
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResult {

  final bool cancel;
  final bool manual;
  final LatLng? position;
  final String? name;
  final String?description;

  SearchResult({required this.cancel, this.manual = false,
  this.description,
  this.name,
  this.position
  });

  @override
  String toString() {

    return '{cancel: $cancel, manual: $manual}';
  }

}