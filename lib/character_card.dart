import 'package:basic_flutter_app/character_model.dart';
import 'character_detail_page.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  CharacterCard(this.character);

  @override
  _CharacterCardState createState() => _CharacterCardState(character);
}

class _CharacterCardState extends State<CharacterCard> {
  Character character;
  String renderUrl;

  _CharacterCardState(this.character);

  void initState() {
    super.initState();
    renderCharacterPic();
  }

  Widget get characterImage {
    var characterAvatar = new Hero(
      tag: character,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.cover, image: new NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black54, Colors.black, Colors.brown[400]])),
      alignment: Alignment.center,
      child: new Text(
        'TWD',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: characterAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderCharacterPic() async {
    await character.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = character.imageUrl;
      });
    }
  }

  Widget get characterCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290,
        height: 115,
        child: new Card(
          color: Colors.black87,
          child: new Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 65),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  widget.character.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                new Text(
                  widget.character.ageActor,
                  style: Theme.of(context).textTheme.subhead,
                ),
                new Text(
                  widget.character.status,
                  style: Theme.of(context).textTheme.caption,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.star),
                    new Text(':  ${widget.character.rating} / 10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showCharacterDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new CharacterDetailPage(character);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => showCharacterDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              characterCard,
              new Positioned(top: 7.5, child: characterImage),
            ],
          ),
        ),
      ),
    );
  }
}
