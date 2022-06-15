import 'package:flutter/material.dart';

import '../constants.dart';
import '../shared/network/fun.dart';

Widget buildCardDesgin(List articles,int index, BuildContext context) => GestureDetector(
      onTap: () {
        FUN.openLink("${articles[index].url}");
      },
      child: Card(
        color: kWhiteColor,
        elevation: 5,
        shadowColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(("${articles[index].urlToImage}" == null)
                        ?"https://www.ngmisr.com/wp-content/uploads/2021/05/404-ERROR-PAGE.jpg"
                        : "${articles[index].urlToImage}")),
              ),
            ),
            Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "${articles[index].title}",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: textColor),
                  textAlign: TextAlign.center,
                )),
            Container(
              height: 40,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        FUN.shareLink("${articles[index].url}");
                      },
                      icon: Icon(Icons.share)),
                  IconButton(
                      onPressed: () {
                        FUN.copyLink("${articles[index].url}").then((value) {
                          final snackBar = SnackBar(
                            content: Text('Copy...'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      icon: Icon(Icons.copy))
                ],
              ),
            )
          ],
        ),
      ),
    );
