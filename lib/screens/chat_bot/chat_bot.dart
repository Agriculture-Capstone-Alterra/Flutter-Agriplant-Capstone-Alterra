import 'package:capstone_project/screens/chat_bot/first_screen_chat_bot.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final String profileChatBot =
      "https://img.id.my-best.com/product_images/e252dc0caddfb4eee8ef54412dcc7466.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=13bd51345ee9a4cd89ba173628fe451e";
  final TextEditingController _textController = TextEditingController();
  bool isThumbUpPressed = false;
  bool isThumbDownPressed = false;
  bool isVisible = true; // Variabel untuk mengatur visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            print('Leading tapped');
          },
          child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                ),
              )),
        ),
        title: const Text('Layanan Pengguna'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
            ),
            child: PopupMenuButton(
              icon: const Icon(Icons.more_horiz),
              onSelected: (value) {
                handleMenuSelection(value, context);
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'menu1',
                    child: Row(
                      children: [
                        Icon(Icons.chat_bubble_outline),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Akhiri Sesi'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'menu2',
                    child: Row(
                      children: [
                        Icon(Icons.ios_share),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Bagikan Percakapan'),
                      ],
                    ),
                  ),
                ];
              },
              offset: const Offset(0, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFE3E3E3),
      body: Column(
        children: [
          Visibility(
            visible: isVisible,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 16.0,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(126.0),
                              child: Image.network(
                                profileChatBot,
                                width: 126,
                                height: 126,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 10.43,
                                height: 10.43,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chatbot',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'Agen Pendukung',
                        style: TextStyle(
                          color: Color(0xFFA5A5A5),
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isThumbUpPressed = !isThumbUpPressed;
                              if (isThumbUpPressed) {
                                isThumbDownPressed = false;
                              }
                            });

                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                isThumbUpPressed = false;

                                isVisible = false;
                              });
                            });
                          },
                          icon: Icon(
                            isThumbUpPressed
                                ? Icons.thumb_up_alt_rounded
                                : Icons.thumb_up_off_alt,
                            color: const Color(0xFF454B58),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isThumbDownPressed = !isThumbDownPressed;
                              if (isThumbDownPressed) {
                                isThumbUpPressed = false;
                              }
                            });

                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                isThumbDownPressed = false;

                                isVisible = false;
                              });
                            });
                          },
                          icon: Icon(
                            isThumbDownPressed
                                ? Icons.thumb_down_alt_rounded
                                : Icons.thumb_down_off_alt,
                            color: const Color(0xFF454B58),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1.0, color: Colors.grey),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index],
                  profileImageUrl: !messages[index].isMe
                      ? 'https://img.id.my-best.com/product_images/e252dc0caddfb4eee8ef54412dcc7466.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=13bd51345ee9a4cd89ba173628fe451e'
                      : '',
                );
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  void handleMenuSelection(String value, BuildContext context) {
    switch (value) {
      case 'menu1':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(
                child: Text(
                  "Akhiri Sesi ini?",
                  textAlign: TextAlign.center,
                ),
              ),
              content: const Text(
                "Jika mengakhiri sesi ini data chat akan terhapus",
                style: TextStyle(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup AlertDialog
                  },
                  child: const Text("Tidak"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstScreenChatBot()),
                    );
                  },
                  child: const Text("Ya"),
                ),
              ],
            );
          },
        );
        break;
      case 'menu2':
        print('Menu Item 2 tapped');
        break;
    }
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
  final String profileImageUrl;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.profileImageUrl,
  }) : super(key: key);

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
            mainAxisAlignment:
                message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!message.isMe)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profileImageUrl),
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
                DateFormat('HH:mm a').format(message.timestamp),
                style: const TextStyle(color: Colors.black, fontSize: 12.0),
              ),
            ],
          ),
          Align(
            alignment:
                message.isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: !message.isMe ? 36.0 : 0.0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  constraints: const BoxConstraints(
                    maxWidth: 250.0,
                  ),
                  decoration: BoxDecoration(
                    color: message.isMe
                        ? const Color(0xFF36725D)
                        : const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isMe ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                if (message.isMe)
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
