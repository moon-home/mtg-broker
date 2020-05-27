import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/card_screen.dart';
import '../models/TickerTile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DraggableScrollableSheetTickers extends StatefulWidget {
  @override
  _DraggableScrollableSheetTickersState createState() => _DraggableScrollableSheetTickersState();
}

class _DraggableScrollableSheetTickersState extends State<DraggableScrollableSheetTickers> {
  final _auth =FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String userID;
  DocumentSnapshot userInvestSnapshot;
  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if (user != null){
        userID=user.uid;
      }else{
        Navigator.pop(context);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance.collection('userInvest').document(userID).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if (snapshot.hasData){
          print('snapshot.data[investCardNames]: ${snapshot.data['investCardNames']}');
          return Container(
            child: ListView.builder(
              //physics: const AlwaysScrollableScrollPhysics(),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data['investCardNames'].length,
              itemBuilder: (context, index){
                return GestureDetector(
                  child: TickerTile(
                    name: snapshot.data['investCardNames'][index],
                    currentPrice: snapshot.data['investCardPrice'][index],
                    amount: snapshot.data['investCardAmount'][index],
                    ifIncrease: false,
                  ),
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardScreen(
                            cardName: snapshot.data['investCardNames'][index],
                          ),
                        )
                    );
                  },
                );
              },
            ),
          );
        }else{
          return Text('loading user portafolio');
        }
      },
    );
  }

}