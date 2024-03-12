angular.module('discoverApp', [])
.controller('discoverController', function ($scope, $http) {
    $http.get('http://localhost:3000/api/getAllArtist').then(function (response) {
        $scope.data = response.data.map(function (art) {
            return {
                art
            };
        });
        console.log($scope.data); // Corrected variable name from 'data' to '$scope.data'
    });
});
