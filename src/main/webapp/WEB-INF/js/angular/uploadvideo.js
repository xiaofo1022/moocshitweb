/**
 * Angular for background
 */

var module = angular.module('uploadvideo', []);

module.controller(
	'UpdateCourseController', function($scope, $http) {
		$scope.course = {};
		
		$scope.submit = function(isValid) {
			if (isValid) {
				var courseVideoKey = $("#qiniu-key").val();
				if (!courseVideoKey) {
					alert("请先上传视频");
					return;
				}
				$scope.course.courseIndex = $("#course-index").val();
				$scope.course.coursePlanId = $("#course-plan").val();
				$scope.course.courseVideoKey = courseVideoKey;
				console.log($scope.course);
				var result = confirm("是否确认提交？");
				if (result) {
					$http.post(baseUrl + '/course/addCourse', $scope.course).success(function(data) {
			            console.log('New course id: ' + data);
			            location.reload();
			        });
				}
			}
		};
	}
);
