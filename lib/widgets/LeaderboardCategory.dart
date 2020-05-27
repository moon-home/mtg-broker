import 'package:flutter/material.dart';
import '../utilities/SizeConfig.dart';
class LeaderboardCategory extends StatefulWidget {
  @override
  _LeaderboardCategoryState createState() => _LeaderboardCategoryState();
}

class _LeaderboardCategoryState extends State<LeaderboardCategory> {
  int selectedIndex = 0;
  final List<String> categories = ['friends', 'all', 'topics'];


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment(0, 0),
      height: SizeConfig.screenHeight*0.09,
      color: Theme.of(context).primaryColor,
      //color: Colors.black,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight*0.02,
                    horizontal: SizeConfig.screenWidth*0.05,
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: index==selectedIndex?Colors.white:Colors.white60,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  )),
            );
          }),
    );
  }
}
