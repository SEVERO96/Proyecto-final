import 'dart:io';
import 'package:flutter/material.dart';


class MyUsers extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Material App',
      home: Mi_pagina1(),
    );
  }
}
class Mi_pagina1 extends StatefulWidget {
  @override
  State<Mi_pagina1> createState( ) => _Mi_pagina1State( );
}
class _Mi_pagina1State extends State<Mi_pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mercancia en proceso'),
      ),




//__________________________________________________ boton con funcion de agregar alumnos
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.people_alt_outlined),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Mi_pagina2()));
        },
      ),
      body: ListView.builder(
          itemCount: _mercancias.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title:
              Text(_mercancias[index].name + ' ' + _mercancias[index].diaLlegada),
              subtitle: Text(_mercancias[index].horaLlegada),
              leading: CircleAvatar(
                child: Text(_mercancias[index].name.substring(0, 1)),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          }
      ),
    );
  }
}
//_______________________________________ mi pagina 2
class Mi_pagina2 extends StatefulWidget {
  @override
  State<Mi_pagina2> createState() => _Mi_pagina2State();
}
class _Mi_pagina2State extends State<Mi_pagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Mercancia'),
      ),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: TextField(
                  controller: nom,
                  decoration: InputDecoration(
                      hintText: 'Nombre de mercancia',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 5.0,),


              Container(
                child: TextField(
                  controller: dia,
                  decoration: InputDecoration(
                      hintText: 'Dia Llegada',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 5.0,),

              Container(
                  child: TextField(
                    controller: hora,
                    decoration: InputDecoration(
                        hintText: 'Hora de Llegada',
                        filled: true,
                        fillColor: Colors.white
                    ),
                  )
              ),
              SizedBox(height: 5.0,),

              Container(
                child: TextField(
                  controller: puer,
                  decoration: InputDecoration(
                      hintText: 'Puerto',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 5.0,),

              Container(
                child: TextField(
                  controller: dimen,
                  decoration: InputDecoration(
                      hintText: 'Dimension (en mtr cubicos)',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 5.0,),

              Container(
                child: TextField(
                  controller: peso,
                  decoration: InputDecoration(
                      hintText: 'Peso (kg)',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 5.0,),

              Container(
                child: TextField(
                  controller: carga,
                  decoration: InputDecoration(
                      hintText: 'Tipo de carga',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 5.0,),

              Container(
                child: TextField(
                  controller: dest,
                  decoration: InputDecoration(
                      hintText: 'Destino',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
              ),

              SizedBox(height: 15.0,),
              Container(
                child: FlatButton(
                  child: Text('Guardar', style: TextStyle(fontSize: 25.0, color: Colors.white ),),
                  color: Colors.green,
                  onPressed: (){


                    tnom = nom.text;
                    tdia = dia.text;
                    thora = hora.text;
                    tpuer = puer.text;
                    tdimen = dimen.text;
                    tpeso = peso.text;
                    tcarga = carga.text;
                    tdest = dest.text;

                    _mercancias.add(mercancia(tnom, tdia, thora, tpuer, tdimen, tpeso, tcarga, tdest));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Mi_pagina1()));


                  },
                ),
              ),

            ]
        ),
      ),
    );
  }
}

//________________________________________________________
List<mercancia> _mercancias =[
  mercancia('mercancia de ropa','13/12/2021', '13:30','SSA', '3M', '500', 'Producto elevorado', 'monterrey'),
  mercancia('mercancia de tela','15/12/2021', '13:30','SSA', '4M', '1000', 'Materia prima', 'monterrey'),
];

final nom = TextEditingController();
final dia = TextEditingController();
final hora = TextEditingController();
final puer = TextEditingController();
final dimen = TextEditingController();
final peso = TextEditingController();
final carga = TextEditingController();
final dest = TextEditingController();



String tnom = '';
String tdia = '';
String thora = '';
String tpuer = '';
String tdimen = '';
String tpeso = '';
String tcarga = '';
String tdest = '';


class mercancia{
  String name;
  String diaLlegada;
  String horaLlegada;
  String puertoLlegada;
  String dimension;
  String peso;
  String tipoCarga;
  String destino;

  mercancia(this.name, this.diaLlegada, this.horaLlegada, this.puertoLlegada, this.dimension, this.peso, this.tipoCarga, this.destino);
}


