import 'dart:io';

import 'package:appentus/Home/home_page_map.dart';
import 'package:appentus/Utils/current_user.dart';
import 'package:appentus/Utils/location_fetch.dart';
import 'package:appentus/imports.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";
  final Map data;
  const HomePage({Key? key, required this.data}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationData? locationData;
  bool hasLocationFetchTried = false;
  @override
  void initState() {
    fetchCurrentLocation();
    super.initState();
  }

  fetchCurrentLocation() async {
    setState(() {
      hasLocationFetchTried = false;
    });
    locationData = await fetchLocation();
    setState(() {
      hasLocationFetchTried = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(
          title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: imagePath == null
                ? Icon(Icons.person_outline)
                : Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              File(imagePath.toString()),
                            )),
                        shape: BoxShape.circle)),
          ),
          SizedBox(
            width: 5,
            height: 10,
          ),
          Text(
            name ?? "User",
            style: TextStyle(color: Colors.black),
          )
        ],
      )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Authors.route);
          },
          child: Text("Authors"),
        ),
      ),
      body: locationData == null
          ? hasLocationFetchTried
              ? Center(
                  child: TextButton(
                      onPressed: () => fetchCurrentLocation(),
                      child: Text("Set Location")),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )
          : HomePageMap(locationData: locationData),
    );
  }
}
