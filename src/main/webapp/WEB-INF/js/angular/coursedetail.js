/**
 * Angular Course Detail.
 */


var module = angular.module('coursedetail', []);
var commentStar = 0;

module.controller('CourseDetailController', function($scope, $http) {
	$scope.comment = {};
	
	$scope.submitComment = function() {
		if (!$('#user_id').val()) {
			alert('请先登录');
			return;
		}
		if (!commentStar) {
			alert('请为本次评论打分');
			return;
		}
		$scope.comment.score = commentStar;
		$scope.comment.commentUserId = $('#user_id').val();
		$scope.comment.courseId = $('#course_id').val();
		console.log($scope.comment);
		var result = confirm('是否确认提交？');
		if (result) {
			$http.post(baseUrl + '/comment/addComment', $scope.comment).success(function(data) {
				location.reload();
			});
		}
	};
});
