import 'package:flutter/material.dart';
import 'package:tlleva/Pages/Login/finish.dart';
import 'package:tlleva/Widgets/button.dart';

import '../../Const/const.dart';


class AddTarjeta extends StatelessWidget {
  bool isLogin;
  AddTarjeta({Key? key, required this.isLogin, required this.name}) : super(key: key);
  String name;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          top: size.height * 0.05,
          left: size.width * 0.02,
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        Positioned(
          top: size.height * 0.067,
          left: size.width * 0.15,
          child: Text(
            'Agregar tarjeta',
            style: TextStyle(
                fontSize: size.height * 0.022,
                color: Colors.black,
                fontFamily: 'Poppins',
                height: 1),
          ),
        ),
        Positioned(
            top: size.height * 0.17,
            left: size.width * 0.05,
            right: size.width * 0.15,
            child: Image.asset(
              'Assets/Images/cardFast.png',
            )),
        Positioned(
            top: size.height * 0.42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.8,
                  child: const TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.375,
                      child: const TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.375,
                      child: const TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.8,
                  child: const TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: size.height*0.2,),
                SizedBox(
                    height: size.height * 0.06,
                    width: size.width * 0.8,
                    child: Button(
                        callback: () => isLogin ?
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> Finish(name: name,))):
                        showDialog(context: context, 
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            height: size.height*0.3,
                            width: size.width*0.9,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      SizedBox(height: size.height*0.03,),
                                      Image.asset('Assets/Images/cardFast.png', width: size.width*0.4,),
                                      SizedBox(height: size.height*0.01,),
                                      Text(
                                        'Tarjeta guardada',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: size.height * 0.029,
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            ),
                                      ),
                                      SizedBox(height: size.height*0.03,),
                                    ],
                                  ),
                                  Positioned(
                                    top: size.height*0.03,
                                    right: size.width*0.11,
                                    child: Icon(Icons.check_circle, size: size.height*0.07, color: const Color.fromARGB(255, 94, 215, 157),)),
                                  Positioned(
                                    left: 1,
                                    top: 2,
                                    child: IconButton(onPressed:() {
                                      NavigatorState nav = Navigator.of(context);
                                      nav.pop();
                                      nav.pop();
                                      nav.pop();
                                    }, icon: const Icon(Icons.cancel_outlined)))
                              ],
                            ),
                          ),
                        )),
                        height: 0.025,
                        text: 'Guardar',
                        size: size, color: Const().black, colorTxt: Colors.white,))
              ],
            )),
        Positioned(
          top: size.height * 0.77,
          left: size.width * 0.05,
          child: const Icon(Icons.lock_outline_rounded),
        ),
        Positioned(
          top: size.height * 0.77,
          left: size.width * 0.12,
          right: size.width * 0.1,
          child: Text(
            'Tu información de pago se almacenará de manera segura',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: size.height * 0.018,
                color: Colors.black,
                fontFamily: 'Poppins',
                height: 1),
          ),
        ),
         
      ]),
    );
  }
}
