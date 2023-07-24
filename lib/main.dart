import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {            //StatelessWidget랑 차이를 알아둘 것
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {        //state는 렌더링 해줌, 자주 바뀌는 데이터들한테 좋음
  var a = 1;
  var name = ['서미누', '유졸리', '유가람'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text(a.toString()),
            onPressed:() {
              setState(() {               //state 사용할 거면 꼭 setState 써줘야함
                a++;
              });
            },
          ),
          appBar: AppBar(title: Text('Contact App'),),
          bottomNavigationBar: BottomLayout(),
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i){
              return ListTile(
                leading: Image(image: AssetImage("profile_icon.png")),
                title: Text(name[i]),
              );
            },
          )
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
