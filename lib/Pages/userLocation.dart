import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

Future<Position> getUserLocationCoordinates() async {
  Position position =
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  return position;
}

Future<String> getUserLocationAddress() async {
  Position position =
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  Coordinates latlong = new Coordinates(position.latitude, position.longitude);
  var addresses = await Geocoder.local.findAddressesFromCoordinates(latlong);
  var first = addresses.first;
  return first.addressLine;
}
