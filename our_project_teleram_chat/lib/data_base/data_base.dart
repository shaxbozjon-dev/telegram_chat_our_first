import '../models/user_model.dart';
import '../service/io_service.dart';

DataBase db = DataBase();

class DataBase {
  Map<String, Map<String, dynamic>> userData = {
    "1": {
      "number": "1",
      "name": "1",
      "password": "1",
    }
  };

  ///Create User
  bool createUser(User user) {
    //agar ichida bulsa falsa qaytaradi
    if (userData.containsKey(user.number)) {
      print("bunday raqam bilan oldin ruyhatdan utilgan ❓❓❌📛📛");
      return false;
    }
    userData[user.number] =
        user.toMap(); //agar ichida bulmasa userni numberini mapga ugiradi
    print("✅✅");
    return true;
  }

  ///Read All Users
  List<Map<String, dynamic>> readAllUsers() {
    return userData.values.toList();
  }

  ///Read User from number
  User? readUser(String number) {
    if (userData.containsKey(number)) {
      return User.fromMap(userData[number]!);
    }
    return null;
  }

  void takror(String number, String name, String password) {
    bool check = false;
    while (check != true) {
      if (number.isEmpty) {
        number = io.outputText("******Ruyhadan utish*****\n number kiriting: ");
        check = false;
      }
      if (name.isEmpty) {
        name = io.outputText(" name kiriting: ");
        check = false;
      }
      if (password.isEmpty) {
        password = io.outputText(" parol kiriting: ");
        check = false;
      }
      if (number.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
        check = true;
        User newUser = User(number: number, name: name, password: password);
        print(db.createUser(newUser));
      }
    }
  }
}
