/**
 * Angular for register
 */

var module = angular.module('register', []);

module.controller('RegisterController', function($scope, $http) {
	$scope.user = {};
	
	$scope.submit = function() {
		if ($scope.user.password != $('#repeat-password').val()) {
			alert('密码输入不一致');
			return;
		}
		$http.post('user/addUser', $scope.user).success(function(data) {
			console.log('Add new user success: ' + data);
			location.assign('index');
		});
	};
});