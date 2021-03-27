import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/services/url_launcher.dart';
import 'package:spacex_latest_launch/utilities/constants.dart';

class UsefulLinksWidget extends StatelessWidget {
  final String title;
  final String link;
  final String shownLink;

  UsefulLinksWidget(
      {@required this.title, @required this.link, @required this.shownLink});

  final UrlLauncher urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kSpace,
        ),
        Row(
          children: [
            Text(
              title,
              style: kDetailBodyTextStyle,
            ),
            GestureDetector(
              onTap: () {
                if (link.length != 0) {
                  urlLauncher.launchURL(link);
                }
              },
              child: Text(
                shownLink,
                style: kDetailBodyLinkTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
