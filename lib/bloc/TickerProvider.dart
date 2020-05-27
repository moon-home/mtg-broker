import 'package:flutter/material.dart';
import 'package:test2/models/MTGCard.dart';
import '../models/TickerTile.dart';
import 'dart:collection';
class TickersProvider with ChangeNotifier {

  List<TickerTile> _tickerList = [];
  HashMap _cardListMap = HashMap<String, MTGCard>();
  MTGCard _bufferCard;

  List<TickerTile> get tickers => _tickerList;
  HashMap<String, MTGCard> get cards => _cardListMap;
  MTGCard get bufferCard => _bufferCard;


  set tickers(List<TickerTile> newTickerList){
     _tickerList = newTickerList;
     notifyListeners();
  }

  void addTicker(String tickerName, double tickerPrice, bool tickerIncrease, String cardId, String cardImageURL){
    if(_cardListMap.containsKey(tickerName)){
      return;
    }
    _tickerList.add(TickerTile(
      name: tickerName,
      currentPrice: tickerPrice,
      ifIncrease: tickerIncrease,
    ));

    _addCard(cardId, tickerName, cardImageURL, tickerPrice);

    notifyListeners();
  }

  void _addCard(String thisId, String thisName, String thisImageURL, double thisPrice){
   _cardListMap.putIfAbsent(
       thisName,
       (){
           return MTGCard(
            id: thisId,
            name: thisName,
            normalImageURL: thisImageURL,
            price: thisPrice
          );
        });
  }

  void increaseCard(String name){
    print(_cardListMap[name].amount);
    _cardListMap[name] = MTGCard(
        id: _cardListMap[name].id,
        name: _cardListMap[name].name,
        normalImageURL: _cardListMap[name].normalImageURL,
        price: _cardListMap[name].price,
        amount:_cardListMap[name].amount+1,
    );
    notifyListeners();
  }

  void decreaseCard(String name){
    if (!_cardListMap.containsKey(name)){
      print("No such card to remove!");
    } else if(_cardListMap[name].amount == 1){
      setBufferCard(name, _cardListMap[name].normalImageURL, _cardListMap[name].price);
      _cardListMap.remove(name);
      _tickerList.removeWhere((item) => item.name == name);
    }else {
      _cardListMap[name] = MTGCard(
        id: _cardListMap[name].id,
        name: _cardListMap[name].name,
        normalImageURL: _cardListMap[name].normalImageURL,
        price: _cardListMap[name].price,
        amount: _cardListMap[name].amount - 1,
      );
    }
    notifyListeners();
  }

  void setBufferCard(String name, String url, double price){
    _bufferCard = MTGCard(
      id: 'nah',
      name: name,
      normalImageURL: url,
      price: price,
      amount:0,
    );
  }

  double getTotalInvest(){
    double t = 0;
    _cardListMap.forEach((k,v)=>t=t+v.price*v.amount);
    return t;
  }
}