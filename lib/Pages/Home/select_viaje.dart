import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Pages/Home/home.dart';
import 'package:tlleva/Widgets/button.dart';

class SelectViaje extends StatefulWidget {
  SelectViaje({Key? key}) : super(key: key);

  @override
  State<SelectViaje> createState() => _SelectViajeState();
}

class _SelectViajeState extends State<SelectViaje> {
  TextEditingController initController = TextEditingController();
  TextEditingController finishController = TextEditingController();
  int select = 0;
  bool button = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: size.height * 0.03,
                    left: size.width * 0.13,
                    top: size.height * 0.08),
                child: Row(
                  children: [
                    Text(
                      'Viaje',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.025,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Container(
                      height: size.height * 0.035,
                      width: size.width * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.015,
                                top: size.height * 0.005),
                            child: Text(
                              'Yo',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: size.height * 0.021,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.black,
                            size: size.height * 0.035,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05, bottom: size.height*0.02),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'Assets/Images/lineaSelectViaje.svg',
                      height: size.height * 0.08,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.055,
                          width: size.width * 0.72,
                          child: TextFormField(
                            controller: initController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                                hintText: 'Ingresa el puto de partida',
                                hintStyle: TextStyle(fontSize: 20),
                                filled: true,
                                fillColor: Color.fromARGB(255, 233, 232, 232),
                                border:
                                    InputBorder.none, //OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.5))),
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.055,
                              width: size.width * 0.72,
                              child: TextFormField(
                                controller: finishController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    hintText: '¿A dónde vas?',
                                    hintStyle: TextStyle(fontSize: 20),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 233, 232, 232),
                                    border:
                                        InputBorder.none, //OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.5))),
                                style: Theme.of(context).textTheme.bodyMedium,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            IconButton(onPressed: (){}, splashRadius: 20, icon: Icon(Icons.add, color: Colors.black, size: size.height*0.04,))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
              thickness: 3,
              height: size.height * 0.03,
              color: const Color(0xFFEAE9E9)),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.1, top: size.height*0.01),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.briefcase, color: Colors.black, size: size.height*0.025,),
                        SizedBox(width: size.width*0.05,),
                           Text(
                        'Trabajo',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: size.height * 0.021,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            height: 1),
                      ),
                      ],
                    ),
                    SizedBox(height: size.height*0.015,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.house, color: Colors.black, size: size.height*0.025,),
                        SizedBox(width: size.width*0.05,),
                           Text(
                        'Casa',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: size.height * 0.021,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            height: 1),
                      ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height*0.025,),
              const Divider(
              thickness: 1.5,
              height: 0,
              color: Color(0xFFB3B3B3)),
              lastSearch(size, 'Grand Central Terminal', '425 Lexington Ave. New York',1),
              const Divider(thickness: 1.2, height: 0,),
              lastSearch(size, 'LaGuardia Airport', 'Queens, NY 11371, Estados Unidos',2),
              const Divider(thickness: 1.2, height: 0,),
              lastSearch(size, 'Grand Central Terminal', '425 Lexington Ave. New York',3),
              const Divider(thickness: 1.2, height: 0,),
              lastSearch(size, 'Grand Central Terminal', '425 Lexington Ave. New York',4),
              const Divider(thickness: 1.2, height: 0,),
              lastSearch(size, 'Grand Central Terminal', '425 Lexington Ave. New York',5),
              const Divider(thickness: 1.2, height: 0,),
              SizedBox(height: size.height*0.03,),
              finishController.text.length > 5 ?
              Padding(
                padding: EdgeInsets.only(left: size.width*0.1),
                child: SizedBox(
                  width: size.width*0.8,
                  height: size.height*0.05,
                  child: Button(callback: (){
                    if(finishController.text.length > 5){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home(show: true)));
                    }else{
                    }
                  }, height: 0.026, text: 'Pedir driver', size: size, color: Const().yellow, colorTxt: Colors.black)),
              ) : Container()
            ],
          ),
        ],
      ),
    );
  } Widget lastSearch(Size size, String text1, String text2, int num) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = num;
        });
        if(initController.text.isEmpty){
          setState(() {
            initController.text = text1;
          });
        }else if(finishController.text.isEmpty){
          setState(() {
            finishController.text = text1;
          });
        }
      },
      child: Container(
        color: num == select ? const Color(0xffF2F2F2): Colors.white,
        height: size.height * 0.09,
        width: size.width * 1,
        child: Padding(
        padding: EdgeInsets.only(left: size.width*0.08,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                color: Color.fromARGB(255, 233, 232, 232),
                shape: BoxShape.circle
                ),
                child: const Center(
                    child: Icon(
                  Icons.access_time_filled,
                  color: Colors.black,
                  size: 30,
                )),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 0.9),
                    ),
                    Text(
                      text2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1.1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
