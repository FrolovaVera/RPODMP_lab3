import 'package:lab3/Screens/HomeScreenQR.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class GenerateQRcodeScreen extends StatefulWidget{
  final url;
  GenerateQRcodeScreen({@required this.url});

  @override
  _GenerateQRcode createState() => _GenerateQRcode();
}

class _GenerateQRcode extends State<GenerateQRcodeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Generate QR-code'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blueGrey,
      ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              _generatorQR(widget.url),
            ],
          ),
        ),
    );
  }
}



 _getStrForQR(){
   var _str = '';
   return Center(
    child: Column(
      children: [
        SizedBox(height:80.0,),
          Text('Write link or text', style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),),
          Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
             children: [
             TextField(
             decoration: InputDecoration(border: OutlineInputBorder()),
             style: TextStyle(fontSize: 16,color: Colors.blueGrey),
             onChanged: (text) {
               _str = text;
             },
             ),
             SizedBox(height: 20.0,),
             SizedBox(height: 50.0, width: 400,
             child: TextButton(
                onPressed: () async {
                  if(TextEditingController().text.isEmpty){
                    const SnackBar(
                      content: Text('Fill all the fields'),
                    );
                  }else {

                  }
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
                child: const Text('Create QR-code',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                ),
               ),
               SizedBox(height: 80.0,),
               QrImage(
                 data: _str,
                 version: QrVersions.auto,
                 backgroundColor: Colors.blueGrey,
                 foregroundColor: Colors.white,
                 size: 225.00,
                 //semanticsLabel: 'блаблабла',
                 gapless: false,
               ),
             ],
         ),
        ),
      ],
    ),
  );
}

_generatorQR(var url){
  return Center(
    child:  Column(
      children: [
      //Text(//заголовок
        //'${url}',
        //style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      //),
        SizedBox(height: 250.0,),
        QrImage(
          data: url.toString(),
          version: QrVersions.auto,
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          size: 250.00,
          //semanticsLabel: 'блаблабла',
          gapless: false,
        ),
      ],
    ),
  );
}
