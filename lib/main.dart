import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DialogsInFlutter(),
    );
  }
}

class DialogsInFlutter extends StatefulWidget {
  const DialogsInFlutter({super.key});

  @override
  State<DialogsInFlutter> createState() => _DialogsInFlutterState();
}

class _DialogsInFlutterState extends State<DialogsInFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              showMyDialog();
            },
            child: const Text('Show Dialog')),
        ElevatedButton(
            onPressed: () {
              showMyGeneralDialog();
            },
            child: const Text('Show Dialog')),
      ]),
    );
  }

  void showMyDialog() async {
    bool isClicked = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('Do u want to play it again'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Okay')));
                  Navigator.of(context).pop(true);
                },
                child: const Text('Get')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Nice')));
                  Navigator.of(context).pop(false);
                },
                child: const Text('Not now')),
          ],
        );
      },
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$isClicked')));
  }

  void showMyGeneralDialog() {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Material(
            child: Container(
          color: Colors.red,
          child: Column(
            children: [
              const TextField(),
              const TextField(),
              const TextField(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Login')),
              ElevatedButton(onPressed: () {}, child: const Text('Cancel'))
            ],
          ),
        ));
      },
    );
  }
}
