import 'package:flutter/material.dart';
import 'package:tasks/second_screen.dart';

class FirstScreen extends StatefulWidget{
  static String tag = 'main-view-controller';
  FirstScreen ({Key key}): super (key : key);

  @override
  _FirstScreen createState()=> new _FirstScreen();
}

class _FirstScreen extends State<FirstScreen>{
  int numElements = 0;
  Map listMap = new Map();
  final List<String> taskList = new List();
  final List<bool> taskComplete = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Image.asset('images/iron.png', fit: BoxFit.cover, width: 50),
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
                onPressed: () async {
                  var task = await Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new SecondScreen(),
                  fullscreenDialog: true,)
                  );
                  if (task != null){
                    //add task
                    taskList.add(task.toString());
                    taskComplete.add(false);
                    numElements++;
                  }
                },
            ),
        ]
      ),
      body: ListView.builder(
        itemCount: this.numElements,
        itemBuilder: (context, index){
          final task = taskList[index];
          final complete = taskComplete[index];
          return ListTile(
            leading: ConstrainedBox(
              constraints: setConstraints(complete),
              child: Image.asset(setImage(complete), fit: BoxFit.cover),
            ),
            title: Text(
              task,
              style: Theme.of(context).textTheme.headline,
            ),
            onTap: () => onTapped(index, context),
          );
        },
      )
    );
  }

  BoxConstraints setConstraints(bool complete){
    if(complete) {
      return BoxConstraints(
        minWidth: 30,
        minHeight: 30,
        maxWidth: 40,
        maxHeight: 40,
      );
    } else {
      return BoxConstraints(
      minWidth: 30,
      minHeight: 30,
      maxWidth: 35,
      maxHeight: 35,
      );
    }
  }

  String setImage(bool complete) {
    if(complete) {
      return "images/checked.png";
    } else {
      return "images/unchecked.png";
    }
  }


  onTapped(int index, BuildContext context) {
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: new Text("Escolleix que vols fer"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Marca/Desmarca tasca"),
            onPressed: () {
              taskComplete.fillRange(index, index + 1, !taskComplete.elementAt(index));
              setState(() {

              });
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Esborra tasca"),
            onPressed: () {
              taskList.removeAt(index);
              taskComplete.removeAt(index);
              numElements--;
              setState(() {

              });
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Cancel·la"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
    );
  }
}