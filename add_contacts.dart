import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:milkizz/contact.dart';

class AddContacts extends StatefulWidget {
var contact;
AddContacts(this.contact);
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  TextEditingController id, milk, fat,lr;
  String _typeSelected ='';
  //String Uid = "76";
  var lmilk2;
  DatabaseReference _ref;
  DatabaseReference ref2;
  DatabaseReference lref;
  var lmilk,lid,lfat,llr;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = TextEditingController();
    milk = TextEditingController();
    fat = TextEditingController();
    lr = TextEditingController();
 String id1 =  'users/-MZHmqNN9X7LLwReSWeB';
    String id2 =  'users/-MZHmvphbSi03ifAEZDu';
    String id3 =  'users/-MZHn052wNcx0ydJUXWW';
    String id4 =  'users/-MZHn3Ic5YoammV28_Yh';
    String id5 =  'users/-MZHn9gAGFsbanJ3der1';
    String usern;

   _ref = FirebaseDatabase.instance.reference().child(
     'users'
   );

      lref = FirebaseDatabase.instance.reference().child('Lvalues');
      lref.once().then((DataSnapshot snapshot){
        print(snapshot.value);
        //print(snapshot.key);
        setState(() {
          lid = snapshot.value['Lid'];
          lmilk = snapshot.value['Lmilk'];
          lfat = snapshot.value['Lfat'];
          llr = snapshot.value['Llr'];


        });

      });

  }

  Widget _buildContactType(String title){
    return InkWell(

      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title? Colors.green : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Center(child: Text(title, style: TextStyle(fontSize: 15,
            color: Colors.white),
        ),),),

      onTap: (){
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Entry'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child:Expanded(
        child: SingleChildScrollView(
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
        controller: TextEditingController(text: lid.toString()),
              decoration: InputDecoration(
                hintText: 'ID',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
                  suffixText: "ID"
              ),
            ),
            SizedBox(height: 15),

            TextField(
              obscureText: false,
              maxLines: 1,
              autofocus: false,
              //initialValue: 'yu',
              controller: TextEditingController(text: lmilk.toString()), // TextEditingController(
                  //text:lmilk.toString()
                //),

              decoration: InputDecoration(
                hintText: 'Milk :'+lmilk.toString(),
                fillColor: Colors.white,
                filled: true,
                 contentPadding: EdgeInsets.all(15),
                suffixText: "Milk"
              ),
            ),

            SizedBox(height: 20,),

            TextFormField(
              maxLines: 1,
              controller: TextEditingController(text: lfat.toString()),
              decoration: InputDecoration(
                hintText: 'Fat',
                /* prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ), */
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
                  suffixText: "Fat"
              ),
            ),

            SizedBox(height: 20,),

            TextFormField(
              maxLines: 1,
              controller: TextEditingController(text: llr.toString()),
              decoration: InputDecoration(
                hintText: 'LR',
                /* prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ), */
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
                  suffixText: "LR"
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:  RaisedButton(child: Text('Refresh',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,

              ),),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return AddContacts(this);
                    }),
                  );
                },

                color: Theme.of(context).primaryColor,
              ),),
            SizedBox(height: 25,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
             child: RaisedButton(child: Text('Save Data',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,

              ),),
                onPressed: (){
                  saveContact();
                },

                color: Theme.of(context).primaryColor,
              ),
            )


          ],
        ),
      ),
    ),),);
  }


  String saveContact(){
    String Id= lid.toString();
    String Milk = lmilk.toString();
    String Fat = lfat.toString();
    String LR = llr.toString();


    Map<String,String> contact = {
      'Uid':Id,
      'Milk': Milk,
      'Fat': Fat,
      'LR':LR,
      'Category': _typeSelected,

    };
    _ref.push().set(contact).then((value) {
      Navigator.pop(context);
    });

  }
}