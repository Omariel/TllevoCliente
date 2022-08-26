import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlleva/Pages/Login/email_password.dart';
import 'package:tlleva/Pages/Login/Login/login.dart';
import 'package:tlleva/Pages/Login/term&cond.dart';
import 'package:tlleva/Widgets/button.dart';

import '../../Const/const.dart';

// ignore: must_be_immutable
class Datos extends StatelessWidget {
  Datos({Key? key}) : super(key: key);
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Text(
              'Ingresa tu nombre',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.height * 0.035,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  height: 1),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),

            Text(
              'Los conductores confirmarán que eres tú al llegar',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.height * 0.025,
                  color: Colors.black87,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            SvgPicture.asset(
              'Assets/Images/face.svg',
              width: size.width * 0.3,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            Form(
              key: keyForm,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.099,
                    width: size.width * 0.8,
                    child: TextFormField(
                      controller: controllerName,
                      cursorColor: Colors.black,
                      validator: (value) {
                        String pattern = r'(^[a-zA-Z ]*$)';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty) {
                          return "El nombre es necesario";
                        } else if (!regExp.hasMatch(value)) {
                          return "El nombre debe de ser a-z y A-Z";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Nombre',
                          hintStyle: TextStyle(fontSize: 20),
                          filled: true,
                          fillColor: Color.fromARGB(255, 233, 232, 232),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5))),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.099,
                    width: size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      validator: (value) {
                        String pattern = r'(^[a-zA-Z ]*$)';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty) {
                          return "El Apellido es necesario";
                        } else if (!regExp.hasMatch(value)) {
                          return "El Apellido debe de ser a-z y A-Z";
                        }
                        return null;
                      },
                      controller: controllerLastName,
                      decoration: const InputDecoration(
                          hintText: 'Apellido',
                          hintStyle: TextStyle(fontSize: 20),
                          filled: true,
                          fillColor: Color.fromARGB(255, 233, 232, 232),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5))),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.275),
                    child: GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      child: Text(
                        '¿Ya tienes una cuenta?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: size.height * 0.021,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            height: 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.105,
                  ),
                  SizedBox(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      child: Button(
                        callback: () {
                          if (keyForm.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmailPassword(
                                          name:
                                              '${controllerName.text} ${controllerLastName.text}',
                                        )));
                          }
                        },
                        height: 0.025,
                        text: 'Siguiente',
                        size: size,
                        color: Const().black,
                        colorTxt: Colors.white,
                      ))
                ],
              ),
            ),

            // Positioned(
            //     bottom: size.height * 0.08,
            //     child: SizedBox(
            //         height: size.height * 0.06,
            //         width: size.width * 0.8,
            //         child: Button(
            //           callback: () {
            //             if (keyForm.currentState!.validate()) {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => EmailPassword(name: '${controllerName.text} ${controllerLastName.text}',)));
            //             }
            //           },
            //           height: 0.025,
            //           text: 'Siguiente',
            //           size: size,
            //           color: Const().black,
            //           colorTxt: Colors.white,
            //         )))
          ]),
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
        ],
      ),
    );
  }
}
