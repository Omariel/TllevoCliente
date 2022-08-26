import 'package:flutter/material.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Pages/Cuenta/Ayuda/cuentaayuda.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({Key? key}) : super(key: key);

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
                    'Ayuda',
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
            height: size.height * 0.045,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txt(size, 'Cuenta', () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CuentaAyuda()));
                }),
                SizedBox(
                  height: size.height * 0.005,
                ),
                txt(size, 'Ayuda con viaje', () {
                  
                }),
                SizedBox(
                  height: size.height * 0.005,
                ),
                txt(size, 'Opciones de pago', () {
                  
                }),
                SizedBox(
                  height: size.height * 0.005,
                ),
                txt(size, 'Emergencia', () {
                  
                }),
                SizedBox(
                  height: size.height * 0.005,
                ),
                txt(size, 'Otros', () {
                  
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector txt(Size size, String name, VoidCallback callback) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: size.height * 0.033,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
