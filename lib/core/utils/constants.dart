import 'package:flutter/services.dart';
import 'package:ride_sharing/core/models/address.dart';

class Constants {
  static String apiKey = "AIzaSyCyEmNAa9Zt0wmSMohBs4zQ1aMd8XCIG8s";

  static String placeUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";

  static String mapStyle = "";
  static void setMapStyle() {
    rootBundle.loadString('assets/images/map_style.txt').then((string) {
      mapStyle = string;
    });
  }

  static Address address = Address(
      latitude: 6.5244,
      longitude: 3.3792,
      placeFormattedAddress: "Lagos",
      placeId: "",
      placeName: "Lagos");

  static String startPlaceId = "ChIJ6WGmt9GNOxART3ZQNfVMdQs";
  static String endPlaceId = "ChIJJeCgOuWNOxARjaZlplRs7nE";
}
