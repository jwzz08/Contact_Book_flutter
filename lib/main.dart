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
            appBar: AppBar(leading: Icon(Icons.menu),title: Text("제목입니다"),
            actions: const [Icon(Icons.star), Icon(Icons.star)],),
            body: SizedBox(
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: (){},
                  )
            ),

            bottomNavigationBar: BottomAppBar(
              child: SizedBox(
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.phone),
                      Icon(Icons.message),
                      Icon(Icons.contact_page),
                    ]
                ),
              ),
            )
        )
    );
  }
}
