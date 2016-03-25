/**
 * Angular for information
 */

var module = angular.module('information', []);

module.controller('InformationController', function($scope, $http) {
	$scope.user = {};
	
	$http.get('user/getUser/' + $('#user-id').val()).success(function(data) {
		$scope.user = data;
	});
	
	$scope.submit = function(isValid) {
		if (isValid) {
			var result = confirm('是否确认提交？');
			if (result) {
				$http.post('user/updateUser', $scope.user).success(function(data) {
					console.log('Update user success: ' + data);
					location.reload();
				});
			}
		}
	};
});
