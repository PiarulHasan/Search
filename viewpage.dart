import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filtering/search.dart';
import 'package:filtering/searchview.dart';
import 'package:flutter/material.dart';

import 'database.dart';


class Filtering extends StatefulWidget {
  @override
  _FilteringState createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtering"),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10,),
        child: Column(
          children: [
            // SizedBox(height: 10,),

            TextField(
              onChanged: (val){
                setState(() {
                  // initiateSearch();
                  // User = User.where((User) => file no.toLowerCase().contains(val.toLowerCase())).toList();
                });
              },
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),

            SizedBox(height: 20,),

            Flexible(
              child: StreamBuilder(
                stream: Firestore.instance.collection("User").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return Text("No Value");
                  }
                  return ListView(
                    children:
                    snapshot.data.documents.map((document){
                      return Row(
                        children: <Widget>[
                          Text(document["Fileno"] ?? "No Data"),
                          SizedBox(width: 10,),
                          Text(document["Name"] ?? "No Data"),
                          SizedBox(width: 10,),
                          Text(document["Address"] ?? "No Data"),
                          SizedBox(width: 10,),
                          Text(document["Gender"] ?? "No Data"),
                          SizedBox(width: 10,),
                          Text(document["Age"] ?? "No Data"),
                          SizedBox(width: 10,),
                          Text(document["Mobile"] ?? "No Data"),
                          SizedBox(width: 10,),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
                },
                child: Text("Search"),
                color: Colors.orangeAccent,
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
      ),

    );
  }
}
