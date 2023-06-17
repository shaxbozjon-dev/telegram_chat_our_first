import 'dart:io';

IOService io = IOService();

class IOService {
  static int columns = stdout.terminalColumns;

  void _console(String text) {
    stdout.write(text);
  }

  void clr() => print("\x1B[2J\x1B[0;0H");
}
