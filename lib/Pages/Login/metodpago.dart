import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlleva/Pages/Login/finish.dart';
import 'package:tlleva/api/api.dart';

import 'addtarjeta.dart';

class MetododePago extends StatefulWidget {
   MetododePago({Key? key, required this.isLogin}) : super(key: key);
  bool isLogin = true;

  @override
  State<MetododePago> createState() => _MetododePagoState();
}

class _MetododePagoState extends State<MetododePago> {

  String name = '';

  void getMyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenUser = prefs.getString('tokenUser')!;
    // ignore: use_build_context_synchronously
    Api().myData(tokenUser, context).then((value) {
      setState(() {
        name = value['name'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMyData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTarjeta(isLogin: widget.isLogin, name: name,))),
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
        Positioned(
          top: size.height*0.6,
          child: Container(
            height: size.height*0.12,
            width: size.width*0.8,
            color: const Color.fromARGB(255, 233, 232, 232),
            child: Row(
              children: [
                SizedBox(width:size.width*0.05),
                Image.asset('Assets/Images/cash.png'),
                SizedBox(width:size.width*0.03),
                Text(
            'Efectivo',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: size.height * 0.019,
                color: Colors.black,
                fontFamily: 'Poppins'),
          ),
              ],
            ),
          )),
          widget.isLogin?
          Positioned(
            top: size.height*0.8,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Finish(name: name,))),
              child: Text(
                'Omitir',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: size.height * 0.019,
                    color: Colors.black,
                    fontFamily: 'Poppins'),
              ),
            ),
          ) : Container(),
      ]),
    );
  }
}
