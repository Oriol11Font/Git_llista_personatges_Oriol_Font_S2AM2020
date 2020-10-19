import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'character_model.dart';
import 'character_list.dart';
import 'new_character_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TWD - PERSONAJES',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'TWD - PERSONAJES',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var list;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0));

    setState(() {
      list = initialCharacters;
    });

    return null;
  }

  List<Character> initialCharacters = []
    //..add(Character('','','',''))
    ..add(Character('Rick Grimes', 'Aprox. 46 años', 'Desaparecido. Lider de Alexandria',
        '"Mi misericordia, prevalece... sobre mi ira." - Rick Grimes. '))
    ..add(Character('Daryl Dixon', 'Aprox. 40 años', 'Viviendo en Alexandria', '"Lo que dijiste antes, que teníamos que cuidar de nosotros... Pues buscar a más gente, es cuidarnos también." - Daryl Dixon'))
    ..add(Character('Carol Peletier', 'Aprox. 45 años', 'Viviendo en El Reino',
        '"Lo único que hace que te conviertas en monstruo, es matar." - Carol Peletier'))
    ..add(Character('Ezekiel','Aprox. 45 años','Viviendo liderando El Reino','"	Necesitaban alguien a quien seguir, así que... Hice el papel" - Ezekiel'))
    ..add(Character('Negan','Aprox. 50 años', 'Viviendo preso en Alexandria', '"Hilltop aprenderá a obedecer, de un modo u otro. Ya sea muertos o vivos, o algo a mitad de camino" - Negan'))
    ..add(Character('Glenn Rhee', 'Aprox. 25 años', 'Muerto. Asesinado por Negan', '"La gente que amas... te hicieron quien eres. Siguen siendo parte de ti. Si dejas de ser tú, ese último pedazo de ellos que todavía está por dentro, quién eres ... se ha ido" - Glenn Rhee'))
    ..add(Character('Carl Grimes', 'Aprox. 15 años', 'Muerto. Convertido en Zombie', '"Mamá, antes de morir, me dijo que yo iba a vencer este mundo... No lo hice... Pero tú podrás." - Carl Grimes'))
    ..add(Character('Maggie Greene','Aprox. 30 años', 'Desaparecida. Lider de Hilltop', '"Ahora este es nuestro hogar, así que deberías aprender a llamarme por mi nombre, no Marsha, no querida, no cariño. Maggie... Maggie Rhee" - Maggie Greene'))
    ..add(Character('Michonne Hawthorne','Aprox. 35 años', 'Desaparecida. Buscando a Rick', '"Pero... incluso ahora... después de todo este tiempo, rodeados de oscuridad... aún hay destellos de luz... pequeños faros que brillan, llamándonos. No basta para iluminar el camino por delante, pero... es suficiente para seguir. Seguir intentándolo. Seguir luchando. Seguir soñando. Así que eso es lo que hago cada segundo de cada día... por ti, por nosotros. No me he rendido y nunca lo haré." - Michonne Hawthorne'))
    ..add(Character('Hershel Greene','Aprox. 65 años', 'Muerto. Asesinado por El Gobernador', '"Sales allá afuera, arriesgas tu vida. Tomas un trago de agua, arriesgas tu vida. Y hoy en día hasta respiras, y arriesgas tu vida. Ahora ya no tenemos opción. La única cosa que puedes escoger es por qué te arriesgas. Ahora puedo hacer que esa gente se sienta mejor y resista un poco más. Puedo salvar vidas. Esa es razón suficiente para arriesgar la mía." - Hershel Greene'))
    ..add(Character('Eugene Porter','Aprox. 35 años', 'Viviendo en Hilltop', '"Sé que soy más inteligente que la mayoría de las personas. Sé que soy un muy buen mentiroso. Y sé que necesitaba llegar a Washington." - Eugene Porter'));

  Future _showNewCharacterForm() async {
    Character newCharacter = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddCharacterFormPage();
    }));
    if (newCharacter != null) {
      initialCharacters.add(newCharacter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown[900],
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: new IconButton(
                  icon: new Icon(Icons.refresh),
                  onPressed: refreshList,
                  ),
                ),
            Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: new IconButton(
                  icon: new Icon(Icons.add),
                  onPressed: _showNewCharacterForm,
                ),
            ),

          ],
      ),
      body: Container(
          key: refreshKey,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                .1,
                .5,
                .7,
                .9
              ],
              colors: [
                Colors.brown[800],
                Colors.brown[700],
                Colors.brown[600],
                Colors.brown[400]
          ])),
          child: new Center(
              child: new CharacterList(initialCharacters),
          ),
      ),
    );
  }
}
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown[900],
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewCharacterForm,
          ),
        ],
      ),
      body: Container(
          key: refreshKey,
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    .1,
                    .5,
                    .7,
                    .9
                  ],
                  colors: [
                    Colors.brown[800],
                    Colors.brown[700],
                    Colors.brown[600],
                    Colors.brown[400]
                  ])),
          child: new Center(
            child: new CharacterList(initialCharacters),
          ),
        onRefresh: refreshList,
      ),


      );

      RefreshIndicator(
            key: refreshKey,
            color: Colors.black,
            backgroundColor: Colors.brown[700],
            child: new Center(
              child: new CharacterList(initialCharacters),
            ),
            onRefresh: refreshList,
          ),
  }*/

