$(document).ready(function(){
	function now(){return new Date().getTime();}
	function toMinutes(arg){return Math.floor((arg % (1000 * 60 * 60)) / (1000 * 60));}
	function toSeconds(arg){return Math.floor((arg % (1000 * 60)) / 1000);}
	function formatDate(date){return toMinutes(date)+":"+toSeconds(date);}
	function toBool(a){if(a === "true"){return true}else{return false;}}
	const MAX_TIME = 1200000.0;
	let theTime    = now();

	$("#timerForm").submit(function(){
		let val       = $("#username").val();
		if(val.length < 1){return false;}

		$.post("/users",{username:val},function(user){
			let createdAt = now()+MAX_TIME;
			let date      = formatDate(createdAt-now());
			let answers   = 0;
			let restarts  = 0;

			$("#timers").append(`
				<tr id="${user.id}">
					<td>${val}</td>
					<td createdAt=${createdAt}>${date}</td>
					<td>${answers}</td>
					<td>${restarts}</td>
					<td>
						<button id="resetBtn${user.id}" type="button" class="resetBtn btn-block btn-success">Reset</button>
					</td>
					<td>
						<button id="removeBtn${user.id}" type="button" class="removeBtn btn-block btn-danger">Remove</button>
					</td>
				</tr>
			`);

			$("#resetBtn"+user.id).click(reset);
			$("#removeBtn"+user.id).click(remove);
			$("#username").val("");
		})

		return false;
	});

	function remove(){
		let tr = $(this).parent().parent();
		let id = tr.attr("id");

		$.post(`/users/${id}/destroy`,{id:id},function(user){
			console.log(user);
			$(tr).remove();
		});
	}

	function reset(e){
		let tr = $(this).parent().parent();
		let notClick   = toBool($(this).attr("notClick"));

		let restartsTr = $(tr).children()[3];
		let restarts   = parseInt($(restartsTr).text());

		let answersTr  = $(tr).children()[2];
		let answers    = parseInt($(answersTr).text());

		if(notClick){restarts++;}
		else{answers++;}
		$(restartsTr).text(restarts);
		$(answersTr).text(answers);

		let id = $(tr).attr("id");

		$.post(`/users/${id}/update`,{id:id,answers:answers,restarts:restarts},function(user){
			let time      = $(tr).children()[1];
			let createdAt = parseInt(user.createdAt)+MAX_TIME;
			let date      = formatDate(createdAt-now());
			$(time).attr("createdAt",createdAt);
			$(time).text(date);
		})

		$(this).attr("notClick",false);		
	}

	function init(){
		let kids = $("#timers").children();

		for(let i=0;i<kids.length;i++){
			let tr = $(kids[i]);
			let time       = $(tr).children()[1];
			
			let resetBtn   = $(tr).children()[4];
			resetBtn = $(resetBtn).children()[0];

			let removeBtn  = $(tr).children()[5];
			removeBtn = $(removeBtn).children()[0];
			
			$(resetBtn).click(reset);
			$(removeBtn).click(remove);

			let createdAt = parseInt($(time).attr("createdAt"))+MAX_TIME;
			let date      = formatDate(createdAt-now());
			$(time).attr("createdAt",createdAt);
			$(time).text(date);
		}

		window.requestAnimationFrame(update);
	}

	function update(){
		if(now()-theTime >= 1000.0){
			let kids = $("#timers").children();
			for(let i=0;i<kids.length;i++){
				let time = $(kids[i]).children()[1];
				let val  = parseInt($(time).attr("createdAt"));
				let date = val-now();

				if(date <= 0){
					let tr  = $(kids[i]).children()[4];
					let btn = $(tr).children()[0];
					$(btn).attr("notClick",true);
					$(btn).click();
				}else{
					$(time).text(formatDate(date));
				}
			}
			theTime=now();
		}
		window.requestAnimationFrame(update);
	}
	init();
})