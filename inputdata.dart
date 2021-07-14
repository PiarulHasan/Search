import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filtering/demosearch.dart';
import 'package:filtering/search.dart';
import 'package:filtering/viewpage.dart';
import 'package:flutter/material.dart';



class Adddata extends StatefulWidget {
  @override
  _AdddataState createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {

  String fileno;
  String name;
  String address;
  String gender;
  String age;
  String mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Adding"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent,
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "File No"
                    ),

                    onChanged: (input){
                      fileno = input;
                    },

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent,
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Name"
                    ),

                    onChanged: (input){
                      name = input;
                    },

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent,
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Address"
                    ),

                    onChanged: (input){
                      address = input;
                    },

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent,
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Gender"
                    ),

                    onChanged: (input){
                      gender = input;
                    },

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent,
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Age"
                    ),

                    onChanged: (input){
                      age = input;
                    },

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orangeAccent,
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Mobile"
                    ),
                    keyboardType: TextInputType.number,

                    onChanged: (input){
                      mobile = input;
                    },

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FlatButton(
                onPressed: (){
                  Firestore.instance.collection("User").add({
                    'Fileno': fileno,
                    'Name': name,
                    'Address': address,
                    'Gender':gender,
                    'Age':age,
                    'Mobile' : mobile,
                  });
                },
                child: Text("Add Data"),
                color: Colors.orangeAccent,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Filtering()));
                },
                child: Text("Get Data"),
                color: Colors.orangeAccent,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
