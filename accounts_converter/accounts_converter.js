var file = process.argv[2];
let fileOutput = process.argv[3];
let accounts = require("./"+file);
let config = require("./config.json");
let format = config.format;
console.log(format);
let parts = format.split(":");
const fs = require('fs');

let output = "";
accounts.forEach(function(account) {
	parts.forEach(function(part) {
		output += account[part] + ":";
	});
	output = output.substring(0, output.length - 1);
	output += "\n";
});

fs.writeFile("./"+fileOutput, output, function(err) {
    if(err) {
        return console.log(err);
    }

    console.log("Accounts converted");
});
