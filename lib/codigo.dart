import 'package:flutter/material.dart';
import 'custom.dart';
import 'lista.dart';

class Codigo extends StatefulWidget {
  const Codigo({Key? key}) : super(key: key);

  @override
  State<Codigo> createState() => _codigoState();
}

class _codigoState extends State<Codigo> {
  TextEditingController textEditingController = TextEditingController();
  String word = 'abracadabra';
  void updateText() {
    word = tabela(textEditingController.text);
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditingController.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 100,
            child: Text(word, style: TextStyle(fontSize:24),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 0, 200, 80),
            child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: 'Código',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: AppColor.verde),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vazio';
                }
                return null;
              },
            ),
          ),
          Container(
            width: 100,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.verde),
              onPressed: () {
                setState(() {
                  updateText();
                });
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    ) ;
  }
}