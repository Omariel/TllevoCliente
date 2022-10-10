import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Const/const.dart';
import '../Model/model_home.dart';

class ApiHome {
  Future<List<dynamic>> categoryVehicle(
      String tokenUser, BuildContext context) async {
    List map = [];
    var response = await http.get(
        Uri.parse(
            'http://apptllevo.com:8089/api/client/category-vehicle/CATEGORY_VH'),
        headers: {'Authorization': 'Bearer $tokenUser'});
    if (response.statusCode == 200) {
      List payload =
          CategoryVehicle.fromJson(jsonDecode(response.body)).payload;
      map = payload;
      return payload;
    } else {
      // ignore: use_build_context_synchronously
      Const().snackBarErrorSuccefull(context,
          'Ha ocurrido un error, por favor intentelo nuevamente', Colors.red);
      return map;
    }
  }

  Future<List<dynamic>> historialDirecciones(
      String tokenUser, BuildContext context) async {
    List map = [];
    var response = await http.get(
        Uri.parse(
            'http://apptllevo.com:8089/api/client/user-addresses-history-by-user'),
        headers: {'Authorization': 'Bearer $tokenUser'});
    if (response.statusCode == 200) {
      List payload =
          HistorialDirecciones.fromJson(jsonDecode(response.body)).payload;
      map = payload;
      return payload;
    } else {
      // ignore: use_build_context_synchronously
      Const().snackBarErrorSuccefull(context,
          'Ha ocurrido un error, por favor intentelo nuevamente', Colors.red);
      return map;
    }
  }

  Future<Map<dynamic, dynamic>> pedirTaxi(
      String tokenUser,
      BuildContext context,
      String categoriaVehiculo,
      String addressIdTo,
      String addressTo,
      String addressNoTo,
      String latitudTo,
      String longitudTo,
      String addressIdFrom,
      String addressFrom,
      String addressNoFrom,
      String latitudFrom,
      String longitudFrom) async {
    Map<String, dynamic> map = {
      "categoria_vehiculo": categoriaVehiculo,
      "address_id_to": addressIdTo,
      "dir_to": {
        "is_principal": "0",
        "address": addressTo,
        "address_no": addressNoTo,
        "latitud": latitudTo,
        "longitud": longitudTo
      },
      "address_id_from": addressIdFrom,
      "dir_from": {
        "is_principal": "0",
        "address": addressFrom,
        "address_no": addressNoFrom,
        "latitud": latitudFrom,
        "longitud": longitudFrom
      }
    };
    String encod = json.encode(map);
    var response = await http.post(
        Uri.parse('http://apptllevo.com:8089/api/client/order-a-taxi'),
        body: encod,
        headers: {
          'Authorization': 'Bearer $tokenUser',
          "content-type": "application/json"
          });
    if (response.statusCode == 200) {
      Map payload = PedirTaxi.fromJson(jsonDecode(response.body)).payload;
      return payload;
    } else {
      // ignore: use_build_context_synchronously
      Const().snackBarErrorSuccefull(context,
          'Ha ocurrido un error, por favor intentelo nuevamente', Colors.red);
      return {};
    }
  }
}
