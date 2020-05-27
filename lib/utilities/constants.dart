import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final kHintTextStyle = TextStyle(
  color: Colors.black26,
  fontFamily: 'OpenSansCondensed',
);

final kLabelStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.normal,
  fontFamily: 'OpenSansConsensed',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(30.0),
//  boxShadow: [
//    BoxShadow(
//      color: Colors.red,
//      blurRadius: 6.0,
//      offset: Offset(0, 2),
//    ),
//  ],
);

const spinkit = SpinKitChasingDots(
  color: Color(0xFF5A104E),
  size: 100.0,
);