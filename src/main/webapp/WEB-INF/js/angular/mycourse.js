/**
 * Angular my course.
 */

var module = angular.module('mycourse', []);

module.controller('MyCourseController', function($scope, $http) {
	$scope.courseList = [];
	
	$http.get('course/allCourse').success(function(data) {
		$scope.courseList = data;
	});
});
