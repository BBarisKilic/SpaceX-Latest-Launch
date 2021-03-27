import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spacex_latest_launch/services/network_helper.dart';
import 'package:spacex_latest_launch/utilities/constants.dart';

class SpaceXLaunchDetail extends StatefulWidget {
  @override
  _SpaceXLaunchDetailState createState() => _SpaceXLaunchDetailState();
}

class _SpaceXLaunchDetailState extends State<SpaceXLaunchDetail> {
  String name = '';
  String imageAddress = '';
  String details = '';
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
        });
      } else {
        setState(() {
          isDataVisible = false;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        name = '';
        imageAddress = '';
        details = kNetworkProblemText;
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
        title: Text(kAppName),
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
      padding: padding,
      child: Card(
        color: Colors.black,
        child: ListTile(
          title: Text(name),
          trailing:
              imageAddress.isNotEmpty ? Image.network(imageAddress) : null,
        ),
      ),
    );
  }

  Widget spaceXLatestLaunchDetails() {
    return Expanded(
      child: Padding(
        padding: padding,
        child: Card(
          color: Colors.black,
          child: Padding(
            padding: padding,
            child: Column(
              children: [
                Text(
                  kDetailsText,
                  style: kDetailTitleTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  details,
                  style: kDetailBodyTextStyle,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
