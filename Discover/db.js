const mysql = require("mysql");
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database:"gallery",
  multipleStatements: true
});
db.connect(function(err){
   if(!err){
       console.log("Connected");
   }else{
       console.log("Connection failed");
   }
});
module.exports = db;