import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  static String routeName = '${const About().runtimeType}';

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/unicorn.svg';
    final Widget svgIcon = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Empty todo list',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('About ToDO App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: svgIcon,
            height: MediaQuery.of(context).size.width / 3,
          ),
          Styles.BoxH12,
          Text(
            'Hello, My Name Is Thiên',
            style: Styles.headline5(context).copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '\nThis is todo app make by me \n\nUsing stack:\n\nFlutter + Redux + Hive\n\nHope you like it :D',
            style: Styles.bodyText2(context).copyWith(fontWeight: FontWeight.bold, color: Styles.bodyText2(context).color.withOpacity(0.6)),
            textAlign: TextAlign.center,
          ),
          Styles.BoxH16,
          FlatButton(
            color: Styles.primaryColor(context),
            child: const Text(
              'Connect with me',
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {
              final Uri _emailLaunchUri =
                  Uri(scheme: 'mailto', path: 'duythien0912@gmail.com', queryParameters: {'subject': 'Hey I like you Thien, let\'s be friends!'});

              launch(_emailLaunchUri.toString());
            },
          ),
        ],
      ),
    );
  }
}
