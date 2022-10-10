import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlleva/Blocs/Location/location_bloc.dart';
import 'package:tlleva/Blocs/Map/map_bloc.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Pages/Cuenta/cuenta.dart';
import 'package:tlleva/Views/map_view.dart';
import 'package:tlleva/Widgets/button.dart';
import 'package:tlleva/api/api_login.dart';

import 'Home/home.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  late String tokenUser;
  Map myData = {};

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  void getMyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenUser = prefs.getString('tokenUser')!;
    // ignore: use_build_context_synchronously
    Api().myData(tokenUser, context).then((value) {
      myData = value;
    }).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Cuenta(
                  tokenUser: tokenUser,
                  data: myData,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        if (locationState.lastKnowLocation == null) {
          return const Center(
            child: Text('Espere, por favor...'),
          );
        }
        return BlocBuilder<MapBloc, MapState>(builder: (context, mapState) {
          Map<String, Polyline> polylines = Map.from(mapState.polylines);
          if (!mapState.showMyRoute) {
            polylines.removeWhere((key, value) => key == 'myRoute');
          }
          return SingleChildScrollView(
            child: Stack(
              children: [
                MapView(
                  target: locationState.lastKnowLocation!,
                  polylines: polylines.values.toSet(),
                  marker: mapState.markers.values.toSet(),
                ),
                //ManualMarket(),
                Positioned(
                  bottom: size.height * 0.2,
                  right: size.width * 0.07,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                          elevation: 3,
                        ),
                        onPressed: () {
                          final userLocation =
                              locationBloc.state.lastKnowLocation;
                          if (userLocation == null) {
                            Const().snackBarErrorSuccefull(
                                context, 'No hay ubicación', Colors.red);
                            return;
                          }
                          mapBloc.moveCamera(userLocation);
                          mapBloc.add(onStartFollowingUserEvent());
                        },
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.black,
                        )),
                  ),
                ),
                Positioned(
                  top: size.height * 0.07,
                  left: size.width * 0.07,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.black,
                          elevation: 3,
                        ),
                        onPressed: () {
                         getMyData();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
