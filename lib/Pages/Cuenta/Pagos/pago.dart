import 'package:flutter/material.dart';
import 'package:tlleva/Pages/Login/addtarjeta.dart';
import 'package:tlleva/Pages/Login/finish.dart';

import '../../../Const/const.dart';


class Pago extends StatelessWidget {
  const Pago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          top: 0,
          child: Container(
              width: size.width * 1,
              height: size.height * 0.17,
              color: Const().yellow,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.04,
                    left: size.width * 0.02,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                  ),
                  Positioned(
                    top: size.height * 0.09,
                    child: Text(
                      'Pago',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: size.height * 0.041,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1.1),
                    ),
                  ),
                ],
              ),
            ),
        ),
        Positioned(
          top: size.height * 0.2,
          left: size.width * 0.1,
          right: size.width * 0.1,
          child: Text(
            'Agrega un método de pago',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: size.height * 0.035,
                color: Colors.black,
                fontFamily: 'Poppins',
                height: 1),
          ),
        ),
        Positioned(
          top: size.height * 0.3,
          left: size.width * 0.1,
          right: size.width * 0.1,
          child: Text(
            'El pago será efectuado después del viaje.',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: size.height * 0.025,
                color: Colors.black87,
                fontFamily: 'Poppins'),
          ),
        ),
        Positioned(
          top: size.height*0.45,
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTarjeta(isLogin: false, name: '',))),
            child: Container(
              height: size.height*0.12,
              width: size.width*0.8,
              color: const Color.fromARGB(255, 233, 232, 232),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('Assets/Images/card.png'),
                  Text(
              'Tarjeta de crédito o débito',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: size.height * 0.019,
                  color: Colors.black,
                  fontFamily: 'Poppins'),
            ),
                ],
              ),
            ),
          )),
      ]),
    );
  }
}
