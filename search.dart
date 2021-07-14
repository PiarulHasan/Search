import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filtering/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final
  TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;


  @override
  Widget build(BuildContext context) {

    Widget searchedData() {
      return
        ListView.builder(
          itemCount: snapshotData.documents.length,
          itemBuilder: (BuildContext context, int index){
           return Flexible(
             child: ListView(

               children: [
                 Text(snapshotData.documents[index].data["Fileno"] ?? "No Data"),
                 // SizedBox(height: 10,),
                 Text(snapshotData.documents[index].data['Name'] ?? "No Data"),
                 // SizedBox(height: 10,),
                 Text(snapshotData.documents[index].data['Address'] ?? "No Data"),
                 // SizedBox(height: 10,),
                 Text(snapshotData.documents[index].data['Gender'] ?? "No Data"),
                 // SizedBox(height: 10,),
                 Text(snapshotData.documents[index].data['Age'] ?? "No Data"),
                 // SizedBox(height: 10,),
                 Text(snapshotData.documents[index].data['Mobile'] ?? "No Data"),
                 // SizedBox(height: 10,),
               ].toList(),
               // children:
               // snapshotData.documents[index].data()[document]{
               //   return Row(
               //     children: <Widget>[
               //       Text(document["Fileno"] ?? "No Data"),
               //       SizedBox(width: 10,),
               //       Text(document["Name"] ?? "No Data"),
               //       SizedBox(width: 10,),
               //       Text(document["Address"] ?? "No Data"),
               //       SizedBox(width: 10,),
               //       Text(document["Gender"] ?? "No Data"),
               //       SizedBox(width: 10,),
               //       Text(document["Age"] ?? "No Data"),
               //       SizedBox(width: 10,),
               //       Text(document["Mobile"] ?? "No Data"),
               //       SizedBox(width: 10,),
               //     ],
               //   );
               // }.toList(),
             ),
           );
           //   ListTile(
           //   leading:Text(snapshotData.documents[index].data['fileno']),
           //   title: Text(snapshotData.documents[index].data['name']),
           //   subtitle: Text(snapshotData.documents[index].data['address']),
           // );
          },
      );
    }

    return Scaffold(
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.clear), onPressed: (){}),
      backgroundColor: Colors.orangeAccent,

      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val){
              return IconButton(icon: Icon(Icons.search), onPressed: () {
                val.queryData(searchController.text).then((value){
                  snapshotData = value;
                  setState(() {
                    isExecuted =true;
                  });
                });
              });
            }
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white)
          ),
          controller: searchController,
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: isExecuted ? searchedData() : Container(
        child: Center(
          child: Text('Search', style: TextStyle(
          color: Colors.white, fontSize: 30
          ),
          ),
        ),
      ),
    );
  }
}
