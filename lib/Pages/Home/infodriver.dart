import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Pages/Cuenta/Ayuda/cuentaayuda.dart';

class InfoDriver extends StatelessWidget {
  const InfoDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: -20,
              child: SvgPicture.asset(
                'Assets/Images/bginfoDriver.svg',
                width: size.width * 1.2,
              )),
          
          ListView(
            padding: EdgeInsets.only(top: size.height * 0.11),
            children: [
              SvgPicture.asset('Assets/Images/simpleFace.svg'),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Ricardo López',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size.height * 0.033,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    height: 0),
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.075),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    info(
                        size,
                        Icon(
                          Icons.home,
                          size: size.height * 0.035,
                        ),
                        'Miembro de tllevo'),
                    info(
                        size,
                        Icon(
                          Icons.star,
                          size: size.height * 0.035,
                        ),
                        '5.0'),
                    info(
                        size,
                        Icon(
                          FontAwesomeIcons.heart,
                          size: size.height * 0.035,
                        ),
                        'Amable'),
                    info(
                        size,
                        Icon(
                          Icons.g_translate,
                          size: size.height * 0.035,
                        ),
                        'Español - Inglés'),
                    info(
                        size,
                        Icon(
                          Icons.home,
                          size: size.height * 0.035,
                        ),
                        'Queens'),
                  ],
                ),
              ),
              Divider(
                height: size.height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '1,452 viajes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        height: 0),
                  ),
                  Text(
                    '4 meses',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        height: 0),
                  ),
                ],
              ),
              Divider(
                height: size.height * 0.07,
              ),
              Text(
                'Comentarios',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size.height * 0.033,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    height: 0),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  SvgPicture.asset(
                    'Assets/Images/simpleFace.svg',
                    height: size.height * 0.05,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'Assets/Images/ChatRecive.svg',
                        height: size.height * 0.08,
                        color: Colors.black,
                      ),
                      Text(
                        'Buena conversación',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            height: 0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  SvgPicture.asset(
                    'Assets/Images/simpleFace.svg',
                    height: size.height * 0.05,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'Assets/Images/ChatRecive.svg',
                        height: size.height * 0.08,
                        color: Colors.black,
                      ),
                      Text(
                        'Amable y muy paciente',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            height: 0),
                      ),
                    ],
                  ),
                ],
              ),
                  SizedBox(height: size.height*0.05,)
            ],
          ),
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
        ],
      ),
    );
  }

  Padding info(Size size, Icon icon, String txt) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: size.width * 0.05,
          ),
          Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: size.height * 0.021,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Poppins',
                height: 0),
          ),
        ],
      ),
    );
  }
}
