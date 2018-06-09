angular.module('CustomerApp',[]).controller('dashboardController', function($scope,$http) {
        debugger;
        console.log('in dashboard');
        // create a message to display in our view
        $scope.message = 'Dashboard';
        
        
        
$http.get('http://172.17.0.3/felicity/nph-genericinterface.pl/Webservice/APIService/SL1?UserID=abhik&SessionID=Rac1Y7joKCiCwsCsS7sXbeuwxusTXxUA')
.then(function(response) {
         debugger;
          console.log('Sample API response :::::::::',response);
         
      }, function(response) {
          console.log('error');
      }
    );
        
        
    $scope.DashboardList={
                    "UserDetails":{
                                    "FirstName":"Abhishek",
                                    "LastName":"Kulkarni",
                                    "CustomerID":"abhik"
                                },
    
    "ServiceCatalog": [
        
            {
                "CurInciState": "Operational",
                "ValidID": 1,
                "ServiceID": 4,
                "CurInciStateType": "operational",
                "Type": "Back End",
                "CurInciStateID": "1",
                "CreateBy": 5,
                "CurInciStateTypeFromCIs": "operational",
                "ChangeBy": 5,
                "ChangeTime": "2017-05-19 20:49:59",
                "CreateTime": "2017-05-19 20:49:59",
                "Criticality": "1 very low",
                "Comment": "Reset your Password",
                "NameShort": "Password Reset",
                "TypeID": "6",
                "Name": "Password Reset",
                "ImageLink":"img/pwd.jpg",
            },
             {
                "CurInciState": "Operational",
                "ValidID": 1,
                "ServiceID": 5,
                "CurInciStateType": "operational",
                "Type": "Back End",
                "CurInciStateID": "1",
                "CreateBy": 5,
                "CurInciStateTypeFromCIs": "operational",
                "ChangeTime": "2017-05-21 06:49:31",
                "ChangeBy": 5,
                "CreateTime": "2017-05-21 06:49:31",
                "Criticality": "1 very low",
                "Comment": "Request Access to VPN Service",
                "NameShort": "VPN Request",
                "TypeID": "6",
                "Name": "VPN Request",
                "ImageLink":"img/wifi.jpg",
            },
            {
                "CurInciState": "Operational",
                "ValidID": 1,
                "ServiceID": 1,
                "CurInciStateType": "operational",
                "Type": "Other",
                "CurInciStateID": "1",
                "CreateBy": 2,
                "CurInciStateTypeFromCIs": "operational",
                "ChangeTime": "2017-05-15 15:03:42",
                "ChangeBy": 4,
                "CreateTime": "2017-04-17 20:22:49",
                "Criticality": "1 very low",
                "Comment": "Report Issue for Application",
                "NameShort": "test",
                "TypeID": "14",
                "Name": "Application Issue",
                "ImageLink":"img/report.png",
            },
            {
                "CurInciState": "Operational",
                "ValidID": 1,
                "ServiceID": 2,
                "CurInciStateType": "operational",
                "Type": "Back End",
                "CurInciStateID": "1",
                "CreateBy": 4,
                "CurInciStateTypeFromCIs": "operational",
                "ChangeTime": "2017-05-15 15:03:51",
                "ChangeBy": 4,
                "CreateTime": "2017-05-15 15:03:51",
                "Criticality": "1 very low",
                "Comment": "Report Issue for Device",
                "NameShort": "test2",
                "TypeID": "6",
                "ParentID": 1,
                "Name": "Service Issue",
                "ImageLink":"img/sett.jpg",
            },
            {
                "CurInciState": "Operational",
                "ValidID": 1,
                "ServiceID": 3,
                "CurInciStateType": "operational",
                "Type": "Back End",
                "CurInciStateID": "1",
                "CreateBy": 4,
                "CurInciStateTypeFromCIs": "operational",
                "ChangeTime": "2017-05-15 15:04:04",
                "ChangeBy": 4,
                "CreateTime": "2017-05-15 15:04:04",
                "Criticality": "1 very low",
                "Comment": "Report issue for Software ",
                "NameShort": "test3 ",
                "TypeID": "6",
                "ParentID": 2,
                "Name": "Software Issue",
                "ImageLink":"img/softwareissue.png",
            },
          
            {
                "CurInciState": "Operational",
                "ValidID": 1,
                "ServiceID": 6,
                "CurInciStateType": "operational",
                "Type": "Back End",
                "CurInciStateID": "1",
                "CreateBy": 5,
                "CurInciStateTypeFromCIs": "operational",
                "ChangeTime": "2017-05-21 07:16:17",
                "ChangeBy": 5,
                "CreateTime": "2017-05-21 07:16:17",
                "Criticality": "1 very low",
                "Comment": "Report Operational Issue ",
                "NameShort": "New Request",
                "TypeID": "6",
                "ParentID": 5,
                "Name": "Operational",
                "ImageLink":"img/report1.jpg",
            }]
            }



    });

