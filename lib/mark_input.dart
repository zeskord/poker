import 'package:flutter/material.dart';
import 'package:poker/config.dart';

class MarkInput extends StatefulWidget {
  const MarkInput({Key? key}) : super(key: key);

  @override
  _MarkInputState createState() => _MarkInputState();
}

class _MarkInputState extends State<MarkInput> {
  String value = '';
  // const List<Widget> ss = () => getMarksList();

  @override
  void initState() {
    super.initState();
    value = '';
  }

  @override
  build(BuildContext context) {
    return TextField(
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: true),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Оценка',
        suffixIcon: GestureDetector(
          onTap: () {
            Navigator.of(context).restorablePush(_dialogBuilder);
          },
          child: const Icon(Icons.list),
        ),
        prefix: const Text('Оценка'),
      ),
    );
  }

  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => const SimpleDialog(
          title: Text('Выберите оценку'), children: markList),
    );
  }

  static const List<Widget> markList = <Widget>[
    MarkCard(content: '0'),
    MarkCard(content: '0.5'),
    MarkCard(content: '1'),
    MarkCard(content: '2'),
    MarkCard(content: '3'),
    MarkCard(content: '5'),
    MarkCard(content: '8'),
    MarkCard(content: '13'),
    MarkCard(content: '21'),
    MarkCard(content: '34'),
  ];
}

class MarkCard extends StatelessWidget {
  final String content;
  // конструктор.
  const MarkCard({Key? key, this.content = ''}) : super(key: key);

  @override
  build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
            child: ListTile(
                title: Text(
          content,
          textAlign: TextAlign.center,
        ))));
  }
}
