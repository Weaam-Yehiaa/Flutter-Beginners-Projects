import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;

class HomePageOCR extends StatefulWidget {
  @override
  _HomePageOCR createState() => _HomePageOCR();
}

class _HomePageOCR extends State<HomePageOCR> {
  String parsedtext = '';
  parsethetext() async {
    // pick a image
    final imagefile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxWidth: 670, maxHeight: 970);

    // prepare the image
    var bytes = Io.File(imagefile!.path.toString()).readAsBytesSync();
    String img64 = base64Encode(bytes);
    print(img64.toString());

    // send to api
    var url = 'https://api.ocr.space/parse/image';
    var payload = {"base64Image": "data:image/jpg;base64,${img64.toString()}"};
    var header = {"apikey": 'K85579355588957'};
    var post = await http.post((url = url) as Uri, body: payload, headers: header);

    // get result from api
    var result = jsonDecode(post.body);
    setState(() {
      parsedtext = result['ParsedResults'][0]['ParsedText'];
    });
    print('ffffffffffffffffffffffff${parsedtext}');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0),
            alignment: Alignment.center,
            child: Text(
              "OCR APP",
              // style: GoogleFonts.montserrat(
              //     fontWeight: FontWeight.w700, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              onPressed: () => parsethetext(),
              child: Text(
                'Upload a image',
                // style: GoogleFonts.montserrat(
                //     fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 70.0),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  "ParsedText is:",
                  // style: GoogleFonts.montserrat(
                  //     fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  parsedtext,
                  // style: GoogleFonts.montserrat(
                  //     fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}