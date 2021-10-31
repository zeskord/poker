import 'package:flutter/material.dart';
import 'authentification.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  _PlanningPageState createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  List userList = [];
  String username = '';
  bool isSpectator = false;

  @override
  void initState() {
    super.initState();
    userList.add(const MarkInput());
    userList.add(ElevatedButton(
        onPressed: () {
          _buttonPressed;
        },
        child: const Text('Кнопка')));
    userList.add(const UserCard(myText: 'Пользователь 1'));
    userList.add(const UserCard(myText: 'Пользователь 2'));
    userList.add(const UserCard(myText: 'Пользователь 3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Планирование'),
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

  void _buttonPressed() {}
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

class MarkInput extends StatefulWidget {
  const MarkInput({Key? key}) : super(key: key);

  @override
  _MarkInputState createState() => _MarkInputState();
}

class _MarkInputState extends State<MarkInput> {
  String value = '';
  @override
  void initState() {
    super.initState();
    value = '';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: true),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Оценка',
        suffixIcon: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.list),
        ),
        prefix: const Text('Оценка'),
      ),
    );
  }
}
