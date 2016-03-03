/**
 * Angular my course.
 */

var module = angular.module('mycourse', []);

module.controller('MyCourseController', function($scope, $http) {
	$scope.courseList = [];
	
	$scope.toCourseDetail = function(courseId) {
		location.assign("courseDetail/" + courseId);
	};
	
	$http.get('course/allCourse').success(function(data) {
		$scope.courseList = data;
	});
});
