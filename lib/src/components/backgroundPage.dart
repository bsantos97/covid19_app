import 'package:covidapiglob/src/models/respuesta_model.dart';
import 'package:flutter/material.dart';

class BackgroundPage extends StatefulWidget {
  //const BackgroundPage({Key key}) : super(key: key);
  final Color colorT;
  final Color colorB;
  final Caso caso;

  final String text;
  final Widget child;

  BackgroundPage(
      {@required this.colorT,
      @required this.colorB,
      @required this.caso,
      @required this.text,
      @required this.child});

  @override
  _BackgroundPageState createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage>
    with SingleTickerProviderStateMixin {
  final _titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 5,
  );

  AnimationController _animationCtrl;

  initState() {
    _animationCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _backgroundApp(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.caso.value.toString(),
                style: _titleStyle,
              ),
              Text(
                widget.text,
                style: _titleStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _backgroundApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(

            //begin: FractionalOffset(0.0, 0.6),
            //end: FractionalOffset(0.0, 1.0),
            colors: [
              widget.colorT,
              widget.colorB,
            ]),
      ),
    );

    final covid19 = Container(height: 360.0, width: 360.0, child: widget.child);

    final covid19Btn = IconButton(
      iconSize: 300,
      onPressed: () {
        print('T');
        Navigator.pushNamed(context, 'casos',
                      arguments: widget.caso);
      },
      icon: Stack(alignment: Alignment.center, children: <Widget>[
        _rotateChild(Image.asset(
          'assets/covid19.png',
        )),
        Text(
          'Click!',
          style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold,)
        )
      ]),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(top: -90, left: -90, child: covid19),
        Positioned(right: -85, bottom: -105, child: covid19Btn),
      ],
    );
  }

  Widget _rotateChild(Widget item) {
    _animationCtrl.repeat();
    return RotationTransition(
        child: item, turns: turnsTween.animate(_animationCtrl));
  }
}
/*
final box = Transform.rotate(
      
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/covid19.png')),
            borderRadius: BorderRadius.circular(75.0),
            gradient: RadialGradient(colors: [
              Color.fromRGBO(107, 140, 182, 1),
              Color.fromRGBO(107, 140, 182, 0.5),
            ])),
      ),
    );


Positioned(
            //Elemento con cordenadas especificas
            top: -90,
            left: -90,
            child: box),
        Positioned(right: -90, bottom: 50, child: box),
 */
