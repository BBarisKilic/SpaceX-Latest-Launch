import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  List<String> _listOfData = [];
  final String address;

  NetworkHelper(this.address);

  Future<List<String>> getData() async {
    _listOfData.clear();
    Uri url = Uri.parse(address);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      _listOfData.add(jsonDecode(data)['name']);
      _listOfData.add(jsonDecode(data)['links']['patch']['small']);
      _listOfData.add(jsonDecode(data)['details']);
      _listOfData.add(jsonDecode(data)['flight_number'].toString());
      String date =
          DateTime.tryParse(jsonDecode(data)['date_utc']).toLocal().toString();
      _listOfData.add(date);
      _listOfData.add(jsonDecode(data)['links']['article']);
      _listOfData.add(jsonDecode(data)['links']['wikipedia']);
      _listOfData.add(jsonDecode(data)['links']['webcast']);
    } else {
      print(response.statusCode);
    }
    return _listOfData;
  }
}
