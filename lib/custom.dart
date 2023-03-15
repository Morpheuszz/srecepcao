import 'package:flutter/material.dart';
class AppColor {
  AppColor._();
  static const Color verde = Color(0xFF1c6137);
  static const Color red = Color(0xFFFF0000);
}

class Barra extends StatelessWidget implements PreferredSizeWidget{

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Center(child: Text('Semana de Recepção')), backgroundColor: AppColor.verde);
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Column(
        children: [
          Image.asset('assets/images/dev.png'),
          SizedBox(height: 20),
          Image.asset('assets/images/jr.png')
        ],
      ),
    );
  }
}

