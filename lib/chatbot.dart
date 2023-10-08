import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import 'dart:convert';
import 'chatMsg.dart';
import 'package:linkify/linkify.dart';

class chatbot extends StatefulWidget {
  const chatbot({super.key});

  final String title = "Ask about space";

  @override
  State<chatbot> createState() => chatbotState();
}

class chatbotState extends State<chatbot> {
  @override
  void initState() {}

  int idUser = 1;
  String name = "Budi";
  String prompt = "Med Stud Games";
  String newChat = "";

  final textPrompt = TextEditingController();

  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hey, this is Oryx!\nWhat do you want to know today?",
        messageType: "receiver"),
  ];

  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void promptTrigger() {
    if (textPrompt.text == "") {
    } else {
      prompt = textPrompt.text;
      setState(() {
        newChat = prompt;
        messages
            .add(ChatMessage(messageContent: newChat, messageType: "sender"));

        textPrompt.clear();
      });
      _scrollDown();
      String isiParse =
          "http://138.91.158.152/chatbot/postMessage?messageid=65221dbdc21a58c47c7c05ab&message=" +
              prompt;
      http.get(Uri.parse(isiParse),
              headers: {'Content-type': 'application/json'})
          // .post(Uri.parse("http://13.86.228.123/docs/chatbot/postMessage"),
          //     headers: {'Content-type': 'application/json'},
          //     body: json.encode({"user_id": idUser, "message": prompt}))
          .then((response) {
        print(response.body);
        // print(json.decode(response.body)['response']['content']);
        // print(json.decode(response.body)['response']);
        // print(json.decode(response.body));
        setState(() {
          newChat = json.decode(response!.body)['content'];
          messages.add(
              ChatMessage(messageContent: newChat, messageType: "receiver"));
          print("pokeeemon");
          _scrollDown();
        });

        _scrollDown();
      });
    }
  }

  String extractLink(String input) {
    var elements = linkify(input,
        options: LinkifyOptions(
          humanize: false,
        ));
    for (var e in elements) {
      if (e is LinkableElement) {
        return e.url;
      }
    }
    return "no link";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: Color.fromARGB(255, 55, 60, 69),
        child: Stack(
          children: <Widget>[
            Scrollbar(
              child: ListView.builder(
                controller: _controller,

                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 100),
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Row(children: <Widget>[
                        Visibility(
                            visible: messages[index].messageType == "receiver"
                                ? true
                                : false,
                            child: Container()
                            // child: Expanded(
                            //   flex: 5,
                            //   child: Image.asset('images/koya.png',
                            //       color: Color.fromRGBO(255, 255, 255, 0.5),
                            //       colorBlendMode: BlendMode.modulate,
                            //       height: 40,
                            //       width: 40),
                            // ),
                            ),
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  (messages[index].messageType == "receiver"
                                      ? BorderRadius.only(
                                          topRight: Radius.circular(35.0),
                                          bottomLeft: Radius.circular(25.0),
                                          bottomRight: Radius.circular(35.0),
                                        )
                                      : BorderRadius.only(
                                          topLeft: Radius.circular(25.0),
                                          bottomLeft: Radius.circular(25.0),
                                          bottomRight: Radius.circular(25.0),
                                        )),
                              color: (messages[index].messageType == "receiver"
                                  ? Colors.grey.shade200
                                  : Color.fromARGB(255, 100, 102, 102)),
                            ),
                            padding: EdgeInsets.all(16),
                            child:
                                extractLink(messages[index].messageContent) ==
                                        "no link"
                                    ? Text(
                                        messages[index].messageContent,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                messages[index].messageType ==
                                                        "receiver"
                                                    ? Colors.black
                                                    : Colors.white),
                                        textAlign:
                                            messages[index].messageType ==
                                                    "receiver"
                                                ? TextAlign.left
                                                : TextAlign.right,
                                      )
                                    : InkWell(
                                        child: Text(
                                          messages[index].messageContent,
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        onTap: () {
                                          launchUrl(Uri.parse(extractLink(
                                              messages[index].messageContent)));
                                        },
                                      ),
//                           Html(
//                               data: messages[index].messageContent,

//                               onLinkTap: (url, context, attributes, element) {
//                                 // open url in a webview
//                                 launchUrl(url! as Uri);
//                               },
// //
//                               style: {
//                                 "html": Style.fromTextStyle(
//                                   TextStyle(fontSize: 14.0),
//                                 ),
//                               },
//                             ),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     height: 30,
                    //     width: 30,
                    //     decoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 47, 44, 80),
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: Icon(
                    //       Icons.clear,
                    //       color: Colors.white,
                    //       size: 20,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textPrompt,
                        decoration: InputDecoration(
                            hintText: "Type here...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                        onEditingComplete: () {
                          promptTrigger();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        promptTrigger();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Color.fromARGB(255, 1, 66, 186),
                      elevation: 0,
                      shape: CircleBorder(

                          // borderRadius: BorderRadius.all(Radius.circular(15.0))
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
