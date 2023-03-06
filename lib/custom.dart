import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const Color verde = Color(0xFF43A047);
  static const Color red = Color(0xFFFF0000);
}

class Barra extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Center(child: const Text('Semana de Recepção!')), backgroundColor: AppColor.verde

    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class codigo extends StatefulWidget {
  const codigo({Key? key}) : super(key: key);

  @override
  State<codigo> createState() => _codigoState();
}

class _codigoState extends State<codigo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 200, 80),
              child: TextFormField(
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
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Enviar'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.verde),
              ),
            ),
          ],
        ),
    ) ;
  }
}
