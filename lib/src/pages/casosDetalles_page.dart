import 'package:covidapiglob/src/models/casoDetails_model.dart';
import 'package:covidapiglob/src/models/respuesta_model.dart';
import 'package:covidapiglob/src/pages/country_page.dart';
import 'package:covidapiglob/src/providers/covid19_provider.dart';
import 'package:flutter/material.dart';

class CasoPage extends StatefulWidget {
  @override
  _CasoPageState createState() => _CasoPageState();
}

class _CasoPageState extends State<CasoPage> {
 

  final _covid19 = Covid19Provider();

  final List<CasoDetailsCountry> paises = List();

   //Permite controlar un scroll de cualquier Widget Scrollable
  //Deben ser destruidos cuando se destruya la pagina
  ScrollController _scrollCtrl = new ScrollController();

    //Se llama cuando la pag deja de existir en el Stack
  @override
  void dispose() {
    super.dispose();
    _scrollCtrl.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Caso caso = ModalRoute.of(context).settings.arguments;
    debugPrint(' ******** ${{caso.value.toString()}}');
    var det = caso.detail.toString();
    var caseDRC=det.split('/');
    var caseD=caseDRC.last;
    debugPrint(' ******** ${{det}}');
    debugPrint(' ******** ${{caseDRC}}');
    debugPrint(' ******** ${{caseD}}');


    return Scaffold(
      body: 
       SingleChildScrollView(
                child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _createImageEcuador(),
              // _createTitles(),
              _createText(),
              // _createText(),
              // _createText(),
              Container(child: _createListCountries(caseD)),
            ],
          ),
       ),
    
    );
  }

  Widget _createImageEcuador() {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/load.gif'),
            image: NetworkImage(
              'https://covid19.mathdro.id/api/countries/Ecuador/og',
            )),
      ),
    );
  }

Widget _createListCountries(caseD) {
    //Usando el valor de caso

    return FutureBuilder(
      future: _covid19.getCountriesByCaso(caseD),
      builder: (BuildContext context,
          AsyncSnapshot<List<CasoDetailsCountry>> snapshot) {
        if (snapshot.hasData) {
          //1. Obtener la fuente de datos
          print('58 ${snapshot.data}');
          return _createListView(snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createListView(lista){


    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollCtrl,
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int index) { 
          return _createTitles(lista[index],index);
        },
    );
  }
  
  Widget _createTitles(elemento,ind) {

    debugPrint('Create ${{elemento.deaths}}');
    var my_w = SafeArea(
      child: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              //Expanded, toma el espacio disponible sin alteral el de los otros widgets
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${elemento.provinceState}, ${elemento.countryRegion}',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'Fecha actualizada: ${new DateTime.fromMillisecondsSinceEpoch(elemento.lastUpdate)}',
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  )
                ],
              ),
            ),
            Icon(
              Icons.crop_original,
              color: Colors.blueAccent,
              size: 35.0,
            ),
            Text('${ind+1}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  
    return GestureDetector(
      onDoubleTap: (){
        print("DOOUBLE TAP!!!");

      },
      onTap: (){
        print('TAP!!!!');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => CountryPage(data:elemento)));
      },
      child: my_w,
    );
  }


  Widget _createText() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          'asdasda dsasd asda dsdasd adsasda das dasd asd as d as da sd a sdasdasd asd asdasdasd asd asdasdasd asdasda sdasdasda sdasd asdasd asddsasd sd asdsadsa sd sd asdasdasd asdasdasd asda sdasdsada dasdda dsasdasdas dasdasdas dd.',
          style: TextStyle(
            fontSize: 16.0,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias, //Ayuda a que nada se salga de la tarjeta
      child: Column(
        children: <Widget>[
          FadeInImage(
            imageSemanticLabel: "Hermosas Montanias",
            fit: BoxFit.cover, //Como inscribe la imagen en el contendor
            height: 300.0,
            fadeInDuration: Duration(
                milliseconds:
                    200), //En cuantos milisegundos se dibuja la imagen una vez cargada
            placeholder: AssetImage('assets/loadImage.gif'),
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/2/2c/NZ_Landscape_from_the_van.jpg'), //Cargar una imagen de internet (url)
          ),
          Container(
            child: Text('Puede ser la descripcion de la tarjeta...'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
  }
}
/* return Container(
      child: Text(caso.detail),
    );

 */
/*

  Widget _createListView() {
    return RefreshIndicator(
        child: ListView.builder(
          controller: _scrollCtrl,
          itemCount: _paises_cards.length,
          itemBuilder: (BuildContext context, int index) {
          //final img = _listNum[index];
          return _cardTipo2();
        },), 
        onRefresh: _getCards());
  }

  Future<Null> _getCards() async {
         //Simular una peticion Http y resolver el get
         final duration=Duration(seconds:2);
         new Timer(duration,(){
           _listNum.clear();
           _lastItem++;
           _agregar7();
         });
         return Future.delayed(duration);


  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                semanticsValue: 'Loading Images...',
                semanticsLabel: 'Loading Images...',
                backgroundColor: Colors.indigo,
                strokeWidth: 5.0,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        ],
      );
    } else {
      return Container();
    }
  }


 */