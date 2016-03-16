/**
 * Angular for chosen status
 */
var coursePlanId;

angular.module('ChosenStatusModel', []).controller('ChosenStatusController', function($scope, $http) {
	$scope.chosen = {};
	$scope.submit = function(isValid) {
		if (isValid) {
			$scope.chosen.coursePlanId = coursePlanId;
			$http.post(baseUrl + 'chosen/startCourse', $scope.chosen).success(function(data) {
				location.reload();
			});
		}
	};
});
