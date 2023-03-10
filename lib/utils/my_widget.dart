import 'dart:ui';

import 'package:absensi_siswa/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

museoText(String title,
    {Color color,
    double fontSize,
    FontWeight fontWeight,
    TextOverflow overflow,
    TextAlign align,
    bool price = false,
    bool number = false,
    bool normal = false}) {
  FlutterMoneyFormatter fmf;
  if (number || price) {
    fmf = new FlutterMoneyFormatter(
      amount: (title != null && title != "") ? double.parse(title) : 0.0,
      settings: MoneyFormatterSettings(
        symbol: !number ? 'Rp' : '',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
        compactFormatType: CompactFormatType.short,
      ),
    );
  }

  return Text(
    title != null
        ? price || number
            ? fmf.output.symbolOnLeft
            : title
        : "",
    style: TextStyle(
      fontFamily: normal ? "Roboto" : "museo",
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    overflow: overflow,
    textAlign: align,
  );
}

appBar({
  Widget title,
  Widget bottom,
  bool withActions = true,
  bool backButton = false,
}) {
  return AppBar(
    automaticallyImplyLeading: backButton,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[vBlue, vBlue2],
      )),
    ),
    bottom: bottom,
    elevation: 0.0,
    bottomOpacity: 0.0,
    title: title,
    // actions: withActions
    //     ? <Widget>[
    //         Row(
    //           children: <Widget>[
    //             Icon(
    //               Icons.notifications,
    //               color: Colors.white,
    //             ),
    //             SizedBox(
    //               width: 18.0,
    //             ),
    //             Icon(
    //               Icons.favorite,
    //               color: Colors.white,
    //             ),
    //             SizedBox(
    //               width: 18.0,
    //             ),
    //             Icon(
    //               Icons.shopping_cart,
    //               color: Colors.white,
    //             ),
    //             SizedBox(
    //               width: 20.0,
    //             ),
    //           ],
    //         )
    //       ]
    //     : null,
  );
}

cardHome({String title, String Icon, onTap}) {
  return InkWell(
    onTap: onTap,
    child: ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
//          side: BorderSide(color: vBlue2, width: 2.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2.0, color: vBlue2)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset(
                        'assets/images/$Icon',
//                      color: vBlueOld,
                      ),
                    ),
                    SizedBox(height: 20),
                    museoText(
                      title,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

cardAbsensi({title}) {
  return Container(
    height: 90,
    child: Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
//          side: BorderSide(color: vBlue2, width: 2.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2.0, color: vBlue2)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                museoText(
                  title,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
