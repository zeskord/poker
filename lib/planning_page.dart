import 'package:flutter/material.dart';
import 'authentification.dart';
import 'package:poker/mark_input.dart';
import 'package:poker/model.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  _PlanningPageState createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  List<Widget> planningPageList = [];
  String username = '';
  bool isSpectator = false;
  UserData userData = UserData();
  UserList userList = UserList();
  // List<UserItem> users = [];

  @override
  void initState() {
    super.initState();

    planningPageList.add(const MarkInput());
    planningPageList.add(ElevatedButton(
        onPressed: () {
          userList.getFromApi();
          // Navigator.of(context).restorablePush(_dialogBuilder);
        },
        child: const Text('Кнопка')));
    // Добавляем пользователей, которые хранятся в массиве users.
    List<UserItem> users = userList.users;
    for (UserItem user in users) {
      planningPageList.add(UserCard(myText: user.username));
    }
    // planningPageList.add(const UserCard(myText: 'Пользователь 1'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 2'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 3'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 4'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 5'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 6'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 7'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 8'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 9'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 10'));
    // planningPageList.add(const UserCard(myText: 'Пользователь 11'));
    // planningPageList.add(Text(userData.username));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        actions: const [],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: planningPageList.length,
          itemBuilder: (BuildContext context, int index) {
            return planningPageList[index];
          }),
    );
  }

  void _buttonPressed() {
    setState(() {
      username = 'ddsdfsdfwefe';
    });
  }

  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) =>
          const SimpleDialog(title: Text('Material Alert!'), children: <Widget>[
        Text('Текст'),
      ]),
    );
  }
}

class UserCard extends StatelessWidget {
  final String myText;
  const UserCard({Key? key, this.myText = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50, child: Card(child: ListTile(title: Text(myText))));
  }
}
