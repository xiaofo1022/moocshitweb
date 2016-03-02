/**
 * Angular for background
 */

angular.module('background', []).controller(
	'UpdateCourseController', function($scope, $http) {
		$scope.course = {};
		$scope.courseType = {};
		
		$scope.submit = function() {
			console.log($scope.course);
		};
		
		$scope.addCourseType = function() {
			console.log($scope.courseType);
		};
		
		refreshCourseTypeList($scope, $http);
	}
);

function refreshCourseTypeList($scope, $http) {
	$http.get('course/allCourseType').success(function(data) {
		$scope.courseTypes = data;
	});
}
