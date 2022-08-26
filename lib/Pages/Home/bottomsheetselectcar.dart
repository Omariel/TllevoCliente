import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Const/const.dart';
import '../../Widgets/button.dart';
import '../Login/metodpago.dart';

class BottomSheetSelectCar extends StatefulWidget {
  const BottomSheetSelectCar({Key? key}) : super(key: key);

  @override
  State<BottomSheetSelectCar> createState() => _BottomSheetSelectCarState();
}

class _BottomSheetSelectCarState extends State<BottomSheetSelectCar> {
  int select = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      width: size.width * 1,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.435, top: size.height * 0.01),
            child: Container(
              height: size.height * 0.006,
              width: size.width * 0.13,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1, bottom: size.height * 0.01),
            child: Text(
              'PREFERENCIAL',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: size.height * 0.017,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
          ),
          selectCar(size, 'Assets/Images/carSimpleYellow.svg', 4, 'tllevo',
              'Llegada 1:09 p.m.', 15.05, 1),
          selectCar(size, 'Assets/Images/bigcarSimpleYellow.svg', 6,
              'tllevo family', 'Llegada 1:09 p.m.', 22.05, 2),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1,
                top: size.height * 0.01,
                bottom: size.height * 0.01),
            child: Text(
              'CONFORTABLE',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: size.height * 0.017,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
          ),
          selectCar(size, 'Assets/Images/carSimple.svg', 4, 'tllevo',
              'Llegada 1:12 p.m.', 20.05, 3),
          selectCar(size, 'Assets/Images/bigcarSimple.svg', 6, 'tllevo family',
              'Llegada 1:12 p.m.', 26.05, 4),
          Divider(
              thickness: 3,
              height: size.height * 0.03,
              color: const Color(0xFFEAE9E9)),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.12,
                right: size.width * 0.1,
                bottom: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.credit_card,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Text(
                      'Visa 2754',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MetododePago(
                                    isLogin: false,
                                  )));
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                      size: 35,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.06,
                child: Button(
                  callback: () {
                    Navigator.of(context).pop(true);
                  },
                  height: 0.026,
                  text: 'Comenzar viaje',
                  size: size,
                  color: Const().yellow,
                  colorTxt: Colors.black,
                )),
          )
        ],
      ),
    );
  }

  Widget selectCar(Size size, String asset, int cantPasajeros, String tipo,
      String llegada, double price, int num) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = num;
        });
      },
      child: Container(
        width: size.width * 1,
        height: size.height * 0.1,
        color: num == select ? const Color(0xffF4F2F2) : Colors.white,
        child: Padding(
          padding:
              EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    asset,
                    width: size.width * 0.23,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 17,
                          ),
                          Text(
                            cantPasajeros.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.height * 0.015,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.2),
                          ),
                        ],
                      ),
                      Text(
                        tipo,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: size.height * 0.021,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            height: 1.2),
                      ),
                      Text(
                        llegada,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: size.height * 0.015,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                '\$$price',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: size.height * 0.021,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}