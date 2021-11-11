import 'package:flutter/material.dart';
import 'authentification.dart';
import 'package:poker/mark_input.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  _PlanningPageState createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  List<Widget> userList = [];
  String username = '';
  bool isSpectator = false;
  UserData userData = UserData();

  @override
  void initState() {
    super.initState();

    // <Object>[] users = [];

    userList.add(const MarkInput());
    userList.add(ElevatedButton(
        onPressed: () {
          Navigator.of(context).restorablePush(_dialogBuilder);
        },
        child: const Text('Кнопка')));
    userList.add(const UserCard(myText: 'Пользователь 1'));
    userList.add(const UserCard(myText: 'Пользователь 2'));
    userList.add(const UserCard(myText: 'Пользователь 3'));
    userList.add(const UserCard(myText: 'Пользователь 4'));
    userList.add(const UserCard(myText: 'Пользователь 5'));
    userList.add(const UserCard(myText: 'Пользователь 6'));
    userList.add(const UserCard(myText: 'Пользователь 7'));
    userList.add(const UserCard(myText: 'Пользователь 8'));
    userList.add(const UserCard(myText: 'Пользователь 9'));
    userList.add(const UserCard(myText: 'Пользователь 10'));
    userList.add(const UserCard(myText: 'Пользователь 11'));
    userList.add(Text(userData.username));
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
          itemCount: userList.length,
          itemBuilder: (BuildContext context, int index) {
            return userList[index];
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
