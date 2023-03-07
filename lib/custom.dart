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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


