import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/card_screen.dart';
import '../models/User.dart';
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
  Map singleUserInvestData;
  void getCurrentUser() async{
    try{
      print('=============try');
      final user = await _auth.currentUser();
      if (user != null){
        userID=user.uid;
        final CollectionReference allUserInvestCollection = Firestore.instance.collection('userInvest');
        DocumentSnapshot userInvestSnapshot = await allUserInvestCollection.document(userID).get();
        singleUserInvestData = userInvestSnapshot.data;
        print('DraggableScrollableSheet got user data: $singleUserInvestData');
      }else{
        Navigator.pop(context);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {

//    var allUserInvestData = Provider.of<QuerySnapshot>(context);
//    final user = Provider.of<User>(context);
//    var singleUserInvestData = allUserInvestData.documents.singleWhere((doc)=>doc.documentID==user.uid).data;

    return Container(
      //padding: EdgeInsets.all(20),
      child: ListView.builder(
        //physics: const AlwaysScrollableScrollPhysics(),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: singleUserInvestData['investCardNames'].length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: TickerTile(
              name: singleUserInvestData['investCardNames'][index],
              currentPrice: singleUserInvestData['investCardPrice'][index],
              amount: singleUserInvestData['investCardAmount'][index],
              ifIncrease: false,
            ),
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardScreen(
                    cardName: singleUserInvestData['investCardNames'][index],
                  ),
                )
              );
            },
          );
        },
      ),
    );
//
//
//
////          child: SingleChildScrollView(
////            child: Column(
////              children: tickersProvider.tickers,
////            ),
////          ),
////          child:
////            tickersProvider.tickers.length==0?
////            ListView.builder(
////              itemCount: sampleList.length,
////              controller: scrollController,
////              itemBuilder: (context, index){
////                return sampleList[index];
////              },
////
////            )
////            :ListView.builder(
////            itemCount: tickersProvider.tickers.length,
////            controller: scrollController,
////            itemBuilder: (context, index){
////              return GestureDetector(
////                child: tickersProvider.tickers[index],
////                onTap: (){
////                  Navigator.push(
////                      context,
////                      MaterialPageRoute(
////                        builder: (context) => CardScreen(
////                          cardName: tickersProvider.cards.containsKey(tickersProvider.tickers[index].name)?
////                                      tickersProvider.tickers[index].name
////                                      :tickersProvider.bufferCard.name,
////                        ),
////                      ));
////                },);
////
////            },
////          ),
//
//
//          decoration: BoxDecoration(
//            gradient: LinearGradient(// 10% of the width, so there are
//              begin: Alignment.topLeft,
//              end: Alignment.bottomRight,// ten blinds.
//                        colors: [Colors.grey[900], Colors.grey[800]],),
//            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
//          ),
//        );
//      },
//    );
  }

}