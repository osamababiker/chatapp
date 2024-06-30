import 'package:chatapp/CustomUI/AvtarCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> { 
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
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF128C7E),
            onPressed: () {},
            child: Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupmember.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == true) {
                          groupmember.remove(contacts[index - 1]);
                          contacts[index - 1].select = false;
                        } else {
                          groupmember.add(contacts[index - 1]);
                          contacts[index - 1].select = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            groupmember.length > 0
                ? Align(
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true)
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupmember.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      chatModel: contacts[index],
                                    ),
                                  );
                                return Container();
                              }),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  )
                : Container(),
          ],
        ));
  }
}
