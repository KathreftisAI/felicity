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
	let messageWindow = $("#discuss");
	let scrollHeight = messageWindow.prop("scrollHeight");
	messageWindow.stop().animate({scrollTop: scrollHeight}, duration || 0);
};


// const rc = new WebSocket('ws://192.168.2.249:3000/websocket');
// const rc = new WebSocket('ws://192.168.2.57:8096/websocket');
const rc = new WebSocket('ws://192.168.2.166:4000/websocket');

// Global variable - stores Ids for all the API calls
const apiIds = [];
// apiIds['login'] 				= [];
apiIds['loadMessagesFromRoom'] 	= [];
apiIds['stream'] 				= [];
apiIds['getUsersOfRoom'] 		= [];
apiIds['sendMessageBody'] 		= [];
apiIds['sendMessageBody_id'] 	= [];

// Gets today's date and time
let now = new Date();

// Generate a random ID
function randomID() {
	return '_' + Math.random().toString(36).substr(2, 9);
};

// const sha256 = "240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9"; // admin - 249
// const sha256 = "48114F783C3243BA4CF20EC7DAF80BF199CD3375BF491A0CE09634CEB56032BF"; // shata
const sha256 = "F56B05F928701C87EB8285B8C5DADE1DDE499CDDA55350870359182ED0BFA6FC"; // shrad
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
    "id":'l0g1n',
    "params":[
        {
            "user": { 
            	"username": "shrad"
            },
            "password": {
                "digest": sha256,
                "algorithm":"sha-256"
            }
        }
    ]
};

let stream = {
    "msg": "sub",
    "id": '',
    "name": "stream-room-messages",
    "params":[
        "GENERAL",
        false
    ]
}

const getUsersOfRoom = {
   "msg":"method",
   "method":"getUsersOfRoom",
   "params":[  
      // "W3Cxnyo7tQz2CQMEi",
      "GENERAL",
      false
   ],
   "id":''
};

let sendMessageBody = {
    "msg": "method",
    "method": "sendMessage",
    "id": '',
    "params": [
        {
            "_id": '',
            "rid": "GENERAL",
            "msg": ""
        }
    ]
};

let loadMessagesFromRoom = {
    "msg": "method",
    "method": "loadHistory",
    "id": '',
    "params": [ "GENERAL", null, 50, { "$date": now.getTime() } ]
};


rc.onopen = function( event ){
	
	// login['id'] 				= randomID();
	loadMessagesFromRoom['id'] 	= randomID();
	stream['id'] 				= randomID();
	getUsersOfRoom['id'] 		= randomID();
	
	// apiIds['login'].push(login['id']);
	apiIds['loadMessagesFromRoom'].push(loadMessagesFromRoom['id']);
	apiIds['stream'].push(stream['id']);
	apiIds['getUsersOfRoom'].push(getUsersOfRoom['id']);

	rc.send(JSON.stringify(connect));
	rc.send(JSON.stringify(login));
	rc.send(JSON.stringify(loadMessagesFromRoom));
	rc.send(JSON.stringify(getUsersOfRoom));
	rc.send(JSON.stringify(stream));
}

rc.onmessage = function( event ){
	// Data received from the event
	let data = '';
	data = JSON.parse(event.data);

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

console.log(data['id']);
			if(data['id'] === 'l0g1n'){
// console.log("Login ID: "+data['id']);
			}
			else if($.inArray(data['id'], apiIds['loadMessagesFromRoom'])){
console.log("Load Messages ID: "+data['id']);
// console.log("It comes here");
// console.log(data.result);

				if(typeof data.result.messages !== 'undefined'){
					loadMessagesInWindow(data.result.messages);
				}
			}
			else if($.inArray(data['id'], apiIds['stream'])){
console.log("Stream: "+data['id']);

			}
			else if($.inArray(data['id'], apiIds['getUsersOfRoom'])){
console.log("Get users ID: "+data['id']);

			}
			else if($.inArray(data['id'], apiIds['sendMessageBody'])){
console.log("Message Body ID: "+data['id']);

			}
			break;

		case 'added':
			break;
		case 'removed':
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
	
	if (e.keyCode === 13 && !e.shiftKey ) {
		e.preventDefault();

		let enteredText = $(this).val();

		/* If nothing entered or only spaces entered,
		 Then clear the textarea and return */
		if((/^\s+$/.test(enteredText) || /^$/.test(enteredText))){
			$(this).val('');
			return;
		}
		
		let messageBody = sendMessageBody;
		// Add random text as ID for id fields
		messageBody.params[0].msg = enteredText;

		messageBody['id'] = randomID();
		messageBody.params[0]['_id'] = randomID();	

		apiIds['sendMessageBody'].push(messageBody['id']);
		apiIds['sendMessageBody_id'].push(messageBody.params[0]['_id']);
		
		// Change textarea to blank
		$(this).val('');
		rc.send(JSON.stringify(messageBody));
		scrollToBottom();
  	}
});