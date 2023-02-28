import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanningQRcodeScreen extends StatefulWidget{
  @override
  _ScanningQRcode createState() => _ScanningQRcode();
}

class _ScanningQRcode extends State<ScanningQRcodeScreen>{
String _scanTxt = 'Not scanning';

Future<void> scanCode() async {
  String scanRes;
  scanRes = await FlutterBarcodeScanner.scanBarcode('#28386a', 'Cancel', true, ScanMode.QR);

  if(!mounted) return;

  setState(() {
    _scanTxt = scanRes;
  });
}

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:  AppBar(
      title: Text('Scanning QR-code'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.blueGrey,
    ),
    body: Container(
      padding: EdgeInsets.all(20.0),
      //alignment: Alignment.center,
      child: Column(

        //direction: Axis.vertical,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          SizedBox(height: 20,),
          SizedBox(height: 60, width: 340,
          child: ElevatedButton(
              onPressed: () => scanCode(),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
              child: Text('Start scan', style: TextStyle(fontSize: 20, color: Colors.white),)),
          ),

          SizedBox(height: 20,),
          Text('Scan text:', style: TextStyle(fontSize: 20,color: Colors.blueGrey),),
          Text('$_scanTxt', style: TextStyle(fontSize: 20,color: Colors.blueGrey),),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 60,
                child: ElevatedButton(
                    onPressed: (){
                       FlutterClipboard.copy( '$_scanTxt');
                      },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
                    child: Text('     Copy     ', style: TextStyle(fontSize: 20, color: Colors.white),)),
              ),

              SizedBox(height: 60,
                child: ElevatedButton(
                    onPressed: () => launchUrl(Uri.parse(_scanTxt)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
                    child: Text('     Open     ', style: TextStyle(fontSize: 20, color: Colors.white),)),
              ),

            ],
          ),
        ],
      ),
    ),
   );
  }
}

