import '../models/user_model.dart';

class DataBase {
  Map<String, Map<String, dynamic>> userData = {
    "1": {
      "number": "1",
      "name": "1",
      "password": "1",
    }
  };

  bool createUser(User user) {
    //agar ichida bulsa falsa qaytaradi
    if (userData.containsKey(user.number)) {
      return false;
    }
    userData[user.number] =
        user.toMap(); //agar ichida bulmasa userni numberini mapga ugiradi
    return true;
  }

  List<Map<String, dynamic>> readAllUsers() {
    return userData.values.toList();
  }

  User? readUser(String number) {
    if (userData.containsKey(number)) {
      return User.fromMap(userData[number]!);
    }
    return null;
  }
}
