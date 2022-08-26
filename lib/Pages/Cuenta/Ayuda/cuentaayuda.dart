import 'package:flutter/material.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Pages/Cuenta/Ayuda/pedir_viaje_ayuda.dart';

class CuentaAyuda extends StatelessWidget {
  const CuentaAyuda({Key? key}) : super(key: key);

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
                    'Cuenta',
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
            padding: EdgeInsets.only(left: size.width * 0.1, right: size.width*0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txt(size, 'No puedo pedir un viaje', () {
                  Navigator.push(context, MaterialPageRoute(builder: 
                  ((context) => const PedirViajeAyuda())));
                }),
                SizedBox(
                  height: size.height * 0.035,
                ),
                txt(size, '¿Como actualizo mi número de teléfono?', () {
                  
                }),
                SizedBox(
                  height: size.height * 0.035,
                ),
                txt(size, 'Configuración de cuenta', () {
                  
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
          fontSize: size.height * 0.029,
          color: Colors.black,
          fontFamily: 'Poppins',
          height: 1.1
        ),
      ),
    );
  }
}
