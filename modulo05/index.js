const express =  require('express');
const app = express();
const morgan = require('morgan');

app.set('puerto', 3001);
// middlewares
app.use(morgan('dev'));

app.get('/',(req,res)=>{
    res.send('BUENAS NOCHES silicon');
});

// Arranco el servidor
app.listen(app.get('puerto'), ()=>{
console.log('Hola soy un programa '+app.get('puerto'))
});

//
const operacion = require("./programa")
// LLamado al objeto operacion
operacion.sumar(4, 3)
