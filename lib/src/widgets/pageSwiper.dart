import 'package:flutter/material.dart';

import 'package:covidapiglob/src/components/backgroundPage.dart';
import 'package:covidapiglob/src/models/respuesta_model.dart';


class PageSwiper extends StatelessWidget {

  final Respuesta data;//Null

  PageSwiper({@required this.data});

  //const PageSwiper({Key key}) : sup//er(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        BackgroundPage(
          child: Image.asset('assets/covid19.png'),
          colorT: Color.fromRGBO(255, 146, 0, 1),
          colorB: Color.fromRGBO(255, 173, 61, 0.9),
          text: "Confirmed",
          caso: data.confirmed,
        ),
        BackgroundPage(
          child: Image.asset('assets/covid19.png'),
          colorT: Color.fromRGBO(0, 255, 134, 1),
          colorB: Color.fromRGBO(63, 255, 163, 0.9),
          text: "Recovered",
          caso: data.recovered,
        ),
        BackgroundPage(
          child: Image.asset('assets/covid19.png'),
          colorT: Color.fromRGBO(255, 0, 66, 1),
          colorB: Color.fromRGBO(255, 49, 102, 0.9),
          text: "Deaths",
          caso: data.deaths,
        ),
      ],
    );
  }
}
