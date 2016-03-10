/**
 * Angular for course manage.
 */

var module = angular.module('coursemanage', []);

module.controller(
	'CourseManageController', function($scope, $http) {
		$scope.course = {};
		$scope.submit = function(isValid) {
			if (isValid) {
				var planPicKey = $('#qiniu-key').val();
				if (!planPicKey) {
					alert('请上传课程封面');
					return;
				}
				var result = confirm('是否确认提交');
				if (result) {
					$scope.course.planPicKey = planPicKey;
					$http.post(baseUrl + '/course/addCourseMasterplan', $scope.course).success(function(data) {
						location.reload();
					});
				}
			}
		}
	}
);
