function DropDown(el) {
	this.dd = el;
	this.placeholder = this.dd.children('span');
	this.opts = this.dd.find('ul.dropdown > li');
	this.val = '';
	this.index = -1;
	this.initEvents();
}
DropDown.prototype = {
	initEvents : function() {
		var obj = this;

		obj.dd.on('click', function(event){
			$(this).toggleClass('active');
			return false;
		});

		obj.opts.on('click',function(){
			var opt = $(this);
			obj.val = opt.text();
			obj.index = opt.index();
			obj.placeholder.text( obj.val);
		});
	},
	getValue : function() {
		return this.val;
	},
	getIndex : function() {
		return this.index;
	}
}



	var dd = new DropDown( $('#dd') );
	var State = new DropDown( $('#state') );
	var priority = new DropDown( $('#priority') );
	var Severity = new DropDown( $('#Severity') );
	var network = new DropDown( $('#network') );

	$(document).click(function() {
		 //all dropdowns
		$('.wrapper-dropdown-1').removeClass('active');
	});
