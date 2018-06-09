 var app=angular.module('CustomerApp',["angular-d3","ngLoadingSpinner"]);

app.controller('myTicketsController', function($scope,CusomerCommonService,$http,$rootScope,$timeout,$location) {
		
		debugger;

		console.log('My Tickets Controller ');

		//create a message to display in our view

		$scope.message = 'CMDB Message';	

$scope.booleanvalue=true;

		var promise = CusomerCommonService.getServiceList();
		promise.then(function(response) {
			//console.log('CusomerCommonService  response in myTicketsController:::::::::',response);	
			$scope.DashboardList=response.data;
			angular.forEach($scope.DashboardList.ServiceCatalog[0],function(item){ 
				debugger;
				item.ImageLink=item.Comment.split('::')[1];
				item.Comment=item.Comment.split('::')[0];
	    			});
			//console.log('Added the Comments :::::::::',$scope.DashboardList);
		});

		$scope.getInitialCI=function(){
			debugger;
			console.log("In refresh Firtst CI ");
			$scope.globalCIFunction($scope.firstCIConfigId);
			console.log("In refresh Firtst CI data....",$scope.treeChartData1);
			
			
		}
/***********************Service call for the CI Starts*************************/

$scope.globalCIFunction=function(id){
//debugger;
var id=id;
var result1 = CusomerCommonService.getCIInformaton(id);
		result1.then(function(response) {
				debugger;
			console.log('CusomerCommonService  response in getCIInformaton:::::::::',response.data);
	
$scope.CIJson=response.data.ConfigItem[0];
/*if($scope.CIJson.CIXMLData.NIC.NIC!= "undefined"){
	$scope.nic=$scope.CIJson.CIXMLData.NIC.NIC;
}
else{
	$scope.nic="";	
}*/
$scope.tempData={
		"name": $scope.CIJson.Name,
		"CurInciState": $scope.CIJson.CurInciState,
		"ConfigItemID": $scope.CIJson.ConfigItemID,
		"InciStateType": $scope.CIJson.InciStateType,
		"CurInciStateType": $scope.CIJson.CurInciStateType,
		"Number": $scope.CIJson.Number,
		"CreateBy": $scope.CIJson.CreateBy,
		"LastVersionID": $scope.CIJson.LastVersionID,
		"DeplState": $scope.CIJson.DeplState,
		"CurDeplState": $scope.CIJson.CurDeplState,
		"CreateTime":$scope.CIJson.CreateTime,
		"DefinitionID": $scope.CIJson.DefinitionID,
		"VersionID": $scope.CIJson.VersionID,
		"DeplStateType": $scope.CIJson.DeplStateType,
	    "Class": $scope.CIJson.Class,
		"InciState": $scope.CIJson.InciState,
		"CurDeplStateType": $scope.CIJson.CurDeplStateType,
		"CIXMLData":$scope.CIJson.CIXMLData,
		//"nicip":$scope.CIJson.CIXMLData.NIC.NIC,
        "type_id": "",
		"source_key": "",
		"target_key": "",
        "children":[],
   }
		

var result2 = CusomerCommonService.getCILinkList(id);
		result2.then(function(response) {
			debugger;
			console.log('CusomerCommonService  response in getCILinkList:::::::::',response.data);	
			$scope.CILinkList=response.data;
			
			//var result1 = CusomerCommonService.getCIInformaton(1);
			angular.forEach($scope.CILinkList,function(item,i){ 
				debugger;
				//var result3 = CusomerCommonService.getCIInformaton($rootScope.clickRootID);
				var obj=   {
						"name":item.Name,
						"source_key": item.source_key,
						"target_key": item.target_key,
						"type_id": item.type_id,
						"InciState": item.InciState,
						
					   };


				$scope.tempData.children.push(obj);
				

	    			});
			console.log("Final Tree chart data:::::::::::::::", $scope.tempData);
			$scope.treeChartData1=$scope.tempData;
			
			//console.log('Added the Comments :::::::::',$scope.tempData);

		}); // closing result2 getCILinkList 

		}); // closing result1 getCIInformaton 

}//closing globalCIFunction

if($scope.booleanvalue){
debugger;
	$scope.absUrl=$location.absUrl();
	console.log("$scope.absUrl....",$scope.absUrl);
	
$scope.firstCIConfigId=5;
$scope.booleanvalue=false;
$scope.globalCIFunction($scope.firstCIConfigId);
}
/***********************Service call for the CI Ends*************************/




//console.log("treeChartData1 ::::::::::", $scope.treeChartData1);



		 $scope.getData = function(){

			console.log("Current Config Item Id .....",$scope.CIJson.ConfigItemID);
			console.log("clickRootSource_key.....",$rootScope.clickRootSource_key);
			console.log("clickRootTarget_key.....",$rootScope.clickRootTarget_key);

			   if($rootScope.clickRootSource_key || $rootScope.clickRootTarget_key){

                            if($scope.CIJson.ConfigItemID!=$rootScope.clickRootSource_key)
				{
				debugger;
  			console.log("Sending clickRootSource key ",$rootScope.clickRootSource_key);
			    $scope.globalCIFunction($rootScope.clickRootSource_key);
			    $rootScope.clickRootSource_key=0;
			    $rootScope.clickRootTarget_key=0;
				}
                           else if($scope.CIJson.ConfigItemID!=$rootScope.clickRootTarget_key) {
			    debugger;
			    console.log("Sending clickRootTarget key ",$rootScope.clickRootTarget_key);
                            $scope.globalCIFunction($rootScope.clickRootTarget_key);
			    $rootScope.clickRootSource_key=0;
			    $rootScope.clickRootTarget_key=0;

                             }

			   // console.log("treeChartData1 On Click",$scope.treeChartData1)
			}//If closing

                    }
			 			   

/*************************Ending code for chart***************************************/

/***********************Started Code static with given service json for chart*************************/



	});
	
