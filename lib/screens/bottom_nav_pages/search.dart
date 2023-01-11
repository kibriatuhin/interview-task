import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SearchScreens extends StatefulWidget {
  const SearchScreens({Key? key}) : super(key: key);

  @override
  State<SearchScreens> createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextFormField(
              onChanged: (val){
                setState((){
                  inputText = val;
                  print(inputText);
                });
              },
            ),
          ),
          Expanded(child: Container(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("products").where("product-name",isEqualTo: inputText).snapshots(),
              builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasError){
                  return Center(child: Text("Something went wrong"),);
                }
                if(snapshot.connectionState == ConnectionState.waiting){

                  return Center(child: Text("loading.."),);
                }

                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data() as Map<String , dynamic>;
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(data['product-name']),
                        leading: Image.network(data["product-img"][0]),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ))
        ],

      ),
    );
  }
}
