import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlleva/Pages/Login/datos.dart';

import '../../Const/const.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: size.height*0.15,
              child: SvgPicture.asset('Assets/Images/logoBlack.svg', width: size.width*0.7,)),
            Positioned(
              top: size.height*0.3,
              left: size.width*0.18,
              right: size.width*0.27,
              child: Text(
                'Viaja cómodo y seguro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: size.height*0.035,
                  color: Colors.black,
                  fontFamily: 'Poppins'
                ),
              ),
            ),
            Positioned(
              top: size.height*0.45,
              left: 1,
              child: Image.asset('Assets/Images/nubes.png', width: size.width*0.45,)),
            Positioned(
              top: size.height*0.5,
              child: Image.asset('Assets/Images/car.png', width: size.width*1,)),
            Positioned(
              bottom: size.height*0.08,
              child: SizedBox(
                height: size.height*0.06,
                width: size.width*0.8,
                child: ElevatedButton(
                    style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                      Const().black,
                    )),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  Datos()));
                    },
                    child: Stack(
                      children: [ 
                           Positioned(
                            top: size.height*0.017,
                            right: 0,
                            child: const Icon(Icons.arrow_forward_outlined, color: Colors.white,)),
                        Positioned(
                          top: size.height*0.01,
                          left: size.height*0.1,
                          child: Text(
                                      'Comenzar',
                                      style: TextStyle(
                          fontSize: size.height * 0.025,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                            ),
                        ),
                      ]
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}