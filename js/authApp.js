const authApp = angular.module('authApp', []);

authApp.controller('registerLoginController', function ($scope, $http) {
    $scope.registerInfo = {
        username: '',
        email: '',
        password: ''
    };

    $scope.loginInfo = {
        username: '',
        password: ''
    };

    $scope.register = function () {
        $http.post('http://localhost:3000/api/register', $scope.registerInfo)
            .then(() => {
                alert("Register Successful!");
                location.reload();
            })
            .catch(error => {
                alert("Error registering!");
                location.reload();
                console.error('Error registering:', error);
            });
    };

    $scope.login = function () {
        $http.post('http://localhost:3000/api/login', $scope.loginInfo)
            .then(() => {
                alert("Login Successful!");
                window.location.href = "discover.html";
            })
            .catch(error => {
                alert("Error logging in!");
                console.error('Error logging in:', error);
            });
    };
});
