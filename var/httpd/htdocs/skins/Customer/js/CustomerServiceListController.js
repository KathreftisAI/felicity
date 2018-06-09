
var app=angular.module("CustomerAppnew", ["ngLoadingSpinner"]);
app.controller('CustomerServiceListController', function($scope,CusomerCommonService,$http) {
		debugger;
		//console.log('Dashboard Controller ');
		// create a message to display in our view
		$scope.message = 'Request Service List';	
		
		var promise = CusomerCommonService.getServiceList();
		promise.then(function(response) {
			console.log('CusomerCommonService  response in ServiceListController:::::::::',response);	
			$scope.DashboardList=response.data;
			angular.forEach($scope.DashboardList.ServiceCatalog[0],function(item){ 
				debugger;
				item.ImageLink=item.Comment.split('::')[1];
				
				
				item.Comment=item.Comment.split('::')[0];
	    	});
			console.log('Added the ServiceListController :::::::::',$scope.DashboardList);
		});

});