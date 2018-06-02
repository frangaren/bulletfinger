import 'package:map_view/location.dart' as mapview;
import 'package:google_maps_webservice/geocoding.dart' as geocoding;
import 'package:bulletfinger/config.dart';
import 'package:intl/intl.dart';

class Game {
 DateTime _date;
 double _lat;
 double _lng;
 String _locationName = 'noname';

 Game([this._date, this._lat = 40.9607793, this._lng = -5.672235]) {
   if (this._date == null) {
     this._date = new DateTime.now();
   }
   this._updateLocationName();
 }

 bool isAboutToStart() {
   DateTime reference = (new DateTime.now()).add(new Duration(minutes: 30));
   return reference.compareTo(this._date) >= 0;
 }

 get date {
   return _date;
 }

 set date(DateTime value) {
   this._date = value;
 }

 get latitude {
   return _lat;
 }

 get longitude {
   return _lng;
 }

 mapview.Location get mapLocation {
   return new mapview.Location(_lat, _lng);
 }

 geocoding.Location get geoLocation {
   return new geocoding.Location(_lat, _lng);
 }

 set geoLocation(geocoding.Location value) {
   _lat = value.lat;
   _lng = value.lng;
   this._updateLocationName();
 }

 set mapLocation(mapview.Location value) {
   geoLocation = new geocoding.Location(value.latitude, value.longitude);
 }

 get locationName {
   return this._locationName;
 }

 get dateString {
   DateFormat format = new DateFormat("EEEE', 'd' de 'MMMM' de 'y", "es_ES");
   String string = format.format(_date);
   return string[0].toUpperCase() + string.substring(1);
 }

 get timeString {
   DateFormat format = new DateFormat("HH':'mm");
   return format.format(_date);
 }

 void _updateLocationName() {
   var provider = new geocoding.GoogleMapsGeocoding(GOOGLE_API_KEY);
   provider.searchByLocation(geoLocation, language: 'es-ES').then(
     (geocoding.GeocodingResponse response) {
       if (response.isOkay) {
         this._locationName = response.results[0].formattedAddress;
       } else {
         this._locationName = '(' + _lat.toStringAsFixed(2) + ', ' + _lng.toStringAsFixed(2) + ')';
       }
     }
   );
 }
}