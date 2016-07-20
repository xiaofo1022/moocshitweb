/**
 * Course Edit
 */
var module = angular.module('courseedit', []);

module.controller('CourseEditController', function($scope, $http) {
  $scope.courseExercises = {};
  $scope.submit = function(isValid) {
    if (isValid) {
      var result = confirm('是否确认提交？');
      if (result) {
        $scope.courseExercises.courseId = globalCourseId;
        $http.post(baseUrl + 'course/addCourseExercises', $scope.courseExercises).success(function(data) {
          console.log('Add course exercises success: ' + data);
          location.reload();
        });
      }
    }
  };
});