import 'package:flutter/material.dart';

class TcValidation extends StatefulWidget {
  @override
  State<TcValidation> createState() => _TcValidationState();
}

class _TcValidationState extends State<TcValidation> {
  // double? tc, sonuc, toplam = 0, rakam;
  String? sayi;
  int? sonucTekToplam = 0,
      sonucCiftToplam = 0,
      sonucTekCarpma,
      onuncuHane,
      onbirinciHane;

  TextEditingController tc1 = TextEditingController();

  tcDogrula() {
    sayi = tc1.text;
    for (int i = 0; i < 9; i = i + 2) {
      sonucTekToplam = sonucTekToplam! + int.parse(charAt(sayi, i));
    }
    sonucTekCarpma = sonucTekToplam! * 7;

    for (int j = 1; j < 9; j = j + 2) {
      sonucCiftToplam = sonucCiftToplam! + int.parse(charAt(sayi, j));
    }

    onuncuHane = (sonucTekCarpma! - sonucCiftToplam!) % 10;

    onbirinciHane = (sonucTekToplam! + sonucCiftToplam! + onuncuHane!) % 10;

    if (int.parse(charAt(sayi, 9)) == onuncuHane &&
        int.parse(charAt(sayi, 10)) == onbirinciHane) {
      Text("bu doğru bir tc");
    } else
      Text("yanlış tc");
  }

  String charAt(sayi, int position) {
    if (sayi is! String ||
        sayi.length <= position ||
        sayi.length + position < 0) {
      return '';
    }

    int _realPosition = position < 0 ? sayi.length + position : position;

    return sayi[_realPosition];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          TextField(
            controller: tc1,
          ),
          ElevatedButton(onPressed: tcDogrula, child: Text("Tc Doğrula")),
        ],
      )),
    );
  }
}
