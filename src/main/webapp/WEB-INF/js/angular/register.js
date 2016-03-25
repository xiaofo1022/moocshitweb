/**
 * Angular for register
 */

var module = angular.module('register', []);

module.controller('RegisterController', function($scope, $http) {
	$scope.user = {};
	
	$scope.submit = function(isValid) {
		if (isValid) {
			if ($scope.user.password != $('#repeat-password').val()) {
				alert('密码输入不一致');
				return;
			}
			var yes = confirm('是否确认提交？');
			if (yes) {
				$http.post('user/addUser', $scope.user).success(function(data) {
					console.log('Add new user success: ' + data);
					location.assign('index');
				});
			}
		}
	};
});