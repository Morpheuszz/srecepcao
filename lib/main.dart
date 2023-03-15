import 'package:flutter/material.dart';
import 'package:semana_recepcao/lista.dart';
import 'custom.dart';
import 'codigo.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semana de Recepcao',
      routes: {
        '/': (context) => MyHomePage(),
        '/jogar': (context) => jogar(),
        '/resposta': (context) => Resposta()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  botaojogar() {
    Navigator.pushNamed(context, '/jogar');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Barra(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 100),
                child: SizedBox(
                  width: 150,
                  height: 75,
                  child: ElevatedButton(
                      onPressed: () {
                        botaojogar();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.verde),
                      child: const Text('Jogar')),
                ),
              ),
              rodape(),
            ],
          ),
        ),
      ),
    );
  }
}

class jogar extends StatefulWidget {
  const jogar({Key? key}) : super(key: key);

  @override
  State<jogar> createState() => _jogarState();
}

class _jogarState extends State<jogar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: Barra(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Codigo()],
            ),
          )),
    );
  }
}

class Resposta extends StatefulWidget {
  const Resposta({Key? key}) : super(key: key);

  @override
  State<Resposta> createState() => _RespostaState();
}

class _RespostaState extends State<Resposta> {
  TextEditingController textEditingController = TextEditingController();
  String rusuario = '';
  void updaterusuario() {
    rusuario = textEditingController.text.toLowerCase();
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
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Center(child: Text('Resposta Final')),
                backgroundColor: AppColor.verde),
            body: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(200, 0, 200, 80),
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            labelText: 'Resposta Final',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: AppColor.verde),
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
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.verde),
                            onPressed: () {
                              updaterusuario();
                              if (checafinal(rusuario)) {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: Center(
                                                child: Text(
                                              'Parabéns, Desafio Concluído!',
                                              style: TextStyle(
                                                  color: AppColor.verde),
                                            )),
                                            content: Container(
                                                width: 75,
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                      'Agora mostre a tela a um organizador para continuar.', textAlign: TextAlign.center,),
                                                )),
                                          ));
                                });
                              } else {
                                final player = AudioPlayer();
                                player.play(UrlSource('https://www.youtube.com/watch?v=EeA_Y0FSv5Q'));
                                setState(() {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Center(
                                              child: Text(
                                                'Resposta Incorreta',
                                                style: TextStyle(fontSize: 50,
                                                    color: AppColor.red),
                                              )),
                                        ),
                                      barrierDismissible: true
                                    );
                                  });
                                });
                              }
                            },
                            child: Text('Enviar'),
                          ))
                    ]))));
  }
}
