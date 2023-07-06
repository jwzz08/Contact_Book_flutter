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
            appBar: AppBar(title: Text("금호동3가", style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(onPressed: () => {}, icon: Icon(Icons.search, color: Colors.black,)),
                IconButton(onPressed: () => {}, icon: Icon(Icons.menu, color: Colors.black,)),
                IconButton(onPressed: () => {}, icon: Icon(Icons.add_alert, color: Colors.black,))
              ]
            ),
            body: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                Image.asset('camera.jpg', width: 100, height: 200,alignment: Alignment.topLeft, ),
                  Row(
                    children: const [
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text("캐논 DSLR 100D (단렌즈,충전기 16기가SD 포함", style: TextStyle(fontSize: 19),
                            softWrap: true,),
                            Text("성동구 행당동 . 끌올 10분 전", style: TextStyle(color: Colors.black54)),
                            Text("210,000원"),
                            Text("♡4", textAlign: TextAlign.right),
                          ],
                      ),
                    ],
                  )
          ]
              ),
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
