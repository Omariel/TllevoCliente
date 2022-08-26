import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Model/model.dart';
import 'package:tlleva/Pages/Cuenta/cuenta.dart';
import 'package:tlleva/Pages/Home/bottomsheetviaje.dart';
import 'package:tlleva/Pages/Home/select_viaje.dart';
import 'package:tlleva/Widgets/button.dart';
import 'package:tlleva/api/api.dart';
import 'package:tlleva/Pages/Home/bottomsheetselectcar.dart';

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
  late String tokenUser;
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
                                  tokenUser: tokenUser, data: myData,
                                ))));
  }

  @override
  void initState() {
    widget.show
        ? WidgetsBinding.instance.addPostFrameCallback((_) {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => const BottomSheetSelectCar());
          })
        : null;
    super.initState();
  }

  AnimationController? controller;
  Animation<double>? animation;
  void progress() {
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
          Positioned(
              top: -100,
              child: Image.asset(
                'Assets/Images/backGroundMap.png',
                height: size.height * 1,
                width: size.width * 1,
              )),
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
          isDraggable == true
              ? DraggableBottomSheet()
              : Positioned(
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                primary: Colors.white,
                                elevation: 3,
                                //maximumSize: Size(50, 50),
                                //minimumSize: Size(1, 30), //////// HERE
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.my_location,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      isLoading
                          ? Container(
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
                              ))
                          : Container(
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
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SelectViaje())),
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
                                  GestureDetector(
                                      onTap: () => showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (context) =>
                                                      const BottomSheetSelectCar())
                                              .then((value) {
                                            setState(() {
                                              isLoading = value;
                                              progress();
                                            });
                                          }),
                                      child: lastSearch(
                                          size,
                                          'Grand Central Terminal',
                                          '425 Lexington Ave. New York')),
                                  const Divider(),
                                  lastSearch(size, 'LaGuardia Airport',
                                      'Queens, NY 11371, Estados Unidos'),
                                  const Divider(),
                                  lastSearch(size, 'LaGuardia Airport',
                                      'Queens, NY 11371, Estados Unidos'),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
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