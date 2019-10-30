// Question 2

//Set CSV filepath here
const pathToFile = '../csv/Q2_input.csv';
const PapaParse = require('papaparse');
const fs = require('fs');
const file = fs.readFileSync(pathToFile, "utf-8");

//Sort an array of objects alphabetically by given a specific key.
function alphabeticSort(property) {
    // Do ascending sort by default
    var sortOrder = 1;

    // Alternatively, do decending sort
    if(property[0] === "-") {
        sortOrder = -1;
        property = property.substr(1);
    }

    return function (a,b) {
        if(sortOrder == -1){
            return b[property].localeCompare(a[property]);
        }else{
            return a[property].localeCompare(b[property]);
        }
    }
}

//1. Read CSV using 'Papa Parse' library (imported from npm)
//   This is one of the simplest and fastest JS library to parse CSV to JSON within few lines of codes
//   https://www.papaparse.com
PapaParse.parse(file, {
    header: true, // This will parse headers and data into an array of field names as of headers'
    complete: function(results) {
        const persons = results.data;

        //2. Sort persons array by 'LastName' ascending.
        persons.sort(alphabeticSort("LastName"));

        //3. Print out the result
        for(let i = 0; i < persons.length; i++){
            console.log(persons[i].FirstName, persons[i].LastName)
        }
    }
});



