import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubbleChatBot extends StatefulWidget {
  final Message message;
  final String profileImageUrl;

  const MessageBubbleChatBot({
    Key? key,
    required this.message,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  State<MessageBubbleChatBot> createState() => _MessageBubbleChatBotState();
}

class _MessageBubbleChatBotState extends State<MessageBubbleChatBot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: widget.message.isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!widget.message.isMe)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.profileImageUrl),
                    radius: 14,
                  ),
                ),
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
                DateFormat('HH:mm a').format(widget.message.timestamp),
                style: const TextStyle(color: Colors.black, fontSize: 12.0),
              ),
            ],
          ),
          Align(
            alignment: widget.message.isMe
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: !widget.message.isMe ? 36.0 : 0.0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  constraints: const BoxConstraints(
                    maxWidth: 250.0,
                  ),
                  decoration: BoxDecoration(
                    color: widget.message.isMe
                        ? const Color(0xFF36725D)
                        : const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    widget.message.text,
                    style: TextStyle(
                      color: widget.message.isMe ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                if (widget.message.isMe)
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: const Text(
                      'Read',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  Message({required this.text, required this.isMe, required this.timestamp});
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