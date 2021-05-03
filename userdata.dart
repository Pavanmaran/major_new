
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:milkizz/add_contacts.dart';
import 'package:milkizz/listscreen.dart';
import 'package:milkizz/user_entry.dart';


class userdatas extends StatefulWidget {
  var contact ;
  userdatas(this.contact);
  @override
  _userdatasState createState() => _userdatasState();
}

class _userdatasState extends State<userdatas> {
  Query ref;
  @override
  void initState() {

    super.initState();

    ref = FirebaseDatabase.instance
        .reference()
        .child('users/-MZHmqNN9X7LLwReSWeB/-MZJ2SA1cKbUV5eAhCYY/')  ;
  }

  Widget _buildContactItem({Map contact}) {
    Color typeColor = getTypeColor(contact['Category']);
    return GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>full_desc(contact))
          );
        },
        child: Container(
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
                  Icon(
                    Icons.turned_in_not_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    contact['Uid'],
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                    contact['Uid'],
                    overflow:TextOverflow.ellipsis,
                    maxLines : 1,
                    softWrap: false,
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600),
                  ),

                  SizedBox(width: 15),
                  Icon(
                    Icons.group_work,
                    color: typeColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    contact['Category'],
                    style: TextStyle(
                        fontSize: 16,
                        color: typeColor,
                        fontWeight: FontWeight.w600),
                  ),

                ],
              ),
            ],
          ),    )
    );


  }

  @override
  Widget build(BuildContext context) {
    //var query = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Single User Data'),
      ),

      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(

          query: ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            return _buildContactItem(contact: contact);
          },
        ),
      ),);
  }

  Color getTypeColor(String Field) {
    Color color = Theme.of(context).accentColor;

    if (Field == 'Buffalo') {
      color = Colors.brown;
    }

    if (Field == 'Cow') {
      color = Colors.green;
    }



    return color;
  }
}
