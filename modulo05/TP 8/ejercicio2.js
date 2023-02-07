'use strict';
let jsonData = require('./personas.json');
//console.log(JSON.stringify(jsonData));
//console.log(jsonData);
console.log(JSON.parse(jsonData));

// a- Al agregar la funcion stringify 
//      Funciona, nos devuelve el objeto javascript en formato texto.
// b- Con la funcion parse 
//      dejando la funcion stringify, se rompe.
//      Si sacamos la funcion stringify, no funciona, no reconoce JsonData. Syntax error, la cadena a la analiar no es un Json valido.
