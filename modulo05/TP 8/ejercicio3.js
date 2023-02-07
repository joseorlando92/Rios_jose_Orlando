'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
//console.log(JSON.parse(data));
console.log(JSON.stringify(data));
console.log(data);
});
// En ambos casos devuelve los valores almacenados en el buffer