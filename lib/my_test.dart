import 'package:flutter/material.dart';

void main(){
 runApp(MaterialApp(
   title: "Test",
   home: MyFirstScreen()
 ));
}

class MyFirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: new AppBar(title: new Text("My Stack Test")),
          body: new Center(
            child: new Card(
              elevation: 1.0,
              margin: EdgeInsets.all(10.0),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: new Column(
                children: <Widget>[
                  new Card(
                    child: ListTile(
                      title: Text("lalalalalal"),
                      subtitle: Text("hahahahah"),
                      leading: new Icon(Icons.android,color: Colors.green,),
                    ),
                    margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
                    color: Colors.lightGreenAccent,
                  ),
                  new Divider(height: 8.0,color: Colors.lightBlue,indent: 1,),
                  RaisedButton(
                    child: Text('按钮'),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> MyScreen()
                        )
                      );
                    },
                  )
                ],
              ),
            ),
          )
    );
  }
}

class MyScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("newScreen")),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pop(context);
        },
        child: Text("back"),),
      ),
    );
  }
}
