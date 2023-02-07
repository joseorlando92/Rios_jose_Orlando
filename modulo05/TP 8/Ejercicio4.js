const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);
var p = '';
for(var i=0;i<persona['personas'].length;i++){
    if (controlPersona(persona['personas'][i]['nombre'])) {
        console.log(persona['personas'][i]['nombre']+ " " +persona['personas'][i]['apellido']);    
    }
}
function controlPersona(p) {
    ret = false;
    if (p=='Maria') {
        ret = true;   
    }else{
        if (p=='Ramon') {
            ret = true;
        }
    }
    return ret;
}