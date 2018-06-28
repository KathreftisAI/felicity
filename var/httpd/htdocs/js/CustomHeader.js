$('#btn_discuss').click(function () {
	$('#discuss_bar').show();		
});

$('#btn_res_discuss').click(function () {
	$('#discuss_bar').show();		
});

$('#res-nav-btn').click(function () {
	$('#res-nav').toggle();		
});

// $('#top_discuss_link').click(function () {
// 	$('#discuss_bar').show();		
// });

$('#top_discuss_link').on('click', function () {
	$('#discuss_bar').show();		
});

$('#discuss_bar .close').click(function () {
	$('#discuss_bar').hide();		
});

// $('#max_dis').click(function () {
// 	$('#discuss_bar').toggleClass('expand');		
// });

$('#max_dis').on('click', function () {
	$('#discuss_bar').toggleClass('expand');		
});

$(window).scroll(function() {
	var windowHeight = $(window).height();
	var chatHeight = $(window).height()-180;
	$(".discuss-sidebar").css("height", windowHeight);
 	$(".msg-items").css("max-height", chatHeight);
});

// $("#discuss").animate({ scrollTop: $("#discuss").attr("scrollHeight") - $('#discuss').height() }, 3000);

// function scrollToBottom(duration) {
// 	// let messageWindow = $(".discuss-sidebar");
// 	let messageWindow = $(window);
// 	let scrollHeight = messageWindow.prop("scrollHeight");
// 	messageWindow.stop().animate({scrollTop: scrollHeight}, duration || 0);
// };


// const rc = new WebSocket('ws://192.168.2.249:3000/websocket');
// const rc = new WebSocket('ws://192.168.2.57:8096/websocket');
// const rc = new WebSocket('ws://192.168.2.166:4000/websocket');
const rc = new WebSocket('ws://192.168.2.235:1300/websocket');

const collections = {};

// Global variable - stores Ids for all the API calls
const apiIds = {};
// apiIds['login'] 				= [];
apiIds['loadHistory'] 			= [];
apiIds['streamRoomMessages'] 	= [];
apiIds['getUsersOfRoom'] 		= [];
apiIds['sendMessageBody'] 		= [];
apiIds['sendMessageBody_id'] 	= [];
apiIds['streamNotifyUser'] 		= [];

// Gets today's date and time
let now = new Date();

// Generate a random ID
function randomID() {
	return '_' + Math.random().toString(36).substr(2, 9);
	// return Math.random().substr(2, 9);
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
            	// "userId": "yNrqEkCJYwj2v7rgh"
            },
            "password": 'shrad'
            // "password": {
            //     "digest": sha256,
            //     "algorithm":"sha-256"
            // }
        }
    ]
};

let streamRoomMessages = {
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

let loadHistory = {
    "msg": "method",
    "method": "loadHistory",
    "id": '',
    "params": [ "GENERAL", null, 50, { "$date": now.getTime() } ]
};

let streamNotifyUser = {  
   "msg":"sub",
   "id":'',
   "name":"stream-notify-user",
   "params":[  
      "shrad/notification",
      {  
         "useCollection":false,
         "args":[  

         ]
      }
   ]
};

let activeUsers = {  
   "msg":"sub",
   "id":"activeUsers",
   "name":"activeUsers",
   "params":[  

   ]
};

rc.onopen = function( event ){
	
	// // login['id'] 				= randomID();
	// loadHistory['id'] 			= randomID();
	// streamRoomMessages['id'] 	= randomID();
	// getUsersOfRoom['id'] 		= randomID();
	// streamNotifyUser['id'] 		= randomID();
	
	// // apiIds['login'].push(login['id']);
	// apiIds['loadHistory'].push(loadHistory['id']);
	// apiIds['streamRoomMessages'].push(streamRoomMessages['id']);
	// apiIds['getUsersOfRoom'].push(getUsersOfRoom['id']);
	// apiIds['streamNotifyUser'].push(streamNotifyUser['id']);

	// rc.send(JSON.stringify(connect));
	// rc.send(JSON.stringify(login));
	// rc.send(JSON.stringify(getUsersOfRoom));
	// rc.send(JSON.stringify(loadHistory));
	// rc.send(JSON.stringify(streamRoomMessages));
	// rc.send(JSON.stringify(streamNotifyUser));

	let methods = [loadHistory, streamRoomMessages, getUsersOfRoom] //, streamNotifyUser];
	let methodsName = ['loadHistory', 'streamRoomMessages', 'getUsersOfRoom'] //, 'streamNotifyUser'];

	rc.send(JSON.stringify(connect));
	rc.send(JSON.stringify(login));
	rc.send(JSON.stringify(activeUsers));
	for (var i = 0; i < methods.length; i++) {
		methods[i]['id'] = randomID();
		apiIds[methodsName[i]].push(methods[i]['id']);
		rc.send(JSON.stringify(methods[i]));
	}

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
			// if((typeof data.fields.args !== 'undefined') && (typeof data.fields.args[0] !== 'undefined'))
			if(typeof data['collection'] !== 'undefined' && data['collection'] == 'stream-room-messages')
				loadSingleMessageInWindow(data.fields.args[0]);
			break;

		case 'updated':
			break;

		case 'result':

			if(data['id'] === 'l0g1n'){

			}
			else if($.inArray(data['id'], apiIds['getUsersOfRoom']) !== -1){

				// addUsersInList(data['result']['records']);
				addUsersInCollection(data['result']['records'], 'roomUsers');
			}
			else if($.inArray(data['id'], apiIds['loadHistory']) !== -1){
				loadHistoryInWindow(data.result.messages);
				// if(typeof data.result.messages !== 'undefined'){
				// 	loadHistoryInWindow(data.result.messages);
				// }
			}
			else if($.inArray(data['id'], apiIds['streamRoomMessages']) !== -1){


			}
			else if($.inArray(data['id'], apiIds['sendMessageBody']) !== -1){

			}
			data = '';
			break;

		case 'added':

			var collectionName = data['collection'];

			if(collections[collectionName] === undefined){
				collections[collectionName] = {};
			}
			
			updateUI(data, collectionName);
			break;
		case 'removed':

			var collectionName = data['collection'];
			if(collectionName == 'users'){

				updateUI(data, collectionName);
			}
			// delete collections[collectionName]['id'];
			break;
	}
}

