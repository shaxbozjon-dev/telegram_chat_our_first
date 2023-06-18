import 'dart:io';

IOService io = IOService();

class IOService {
  static int columns = stdout.terminalColumns;

  void _console(String text) {
    stdout.write(text);
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

  void clr() => print("\x1B[2J\x1B[0;0H");
}
