// Real class
class Cat {
  int _lives = 9;
  List<String> _foodEaten = List<String>();

  int get lives => _lives;
  set lives (_) => {_lives = _};
  List<String> get foodEaten => _foodEaten;

  String sound() {
     return "Meow";
  }
  bool eatFood(String food, {bool hungry=false}) {
    if (food == "Nothing")
      return false;
    if (food == "Fish") {
      _foodEaten.add(food);
      return true;
    }
    if ((food == "Milk") && (hungry)) {
      _foodEaten.add(food);
      return true;
    }
    return false;
  } 

  Future<void> chew({String food="food"}) async {
    print("Chewing $food...\n");
  }
  
  int walk(List<String> places) {
    return places.length;
  }
  
  void sleep() {
  }
  
  void hunt(String place, String prey) {
  }
}


class Places {
  String _name;
  Places(this._name);

  String get name => _name;
  List<String> places() {
    List<String> pls = List<String>();
    pls.add("backyard");
    pls.add("tree");
    pls.add("room");
    return pls;
  }

  String food(String place) {
    if (place == "backyard")
      return "Fish";
    else if (place == "room")      
      return "Milk";
    return "Nothing";
  }
}

class HuntGame{
    final Cat _cat;

    HuntGame(this._cat);

    void play1(String plsName) async {
        final Places _places = Places(plsName);
        print("$plsName started...\n");

        List<String> pls = _places.places();
        for (String pl in pls) {
          String food = _places.food(pl);
          print("$plsName in place: $pl now, found: $food");
          if (_cat.eatFood(food)) {
            await _cat.chew(food:food);
          }
        }
        print("$plsName ended.\n");
    }

}