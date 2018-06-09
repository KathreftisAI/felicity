 var app=angular.module('CustomerApp',["angular-d3","ngLoadingSpinner"]);
 app.config(['$httpProvider',function ($httpProvider) {
//debugger;
 $httpProvider.defaults.headers.common = {};
  $httpProvider.defaults.headers.post = {};
  $httpProvider.defaults.headers.put = {};
  $httpProvider.defaults.headers.patch = {};
//$httpProvider.defaults.useXDomain = true;
//$httpProvider.defaults.withCredentials = true;
//delete $httpProvider.defaults.headers.common["X-Requested-With"];
//$httpProvider.defaults.headers.common["Accept"] = "application/json";
//$httpProvider.defaults.headers.common["Content-Type"] = "application/json";
}]);
 app.controller('dashboardController', function($scope,CusomerCommonService,$http) {
		//debugger;
		//console.log('Dashboard Controller ');
		// create a message to display in our view
		$scope.message = 'Dashboard';	
		
		var promise = CusomerCommonService.getServiceList();
		promise.then(function(response) {
			console.log('CusomerCommonService  response in dashboardController:::::::::',response);	
			$scope.DashboardList=response.data;
			angular.forEach($scope.DashboardList.ServiceCatalog[0],function(item){ 
				debugger;
				item.ImageLink=item.Comment.split('::')[1];
				
				
				item.Comment=item.Comment.split('::')[0];
	    	});
			console.log('Added the Comments :::::::::',$scope.DashboardList);
		});

	});
	
	
	
	
