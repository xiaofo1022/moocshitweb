/**
 * Angular for background
 */

angular.module('background', []).controller(
	'UpdateCourseController', function($scope, $http) {
		$scope.course = {};
		$scope.courseType = {};
		
		$scope.submit = function() {
			var courseVideoKey = $("#course-video-key").val();
			if (!courseVideoKey) {
				alert("请先上传视频");
				return;
			}
			$scope.course.courseVideoKey = courseVideoKey;
			console.log($scope.course);
			$http.post('course/addCourse', $scope.course).success(function(data) {
	            console.log('New course id: ' + data);
	            location.assign("background");
	        })
		};
		
		$scope.addCourseType = function() {
			console.log($scope.courseType);
			$http.post('course/addCourseType', $scope.courseType).success(function(data) {
	            console.log('New course type id: ' + data);
	            refreshCourseTypeList($scope, $http);
	            $('#add-coursetype-modal').modal('hide');
	        })
		};
		
		refreshCourseTypeList($scope, $http);
	}
);

function refreshCourseTypeList($scope, $http) {
	$http.get('course/allCourseType').success(function(data) {
		$scope.courseTypes = data;
	});
}
