import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:news_app_mvvm/constants.dart';
import 'package:news_app_mvvm/utils/text_utile.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperScreen extends StatelessWidget {
   HelperScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Helper ",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KTextUtils(
                  text: "Information",
                  size: 26,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.none),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: KTextUtils(
                    text: "This program is based on obtaining the latest \nexclusive news.",
                    size: 24,
                    color: kGrayColor,
                    fontWeight: FontWeight.normal,
                    textDecoration: TextDecoration.none),
              ),
              const SizedBox(height: 20,),
              KTextUtils(
                  text: "Information Programmer",
                  size: 24,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.none),
              const SizedBox(height: 10,),
              InkWell(
                child: const SelectableText(
                  "Eng\\Mohamed Ahmed",
                ),
                onTap: () {
                  FlutterClipboard.copy('hello flutter friends')
                      .then((value) {
                    // ScaffoldMessenger.of(_).showSnackBar(
                    //   SnackBar(
                    //     content: const Text('Copy....'),
                    //   ),
                    // );
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        child: Icon(Icons.facebook),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  launcherInBrowser();
                  // launcherInBrowser("https://www.facebook.com/profile.php?id=100007422464467");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
   launcherInBrowser(   ) async {
     String url = 'https://www.facebook.com/profile.php?id=100007422464467';
     // ignore: deprecated_member_use
     if (await canLaunch(url)) {
       // ignore: deprecated_member_use
       await launch(
         url,
         // forceSafariVC: false,
         // forceWebView: false,
         // headers: <String,String>{'header_key':'header_value'},
       );
     } else {
       throw 'Could not launch $url';
     }
   }
}
