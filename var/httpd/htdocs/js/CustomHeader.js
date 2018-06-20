$('#btn_discuss').click(function () {
	$('#discuss_bar').show();		
});

$('#btn_res_discuss').click(function () {
	$('#discuss_bar').show();		
});

$('#res-nav-btn').click(function () {
	$('#res-nav').toggle();		
});

$('#top_discuss_link').click(function () {
	$('#discuss_bar').show();		
});

$('#discuss_bar .close').click(function () {
	$('#discuss_bar').hide();		
});

$('#max_dis').click(function () {
	$('#discuss_bar').toggleClass('expand');		
});

$(window).scroll(function() {
	var windowHeight = $(window).height();
	var chatHeight = $(window).height()-180;
	$(".discuss-sidebar").css("height", windowHeight);
 	$(".msg-items").css("max-height", chatHeight);
});

// $("#discuss").animate({ scrollTop: $("#discuss").attr("scrollHeight") - $('#discuss').height() }, 3000);

const scrollToBottom = function scrollToBottom (duration) {
	let messageWindow = $(".discuss-sidebar");
	let scrollHeight = messageWindow.prop("scrollHeight");
	messageWindow.stop().animate({scrollTop: scrollHeight}, duration || 0);
};


// const rc = new WebSocket('ws://192.168.2.249:3000/websocket');
const rc = new WebSocket('ws://192.168.2.57:8096/websocket');

let now = new Date();

const randomID = function () {
	// Math.random should be unique because of its seeding algorithm.
	// Convert it to base 36 (numbers + letters), and grab the first 9 characters
	// after the decimal.
	return '_' + Math.random().toString(36).substr(2, 9);
};

let stream = {
    "msg": "sub",
    "id": randomID(),
    "name": "stream-room-messages",
    "params":[
        "GENERAL",
        false
    ]
}

// const sha256 = "240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9"; // admin - 249
const sha256 = "48114F783C3243BA4CF20EC7DAF80BF199CD3375BF491A0CE09634CEB56032BF"; // shata
// const sha256 = "03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4"; // unobot

let pong = {
	"msg": 'pong'
};

let connect = {
    "msg": "connect",
    "version": "1",
    "support": ["1"]
};

let login = {
    "msg": "method",
    "method": "login",
    "id":randomID(),
    "params":[
        {
            "user": { 
            	"username": "admin" 
            },
            "password": {
                "digest": sha256,
                "algorithm":"sha-256"
            }
        }
    ]
};

let sendMessageBody = {
    "msg": "method",
    "method": "sendMessage",
    "id": randomID(),
    "params": [
        {
            "_id": randomID(),
            "rid": "GENERAL",
            "msg": ""
        }
    ]
};

let loadMessagesFromRoom = {
    "msg": "method",
    "method": "loadHistory",
    "id": randomID(),
    "params": [ "GENERAL", null, 50, { "$date": now.getTime() } ]
};

rc.onopen = function( event ){
	login.id 				= randomID();
	loadMessagesFromRoom.id = randomID();
	stream.id 				= randomID();
	rc.send(JSON.stringify(connect));
	rc.send(JSON.stringify(login));
	rc.send(JSON.stringify(loadMessagesFromRoom));
	rc.send(JSON.stringify(stream));
}

rc.onmessage = function( event ){
	// Data received from the event
	let data = JSON.parse(event.data);

	switch(data.msg){
		case 'ping':
			rc.send(JSON.stringify(pong));
			break;

		case 'changed':
			if(typeof data.fields.args[0] !== 'undefined')
				loadSingleMessageInWindow(data.fields.args[0]);
			break;

		case 'updated':
			break;

		case 'result':
			if(typeof data.result.messages !== 'undefined')
				loadMessagesInWindow(data.result.messages);
			break;
	}
}

function loadSingleMessageInWindow( messageData ){
	if(messageData.u.username == login.params[0].user.username){
		addMessageLi('msg-self', messageData);
	}else{
		addMessageLi('msg-from', messageData);
	}
}

function loadMessagesInWindow( messages ){

	for (var i = messages.length - 1; i >= 0; i--) {
		messages[i];
		if(messages[i].u.username == login.params[0].user.username){
			addMessageLi('msg-self', messages[i]);
		} else {
			addMessageLi('msg-from', messages[i]);
		}
	}
}

function addMessageLi( addClass, messageData ){
	let messageTime = new Date(messageData.ts['$date']);
	messageTime = messageTime.toLocaleString();

	let converter = new showdown.Converter({extensions: ['table']});
	let body = converter.makeHtml(messageData.msg);

	$("#msg-items-u").append('\
		<li class="msg-item '+addClass+'">\
			<div class="msg-body">\
				<div class="msg-header"> <span class="msg-name">'+messageData.u['name']+'</span> <span class="msg-datetime">'+messageTime+'</span> </div>\
				<div class="msg-message">'+body+'</div>\
			</div>\
		</li>\
    ');
}

$(".chat-area textarea").keydown(function(e){
	if (e.keyCode === 13 && !e.shiftKey) {
		e.preventDefault();

		let messageBody = sendMessageBody;
		messageBody.params[0].msg = $(this).val();
		messageBody.id = randomID();
		messageBody.params[0]['_id'] = randomID();	
		$(this).val('');
		rc.send(JSON.stringify(messageBody));
		scrollToBottom();
  	}
});