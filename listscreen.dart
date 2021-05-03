
import 'package:flutter/material.dart';
import 'package:milkizz/add_contacts.dart';
import 'package:milkizz/contact.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:math';



class full_desc extends StatefulWidget {
  var contact ;
  full_desc(this.contact);
  @override
  _full_descState createState() => _full_descState();
}

class _full_descState extends State<full_desc> {
  Query _ref;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _ref = FirebaseDatabase.instance
        .reference()
        .child('users')
        .orderByChild('Uid');

  }

  _builtDetail(){
   // double amnt = double.parse(widget.contact['Milk'])*6*double.parse(widget.contact['Fat'])+0.02 ;
  // String amnt1=amnt.toStringAsFixed(2);
    return Column(children:[
    Padding(padding: EdgeInsets.only(left: 80,right: 80,bottom: 20),

      child: Text("User Data",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30,

            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600),
      ),),
      Padding(padding: EdgeInsets.only(right: 170,bottom: 5),
      child :Text("User ID : "+widget.contact['Uid'],
        style: TextStyle(
            fontSize: 26,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600),
      ),),
     /* Padding(padding: EdgeInsets.only(right:60,bottom: 5),
    child :Text("Name: "+widget.contact['Uid'],
        style: TextStyle(
            fontSize: 26,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600),
      ),),
*/
    Padding(padding: EdgeInsets.only(right: 210,bottom: 5),
    child :Text("Milk : "+widget.contact['Milk'],
        style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w600),
      ),),
    Padding(padding: EdgeInsets.only(right: 210,bottom: 5),
    child :Text("Fat : "+widget.contact['Fat'],
        style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w600),
      ),),

    Padding(padding: EdgeInsets.only(right: 210,bottom: 5),
    child :Text("LR : "+ widget.contact['LR'],
        style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w600),
      ),),
     // widget.amnt1 = widget.contact['Milk']*widget.contact['Fat'],

      Padding(padding: EdgeInsets.only(right: 100,bottom: 5),


  /*  child :Text("Amount : "+ amnt1 ,

        style: TextStyle(
            fontSize: 26 ,
            color: Colors.black,
            fontWeight: FontWeight.w600),
      ),  */
      ),
    ]);
  }
/*

  Widget _buildlistitem ({Map contact}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.white,

      child: new Wrap(


        spacing: 5.0,
        runSpacing: 5.0,
        direction: Axis.vertical,
        children: [
          Row(
            children: [
              /* Icon(
                Icons.turned_in_not_rounded,
                color: Theme.of(context).accentColor,
                size: 20,
              ), */

              SizedBox(
                width: 1,
              ),
              Text(
                contact['Milk'],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme
                        .of(context)
                        .accentColor,
                    fontWeight: FontWeight.w600),
              ),

              SizedBox(width: 15),
            ],
          ),


        ],
      ),
    );
  }
 */

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 38, bottom: 10),
        padding: EdgeInsets.all(10.0),
        child: Expanded(
          child:
          SingleChildScrollView(
              child:

              _builtDetail()
          ),
        ),
      ),
    );


  }

}

