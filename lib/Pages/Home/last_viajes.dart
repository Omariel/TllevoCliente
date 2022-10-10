import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlleva/Widgets/button.dart';
import 'package:tlleva/Widgets/column_builder.dart';

import '../../api/api_home.dart';

// ignore: must_be_immutable
class DraggableBottomSheetLastViajes extends StatefulWidget {
  VoidCallback callbackSearch;
  VoidCallback callbackHistory;
  List data;
  DraggableBottomSheetLastViajes(
      {required this.callbackHistory, required this.callbackSearch, required this.data});
  @override
  State<DraggableBottomSheetLastViajes> createState() =>
      _DraggableBottomSheetLastViajesState();
}

class _DraggableBottomSheetLastViajesState
    extends State<DraggableBottomSheetLastViajes> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          width: size.width * 1,
          height: size.height * 0.6,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Container(
                width: size.width * 1,
                height: size.height * 0.5,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  children: [
                    Container(
                      width: size.width * 1,
                      height: size.height * 0.06,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.023),
                        child: Text(
                          '¡Comunidad 100% Latina!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              height: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () => widget.callbackSearch(),
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.8,
                        color: const Color.fromARGB(255, 233, 232, 232),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.05),
                            Icon(
                              Icons.search,
                              size: size.height * 0.05,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
              
                         ColumnBuilder(
                            itemCount: widget.data.length > 3 ? 3 : widget.data.length,
                            textDirection: TextDirection.ltr,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                      onTap: () => widget.callbackHistory(),
                                      child: lastSearch(
                                          size,
                                          widget.data[index]['address'].toString(),
                                          widget.data[index]['address_no']
                                              .toString())),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget lastSearch(Size size, String text1, String text2) {
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                color: const Color.fromARGB(255, 233, 232, 232),
                child: const Center(
                    child: Icon(
                  Icons.location_on,
                  size: 20,
                )),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
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
                          height: 1),
                    ),
                    Text(
                      text2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          height: 1),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
          //SizedBox(width: size.width*0.02,)
        ],
      ),
    );
  }
}
