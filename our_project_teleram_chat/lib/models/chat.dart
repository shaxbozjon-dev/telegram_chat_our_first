import 'dart:convert';

Map<String, Map<String, dynamic>> chatslar = {
  "1": {
    "qabul_qiluvchi": "message",
  },
};

class Chat {
  String junatuvchi;
  String qabulQiluvchi;
  String message;
  Chat({
    required this.junatuvchi,
    required this.qabulQiluvchi,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'junatuvchi': junatuvchi,
      'qabulQiluvchi': qabulQiluvchi,
      'message': message,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      junatuvchi: map['junatuvchi'] ?? '',
      qabulQiluvchi: map['qabulQiluvchi'] ?? '',
      message: map['message'] ?? '',
    );
  }
}
