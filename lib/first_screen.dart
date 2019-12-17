import 'package:flutter/material.dart';
import 'package:tasks/second_screen.dart';

class FirstScreen extends StatefulWidget{
  static String tag = 'main-view-controller';
  FirstScreen ({Key key}): super (key : key);

  @override
  _FirstScreen createState()=> new _FirstScreen();
}

class _FirstScreen extends State<FirstScreen>{
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
                  Map results =
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context){
                        return new SecondScreen(
                       /*   isYesCallback: (){
                            setState(() {

                            });
                            return;
                          },

                        */
                        );
                      },
                      fullscreenDialog: true
                  ));
                  if (results != null && results.containsKey('isNoResult') && results['isNoResult']){
                    setState(() {

                    });
                  }
                },
            ),
        ]
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }



}