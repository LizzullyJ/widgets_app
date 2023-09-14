import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({Key? key}) : super(key: key);

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        
        title: const Text('¿Estás Seguro?'),
        content: const Text(
            'Laborum velit cosequat fugiat id laborum deserunt veniam reprehenderit irure nisi. Laboris quis esse laboris commodo sint et in ullamco id aliquip cillum duis commodo. Ex nulla aliquip sit quis aute. Dolor est eu voluptate incididunt laborum enim tempor nostrud ullamco anim proident. Ea non aliquip commodo duis dolore fugiat nulla non sint deserunt eiusmod incididunt proident officia.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Dialogs'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Anim voluptate nulla amet nostrud minim officia veniam. Cupidatat proident ad id enim elit est nostrud elit anim aliquip. Enim consequat qui officia consectetur quis. Officia qui aliqua sint culpa do cupidatat elit tempor. Nisi anim adipisicing sit nisi ad incididunt culpa. Enim dolore aliquip deserunt esse ad commodo ut.'),
                ]);
              },
              child: const Text('Licencias Usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
