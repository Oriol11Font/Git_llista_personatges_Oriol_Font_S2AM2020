import 'package:flutter/material.dart';
import 'character_model.dart';
import 'dart:async';

class CharacterDetailPage extends StatefulWidget {
  final Character character;
  CharacterDetailPage(this.character);

  @override
  _CharacterDetailPageState createState() => new _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  final double characterAvartarSize = 150.0;
  double _sliderValue = 5.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new Slider(
                  activeColor: Colors.redAccent,
                  min: 0.0,
                  max: 10.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              new Container(
                width: 50.0,
                alignment: Alignment.center,
                child: new Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  void updateRating() {
      setState(() {
        widget.character.rating = _sliderValue.toInt();
      });
  }

  /*Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Error!'),
            content: new Text("They're good dogs, Brant."),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Try Again'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }*/

  Widget get submitRatingButton {
    return new RaisedButton(
      onPressed: () => updateRating(),
      child: new Text('Actualizar'),
      color: Colors.redAccent,
    );
  }

  // ignore: non_constant_identifier_names
  Widget get CharacterImage {
    return new Hero(
      tag: widget.character,
      child: new Container(
        height: characterAvartarSize,
        width: characterAvartarSize,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              const BoxShadow(
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1f000000))
            ],
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(widget.character.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 40.0,
        ),
        new Text(
          '${widget.character.rating}/10',
          style: Theme.of(context).textTheme.display2,
        )
      ],
    );
  }

  Widget get characterProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [.1, .5, .7, .9],
          colors: [
            Colors.brown[800],
            Colors.brown[700],
            Colors.brown[600],
            Colors.brown[400]
          ],
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CharacterImage,
          new Text(
            '${widget.character.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          new Text(
            '${widget.character.ageActor}',
            style: TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: new Text(widget.character.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: new AppBar(
        backgroundColor: Colors.brown[900],
        title: new Text('Conoce a ${widget.character.name}'),
      ),
      body: new ListView(
        children: <Widget>[characterProfile, addYourRating],
      ),
    );
  }
}
