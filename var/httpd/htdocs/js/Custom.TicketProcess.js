
$(document).ready(function(){

// Incident Workflow ===>  incident management v2  Process-9e036511e8e4430742e6146a224e7d76
// Proiblem Workflow ===>  Problem Management  Process-edc13faab1ffd48e9de86631dec53b7d

	var url = document.URL;
	var urlArray = url.split('?');
	var baseUrl = urlArray[0];


	if($('.Row.Row_DynamicField_ResolutionPriority').length){

		if($('#DynamicField_ResolutionPriority').val() === "Normal"){
			$('.Row.Row_DynamicField_MajorPriorityDescription').attr('style','display:none');
		} 
		if($('#DynamicField_ResolutionPriority').val() === "Major"){

			$('.Row.Row_DynamicField_MajorPriorityDescription').attr('style','display:block');
			$('#DynamicField_MajorPriorityDescription').addClass("Validate_Required");
			$('#LabelDynamicField_MajorPriorityDescription').addClass("Mandatory");
			if($("#LabelDynamicField_MajorPriorityDescription .Marker").length == 0){
				$("#LabelDynamicField_MajorPriorityDescription").prepend('<span class="Marker">*</span>');
			}
			$('#DynamicField_MajorPriorityDescriptionError > p').empty().text("this field is required");
		}
	}

	$('#DynamicField_ResolutionPriority').on('change', function(){

		if($('#DynamicField_ResolutionPriority').val() === "Normal"){
			$('#DynamicField_MajorPriorityDescription').removeClass("Validate_Required");
			$('.Row.Row_DynamicField_MajorPriorityDescription').attr('style','display:none');
		} 

		if($('#DynamicField_ResolutionPriority').val() === "Major"){
			$('.Row.Row_DynamicField_MajorPriorityDescription').attr('style','display:block');
			$('#DynamicField_MajorPriorityDescription').addClass("Validate_Required");
			$('#LabelDynamicField_MajorPriorityDescription').addClass("Mandatory");
			if($("#LabelDynamicField_MajorPriorityDescription .Marker").length == 0){
				$("#LabelDynamicField_MajorPriorityDescription").prepend('<span class="Marker">*</span>');
			}
			$('#DynamicField_MajorPriorityDescriptionError > p').empty().text("this field is required");
		}
	});

	function ticketLinkButton(){
		urlArray = urlArray[1].split(';');
		urlArray = urlArray[2].split('=');
		var ticketID = urlArray[1];

		var linkButton = $('<div class="Row LinkRelated">\
			<label for="linkButton" class="Mandatory"><span class="Marker">*</span>Link Related Ticket:</label>\
			<div class="Field"><a id="linkButton" class="btn btn-primary AsPopup PopupType_TicketAction" href='+baseUrl+'?Action=AgentProcessLinkObject;SourceObject=Ticket;SourceKey='+ticketID+'>Link to Ticket</a></div><div class="Clear"></div></div>');

		$('.TableLike').append(linkButton);
	}


	function faqLinkButton(){
		urlArray = urlArray[1].split(';');
		urlArray = urlArray[2].split('=');
		var ticketID = urlArray[1];

		var linkButton2 = $('<div class="Row LinkRelated">\
			<label for="linkButton2" class="Mandatory"><span class="Marker">*</span>Link Related FAQ:</label>\
			<div class="Field"><a id="linkButton2" class="btn btn-primary AsPopup PopupType_TicketAction" href='+baseUrl+'?Action=AgentProcessLinkObject;SourceObject=Ticket;TargetIdentifier=FAQ;SourceKey='+ticketID+'>Link to FAQ</a></div><div class="Clear"></div></div>');

		$('.TableLike').append(linkButton2);
	}	

	// Create Linked table on activity Dialog
	function createLinkTable(linkItem){
		var linkHtml = '<div class="clearfix">\
						</div><div id="linkedTicketTable" class="panel panel-default">\
							<div class="panel-heading">Linked Items</div>\
							<table class="table table-bordered table-hover">\
								<thead>\
									<tr id="linkTableHead">\
										<td><strong>Number</strong></td>\
										<td><strong>Title</strong></td>\
										<td><strong>Type</strong></td>\
									</tr>\
								</thead>\
								<tbody id="linkTableBody">\
								</tbody>\
							</table>\
						</div>';

		var linkTableLocation = $('#AppWrapper > .LayoutFixedSidebar.SidebarLast  > .ContentColumn > .Validate.PreventMultipleSubmits> .LayoutPopup.ARIARoleMain > .Content > .TableLike:last-child');

		linkTableLocation.append(linkHtml);

		var tableRowData = linkItem.Item.forEach(function(item){

			if(item.type == "Ticket"){
				var tableRow = '<tr>\
									<td><a href="'+baseUrl+'?Action=AgentTicketZoom;TicketID='+item.id+'" target="_blank">'+item.number+'</a></td>\
									<td>'+item.title+'</td>\
									<td>'+item.type+'</td>\
								</tr>';
				$('#linkTableBody').append(tableRow);

			} else if(item.type == "FAQ"){
				var tableRow = '<tr>\
									<td><a href="'+baseUrl+'?Action=AgentFAQZoom;ItemID='+item.id+'" target="_blank">'+item.number+'</a></td>\
									<td>'+item.title+'</td>\
									<td>'+item.type+'</td>\
								</tr>';
				$('#linkTableBody').append(tableRow);
			}
		});

	}

	function getLinkedData(url){
		var ticketID = urlArray[1];
	          	
        $.ajax({
    		url: url,
    		type: "GET",
    		data: {TicketID : ticketID},
    		success : function(data){
    			data = $.parseJSON(data);
    			if(data.TotalCount > 0){
    				createLinkTable(data);
				}
				else{
					$('.Primary.CallForAction').prop("disabled", true);
					$('.Primary.CallForAction').css("cursor","no-drop");
					$('.Primary.CallForAction > *').css("cursor","no-drop");	
				}
    		}
		});
    }


	function createFAQ(){

		var faqTitle 	= $('#DynamicField_FAQTitle').val();
		var faqKeyword 	= $('#DynamicField_FAQKeywords').val() || '';
		var faqSymptom 	= $('#DynamicField_FAQSymptom').val();
		var faqProblem 	= $('#DynamicField_FAQProblem').val();
		var faqSolution = $('#DynamicField_FAQSolution').val();
		var faqComment 	= $('#DynamicField_FAQComment').val();


		var createFAQData = {
			"Symptom"	: faqSymptom,
			"Problem"	: faqProblem,
			"Solution"	: faqSolution,
			"Comment"	: faqComment,
			"ValidID"	: "1",
			"LanguageID": "1",		//English language ID
			"Title"		: faqTitle,
			"StateID"	: "1",     	//External FAQ StateID
			"CategoryID": "1",		//category id
			"Keywords"	: faqKeyword
		}


		$.ajax({
			type: "GET",
			url: "index.pl?Action=CreateFAQ;",
			data: createFAQData,
			success: function(resultData){
				
			}
		});


	}

	function hideDisplayFAQFields(){

		var hideFields = ['FAQTitle', 'FAQKeywords', 'FAQSymptom', 'FAQProblem', 'FAQSolution', 'FAQComment'];

		$.each(hideFields, function(i, v){
			$('.Row.Row_DynamicField_'+v).attr('style','display:none');
		});

		var hideCreateFAQFields = hideFields;

		var index2= hideCreateFAQFields.indexOf('FAQKeywords');
		if(index2 !== -1) hideCreateFAQFields.splice(index2, 1); 

		$.each(hideCreateFAQFields, function(i, v){
			$('#DynamicField_'+v).removeClass("Validate_Required");
			$('#LabelDynamicField_'+v).removeClass("Mandatory");
		});

	}

	function showDisplayFAQFields(){

		var showFields = ['FAQTitle', 'FAQKeywords', 'FAQSymptom', 'FAQProblem', 'FAQSolution', 'FAQComment'];

		$.each(showFields, function(i, v){
			$('.Row.Row_DynamicField_'+v).attr('style','display:block');
		});

		var showCreateFAQFields = showFields;

		var index1 = showCreateFAQFields.indexOf('FAQKeywords');
		if(index1 !== -1) showCreateFAQFields.splice(index1, 1); 

		$.each(showCreateFAQFields, function(i, v){
			$('#DynamicField_'+v).addClass("Validate_Required");
			$('#LabelDynamicField_'+v).addClass("Mandatory");
			if($("#LabelDynamicField_"+v+" .Marker").length == 0){
				$("#LabelDynamicField_"+v).prepend('<span class="Marker">*</span>');
			}
			$('#DynamicField_'+v+'Error > p').empty().text("this field is required");
		});

	}


	switch ($("input[name='ActivityDialogEntityID']").val()){

		// ActivityDialog-328acb1afb701e088b436b9eddc7705e => Incident workflow -> "Repeated issue"
		case 'ActivityDialog-328acb1afb701e088b436b9eddc7705e':
			ticketLinkButton();
	      	getLinkedData('index.pl?Action=GetLinkedTicketData');
			break;

		// ActivityDialog-eaab57c7ae42e7167462256a23f5e664 => Problem workflow -> "Repeated problem"
		case 'ActivityDialog-eaab57c7ae42e7167462256a23f5e664':
			ticketLinkButton();
	      	getLinkedData('index.pl?Action=GetLinkedTicketData');
			break;

		// ActivityDialog-7462a6f865802d71d235cf4b137e96ea => Incident workflow -> "Info in KB"
		case 'ActivityDialog-7462a6f865802d71d235cf4b137e96ea':
			faqLinkButton();
			getLinkedData('index.pl?Action=GetLinkedFAQData;');
			break;

		// ActivityDialog-0ce653f53b3290f935dea002d3342d0c => Incident workflow "No info in KB"
		case 'ActivityDialog-0ce653f53b3290f935dea002d3342d0c':
			$('#SubmitActivityDialog-0ce653f53b3290f935dea002d3342d0c').on('click', function(){
				createFAQ();			
			});
			break;

		// ActivityDialog-3f8f42301dba09e2dc47795b97353425 => Problem workflow "Work Around"
		case 'ActivityDialog-3f8f42301dba09e2dc47795b97353425':
			faqLinkButton();

			if($('#DynamicField_WorkArround').val() === "Yes"){
				hideDisplayFAQFields();
				getLinkedData('index.pl?Action=GetLinkedFAQData;');
				$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:block');
				$('.Row.LinkRelated').attr('style','display:block');
				$('#DynamicField_IncidentsWorkArround').addClass("Validate_Required");
				$('#LabelDynamicField_IncidentsWorkArround').addClass("Mandatory");
				if($("#LabelDynamicField_IncidentsWorkArround .Marker").length == 0){
					$("#LabelDynamicField_IncidentsWorkArround").prepend('<span class="Marker">*</span>');
				}
				$('#DynamicField_IncidentsWorkArroundError > p').empty().text("this field is required");
			}
			if($('#DynamicField_WorkArround').val() === "No"){
				showDisplayFAQFields();
				$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:none');
				$('.Row.LinkRelated').attr('style','display:none');
				$('.Primary.CallForAction').prop("disabled", false);
				$('.Primary.CallForAction').css("cursor","pointer");
				$('.Primary.CallForAction > *').css("cursor","pointer");
			}

			$('#DynamicField_WorkArround').on('change', function(){

				if($('#DynamicField_WorkArround').val() === "No"){
					showDisplayFAQFields();
					$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:none');
					$('#DynamicField_IncidentsWorkArround').removeClass("Validate_Required");
					$('.Row.LinkRelated').attr('style','display:none');
					$('.Primary.CallForAction').prop("disabled", false);
					$('.Primary.CallForAction').css("cursor","pointer");
					$('.Primary.CallForAction > *').css("cursor","pointer");

				} 

				if($('#DynamicField_WorkArround').val() === "Yes"){
					hideDisplayFAQFields();
					if($('#linkedTicketTable').length == 0){
						getLinkedData('index.pl?Action=GetLinkedFAQData;');
					}	
					$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:block');
					$('.Row.LinkRelated').attr('style','display:block');
					$('#DynamicField_IncidentsWorkArround').addClass("Validate_Required");
					$('#LabelDynamicField_IncidentsWorkArround').addClass("Mandatory");
					if($("#LabelDynamicField_IncidentsWorkArround .Marker").length == 0){
						$("#LabelDynamicField_IncidentsWorkArround").prepend('<span class="Marker">*</span>');
					}
					$('#DynamicField_IncidentsWorkArroundError > p').empty().text("this field is required");
				}

			});

			$('#SubmitActivityDialog-3f8f42301dba09e2dc47795b97353425').on('click', function(){
				if($('#DynamicField_WorkArround').val() == "No"){
					createFAQ();			
				}
			});

			break;
	}

});

