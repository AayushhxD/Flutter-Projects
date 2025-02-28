import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [
    {
      'message': "Hello!",
      'time': "12:28",
      'isSent': true, // Sender's message
    },
    {
      'message':
          "Thank you very much for your traveling, we really like the apartments. We will stay here for another 5 days...",
      'time': "12:28",
      'isSent': true, // Sender's message
    },
    {
      'message': "Hello!",
      'time': "12:30",
      'isSent': false, // Receiver's message
    },
    {
      'message': "I'm very glad you like it👍",
      'time': "12:32",
      'isSent': false, // Receiver's message
    },
    {
      'message': "We are arriving today at 01:45, will someone be at home?",
      'time': "12:35",
      'isSent': false, // Receiver's message
    },
  ];
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'message': _messageController.text,
          'time': DateTime.now().hour.toString() +
              ":" +
              DateTime.now().minute.toString(),
          'isSent': true, // Sender's message
        });
        _messageController.clear();
      });
    }
  }

  Widget _buildMessage(Map<String, dynamic> message, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender)
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/Group 184.png"),
            ),
          if (!isSender) const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            margin: const EdgeInsets.symmetric(vertical: 5),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.65),
            decoration: BoxDecoration(
              color: isSender
                  ? const Color.fromRGBO(229, 244, 255, 1)
                  : const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: isSender
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message['message'],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color.fromRGBO(27, 30, 40, 1),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      message['time'],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromRGBO(125, 132, 141, 1),
                      ),
                    ),
                    if (isSender)
                      const Icon(
                        Icons.done_all,
                        size: 15,
                        color: Color.fromRGBO(25, 176, 0, 1),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (isSender) const SizedBox(width: 10),
          if (isSender)
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/2.png"),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 56),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Color.fromRGBO(27, 30, 40, 1),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Sajib Rahman",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: const Color.fromRGBO(27, 30, 40, 1),
                            ),
                          ),
                          Text(
                            "Active Now",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(25, 176, 0, 1),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: const Icon(
                          Icons.call_outlined,
                          size: 24,
                          color: Color.fromRGBO(27, 30, 40, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(
                    _messages[index], _messages[index]['isSent']);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                  color: const Color.fromRGBO(226, 226, 226, 1),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    size: 25,
                    color: Color.fromRGBO(204, 204, 204, 1),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a message',
                      ),
                      onSubmitted: (value) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Color.fromRGBO(25, 176, 0, 1),
                    ),
                    onPressed: _sendMessage,
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
