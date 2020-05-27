import 'package:flutter/material.dart';
import '../utilities/SizeConfig.dart';
import '../models/User.dart';
import '../screens/chat_121_screen.dart';

final User greg = User(
  name: 'Greg',
  imageUrl: 'images/tmp/anne.jpg',
);
final User james = User(
  name: 'James',
  imageUrl: 'images/tmp/barn.jpg',
);
final User john = User(
  name: 'John',
  imageUrl: 'images/tmp/christ.jpg',
);
final User olivia = User(
  name: 'Olivia',
  imageUrl: 'images/tmp/kristina.jpg',
);
final User sam = User(
  name: 'Sam',
  imageUrl: 'images/tmp/leon.jpg',
);
final User sophia = User(
  name: 'Sophia',
  imageUrl: 'images/tmp/wendy.jpg',
);
final User steven = User(
  name: 'Steven',
  imageUrl: 'images/tmp/mark.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

class ChatFavContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
//        Container(
//          color: Colors.blue,
//          padding: EdgeInsets.symmetric(
//            horizontal: 20.0,
//          ),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                'Favorite Contacts',
//                style: TextStyle(
//                    color: Colors.blueGrey,
//                    fontSize: 15.0,
//                    fontWeight: FontWeight.bold,
//                    letterSpacing: 1.0
//                ),
//              ),
//              IconButton(
//                icon: Icon(
//                  Icons.more_horiz,
//                ),
//                iconSize: 25.0,
//                color: Colors.blueGrey,
//                onPressed: (){},
//              )
//            ],
//          ),
//        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          height: SizeConfig.screenHeight*0.14,
          //color: Colors.pink,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 5.0),
            scrollDirection: Axis.horizontal,
            itemCount: favorites.length,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => Chat121(
                        user: favorites[index]),
                  ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(height: 6.0,),
                        Text(
                            favorites[index].name,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                            ),
                        ),
                      ],),
                ),
              );
            }),
        ),
      ],
    );
  }
}
