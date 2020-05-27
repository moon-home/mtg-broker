import 'package:flutter/material.dart';

class TickerTile extends StatelessWidget{
  final String name;
  final double currentPrice;
  final bool ifIncrease;
  final int amount;

  Color getColor(){
    return ifIncrease?Colors.red:Colors.green;
  }

  Icon getIcon(){
    return ifIncrease?Icon(Icons.arrow_upward, color: getColor(),):Icon(Icons.arrow_downward, color: getColor(),);
  }

  TickerTile({this.name, this.currentPrice, this.amount, this.ifIncrease, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w100, fontSize: 22,),),
          Container(child: Row(children: <Widget>[
            Text('\$ ${currentPrice.toString()}', style: TextStyle(color: getColor(), fontWeight: FontWeight.w100, fontSize: 22, ),),
            Text(' x${amount.toString()}', style: TextStyle(color: getColor(), fontWeight: FontWeight.w100, fontSize: 22, ),),
            getIcon(),
          ],)),
        ],),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    );}}
