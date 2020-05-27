import 'package:flutter/material.dart';
import '../models/TickerTile.dart';

List<Widget> tickerList = [
  TickerTile(
    name: 'CardName1',
    currentPrice: 12.05,
    ifIncrease: true,
  ),
  TickerTile(
    name: 'CardName2',
    currentPrice: 12.05,
    ifIncrease: false,
  ),
  TickerTile(
    name: 'Card1',
    currentPrice: 12.05,
    ifIncrease: false,
  ),
];
