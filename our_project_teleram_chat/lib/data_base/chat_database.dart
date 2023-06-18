import 'package:our_project_teleram_chat/models/chat.dart';
import 'package:uuid/uuid.dart';

ChatBase chb = ChatBase();

class ChatBase {
  Map<String, Chat> chatBase = {};

  String createChat(Chat chat) {
    String id = Uuid().v4();
    chatBase[id] = chat;
    return id;
  }

  void addMessage(String id, String sender, String message) {
    chatBase[id]!.messages = chatBase[id]!.sendMessage(sender, message);
  }
}
