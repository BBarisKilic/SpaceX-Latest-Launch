import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spacex_latest_launch/services/network_helper.dart';
import 'package:spacex_latest_launch/utilities/constants.dart';
import 'package:spacex_latest_launch/widgets/useful_links_widget.dart';

class SpaceXLaunchDetail extends StatefulWidget {
  @override
  _SpaceXLaunchDetailState createState() => _SpaceXLaunchDetailState();
}

class _SpaceXLaunchDetailState extends State<SpaceXLaunchDetail> {
  String name = '';
  String imageAddress = '';
  String details = '';
  String flightNumber = '';
  String date = '';
  String article = '';
  String wikipedia = '';
  String youtube = '';
  bool isDataVisible = false;

  NetworkHelper networkHelper = NetworkHelper(kURL);

  void updateUI() async {
    try {
      var decodedData = await networkHelper.getData();
      if (decodedData.length != 0) {
        setState(() {
          isDataVisible = true;
          name = decodedData[0];
          imageAddress = decodedData[1];
          details = decodedData[2];
          flightNumber = decodedData[3];
          date = decodedData[4];
          article = decodedData[5];
          wikipedia = decodedData[6];
          youtube = decodedData[7];
        });
      } else {
        setState(() {
          isDataVisible = false;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isDataVisible = true;
        name = kNetworkProblemText;
        imageAddress = '';
        details = '';
        flightNumber = '';
        date = '';
        article = '';
        wikipedia = '';
        youtube = '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppName,
          style: kTitleTextStyle,
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Visibility(
              visible: !isDataVisible,
              child: Center(
                child: SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 100.0,
                ),
              ),
            ),
            Visibility(
              visible: isDataVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  spaceXLatestLaunch(),
                  spaceXLatestLaunchDetails(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget spaceXLatestLaunch() {
    return Padding(
      padding: kPadding,
      child: Card(
        color: kCardBackgroundColor,
        child: ListTile(
          title: Text(
            name,
            style: kTitleTextStyle,
          ),
          trailing:
              imageAddress.isNotEmpty ? Image.network(imageAddress) : null,
        ),
      ),
    );
  }

  Widget spaceXLatestLaunchDetails() {
    return Expanded(
      child: Padding(
        padding: kPadding,
        child: Card(
          color: kCardBackgroundColor,
          child: Padding(
            padding: kPadding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    kDetailsText,
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: kDoubleSpace,
                  ),
                  Text(
                    details,
                    style: kDetailBodyTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: kSpace,
                  ),
                  Row(
                    children: [
                      Text(
                        kFlightNumberText,
                        style: kDetailBodyTextStyle,
                      ),
                      Text(
                        flightNumber,
                        style: kDetailBodyImportantInfoTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kSpace,
                  ),
                  Row(
                    children: [
                      Text(
                        kDateText,
                        style: kDetailBodyTextStyle,
                      ),
                      Text(
                        date,
                        style: kDetailBodyImportantInfoTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDoubleSpace,
                  ),
                  UsefulLinksWidget(
                      title: kArticleText,
                      link: article,
                      shownLink: kArticleAddressText),
                  UsefulLinksWidget(
                      title: kWikipediaText,
                      link: wikipedia,
                      shownLink: kWikipediaAddressText),
                  UsefulLinksWidget(
                      title: kYoutubeText,
                      link: youtube,
                      shownLink: kYoutubeAddressText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
