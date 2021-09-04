import 'package:appentus/imports.dart';
import 'package:universe/universe.dart';
export 'package:universe/universe.dart';

class HomePageMap extends StatelessWidget {
  final LocationData? locationData;
  const HomePageMap({Key? key, required this.locationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return U.GoogleMap(
      live: true,
      showLocationIndicator: true,
      showCenterMarker: true,
      showLocator: true,
      center: [locationData?.latitude, locationData?.longitude],
      zoom: 15,
    );
  }
}
