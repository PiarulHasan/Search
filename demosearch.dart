//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:filtering/database.dart';
// import 'package:flutter/material.dart';
//
//
//
// class Demo extends StatefulWidget {
//   @override
//   _DemoState createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   List _foundUsers = [];
//   final
//   _allUsers = DatabaseMethods();
//   List<String> user;
//
//
//
//   @override
//   initState() {
//
//     _foundUsers = _allUsers as List;
//     super.initState();
//   }
//
//
//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//
//       results = _allUsers as List<Map<String, dynamic>>;
//     } else {
//       results = _allUsers
//           .where((user) =>
//           user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//
//     }
//
//     // Refresh the UI
//     setState(() {
//       _foundUsers = results;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             TextField(
//               onChanged: (value) => _runFilter(value),
//               decoration: InputDecoration(
//                   labelText: 'Search', suffixIcon: Icon(Icons.search)),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: _foundUsers.length > 0
//                   ? ListView.builder(
//                 itemCount: _foundUsers.length,
//                 itemBuilder: (context, index) => Card(
//                   key: ValueKey(_foundUsers[index]["id"]),
//                   color: Colors.amberAccent,
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: ListTile(
//                     leading: Text(
//                       _foundUsers[index]["id"].toString(),
//                       style: TextStyle(fontSize: 24),
//                     ),
//                     title: Text(_foundUsers[index]['name']),
//                     subtitle: Text(
//                         '${_foundUsers[index]["age"].toString()} years old'),
//                   ),
//                 ),
//               )
//                   : Text(
//                 'No results found',
//                 style: TextStyle(fontSize: 24),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }