import 'package:flutter/material.dart';
import '../utilities/SizeConfig.dart';
class ChatCategorySelector extends StatefulWidget {
  @override
  _ChatCategorySelectorState createState() => _ChatCategorySelectorState();
}

class _ChatCategorySelectorState extends State<ChatCategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['messages', 'online', 'groups'];


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
                      //fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  )),
            );
          }),
    );
  }
}
