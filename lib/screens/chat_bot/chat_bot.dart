import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text('Layanan Pengguna'),
        centerTitle: true,
        actions: const [Icon(Icons.more_horiz)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Ketik pesan...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _sendMessage(_textController.text);
              _textController.clear();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    setState(() {
      messages.add(Message(text: text, isMe: true, timestamp: DateTime.now()));
    });
  }
}

class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  Message({required this.text, required this.isMe, required this.timestamp});
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                child: const Text(
                  'Obrolan Langsung',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                DateFormat('HH:mm a').format(message.timestamp),
                style: const TextStyle(color: Colors.black, fontSize: 12.0),
              ),
            ],
          ),
          Align(
            alignment:
                message.isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: message.isMe
                    ? const Color(0xFF36725D)
                    : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: message.isMe ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Message> messages = [
  Message(
    text:
        'Selamat datang di Chatbot Pertanian Kami! Bagaimana saya bisa membantu Anda hari ini?',
    isMe: false,
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Message(
      text: 'Silakan ketik pertanyaan atau kata kunci untuk memulai.',
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
  Message(
    text: 'Saya ingin bertanya mengenai kondisi tumbuhan saya',
    isMe: true,
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Message(
    text:
        'Terima kasih atas pertanyaan Anda. Saya akan mencoba memberikan jawaban terbaik.',
    isMe: false,
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Message(
    text:
        'Anda juga bisa mengunggah gambar tanaman untuk mendapatkan informasi lebih lanjut.',
    isMe: false,
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
];
