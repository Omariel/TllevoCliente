import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlleva/Pages/Home/home.dart';
import 'package:tlleva/Pages/Home/infodriver.dart';
import 'package:tlleva/Pages/Home/mensajes.dart';

import '../../Const/const.dart';
import '../../Widgets/button.dart';

class DraggableBottomSheet extends StatefulWidget {
  DraggableBottomSheet({Key? key}) : super(key: key);

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  bool llego = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return llego ? enCamino(size) : porLlegar(size);
  }

  DraggableScrollableSheet enCamino(Size size) {
    return DraggableScrollableSheet(
      initialChildSize: 0.23,
      minChildSize: 0.23,
      maxChildSize: 0.88,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: ListView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.01, bottom: size.height * 0.02),
                      child: Container(
                        height: size.height * 0.006,
                        width: size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    Text(
                      'En camino a LaGuardia\nAirport Queens',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.025,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Text(
                      'Hora de llegada',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1.6),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: size.height * 0.7,
                                    width: size.width * 0.9,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.06,
                                            ),
                                            Text(
                                              '¿Qué tal estuvo tu viaje?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: size.height * 0.025,
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins',
                                                  height: 1),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            SvgPicture.asset(
                                              'Assets/Images/simpleFace.svg',
                                              height: size.height * 0.085,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.035,
                                            ),
                                            Text(
                                              'Ricardo López',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: size.height * 0.021,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Poppins',
                                                  height: 1),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.035,
                                            ),
                                            Text(
                                              'Califica tu viaje',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: size.height * 0.025,
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins',
                                                  height: 1),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black26,
                                                  size: size.height * 0.06,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black26,
                                                  size: size.height * 0.06,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black26,
                                                  size: size.height * 0.06,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black26,
                                                  size: size.height * 0.06,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black26,
                                                  size: size.height * 0.06,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.07),
                                              child: Text(
                                                'Dar propina a Ricardo López cuando finalice el viaje',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.021,
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    height: 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: size.height * 0.035,
                                                  width: size.width * 0.2,
                                                  color: const Color.fromARGB(
                                                      255, 233, 232, 232),
                                                  child: Text(
                                                    '\$1.00',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.021,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        height: 0),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: size.height * 0.035,
                                                  width: size.width * 0.2,
                                                  color: const Color.fromARGB(
                                                      255, 233, 232, 232),
                                                  child: Text(
                                                    '\$3.00',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.021,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        height: 0),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: size.height * 0.035,
                                                  width: size.width * 0.2,
                                                  color: const Color.fromARGB(
                                                      255, 233, 232, 232),
                                                  child: Text(
                                                    '\$5.00',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.021,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        height: 0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * 0.05,
                                            ),
                                            SizedBox(
                                                height: size.height * 0.06,
                                                width: size.width * 0.7,
                                                child: Button(
                                                    callback: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Home(
                                                                      show:
                                                                          false)));
                                                    },
                                                    height: 0.021,
                                                    text: 'Enviar',
                                                    size: size,
                                                    color: Colors.black,
                                                    colorTxt: Colors.white)),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              'Omitir',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: size.height * 0.021,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: size.height * 0.18,
                                          child: Container(
                                            height: size.height * 0.03,
                                            width: size.width * 0.13,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Colors.white,
                                                  size: size.height * 0.02,
                                                ),
                                                Text(
                                                  '5.0',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.017,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.06,
                        width: size.width * 0.6,
                        color: Colors.black,
                        child: Text(
                          '1:12 min',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.029,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              height: 1),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.12,
                        ),
                        Icon(
                          Icons.location_on_sharp,
                          size: size.height * 0.025,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LaGuardia Airport',
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  height: 1),
                            ),
                            Text(
                              'Queens, NY 11271, Estados Unidos',
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  height: 1),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.12,
                        ),
                        Icon(
                          Icons.credit_card,
                          size: size.height * 0.03,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$15.95',
                              style: TextStyle(
                                  fontSize: size.height * 0.026,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                            Text(
                              'Visa 2754',
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  height: 1),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.8,
                        child: Button(
                            callback: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: SizedBox(
                                          height: size.height * 0.62,
                                          width: size.width * 0.9,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: size.height * 0.06,
                                                  ),
                                                  Container(
                                                    height: size.height * 0.1,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.location_pin,
                                                        color: Const().yellow,
                                                        size:
                                                            size.height * 0.08,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Text(
                                                    'Compartir viaje',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.025,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        height: 1),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.03,
                                                  ),
                                                  Container(
                                                    height: size.height * 0.1,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: Center(
                                                      child: Text(
                                                        '911',
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.05,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Const().yellow,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Text(
                                                    'Llamar al 911',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.025,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        height: 1),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.03,
                                                  ),
                                                  Container(
                                                    height: size.height * 0.1,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Transform.rotate(
                                                            angle: pi / 4,
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Const()
                                                                  .yellow,
                                                              size:
                                                                  size.height *
                                                                      0.08,
                                                            ))),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Text(
                                                    'Cancelar y buscar\notro conductor',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.025,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        height: 1),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                  left: 1,
                                                  top: 2,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(Icons
                                                          .cancel_outlined)))
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                            height: 0.021,
                            text: 'Seguridad',
                            size: size,
                            color: Const().black,
                            colorTxt: Colors.white)),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InfoDriver())),
                          child: SvgPicture.asset(
                            'Assets/Images/simpleFace.svg',
                            height: size.height * 0.08,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'P9F46',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: size.height * 0.033,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  height: 0),
                            ),
                            Text(
                              'Hyundai Accent',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  height: 0),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.13,
                          color: const Color(0xffE6E6E6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: size.height * 0.02,
                              ),
                              Text(
                                '5.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: size.height * 0.017,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    height: 0),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Ricardo López',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.021,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0),
                        ),
                        Text(
                          '1,452 viajes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.017,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              height: 0),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Dar propina a Ricardo\nLópez cuando finalice\nel viaje',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: size.height * 0.021,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              height: 1),
                        ),
                        SvgPicture.asset(
                          'Assets/Images/propinaCoins.svg',
                          height: size.height * 0.055,
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.04,
                          width: size.width * 0.25,
                          color: const Color.fromARGB(255, 233, 232, 232),
                          child: Text(
                            '\$1.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.height * 0.026,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                height: 0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.04,
                          width: size.width * 0.25,
                          color: const Color.fromARGB(255, 233, 232, 232),
                          child: Text(
                            '\$3.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.height * 0.026,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                height: 0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.04,
                          width: size.width * 0.25,
                          color: const Color.fromARGB(255, 233, 232, 232),
                          child: Text(
                            '\$5.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.height * 0.026,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                height: 0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ]),
        );
      },
    );
  }

  DraggableScrollableSheet porLlegar(Size size) {
    return DraggableScrollableSheet(
      initialChildSize: 0.21,
      minChildSize: 0.21,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: ListView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.01, bottom: size.height * 0.02),
                      child: Container(
                        height: size.height * 0.006,
                        width: size.width * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    Text(
                      'Conductor esta a\npunto de llegar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.height * 0.025,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          llego = !llego;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.06,
                        width: size.width * 0.6,
                        color: Colors.black,
                        child: Text(
                          '1:00 min',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.029,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              height: 1),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InfoDriver())),
                          child: SvgPicture.asset(
                            'Assets/Images/simpleFace.svg',
                            height: size.height * 0.08,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'P9F46',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: size.height * 0.033,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  height: 0),
                            ),
                            Text(
                              'Hyundai Accent',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  height: 0),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.13,
                          color: const Color(0xffE6E6E6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: size.height * 0.02,
                              ),
                              Text(
                                '5.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: size.height * 0.017,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    height: 0),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Ricardo López',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.021,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0),
                        ),
                        Text(
                          '1,452 viajes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.017,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              height: 0),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.2,
                      height: size.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Mensajes())),
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.05,
                        width: size.width * 0.8,
                        color: const Color.fromARGB(255, 233, 232, 232),
                        child: Text(
                          'Enviar mensaje',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.021,
                              color: Colors.black54,
                              fontFamily: 'Poppins',
                              height: 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.8,
                        child: Button(
                            callback: () {},
                            height: 0.021,
                            text: 'Llamar',
                            size: size,
                            color: Const().black,
                            colorTxt: Colors.white))
                  ],
                ),
              ]),
        );
      },
    );
  }
}
