import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: BottomLayout(),
          body: ListView(
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person_add_rounded, size: 35), Text("홍길동", style: TextStyle(fontSize: 20)),
                  Icon(Icons.person_2_rounded, size: 35), Text("홍길동", style: TextStyle(fontSize: 20)),
                  Icon(Icons.person_2_rounded, size: 35), Text("홍길동", style: TextStyle(fontSize: 20)),
                ],
              )
            ],
          ),
        )
    );
  }
}


class BottomLayout extends StatelessWidget {
  const BottomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.call),
          Icon(Icons.message),
          Icon(Icons.contact_emergency),
        ],
      ),
    );
  }
}
