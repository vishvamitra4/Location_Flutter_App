
import 'package:flutter/material.dart';
import 'Location_List.dart';

class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return MaterialApp(home : LocationList());
  }
}


/*

class App extends StatelessWidget
{
  final List<Location> allItems = MockLocation.fetchAll();
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: LocationList(allItems),
    );
  }
}


import 'package:flutter/material.dart';
import 'location_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationList());
  }
}
 */

/*
import 'package:flutter/material.dart';
import 'Location_Detail.dart';
import './models/location.dart';
import './mocks/mock_location.dart';

class App extends StatelessWidget
{
  final Location mockLocation = MockLocation.fetchAny();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home : LocationDetail(mockLocation),
    );
  }
}
*/

