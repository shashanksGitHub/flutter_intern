import 'package:flutter/material.dart';
class DeletePage extends StatefulWidget {
   String name;
   String number;
   String email;
  DeletePage({Key key, @required this.name, @required this.number,@required this.email}) : super(key: key);

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Detail screen')),


      body: Column(
        children: [
          Text(
            widget.name,
            style: TextStyle(fontSize: 24),
          ),
          Text(
            widget.number,
            style: TextStyle(fontSize: 24),
          ),
          Text(
            widget.email,
            style: TextStyle(fontSize: 24),
          ),
          FlatButton(
            onPressed:  () =>
            {setState(() {
widget.name = "";
widget.number = "";
widget.email = "";


            })
            },
            child: Text(
              "Delete",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          )

        ],
      ),



    );
  }
}
