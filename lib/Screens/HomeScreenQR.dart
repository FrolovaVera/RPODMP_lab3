import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:lab3/Screens/GenerateGRcodeScreen.dart';
import 'package:lab3/Screens/ScanningQRcodeScreen.dart';

class HomeScreenQR extends StatefulWidget{
  @override
  _HomeScreenQRcode createState() => _HomeScreenQRcode();
}

class _HomeScreenQRcode extends State{
  String url ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.qr_code_2),
          title: Text('QR-code'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Write link or text', style: TextStyle(fontSize: 20.0, color: Colors.blueGrey,fontWeight: FontWeight.bold),),

              SizedBox(height: 15.0,),
              SizedBox(height: 60,width: 400,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
                  onChanged: (text) {
                    url = text;
                  },
                ),
              ),

              SizedBox(height: 15.0,),
              SizedBox(height: 60,width: 400,
                child: TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateQRcodeScreen(url: url,))),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
                  child: const Text('Create QR-code',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              SizedBox(height: 15.0,),
              SizedBox(height: 60,width: 400,
                child: TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScanningQRcodeScreen())),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
                  child: const Text('Scanning QR-code',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),


            ],
          ),
        ),
      );
  }

}

class _HomeScreenQRcodemm extends State{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.qr_code_2),
          title: Text('QR-code'),
        ),
        body: Container(
          child: Center(
            child:  QrImage(
              data: 'https://www.youtube.com/watch?v=hHehIGfX_yU&ab_channel=HeyFlutter%E2%80%A4com',
              version: QrVersions.auto,
              backgroundColor: Colors.black54,
              foregroundColor: Colors.white,
              size: 250.00,
              semanticsLabel: 'блаблабла',
              gapless: false,
            ),
          ),
        ),
          backgroundColor: Colors.white70,
      ),
    );
  }
}