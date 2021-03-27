import 'package:flutter/material.dart';

const kAppName = 'SpaceX Latest Launch';
const kURL = 'https://api.spacexdata.com/v4/launches/latest';
const kNetworkProblemText = 'Network Problem!';
const kDetailsText = 'Details';
const kFlightNumberText = 'Flight Number: ';
const kDateText = 'Date: ';
const kArticleText = 'Article: ';
const kArticleAddressText = 'spaceflightnow.com';
const kWikipediaText = 'Wikipedia: ';
const kWikipediaAddressText = 'wikipedia.org';
const kYoutubeText = 'Youtube: ';
const kYoutubeAddressText = 'youtube.com';
const kSpace = 10.0;
const kDoubleSpace = 20.0;
const kPadding = EdgeInsets.all(10.0);
const kCardBackgroundColor = Color(0xff1B1B1B);
const kTitleTextStyle = TextStyle(
  fontSize: 22,
);
const kDetailBodyTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white70,
);
const kDetailBodyImportantInfoTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);
const kDetailBodyLinkTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.lightBlue,
  decoration: TextDecoration.underline,
);
