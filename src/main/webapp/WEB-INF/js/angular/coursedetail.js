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
		console.log($scope.comment);
	};
});
