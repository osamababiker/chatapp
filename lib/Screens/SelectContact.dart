import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> { 
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
       ChatModel(name: "Dev Stack", status: "A full stack developer", icon: "person.svg", isGroup: false, time: "2:00", currentMessage: "Hi Everyone", id: 1),
    ChatModel(name: "Balram", status: "Flutter Developer...........", icon: "person.svg", isGroup: false, time: "3:00", currentMessage: "Hi", id: 2),
    ChatModel(name: "Saket", status: "Web developer...", icon: "person.svg", isGroup: false, time: "2:30", currentMessage: "Wellcom ...", id: 3),
    ChatModel(name: "Bhanu Dev", status: "App developer....", icon: "person.svg", isGroup: false, time: "4:00", currentMessage: "Hi Everyone", id: 4),
    ChatModel(name: "Collins", status: "Raect developer..", icon: "person.svg", isGroup: false, time: "2:15", currentMessage: "I'm Back", id: 5),
    ChatModel(name: "Kishor", status: "Full Stack Web", icon: "person.svg", isGroup: false, time: "2:00", currentMessage: "Let's go now..", id: 6),
    ChatModel(name: "Testing1", status: "Example work", icon: "person.svg", isGroup: false, time: "8:00", currentMessage: "Hi, ", id: 7),
    ChatModel(name: "Testing2", status: "Sharing is caring", icon: "person.svg", isGroup: false, time: "10:00", currentMessage: "", id: 8),
    ChatModel(name: "Divyanshu", status: ".....", icon: "person.svg", isGroup: false, time: "11:20", currentMessage: "Hi Everyone", id: 9),
    ChatModel(name: "Helper", status: "Love you Mom Dad", icon: "person.svg", isGroup: false, time: "2:25", currentMessage: "Wellcom Back Bro.", id: 10),
    ChatModel(name: "Tester", status: "I find the bugs", icon: "person.svg", isGroup: false, time: "6:45", currentMessage: "Im Good thanks", id: 11),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "256 contacts",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
  }
}
