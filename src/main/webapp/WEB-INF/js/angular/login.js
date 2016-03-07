/**
 * Angular for login
 */

var module = angular.module('login', []);

module.controller('LoginController', function($scope, $http) {
	$scope.loginUser = {};
	
	$scope.login = function() {
		$http.post('user/login', $scope.loginUser).success(function(data) {
			if (data.message != 'success') {
				alert(data.message);
				return;
			} else {
				location.reload();
			}
		});
	};
});
