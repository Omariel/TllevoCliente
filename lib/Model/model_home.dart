import 'package:flutter/material.dart';

class CategoryVehicle {
  CategoryVehicle({Key? key, required this.success, required this.payload});

  bool success;
  List payload;

  factory CategoryVehicle.fromJson(Map<String, dynamic> json) {
    return CategoryVehicle(success: json['success'], payload: json['payload']);
  }
}

class HistorialDirecciones {
  HistorialDirecciones({Key? key, required this.success, required this.payload});

  bool success;
  List payload;

  factory HistorialDirecciones.fromJson(Map<String, dynamic> json) {
    return HistorialDirecciones(success: json['success'], payload: json['payload']);
  }
}

class PedirTaxi {
  PedirTaxi({Key? key, required this.success, required this.payload});

  bool success;
  Map payload;

  factory PedirTaxi.fromJson(Map<String, dynamic> json) {
    return PedirTaxi(success: json['success'], payload: json['payload']);
  }
}