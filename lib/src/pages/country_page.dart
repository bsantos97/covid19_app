import 'package:covidapiglob/src/models/casoDetails_model.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  //const CountryPage({Key key}) : super(key: key);

  CasoDetailsCountry data;
  CountryPage({@required this.data});

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.data.provinceState}, ${widget.data.iso3}'
        ),
      ),
      body: _createActionsButton(),
    );
  }


  Widget _createActionsButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createAction(Icons.favorite_border, 'Deaths: ${widget.data.deaths}'),
          _createAction(Icons.group_add, 'Confirmed: ${widget.data.confirmed}'),
          _createAction(Icons.child_care, 'Recovered: ${widget.data.recovered}'),
        ],
      ),
    );
  }

  Widget _createAction(IconData icon, String action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          color: Colors.red,
          splashColor: Colors.greenAccent,
          icon: Icon(
            icon,
            size: 40.0,
          ),
          onPressed: () {
            print('$action me maybe');
          },
        ),
        Text(
          action,
          style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}