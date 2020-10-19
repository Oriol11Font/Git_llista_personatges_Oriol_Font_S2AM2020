import 'package:basic_flutter_app/character_model.dart';
import 'package:flutter/material.dart';

class AddCharacterFormPage extends StatefulWidget {
  @override
  _AddCharacterFormPageState createState() => new _AddCharacterFormPageState();
}

class _AddCharacterFormPageState extends State<AddCharacterFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController actorController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();


  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.redAccent,
        content: new Text('Obligatorio un nombre!'),
      ));
    } else {
      var newCharacter = new Character(nameController.text, ageController.text, actorController.text,
          descriptionController.text);
      Navigator.of(context).pop(newCharacter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Añade un personaje'),
        backgroundColor: Colors.brown[900],
      ),
      body: new Container(
        color: Colors.brown[700],
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: new TextField(
                autofocus: true,
                controller: nameController,
                onChanged: (text) {},
                decoration: new InputDecoration(labelText: 'Nombre'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: new TextField(
                keyboardType: TextInputType.number,
                controller: ageController,
                onChanged: (text) {},
                decoration: new InputDecoration(labelText: "Edad"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: new TextField(
                controller: actorController,
                onChanged: (text) {},
                decoration: new InputDecoration(labelText: "Estado"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: new TextField(
                controller: descriptionController,
                onChanged: (text) {},
                decoration: new InputDecoration(labelText: 'Frase del personaje'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Builder(
                builder: (context) {
                  return new RaisedButton(
                    onPressed: () => submitPup(context),
                    color: Colors.redAccent,
                    child: new Text('Añadir'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
