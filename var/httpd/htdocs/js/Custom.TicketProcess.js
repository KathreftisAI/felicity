
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

	// ActivityDialog-328acb1afb701e088b436b9eddc7705e => Incident workflow -> "Repeated issue"
	// ActivityDialog-eaab57c7ae42e7167462256a23f5e664 => Problem workflow -> "Repeated problem"

	if($("input[name='ActivityDialogEntityID']").val() == "ActivityDialog-328acb1afb701e088b436b9eddc7705e" ||
		$("input[name='ActivityDialogEntityID']").val() == "ActivityDialog-eaab57c7ae42e7167462256a23f5e664"){

		urlArray = urlArray[1].split(';');
		urlArray = urlArray[2].split('=');
		var ticketID = urlArray[1];

		var linkButton = $('<div class="Row"><div class="Field"><a id="linkButton" class="btn btn-primary AsPopup PopupType_TicketAction" href='+baseUrl+'?Action=AgentProcessLinkObject;SourceObject=Ticket;SourceKey='+ticketID+'>Link to Ticket</a></div><div class="Clear"></div></div>');

		$('.TableLike').append(linkButton);
	
	}

	// ActivityDialog-7462a6f865802d71d235cf4b137e96ea => Incident workflow -> "Info in KB"
	// ActivityDialog-3f8f42301dba09e2dc47795b97353425 => Problem workflow -> "work around" -> no workaround

	if($("input[name='ActivityDialogEntityID']").val() == "ActivityDialog-7462a6f865802d71d235cf4b137e96ea" ||
		$("input[name='ActivityDialogEntityID']").val() =="ActivityDialog-3f8f42301dba09e2dc47795b97353425"){
		urlArray = urlArray[1].split(';');
		urlArray = urlArray[2].split('=');
		var ticketID = urlArray[1];

		var linkButton2 = $('<div class="Row"><div class="Field"><a id="linkButton2" class="btn btn-primary AsPopup PopupType_TicketAction" href='+baseUrl+'?Action=AgentProcessLinkObject;SourceObject=Ticket;TargetIdentifier=FAQ;SourceKey='+ticketID+'>Link to FAQ</a></div><div class="Clear"></div></div>');

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


		if(linkItem.TotalCount > 0){

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
	}

	// Get linked Ticket data
	// ActivityDialog-328acb1afb701e088b436b9eddc7705e => Incident workflow -> "Repeated issue"

	if($("input[name='ActivityDialogEntityID']").val() == "ActivityDialog-328acb1afb701e088b436b9eddc7705e" || 
		$("input[name='ActivityDialogEntityID']").val()== "ActivityDialog-eaab57c7ae42e7167462256a23f5e664"){

		var ticketID = urlArray[1];
	          	
         $.ajax({
    		url: 'index.pl?Action=GetLinkedTicketData',
    		type: "GET",
    		data: {TicketID : ticketID},
    		success : function(data){
    			createLinkTable($.parseJSON(data));
    		}
    	});
	}

	// Get linked FAQ data
	// ActivityDialog-7462a6f865802d71d235cf4b137e96ea => Incident workflow -> "Info in KB"
	// ActivityDialog-3f8f42301dba09e2dc47795b97353425 => Problem workflow -> "Work around" 

	if($("input[name='ActivityDialogEntityID']").val() == "ActivityDialog-7462a6f865802d71d235cf4b137e96ea" ||
		$("input[name='ActivityDialogEntityID']").val() =="ActivityDialog-3f8f42301dba09e2dc47795b97353425"){

		getLinkedFaqData();
		function getLinkedFaqData(){
			var ticketID = urlArray[1];
		          	
	        $.ajax({
	    		url: 'index.pl?Action=GetLinkedFAQData;',
	    		type: "GET",
	    		data: {TicketID : ticketID},
	    		success : function(data){
	    			createLinkTable($.parseJSON(data));
	    		}
    		});
        }



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

	// ActivityDialog-0ce653f53b3290f935dea002d3342d0c => Incident workflow "No info in KB"
	if($("input[name='ActivityDialogEntityID']").val() == "ActivityDialog-0ce653f53b3290f935dea002d3342d0c"){					   
		$('#SubmitActivityDialog-0ce653f53b3290f935dea002d3342d0c').on('click', function(){
			createFAQ();			
		});
	}


	// ActivityDialog-3f8f42301dba09e2dc47795b97353425 => Problem workflow "Work around if no is selected"
	if($("input[name='ActivityDialogEntityID']").val() == "ActivityDialog-3f8f42301dba09e2dc47795b97353425"){					   
		$('#SubmitActivityDialog-3f8f42301dba09e2dc47795b97353425').on('click', function(){
			if($('#DynamicField_WorkArround').val() == "No"){
				createFAQ();			
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


	// ActivityDialog-3f8f42301dba09e2dc47795b97353425 => Problem workflow "Work Around"

	if($("input[name='ActivityDialogEntityID']").val()== "ActivityDialog-3f8f42301dba09e2dc47795b97353425"){

		if($('.Row.Row_DynamicField_WorkArround').length){

			if($('#DynamicField_WorkArround').val() === "No"){
				showDisplayFAQFields();
				$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:none');
			} 
			if($('#DynamicField_WorkArround').val() === "Yes"){
				hideDisplayFAQFields();
				$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:block');
				$('#DynamicField_IncidentsWorkArround').addClass("Validate_Required");
				$('#LabelDynamicField_IncidentsWorkArround').addClass("Mandatory");
				if($("#LabelDynamicField_IncidentsWorkArround .Marker").length == 0){
					$("#LabelDynamicField_IncidentsWorkArround").prepend('<span class="Marker">*</span>');
				}
				$('#DynamicField_IncidentsWorkArroundError > p').empty().text("this field is required");
			}
		}


		$('#DynamicField_WorkArround').on('change', function(){

			if($('#DynamicField_WorkArround').val() === "No"){
				showDisplayFAQFields();
				$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:none');
				$('#DynamicField_IncidentsWorkArround').removeClass("Validate_Required");
			} 

			if($('#DynamicField_WorkArround').val() === "Yes"){
				hideDisplayFAQFields();
				$('.Row.Row_DynamicField_IncidentsWorkArround').attr('style','display:block');
				$('#DynamicField_IncidentsWorkArround').addClass("Validate_Required");
				$('#LabelDynamicField_IncidentsWorkArround').addClass("Mandatory");
				if($("#LabelDynamicField_IncidentsWorkArround .Marker").length == 0){
					$("#LabelDynamicField_IncidentsWorkArround").prepend('<span class="Marker">*</span>');
				}
				$('#DynamicField_IncidentsWorkArroundError > p').empty().text("this field is required");
			}

		});

	}
});

