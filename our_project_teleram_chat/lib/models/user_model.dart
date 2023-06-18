import 'dart:io';
import '../data_base/chat_database.dart';
import 'chat.dart';

class User {
  String number;
  String name;
  String _password;

  Map<String, String> userChats = {};
  String get password => _password;

  User({
    required this.number,
    required this.name,
    required String password,
  }) : _password = password;

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'password': _password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      number: map['number'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  @override
  String toString() =>
      'User(number: $number, name: $name, password: $password)';

  /// * Boshqa bir userga xabar yuborish
  void sendMessage(User user, String message) {
    /// ! Agar bu user bilan oldin yozishgan bo'lsa chatdatabasega
    /// ! usha xabar shunchaki qo'shib qo'yiladi
    if (userChats.containsKey(user.name)) {
      chb.addMessage(userChats[user.name]!, name, message);
    }

    /// ! Aks holda yangi chat yaratiladi va id beriladi. ID hozirgi userning va
    /// ! yuborilayotgan userning userChats listiga qo'shiladi
    else {
      Chat chat = Chat(sender: name, receiver: user.name, messages: [
        [name, message]
      ]);
      String id = chb.createChat(chat);
      userChats[user.name] = id;
      user.userChats[name] = id;
    }
  }
}

void main(List<String> args) {
  int chiziqUzunligi = stdout.terminalColumns;
  String chiziq = ''.padLeft(chiziqUzunligi, "-");

  // * ikkita user yaratib ko'rdim
  User murodjon =
      User(number: "993041155", name: "Murodjon", password: "Murodjon1!");
  User shaxboz = User(number: "1", name: "Shaxboz", password: "123456");

  // * murodjon shaxbozga "Salom" digan xabar yubordi
  murodjon.sendMessage(shaxboz, "Salom");

  // * ikkala userdaham endi id bor
  print(murodjon.userChats);
  print(shaxboz.userChats);
  print(chiziq);

  // * murodjon shaxbozga yozgan xabarlarini ko'rmoqchi
  chb.chatBase[murodjon.userChats[shaxboz.name]]!.printMessages(murodjon.name);
  print(chiziq);

  // * murodjon yana xabar yubordi
  murodjon.sendMessage(shaxboz, "Nima gapla");

  // * murodjon yana yozgan xabarlarini ko'rmoqchi
  chb.chatBase[murodjon.userChats[shaxboz.name]]!.printMessages(murodjon.name);
  print(chiziq);

  // * endi shaxboz "Tinch oka o'zizdachi?" xabarini yubordi
  shaxboz.sendMessage(murodjon, "Tinch oka o'zizdachi?");

  // * shaxboz kelgan xabarlarni va o'zi yozgan xabarlarni ko'rmoqchi
  chb.chatBase[shaxboz.userChats[murodjon.name]]!.printMessages(shaxboz.name);
  print(chiziq);

  /// Bu hozir chernovik varianti. O'zi shu xabarlani chop qilishshi kodini qisqartirish
  /// kerak edi. Qogani ertaga endi
}
