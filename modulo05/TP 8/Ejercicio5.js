const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var departamentos = JSON.parse(rawdata);
var d = '';

for(var i=0;i<departamentos['departamentos'].length;i++){
    if (controlPersona(departamentos['departamentos'][i]['nombre_departamento'])) {
        for(var j=0;j<departamentos['departamentos'][i]['empleados'].length;j++){
            console.log(departamentos['departamentos'][i]['empleados'][j]['nombre']+" "+departamentos['departamentos'][i]['empleados'][j]['puesto']);
        }
    }
}
function controlPersona(d) {
    var ret = false;
        if (d=='Tecnologia') {
            ret = true;   
        }
    return ret;
}