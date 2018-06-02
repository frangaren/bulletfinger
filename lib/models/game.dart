class Game {
 DateTime _date;

 Game(this._date);

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

}