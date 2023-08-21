import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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


  getPermission() async {
    var status = await Permission.contacts.status;            //await 처리 시간이 긴 데이터들에게 기다리라고 하기
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();     //기본 연락처앱에서 연락처 가져오기
      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();        //권한 관련 해당어플 설정 열기
    }
  }


  var name = [];

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
          appBar: AppBar(title: Text('Contact App'),actions: [
            IconButton(onPressed: (){ getPermission(); }, icon: Icon(Icons.contacts))
          ]),
          bottomNavigationBar: BottomLayout(),
          body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, i){
              return ListTile(
                leading: Image(image: AssetImage("assets/profile_icon.png")),
                trailing: TextButton(onPressed: (){}, child: Text('삭제')),
                title: Text(name[i].givenName ?? 'unknown'),
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
              var newContact = Contact();     //새로운 연락처 만들기
              newContact.givenName = inputData.text;    //given name으로 하여금 형 맞춰주기
              ContactsService.addContact(newContact);   //기본 연락처앱에 넣어주기
              addName(newContact);      //name state에 저장해서 연락처앱 리스트 새로고침
              Navigator.pop(context);
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
