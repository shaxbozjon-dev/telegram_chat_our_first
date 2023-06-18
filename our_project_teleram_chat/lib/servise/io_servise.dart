import 'dart:io';

IoServise io = IoServise();

class IoServise {
  void _console(String str) {
    stdout.write(str); //?textni shaklida olib beradi
  }

  String outputText(String str) {
    _console(str); //?text olib beryabdi
    return stdin.readLineSync() ?? ""; //tekst va str kitishni suraydi
  }

  int outputNumber(String str) {
    _console(str);
    return int.tryParse(stdin.readLineSync() ?? "") ??
        -1; // raqam kiritishni suraydi
  }
}
