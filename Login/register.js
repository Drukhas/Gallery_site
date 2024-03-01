var Register = angular.module('registry', ['ngRoute','ui.router'
]);

Register.controller('reg', function ($scope, $http) {
    $scope.master = {
        username: '',
        email: '',
        password: ''
    };


    $scope.submit = function () {
        $http.post('http://localhost:3000/register', $scope.master).then(
            function successCallback(response) {
                console.log("Successfully POST-ed data");
            })
        console.log($scope.master);
    }
});

app.config(function($stateProvider, $urlRouterProvider) {
    $stateProvider
        .state('homepage', {
            url: '/homepage',
            templateUrl: 'Discover/discover.html',
            controller: 'testcon'
        });

    // Redirect to homepage as default
    $urlRouterProvider.otherwise('/homepage');
});