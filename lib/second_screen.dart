import 'package:flutter/material.dart';

typedef Function Callback();

class SecondScreen extends StatefulWidget{
  static String tag = 'main-view-controller';
  final Callback isYesCallback;

  SecondScreen({Key key, this.isYesCallback}) : super(key: key);
  @override
  _SecondScreen createState() => new _SecondScreen();

}

class _SecondScreen extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: new EdgeInsets.all(30.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Que vols recordar?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autofocus: true,
              controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Escriu una task...'
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[

                new Expanded(child: FlatButton(
                  onPressed: () {
                    //return to prev window
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Cancelar', style: TextStyle(fontSize: 20.0)),
                ), flex: 2),
                new Expanded(child: RaisedButton(
                  child: Text('Crear tasca', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    //return to prev window with task text
                    Navigator.pop(context, myController.text);
                  },
                ), flex: 3)
              ],
            )
          ],
        ),
      ),
    );
  }
}