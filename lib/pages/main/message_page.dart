import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/pages/main/match_page.dart';
import 'package:stadium/provider/message_provider.dart';
import 'package:stadium/widgets/cards/message_card.dart';
import 'package:stadium/widgets/inputs/massege_input.dart';

class MessagingScreen extends StatefulWidget {
  final int receiverId;
  final int senderId;
  const MessagingScreen({super.key, required this.receiverId, required this.senderId});
  @override
  // ignore: library_private_types_in_public_api
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MessageProvider>(context, listen: false).getMessagesRealTime(
      widget.receiverId,
      widget.senderId,
    );
    Provider.of<MessageProvider>(context, listen: false).getMessages(
      widget.receiverId,
    );
  }

  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(
        builder: (context, messageConsumer, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                 Navigator.pop(
                                context,
                                MaterialPageRoute(builder: (context) =>MatchPage ()));

              },
            ),
            title: Text(
              "Messaging",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(children: [
            Expanded(
                child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: messageConsumer.messages.length,
              itemBuilder: (context, index) {
                return MessageCard(
                  isSender: messageConsumer.messages[index].senderId ==
                      widget.senderId,
                  message: messageConsumer.messages[index].message,
                );
              },
            )),
            MessageInputField(
              controller: _textController,
              ontap: () {
                Provider.of<MessageProvider>(context,listen: false ).sendMessage({
                  "message": _textController.text,
                  //"senderId": widget.senderId,
                  "receiver_id": widget.receiverId.toString(),
                });
                _textController.clear();
              },
            ),
          ]));
    });
  }
}
