import '../models/user_model.dart';

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
      return false;
    }
    userData[user.number] =
        user.toMap(); //agar ichida bulmasa userni numberini mapga ugiradi
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
}
