import 'dart:convert';

Map<String, Map<String, dynamic>> chatslar = {
  "1": {
    "qabul_qiluvchi": "message",
  },
};

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
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      qabulQiluvchi: map['qabulQiluvchi'] ?? '',
      message: map['message'] ?? '',
    );
  }
}
