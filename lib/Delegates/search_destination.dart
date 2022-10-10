

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tlleva/Blocs/Location/location_bloc.dart';
import 'package:tlleva/Blocs/Search/search_bloc.dart';
import 'package:tlleva/Model/search_result.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResult>{

    SearchDestinationDelegate():super(
      searchFieldLabel: 'Buscar...'
    );

  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: (){
       query = '';
     }, icon: Icon(Icons.clear) )
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      final result = SearchResult(cancel: true);
      close(context, result);
    }, icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final proximity = BlocProvider.of<LocationBloc>(context).state.lastKnowLocation!;
    searchBloc.getPlacesByQuery(proximity, query);
       return BlocBuilder<SearchBloc, SearchState>(
         builder:(context, state) {
           final places = state.places;
           return ListView.separated(
             itemCount: places.length,
             separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final place = places[index];
              return ListTile(
                title: Text(place.text),
                subtitle: Text(place.placeName),
                leading: const Icon(Icons.place_outlined, color: Colors.black,),
                onTap: (){ 
                  final result = SearchResult(cancel: false, manual: false,
                  position: LatLng(place.center[1], place.center[0]),
                  name: place.text,
                  description: place.placeName
                  );
                  close(context, result);
                  },
              );
            },
           );
         },);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.length != 0){
      if((query.length % 2) == 0){
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final proximity = BlocProvider.of<LocationBloc>(context).state.lastKnowLocation!;
    searchBloc.getPlacesByQuery(proximity, query);
      }
      return BlocBuilder<SearchBloc, SearchState>(
         builder:(context, state) {
           final places = state.places;
           return ListView.separated(
             itemCount: places.length,
             separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final place = places[index];
              return ListTile(
                title: Text(place.text),
                subtitle: Text(place.placeName),
                leading: const Icon(Icons.place_outlined, color: Colors.black,),
                onTap: (){ 
                  final result = SearchResult(cancel: false, manual: false,
                  position: LatLng(place.center[1], place.center[0]),
                  name: place.text,
                  description: place.placeName
                  );
                  close(context, result);
                  },
              );
            },
           );
         },);
    }else{

       return ListView(
         children: [
           ListTile(
             leading: const Icon(Icons.location_on_outlined, color: Colors.black,),
             title: const Text('Colocar la ubicacion', style: TextStyle(
               fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Poppins',
             ),),
             onTap: () {
               final result = SearchResult(cancel: false, manual: true);
      close(context, result);
             },
           )
         ],
       );
    }

  }


}