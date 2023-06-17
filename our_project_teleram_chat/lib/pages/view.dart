import '../data_base/data_base.dart';
import '../models/../models/user_model.dart';
// import 'package:uuid/uuid.dart';
import '../pages/builder.dart';
import '../servise/io_servise.dart';

void main(List<String> args) {
  Menu menu = Menu();
  menu.builder();
}

class Menu extends Builder {
  @override
  void builder() {
    // TODO: implement builder
    super.builder();

    while (true) {
      String common = io.outputText(
          "_________________Xush kelibsiz___________________\n1.SignIn\n2.SignUp\n3.exit\n");

      switch (common) {
        case "1":
          SignIn();
          break;
        case "2":
          signUp();
          break;
        default:
      }
    }
  }
}

void signUp() {
  String number = "";
  String name = "";
  String password = "";
  bool check = false;
  db.takror(number, name, password);
}

void SignIn() {
  String number = io.outputText("******Sign UP*****\n number kiriting: ");
  String password = io.outputText(" parol kiriting: ");
  print(db.readUser(number));
  db.userData[number];
  String see = io.outputText("1.read contakt\n2.chat\n ");
  switch (see) {
    case "1":
      print(db.readAllUsers());
      break;
    case "2":
      break;
    default:
  }
}
