import 'package:flutter/material.dart';
import 'package:test2/bloc/TickerProvider.dart';
import 'package:provider/provider.dart';

class TickersList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TickersProvider tickerBloc = Provider.of<TickersProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: tickerBloc.tickers,
      ),
    );
  }
}
