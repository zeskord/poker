import 'package:flutter/material.dart';

class MarkInput extends StatefulWidget {
  const MarkInput({Key? key}) : super(key: key);

  @override
  _MarkInputState createState() => _MarkInputState();
}

class _MarkInputState extends State<MarkInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      // final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: _controller.text,
        // selection:
        //     TextSelection(baseOffset: text.length, extentOffset: text.length),
        // composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: true),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Оценка',
        suffixIcon: GestureDetector(
          onTap: () {
            // Navigator.of(context).restorablePush(_dialogBuilder);
            showMySimpleDialog(context);
          },
          child: const Icon(Icons.list),
        ),
        prefix: const Text('Оценка'),
      ),
    );
  }

  void onMarkSelect(String content) {
    // _ee = content;
    // value = '';
    // ModalRoute.of
    setState(() {
      _controller.text = content;
    });
  }

  // Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
  //   DialogRoute myDialog = DialogRoute<void>(
  //     context: context,
  //     builder: (BuildContext context) => SimpleDialog(
  //         title: const Text('Выберите оценку'), children: markList),
  //   );

  //   return myDialog;
  // }

  void showMySimpleDialog(BuildContext context) {
    List<Widget> markList = <Widget>[
      MarkCard(content: '0', notifyParent: onMarkSelect),
      MarkCard(content: '0.5', notifyParent: onMarkSelect),
      MarkCard(content: '1', notifyParent: onMarkSelect),
      MarkCard(content: '2', notifyParent: onMarkSelect),
      MarkCard(content: '3', notifyParent: onMarkSelect),
      MarkCard(content: '5', notifyParent: onMarkSelect),
      MarkCard(content: '8', notifyParent: onMarkSelect),
      MarkCard(content: '13', notifyParent: onMarkSelect),
      MarkCard(content: '21', notifyParent: onMarkSelect),
      MarkCard(content: '34', notifyParent: onMarkSelect),
    ];

    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("SimpleDialog"),
            children: markList,
            // <Widget>[
            //   new SimpleDialogOption(
            //     child: new Text("SimpleDialogOption One"),
            //     onPressed: () {
            //       Navigator.of(context).pop("SimpleDialogOption One");
            //     },
            //   ),
            //   new SimpleDialogOption(
            //     child: new Text("SimpleDialogOption Two"),
            //     onPressed: () {
            //       Navigator.of(context).pop("SimpleDialogOption Two");
            //     },
            //   ),
            //   new SimpleDialogOption(
            //     child: new Text("SimpleDialogOption Three"),
            //     onPressed: () {
            //       Navigator.of(context).pop("SimpleDialogOption Three");
            //     },
            //   ),
            // ],
          );
        });
  }
}

class MarkCard extends StatelessWidget {
  final String content;
  final void Function(String) notifyParent;
  // конструктор.
  const MarkCard({Key? key, this.content = '', required this.notifyParent})
      : super(key: key);

  _onClick(content) {
    notifyParent(content);
  }

  @override
  build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
            child: ListTile(
          title: Text(
            content,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            // notifyParent(content);
            _onClick(content);
            Navigator.of(context).pop(content);
          },
          subtitle: Text(context.toString()),
        )));
  }
}
