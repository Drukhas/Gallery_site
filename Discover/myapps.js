var mytestapp = angular.module('mytestapp', ['ngRoute']);

mytestapp.controller('testcon', function ($scope, $http) {
    $http.get('http://localhost:3000/getAllArtist').then(function (response) {
        $scope.data = response.data.map(function (art) {

            return {
                art
            };
        });
        console.log($scope.data); // Corrected variable name from 'data' to '$scope.data'
    });
});
