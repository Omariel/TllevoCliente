import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tlleva/Blocs/Location/location_bloc.dart';
import 'package:tlleva/Blocs/Map/map_bloc.dart';
import 'package:tlleva/Blocs/Search/search_bloc.dart';
import 'package:tlleva/Const/const.dart';
import 'package:tlleva/Delegates/search_destination.dart';
import 'package:tlleva/Model/search_result.dart';
import 'package:tlleva/Pages/Home/home.dart';
import 'package:tlleva/Widgets/button.dart';
import 'package:tlleva/Widgets/column_builder.dart';

import '../../api/api_home.dart';

class SelectViaje extends StatefulWidget {
  SelectViaje(
      {Key? key, required this.tokenUser, required this.historialDirecciones})
      : super(key: key);
  String tokenUser;
  Map historialDirecciones;

  @override
  State<SelectViaje> createState() => _SelectViajeState();
}

class _SelectViajeState extends State<SelectViaje> {
  TextEditingController initController = TextEditingController();
  TextEditingController finishController = TextEditingController();
  int select = 0;
  bool button = false;
  bool cargando = true;
  List data = [];
  LatLng? startPosition;
  String? dir1Start;
  String? dir2Start;
  String? dir1End;
  String? dir2End;
  LatLng? endPosition;
  var newresult;
  @override
  void initState() {
    if(widget.historialDirecciones.isNotEmpty){
      setState(() {
        endPosition = LatLng(double.parse(widget.historialDirecciones['latitude']), double.parse(widget.historialDirecciones['longitude']));
        dir1End = widget.historialDirecciones['address'];
        dir2End = widget.historialDirecciones['address_no'];
      });
    }
    widget.historialDirecciones.isNotEmpty
        ? finishController = TextEditingController(
            text:
                '${widget.historialDirecciones['address']} ${widget.historialDirecciones['address_no']}')
        : null;
    ApiHome().historialDirecciones(widget.tokenUser, context).then((value) {
      data = value;
      setState(() {
        cargando = false;
      });
    });
    super.initState();
  }

  void onSearchResults(BuildContext context,  LatLng start,
      LatLng end) async {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);


    if (start != null) {
      final destination = await searchBloc.getCoorsStartToEnd(start, end);
      //final destination = await searchBloc.getCoorsStartToEnd( locationBloc.state.lastKnowLocation!, result.position! );
      await mapBloc.drawRoutePolyline(destination);
    }
  }

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
                padding: EdgeInsets.only(
                    left: size.width * 0.05, bottom: size.height * 0.02),
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
                            onTap: () async {
                              final result = await showSearch(
                                  context: context,
                                  delegate: SearchDestinationDelegate());
                              if (result == null) return;
                              //onSearchResults( context, result );
                              var sep = result.description!.split(', ');
                              setState(() {
                                initController =
                                    TextEditingController(text: result.name);
                                startPosition = result.position;
                                dir1Start = sep[0];
                                dir2Start = sep[1];
                              });
                            },
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
                            keyboardType: TextInputType.none,
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
                                onTap: () async {
                                  final result = await showSearch(
                                      context: context,
                                      delegate: SearchDestinationDelegate());
                                  if (result == null) return;
                                  //onSearchResults( context, result );
                                  var sep = result.description!.split(', ');
                                  setState(() {
                                    finishController = TextEditingController(
                                        text: result.name);
                                    endPosition = result.position;
                                    newresult = result;
                                    dir1End = sep[0];
                                    dir2End = sep[1];
                                  });
                                },
                                readOnly: true,
                                controller: finishController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    hintText: '¿A dónde vas?',
                                    hintStyle: TextStyle(fontSize: 20),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 233, 232, 232),
                                    border: InputBorder
                                        .none, //OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.5))),
                                style: Theme.of(context).textTheme.bodyMedium,
                                keyboardType: TextInputType.none,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                splashRadius: 20,
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: size.height * 0.04,
                                ))
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
                padding: EdgeInsets.only(
                    left: size.width * 0.1, top: size.height * 0.01),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          FontAwesomeIcons.briefcase,
                          color: Colors.black,
                          size: size.height * 0.025,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
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
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          FontAwesomeIcons.house,
                          color: Colors.black,
                          size: size.height * 0.025,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
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
              SizedBox(
                height: size.height * 0.025,
              ),
              const Divider(
                  thickness: 1.5, height: 0, color: Color(0xFFB3B3B3)),
              cargando
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ColumnBuilder(
                      itemCount: data.length,
                      textDirection: TextDirection.ltr,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            lastSearch(
                                size,
                                data[index]['address'].toString(),
                                data[index]['address_no'].toString(),
                                index, () {
                                if (initController.text.isEmpty) {
                                  setState(() {
                                    startPosition = LatLng(double.parse(data[index]['latitude']), double.parse(data[index]['longitude']));
                                    dir1Start = data[index]['address'].toString();
                                    dir2Start = data[index]['address_no'].toString();
                                  });
                                } else if (finishController.text.isEmpty) {
                                  setState(() {
                                    endPosition = LatLng(double.parse(data[index]['latitude']), double.parse(data[index]['longitude']));
                                    dir1End = data[index]['address'].toString();
                                    dir2End = data[index]['address_no'].toString();
                                  });
                                }
                            }),
                            const Divider(
                              thickness: 1.2,
                              height: 0,
                            ),
                          ],
                        );
                      },
                    ),
              SizedBox(
                height: size.height * 0.03,
              ),
              finishController.text.length > 5
                  ? Padding(
                      padding: EdgeInsets.only(left: size.width * 0.1),
                      child: SizedBox(
                          width: size.width * 0.8,
                          height: size.height * 0.05,
                          child: Button(
                              callback: () {
                                if (finishController.text.length > 5) {
                                  Map map = {
                                    'dir1Start': dir1Start,
                                    'dir2Start': dir2Start,
                                    'startPosition': startPosition,
                                    'dir1End': dir1End,
                                    'dir2End': dir2End,
                                    'endPosition': endPosition
                                  };
                                  print(map);
                                  onSearchResults(context,
                                      startPosition!, endPosition!);
                                  //Navigator.of(context).pop();
                                  Navigator.of(context).pop(map);
                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home(show: true)));
                                } else {}
                              },
                              height: 0.026,
                              text: 'Pedir driver',
                              size: size,
                              color: Const().yellow,
                              colorTxt: Colors.black)),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }

  Widget lastSearch(
      Size size, String text1, String text2, int num, VoidCallback callback) {
    return GestureDetector(
      onTap: () {
        setState(() {
          callback();
          select = num;
        });
        if (initController.text.isEmpty) {
          setState(() {
            initController.text = text1;
          });
        } else if (finishController.text.isEmpty) {
          setState(() {
            finishController.text = text1;
          });
        }
      },
      child: Container(
        color: num == select ? const Color(0xffF2F2F2) : Colors.white,
        height: size.height * 0.09,
        width: size.width * 1,
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.08,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 233, 232, 232),
                    shape: BoxShape.circle),
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
