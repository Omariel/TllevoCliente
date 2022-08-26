import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Widgets/button.dart';

// ignore: must_be_immutable
class Configuracion extends StatelessWidget {
  Configuracion ({Key? key, required this.MyData, required this.name1, required this.name2}) : super(key: key);
  Map MyData;
  String name1;
  String name2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
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
                    'Configuración',
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
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1, right: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('Assets/Images/simpleFace.svg', height: size.height*0.13,),
          SizedBox(
            height: size.height * 0.1,
          ),
                Container(
                height: size.height * 0.04,
                width: size.width * 0.8,
                color: const Color.fromARGB(255, 233, 232, 232),
                child:  Padding(
                  padding:  EdgeInsets.only(left:size.width*0.06, top: size.height*0.01),
                  child: Text(
                      name1,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: size.height * 0.019,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1.1),
                    ),
                ),
              ),
          SizedBox(
            height: size.height * 0.01,
          ),
                Container(
                height: size.height * 0.04,
                width: size.width * 0.8,
                color: const Color.fromARGB(255, 233, 232, 232),
                child:  Padding(
                  padding:  EdgeInsets.only(left:size.width*0.06, top: size.height*0.01),
                  child: Text(
                      name2,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: size.height * 0.019,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1.1),
                    ),
                ),
              ),
          SizedBox(
            height: size.height * 0.01,
          ),
                Container(
                height: size.height * 0.04,
                width: size.width * 0.8,
                color: const Color.fromARGB(255, 233, 232, 232),
                child:  Padding(
                  padding:  EdgeInsets.only(left:size.width*0.06, top: size.height*0.01),
                  child: Text(
                      MyData['email'],
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: size.height * 0.019,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1.1),
                    ),
                ),
              ),
          SizedBox(
            height: size.height * 0.01,
          ),
                Container(
                height: size.height * 0.04,
                width: size.width * 0.8,
                color: const Color.fromARGB(255, 233, 232, 232),
                child:  Padding(
                  padding:  EdgeInsets.only(left:size.width*0.06, top: size.height*0.01),
                  child: Text(
                      MyData['phone'],
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: size.height * 0.019,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1.1),
                    ),
                ),
              ),
          SizedBox(height: size.height*0.23,),
          Button(callback: (){}, height: 0.021, text: 'Guardar', size: size, color: Const().black, colorTxt: Colors.white,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
