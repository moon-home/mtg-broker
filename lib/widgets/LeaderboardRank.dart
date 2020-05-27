import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test2/screens/chat_121_screen.dart';
import '../models/Message.dart';
import 'ChatFavContacts.dart';
import '../models/User.dart';

class LeaderboardRank extends StatelessWidget {

  final List<User> ranks = [sam, steven, olivia, john, greg, sam, steven, olivia, john, greg];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //height: 50,
        decoration: BoxDecoration(
          //color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )
        ),
        child: ListView.builder(
            itemCount: ranks.length,
            itemBuilder: (BuildContext context, int index){
              final User user = ranks[index];
              double investGain = (ranks.length+1-index)*0.5115*100;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child:Text(
                                  (index+1).toString(),
                                  style: TextStyle(
                                    color: index<3? Theme.of(context).primaryColor: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(user.imageUrl),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                child: Text(
                                  user.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(child: Text('${investGain.toStringAsFixed(2)}%'),),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 0,
                      height: 5,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