// Change UI according to the collectionName which 
// was added or removed
function updateUI( data, collectionName ){
	switch(collectionName){
		case 'users':
			if(data.msg === 'added'){

				addUsersInList(data);

				// if((data['fields']['username'] !== login['params'][0]['user']['username']) || (data['id'] !== 'rocket.cat')){
				// 	addUsersInList(data);
				// 	return;
				// }
			}
			else if(data.msg === 'removed'){

				// removeUsersInList(data);
				$("#members_"+data['id']).remove();
				delete collections['users'][data['id']];
				let count = parseInt($("#members-count").html()) - 1;
				$("#members-count").html(count);
			}
			break;

		default:
			console.log("default");
	}
}


// function removeUsersInList( userData ){
// 	$("#members_"+userData['id']).remove();
// }

// Add user in members area
function addUsersInList( usersData ){
// console.log(usersData);
	let usersListTemplate = '';
	let usersOnline = 0;

	if((usersData['msg'] !== 'undefined') && (usersData['msg'] === 'added')){
	
		addUsersInCollection(usersData, 'add');

		if((usersData['fields']['username'] === login['params'][0]['user']['username']) || (usersData['id'] === 'rocket.cat')){
			// addUsersInList(data);
			return;
		}

		// var names = [];
		// var keys = Object.keys(collections['users']);

		usersListTemplate += addUserLi(usersData);

		usersOnline = usersData.length === ('undefined' || 0) ? 1:usersData.length;
	}
	
	$("#members-u").append(usersListTemplate);
	$("#members-count").html(usersOnline);
}

// Add users in Collection
function addUsersInCollection( users, type ){

	var userIds = [];

	if(collections['users'] == undefined){
		collections['users'] = {};
	}
	if(collections['users']['online'] == undefined){
		collections['users']['online'] = {};
	}
	if(collections['users']['all'] == undefined){
		collections['users']['all'] = {};
	}

	if(type == 'roomUsers'){

		var count = 0;
		$.each(collections['users']['online'], function(id, value){

			userIds[count] = id;
			count++;
		});

		// let users = users['records'];
		for (var i = 0; i < users.length; i++) {

			if($.inArray(users[i]['_id'], userIds) !== -1){
				continue;
			}

			collections['users']['online'][users[i]['_id']] = {};
			collections['users']['online'][users[i]['_id']]['name'] = users[i]['name'];
		}	
	}
	else if(type == 'add'){
		var count = 0;
		$.each(collections['users']['all'], function(id, value){

			userIds[count] = id;
			count++;
		});

		if($.inArray(users['id'], userIds) !== -1)
			return;

		collections['users']['all'][users['id']] = {};
		collections['users']['all'][users['id']]['username'] = users['fields']['username'];
	}
}

function addUserLi( userData ){

	let userLi = '\
		<li class="member" id="members_'+userData['_id']+'">\
            <div class="avatar"><img src="assets/images/avatar-13.jpg"></div>\
              '+userData['name']+' \
        </li>\
	';

	return userLi;
}

// Load message in window
function loadSingleMessageInWindow( messageData ){
	
	if(messageData.u.username == login.params[0].user.username){
		addMessageLi('msg-self', messageData);
	}else{
		addMessageLi('msg-from', messageData);
	}
	return true;
}

// Triggers on first page load (Loads history)
function loadHistoryInWindow( messages ){

	for (var i = messages.length - 1; i >= 0; i--) {
	// for (var i = 0; i <= messages.length - 1; i++) {

		loadSingleMessageInWindow(messages[i]);
	}
}

// Add Message to the stack
function addMessageLi( addClass, messageData ){
	let messageTime = new Date(messageData.ts['$date']);
	messageTime = messageTime.toLocaleString();

	let converter = new showdown.Converter({extensions: ['table']});
	let body = converter.makeHtml(messageData.msg);

	let title = messageData.u['name'];

	if(messageData.t !== 'undefined' && messageData.t === 'uj'){
		title = body;
		body = "<h5><strong style='color: orange;'>User Joined Group</strong></h5>";
	}
	if(messageData.t !== 'undefined' && messageData.t === 'ul'){
		title = body;
		body = "<h5><strong style='color: orange;'>User Left Group</strong></h5>";
	}

	// $("#msg-items-u").append('\
	$("#msg-items-u").prepend('\
		<li class="msg-item '+addClass+'" id="'+messageData['_id']+'">\
			<div class="msg-body">\
				<div class="msg-header"> <span class="msg-name">'+title+'</span> <span class="msg-datetime">'+messageTime+'</span> </div>\
				<div class="msg-message">'+body+'</div>\
			</div>\
		</li>\
    ');
}

//On Key up
$(".chat-area textarea").keydown(function(e){
	
	// When User presses the enter key
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
		// scrollToBottom();
  	}
});