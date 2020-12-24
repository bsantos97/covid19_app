import 'package:covidapiglob/src/pages/casosDetalles_page.dart';
import 'package:covidapiglob/src/pages/home_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  //Constructor por defecto

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: true,
    
      initialRoute: '/',
      routes: {
        '/': (BuildContext context)=>HomePage(),
        'casos':(BuildContext context)=>CasoPage(),
        //Ruta nueva
      },
    );
  }
}