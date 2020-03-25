import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const api_key = "AIzaSyCkz4Gqi1DBPpqJ1MhSy_cKm6d7rvEsfqo";

class GoogleMapsServices{

  Future<dynamic> get(LatLng l1, LatLng l2) {
    print("GOOGLE MAP SERVICES L1=:>>>>>${l1.latitude},${l1.longitude}");
    print("\n\n");
    print("GOOGLE MAP SERVICES L2=:>>>>>${l2.latitude},${l2.longitude}");
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$api_key";
    return http.get(url).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(res);
      }
      print("GOOGLE MAP SERVICES=    ${response.body}");
      Map values = jsonDecode(response.body);
      return values["routes"][0]["overview_polyline"]["points"];
    });
  }

//  Future<String> getRouteCoordinates(LatLng l1, LatLng l2) async {
//    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$api_key";
//    print("GOOGLE MAP SERVICES L1=:>>>>>${l1.latitude},${l1.longitude}");
//    print("\n\n");
//    print("GOOGLE MAP SERVICES L2=:>>>>>${l2.latitude},${l2.longitude}");
//    http.Response response = await http.get(url);
//    print("GOOGLE MAP SERVICES=    ${response.body}");
//    Map values = jsonDecode(response.body);
//    return values["routes"][0]["overview_polyline"]["points"];
//  }
}