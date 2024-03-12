const express = require('express');
const cors = require('cors');
const bcrypt = require('bcrypt');
var bodyParser = require('body-parser');
var app = express();
var db = require('./db.js');


app.use(cors({ origin: '*' }));
// for parsing application/json
app.use(bodyParser.json());
// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));
//form-urlencoded
app.use(express.json())
// app.use('/home', express.static('home'));
app.listen(3000, function () { // application run at port 3000
    console.log("Application start at localhost:3000")
})

app.get('/api/getAllArtist', function (request, response) {
    const stm = "SELECT * FROM artists a JOIN images i ON a.ArtistID = i.ArtistID ";
    db.query(stm, (error, results) => {
        if (error) {
            console.error('Error executing MySQL query: ' + error.stack);
            response.status(500).json({ error: 'Error executing MySQL query' });
            return;
        }
        // Check if movie exists
        if (results.length === 0) {
            response.status(404).json({ error: 'not found' });
            return;
        }
        // Send the first result (assuming only one movie matches the ID)
        response.json(results);
    });
});

app.post('/api/register', function (request, response) {
    const { username, email, password } = request.body;

    // Check if username, email, and password are provided
    if (!username||!email||!password) {
        return response.status(400).json({ error: 'Username, email, and password are required' });
    }

    const stm = "INSERT INTO users (Username, Email, Password) VALUES (?, ?, ?)";
    db.query(stm, [username, email, password], function (error, result) {
        if (error) {
            console.error('Error executing MySQL query: ' + error.stack);
            return response.status(500).json({ error: 'Error executing MySQL query' });
        }

        // Optionally, you can return a success message or the inserted user data
        response.status(200).json({ message: 'User registered successfully', user: { username, email } });
    });
});

app.post('/api/login', function (request, response) {
    const { username, password } = request.body;

    if (!username || !password) {
        return response.status(400).json({ error: 'Username and Password are required!' });
    }

    findByUsers(username, response, (user) => {
        if (!username) {
            return response.status(404).json({ error: 'User not found' });
        }

        if (!isPasswordMatch(password, user.password)) {
            return response.status(401).json({ error: 'Incorrect password' });
        }

        // Successful login
        response.status(200).json({ message: 'Login successful', user: user });
    });
});


//check password
const isPasswordMatch = function (rawPassword, MatchPassword) {
    return bcrypt.compareSync(rawPassword, MatchPassword);
}

//find by email
const findByUsers = function (username, response) {
    const stm = "SELECT * FROM users WHERE Username = ?";
    db.query(stm, [username], (error, results) => {
        if (error) {
            console.error('Error executing MySQL query: ' + error.stack);
            response.status(500).json({ error: 'Error executing MySQL query' });
            return;
        }
        // Check if email exists
        if (results.length === 0) {
            response.status(404).json({ error: 'User not found' });
            return;
        }
        // Extract email and password from the first result
        const { username, password } = results[0];
        // Return only email and password
        response.json({ username, password });
    });
};

