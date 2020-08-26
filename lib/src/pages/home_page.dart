
import 'package:covidapiglob/src/models/respuesta_model.dart';
import 'package:covidapiglob/src/providers/covid19_provider.dart';
import 'package:covidapiglob/src/widgets/pageSwiper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  final _covid19=Covid19Provider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages(),
    );
  }
  Widget _pages(){
    return FutureBuilder(
      future: _covid19.getRespuesta(),
      builder: (BuildContext context, AsyncSnapshot<Respuesta> snapshot) {
        if(snapshot.hasData){
          return PageSwiper( data: snapshot.data,);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      
    );
  }

}
