import 'dart:io';

class Chat {

  String qabulQiluvchi;
  String message;
  Chat({
    required this.qabulQiluvchi,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'qabulQiluvchi': qabulQiluvchi,
      'message': message,
    
  String sender;
  String receiver;
  List<List<String>> messages;

  Chat({
    required this.sender,
    required this.receiver,
    List<List<String>>? messages,
  }) : messages = messages ?? [];

  List<List<String>> sendMessage(String sender, String message) {
    messages.add([sender, message]);
    return messages;
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'receiver': receiver,
      'messages': messages,

    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(

      qabulQiluvchi: map['qabulQiluvchi'] ?? '',
      message: map['message'] ?? '',

      sender: map['sender'] ?? '',
      receiver: map['receiver'] ?? '',
      messages: map['messages'] ?? [],
>>>>>>> 87c77ee9e7ba66abcef9f479e833a6192abb2de2
    );
  }

  void printMessages(String currentUser) {
    for (final sms in messages) {
      if (sms[0] == currentUser) {
        printMessageEndLine(sms[1]);
      } else {
        print(sms[1]);
      }
    }
  }

  void printMessageEndLine(String message) {
    print(message.padLeft(stdout.terminalColumns));
  }
}
