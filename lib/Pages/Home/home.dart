import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Pages/Home/bottomsheetviaje.dart';
import 'package:tlleva/Pages/Home/last_viajes.dart';
import 'package:tlleva/Pages/Home/select_viaje.dart';
import 'package:tlleva/Pages/map_screen.dart';
import 'package:tlleva/Widgets/button.dart';
import 'package:tlleva/api/api_home.dart';
import 'package:tlleva/api/api_login.dart';
import 'package:tlleva/Pages/Home/bottomsheetselectcar.dart';

import '../../Blocs/Map/map_bloc.dart';
import '../../Blocs/gps/gps_bloc.dart';
import '../../Widgets/column_builder.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key? key, required this.show}) : super(key: key);
  bool show;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool isLoading = false;
  bool isDraggable = false;
  Map myData = {};
  Map pedido = {};
  String hisEmail = '';
  String hisName = '';
  String dirEnd = '';
  List historialViajes = [];
  late String tokenUser;

  @override
  void initState() {
    getMyData();
    widget.show
        ? WidgetsBinding.instance.addPostFrameCallback((_) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            tokenUser = prefs.getString('tokenUser')!;
            await Api().myData(tokenUser, context).then((value) {
              myData = value;
            });
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => BottomSheetSelectCar(
                      tokenUser: tokenUser,
                    )).then((value) {
              setState(() {
                isLoading = true;
                progress();
              });
            });
          })
        : init();
    super.initState();
  }

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenUser = prefs.getString('tokenUser')!;
    await ApiHome().historialDirecciones(tokenUser, context).then((value) {
      setState(() {
        historialViajes = value;
      });
    });
  }

  getMyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenUser = prefs.getString('tokenUser')!;
    await Api().myData(tokenUser, context).then((value) {
      myData = value;
    });
  }

  AnimationController? controller;
  Animation<double>? animation;
  void progress() async {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!)
      ..addListener(() {
        setState(() {
          animation!.value == 1.0
              ? setState(() {
                  isLoading = false;
                  isDraggable = true;
                })
              : null;
        });
      });
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(children: [
          BlocBuilder<GpsBloc, GpsState>(
            builder: (context, state) {
              return state.isAllGrantes
                  ? MapScreen()
                  : !state.isGpsEnable
                      ? _EnableGps(size: size)
                      : _AccessButton(size: size);
            },
          ),
          isDraggable == true
              ? myData['email'] == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : DraggableBottomSheet(
                      myEmail: myData['email'],
                      hisEmail: hisEmail,
                      hisName: hisName,
                      dirEnd: dirEnd,
                    )
              : isLoading
                  ? Positioned(
                      bottom: 0,
                      child: Container(
                          width: size.width * 1,
                          height: size.height * 0.35,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.1,
                                right: size.width * 0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Buscando\nConductor',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: size.height * 0.041,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Espera...',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: size.height * 0.025,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      height: 1),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                LinearProgressIndicator(
                                  value: animation!.value,
                                  backgroundColor: const Color(0xffDDDEDB),
                                  color: const Color(0xff111820),
                                  minHeight: 5,
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                SizedBox(
                                    width: size.width * 0.8,
                                    height: size.height * 0.06,
                                    child: Button(
                                        callback: () {
                                          setState(() {
                                            isLoading = false;
                                            controller!.stop();
                                          });
                                        },
                                        height: 0.026,
                                        text: 'Cancelar',
                                        size: size,
                                        color: Const().yellow,
                                        colorTxt: Colors.black))
                              ],
                            ),
                          )),
                    )
                  : DraggableScrollableSheet(
                      initialChildSize: 0.18,
                      minChildSize: 0.18,
                      maxChildSize: 0.5,
                      builder: (context, scrollController) {
                        return Container(
                          width: size.width * 1,
                          height: size.height * 0.6,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            controller: scrollController,
                            children: [
                              Container(
                                width: size.width * 1,
                                height: size.height * 0.5,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Column(
                                  children: [
                                    Container(
                                      width: size.width * 1,
                                      height: size.height * 0.06,
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.023),
                                        child: Text(
                                          '¡Comunidad 100% Latina!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              height: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        tokenUser =
                                            prefs.getString('tokenUser')!;
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectViaje(
                                                      tokenUser: tokenUser,
                                                      historialDirecciones: {},
                                                    ))).then((value) {
                                          pedido = value;
                                          showModalBottomSheet(
                                              isDismissible: false,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) =>
                                                  BottomSheetSelectCar(
                                                    tokenUser: tokenUser,
                                                  )).then((value) {
                                            ApiHome()
                                                .pedirTaxi(
                                                    tokenUser,
                                                    context,
                                                    "${value['id']}",
                                                    "0",
                                                    '${pedido['dir1Start']}',
                                                    '${pedido['dir2Start']}',
                                                    '${pedido['startPosition'].latitude}',
                                                    '${pedido['startPosition'].longitude}',
                                                    '0',
                                                    '${pedido['dir1End']}',
                                                    '${pedido['dir2End']}',
                                                    '${pedido['endPosition'].latitude}',
                                                    '${pedido['endPosition'].longitude}')
                                                .then((value) {
                                              print('Pedir taxi -> $value');
                                              setState(() {
                                                if (value['driver_user'] ==
                                                    null) {
                                                  Const().snackBarErrorSuccefull(
                                                      context,
                                                      'No se encontró conductores disponibles en tu zona, intenta más tarde',
                                                      Colors.red);
                                                  final mapBloc =
                                                      BlocProvider.of<MapBloc>(
                                                          context);
                                                  mapBloc.clearRoutes();
                                                } else {
                                                  hisEmail =
                                                      value['driver_user']
                                                          ['email'];
                                                  hisName = value['driver_user']
                                                      ['name'];
                                                  dirEnd =
                                                      '${value['user_address']['address']}, ${value['user_address']['address_no']}';
                                                  isLoading = true;
                                                  progress();
                                                }
                                              });
                                            });
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.07,
                                        width: size.width * 0.8,
                                        color: const Color.fromARGB(
                                            255, 233, 232, 232),
                                        child: Row(
                                          children: [
                                            SizedBox(width: size.width * 0.05),
                                            Icon(
                                              Icons.search,
                                              size: size.height * 0.05,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    ColumnBuilder(
                                      itemCount: historialViajes.length > 3
                                          ? 3
                                          : historialViajes.length,
                                      textDirection: TextDirection.ltr,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                                onTap: () async {
                                                  SharedPreferences prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  tokenUser = prefs
                                                      .getString('tokenUser')!;
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SelectViaje(
                                                                tokenUser:
                                                                    tokenUser,
                                                                historialDirecciones:
                                                                    historialViajes[
                                                                        index],
                                                              ))).then((value) {
                                                    pedido = value;
                                                    showModalBottomSheet(
                                                        isDismissible: false,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isScrollControlled:
                                                            true,
                                                        context: context,
                                                        builder: (context) =>
                                                            BottomSheetSelectCar(
                                                              tokenUser:
                                                                  tokenUser,
                                                            )).then((value) {
                                                      ApiHome()
                                                          .pedirTaxi(
                                                              tokenUser,
                                                              context,
                                                              "${value['id']}",
                                                              "0",
                                                              '${pedido['dir1Start']}',
                                                              '${pedido['dir2Start']}',
                                                              '${pedido['startPosition'].latitude}',
                                                              '${pedido['startPosition'].longitude}',
                                                              '0',
                                                              '${pedido['dir1End']}',
                                                              '${pedido['dir2End']}',
                                                              '${pedido['endPosition'].latitude}',
                                                              '${pedido['endPosition'].longitude}')
                                                          .then((value) {
                                                        print(
                                                            'Pedir taxi -> $value');
                                                        setState(() {
                                                          if (value[
                                                                  'driver_user'] ==
                                                              null) {
                                                            Const().snackBarErrorSuccefull(
                                                                context,
                                                                'No se encontró conductores disponibles en tu zona, intenta más tarde',
                                                                Colors.red);
                                                            final mapBloc =
                                                                BlocProvider.of<
                                                                        MapBloc>(
                                                                    context);
                                                            mapBloc
                                                                .clearRoutes();
                                                          } else {
                                                            hisEmail = value[
                                                                    'driver_user']
                                                                ['email'];
                                                            hisName = value[
                                                                    'driver_user']
                                                                ['name'];
                                                            dirEnd =
                                                                '${value['user_address']['address']}, ${value['user_address']['address_no']}';
                                                            isLoading = true;
                                                            progress();
                                                          }
                                                        });
                                                      });
                                                    });
                                                  });
                                                },
                                                child: lastSearch(
                                                    size,
                                                    historialViajes[index]
                                                        ['address'],
                                                    historialViajes[index]
                                                            ['address_no']
                                                        .toString())),
                                            const Divider(),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
        ]),
      ),
    );
  }

  Widget lastSearch(Size size, String text1, String text2) {
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                color: const Color.fromARGB(255, 233, 232, 232),
                child: const Center(
                    child: Icon(
                  Icons.location_on,
                  size: 20,
                )),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1),
                    ),
                    Text(
                      text2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
          //SizedBox(width: size.width*0.02,)
        ],
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Debe tener acceso al GPS',
            style: TextStyle(
                fontSize: size.height * 0.017,
                color: Colors.black,
                fontFamily: 'Poppins',
                height: 1),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.8,
              child: Button(
                  callback: () {
                    final gpsBloc = BlocProvider.of<GpsBloc>(context);
                    gpsBloc.askGpsAccess();
                  },
                  height: 0.017,
                  text: 'Solicitar Acceso',
                  size: size,
                  color: Colors.black,
                  colorTxt: Colors.white))
        ],
      ),
    );
  }
}

class _EnableGps extends StatelessWidget {
  const _EnableGps({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Debe habilitar el gps',
        style: TextStyle(
            fontSize: size.height * 0.017,
            color: Colors.black,
            fontFamily: 'Poppins',
            height: 1),
      ),
    );
    // Positioned(
    //     top: -100,
    //     child: Image.asset(
    //       'Assets/Images/backGroundMap.png',
    //       height: size.height * 1,
    //       width: size.width * 1,
    //     ));
  }
}
