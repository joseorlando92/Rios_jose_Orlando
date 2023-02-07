const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
let persona = JSON.parse(rawdata);
console.log(persona);
//console.log(JSON.stringify(rawdata));
// Cuando reemplazamos las ultimas dos lineas de codigo:
//      muestra una serie de numeros porque falta la funcion parse.

// El metodo Parse transforma un texto en un objeto Javascript

// El metodo Stringify transforma un objeto de javascript en texto, pero sin la funcion parse se rompe.