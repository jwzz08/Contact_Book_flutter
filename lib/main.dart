import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
      home: MyApp())
  );
}



class MyApp extends StatefulWidget {            //StatelessWidget랑 차이를 알아둘 것
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {        //state는 렌더링 해줌, 자주 바뀌는 데이터들한테 좋음
  var name = ['서미누', '유졸리', '유가람'];

  addName(a){
    setState(() {
      name.add(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed:() {
              showDialog(context: context, builder: (context) {
                return DialogUI( addName : addName );
              },);
            },
          ),
          appBar: AppBar(title: Text('Contact App'),),
          bottomNavigationBar: BottomLayout(),
          body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, i){
              return ListTile(
                leading: Image(image: AssetImage("profile_icon.png")),
                title: Text(name[i]),
              );
            },
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

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addName}) : super(key: key);           //const 때문에 DialogUI 오류나서 지움. or var state 대신 final state 사용가능.
  final addName;                         //앞 줄 const 그대로 사용하고 변수타입을 var -> final(read only) 변경.
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField( controller: inputData,),
            TextButton(onPressed: (){
              addName(inputData.text);
            }, child: Text('완료')),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('취소'))
          ],
      )
      ),
    );
  }
}

