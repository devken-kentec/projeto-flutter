import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:you_flutter/models/video.dart';

const API_KEY = "AIzaSyBiRULKomjYxY9jpFT4dgVuENOmPySnUSY";

class Api {
  search(String search) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&maxResults=10"));

    decode(response);
  }

  decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Video> videos = decoded(['snippet']).map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
