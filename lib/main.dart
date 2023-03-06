import 'package:flutter/material.dart';
import 'custom.dart';
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
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 150),
                child: SizedBox(
                  width: 150,
                  height: 75,
                  child: ElevatedButton(onPressed: () {botaojogar();}, style: ElevatedButton.styleFrom(backgroundColor: AppColor.verde),child: const Text('Jogar')
                    ),
                  ),
                ),
              SizedBox(
                width: 150,
                height: 75,
                child: Image.asset('assets/images/dev.png'),
              ),
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
              children: <Widget>[
                codigo()
              ],
            ),
          )
    ),
    );
  }
}
