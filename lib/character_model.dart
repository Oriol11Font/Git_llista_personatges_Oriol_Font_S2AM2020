import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Character {
  final String name;
  final String ageActor;
  final String status;
  final String description;
  String imageUrl;

  int rating = 0;

  Character(this.name, this.ageActor, this.status, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      var uri = new Uri.http('raw.githubusercontent.com', '/Oriol11Font/twd-api/api/api/name/'+ this.name +'.json');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      var decoded = json.decode(responseBody);
      var url = decoded['image'];
      imageUrl = url;

    } catch (exception) {
      print(exception);
    }
  }
}