import 'package:flutter/material.dart';
import 'package:flutter_intern/common_widgets/error_dialog.dart';
import 'package:flutter_intern/common_widgets/loading_widget.dart';
import 'package:flutter_intern/screens/delete_page.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with AutomaticKeepAliveClientMixin<Register> {
  bool get wantKeepAlive => true;
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _contactNumberTextEditingController =
  TextEditingController();


  TextEditingController _nameTextEditingController = TextEditingController();
  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.blue, Colors.blueGrey],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              clearFormInfo();
              Navigator.pop(context);
            }),
        title: Text(
          "Registration Form",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          FlatButton(
            onPressed: uploading ? null : () => uploadAndSaveFormInfo(),
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          uploading ? circularProgress() : Text(""),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.pink,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _emailTextEditingController,
                decoration: InputDecoration(
                  hintText: "  email",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.pink,
            ),
            title: Container(
              width: 250,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _contactNumberTextEditingController,
                decoration: InputDecoration(
                  hintText: "Contact Number",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),




          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.pink,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _nameTextEditingController,
                decoration: InputDecoration(
                  hintText: " Name",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),



        ],
      ),
    );
  }

  clearFormInfo() {
    setState(() {
      _emailTextEditingController.clear();
      _contactNumberTextEditingController.clear();
      _nameTextEditingController.clear();
    });
  }

  uploadAndSaveFormInfo() async {
    setState(() {
      if (
      _emailTextEditingController.text.isEmpty ||
          _contactNumberTextEditingController.text.isEmpty ||
          _nameTextEditingController.text.isEmpty
      ) {
        showDialog(
            context: context,
            builder: (c) {
              return ErrorAlertDialog(
                message: "Please Fill the Form Completely.",
              );
            });
      }
      else{
        _passDataToSecondScreen(context);
//        Route route =
//        MaterialPageRoute(builder: (c) => DeletePage());
//        Navigator.pushReplacement(context, route);
      }
    }

    );
}
 void _passDataToSecondScreen(BuildContext context) {
        String name = _nameTextEditingController.text;
        String number = _contactNumberTextEditingController.text;
        String email = _emailTextEditingController.text;

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeletePage(name: name, number: number, email: email,),
            ));
 }
}
