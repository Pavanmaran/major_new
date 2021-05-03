import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:milkizz/contact.dart';
import 'package:milkizz/main.dart';

class user_entry extends StatefulWidget {
  var contact;

  user_entry(this.contact);
  @override
  _user_entryState createState() => _user_entryState();
}

class _user_entryState extends State<user_entry> {
  TextEditingController _nameController, _numberController, _desc2;
  String _typeSelected = '';
  DatabaseReference ref1;
  //final FirebaseFirestore firestore =   FirebaseFirestore.instance;


  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _desc2 = TextEditingController();
    String Uid = "76";
    ref1 = FirebaseDatabase.instance.reference().child('users');
  }

  Widget _buildContactType(String title) {
    return InkWell(

      child: Container(
        height: 40,
        width: 90,

        decoration: BoxDecoration(
          color: _typeSelected == title ? Colors.green : Theme
              .of(context)
              .accentColor,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Center(child: Text(title, style: TextStyle(fontSize: 15,
            color: Colors.white),
        ),),),

      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Entry'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'User name',
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),


                SizedBox(height: 20,),

                TextFormField(
                  maxLines: 1,
                  controller: _desc2,
                  decoration: InputDecoration(
                    hintText: 'ID',
                    /* prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ), */
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),


                SizedBox(height: 15,),
                Container(
                  height: 50,
                  child: ListView(

                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildContactType('Buffalo'),
                      SizedBox(width: 10,),

                      _buildContactType('Cow'),
                      SizedBox(width: 10,),

                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: RaisedButton(child: Text('Save Data', style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                    onPressed: () {
                      saveContact();
                    },
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                )
              ],),),
        ),),);
  }

  void saveContact() async {
    String Uid = _desc2.text;
    //String Milk = _numberController.text;
    String Uname = _nameController.text;
    Map<String, String> user_entry = {
      'Uid': Uid,
      'Uname': Uname,
      'Category': _typeSelected,
    };
    /*  try {
      await
      firestore.collection("users").doc("userslist").set(
          {'name': 'pawan',
          'id':'23',}
          );
    } catch(e){
      print(e);
    } */

    ref1.push().set(user_entry).then((value) {
      Navigator.pop(context);
      // });
    });
  }
}
