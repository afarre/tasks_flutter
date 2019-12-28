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
  final List<String> taskList = new List();

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
                  //add task
                  taskList.add(task.toString());
                  numElements++;
                },
            ),
        ]
      ),
      body: ListView.builder(
        itemCount: this.numElements,
        itemBuilder: (context, index){
          final task = taskList[index];
          return ListTile(
            title: Text(
              task,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        },
      )
    );
  }

  _buildRow(int index) {
    return Text("Item " + index.toString());
  }

}