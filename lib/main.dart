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
          appBar: AppBar(
              title: Text("금호동3가", style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(onPressed: () => {},
                    icon: Icon(Icons.search, color: Colors.black,)),
                IconButton(onPressed: () => {},
                    icon: Icon(Icons.menu, color: Colors.black,)),
                IconButton(onPressed: () => {},
                    icon: Icon(Icons.add_alert, color: Colors.black,))
              ]
          ),
          body: Container(
            height: 150,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset('camera.jpg', width: 100,
                  height: 200,
                  alignment: Alignment.topLeft,),
                Container(child: Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("캐논 DSLR 100D 단렌즈", style: TextStyle(fontSize: 18)),
                      Text("성동구 행당동 . 끌올 10분 전",
                          style: TextStyle(color: Colors.black54)),
                      Text("210,000원"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite),
                          Text("4"),
                        ],
                      ),
                    ],
                  ),
                ),
                )
              ],
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
              )
          ),
        )
    );
  }
}


