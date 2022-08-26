import 'package:flutter/material.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Widgets/button.dart';

class PedirViajeAyuda extends StatelessWidget {
  const PedirViajeAyuda({Key? key}) : super(key: key);

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
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1, right: size.width * 0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No puedo pedir un viaje',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.height * 0.029,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      height: 1.1),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.height * 0.017,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      height: 1.1),
                ),
                SizedBox(
                  height: size.height * 0.035,
                ),
                Text(
                  '¿Alguna otra duda?',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.height * 0.017,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      height: 1.1),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Column(
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width * 0.8,
                color: const Color.fromARGB(255, 233, 232, 232),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                width: size.width*0.8,
                child: Button(callback: (){}, height: 0.021, text: 'Enviar', size: size, color: Const().black, colorTxt: Colors.white,))
            ],
          )
        ],
      ),
    );
  }
}
