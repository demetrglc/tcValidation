import 'package:flutter/material.dart';

class TcValidation extends StatefulWidget {
  const TcValidation({Key? key}) : super(key: key);

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

  tcDogrula(String myNumber) {
    for (int i = 0; i < 9; i = i + 2) {
      sonucTekToplam = sonucTekToplam! + int.parse(charAt(myNumber, i));
    }
    sonucTekCarpma = sonucTekToplam! * 7;

    for (int j = 1; j < 9; j = j + 2) {
      sonucCiftToplam = sonucCiftToplam! + int.parse(charAt(myNumber, j));
    }

    onuncuHane = (sonucTekCarpma! - sonucCiftToplam!) % 10;

    onbirinciHane = (sonucTekToplam! + sonucCiftToplam! + onuncuHane!) % 10;

    if (int.parse(charAt(myNumber, 9)) == onuncuHane &&
        int.parse(charAt(myNumber, 10)) == onbirinciHane) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('True Tc'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('False Tc'),
      ));
    }
  }

  String charAt(sayi, int position) {
    if (sayi is! String ||
        sayi.length <= position ||
        sayi.length + position < 0) {
      return '';
    }

    int realPosition = position < 0 ? sayi.length + position : position;

    return sayi[realPosition];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          TextField(
            controller: tc1,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () {
                if (tc1.text.length != 11) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Empty Tc'),
                  ));
                } else {
                  tcDogrula(tc1.text);
                  onuncuHane = null;
                  onbirinciHane = null;
                  sonucTekCarpma = null;
                  sonucTekToplam = 0;
                  sonucCiftToplam = 0;
                }
              },
              child: const Text("Tc Doğrula")),
        ],
      )),
    );
  }
}
