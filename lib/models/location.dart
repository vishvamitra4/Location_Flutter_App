
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import './location_fact.dart';
import '../enpoint.dart';
import 'dart:convert';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final List<LocationFact>? facts;

  Location(
      {required this.id,
        required this.name,
        required this.url,
        required this.facts});

  Location.blank()
      : id = 0,
        name = '',
        url = '',
        facts = [];

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];
    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}

/*
import './location_fact.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import '../enpoint.dart';
import 'dart:convert';
import 'dart:async';


part 'location.g.dart';
@JsonSerializable()
class Location
{
  final int id;
  final String name;
  final String url;
  final List<LocationFact> facts;
  Location({required this.id, required this.name , required this.url , required this.facts});
  Location.blank()
  : id = 0,
    name = '',
    url = '',
    facts = [];

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);


  static Future<List<Location>> fetchAll() async{
    var uri = Endpoint.uri('/locations', queryParameters: {});
    final res = await http.get(uri);


    if(res.statusCode != 200){
      throw (res.body);
    }

    List<Location> list = <Location>[];
    for(var keys in json.decode(res.body)) {
      list.add(Location.fromJson(keys));
    }

    return list;
  }

  static Future<Location> fetchById(int id) async{
    var uri = Endpoint.uri('/locations/$id', queryParameters: {} , );
    final res = await http.get(uri);
    if(res.statusCode != 200){
      throw (res.body);
    }

    final Map<String , dynamic> itemMap = json.decode(res.body);
    return Location.fromJson(itemMap);
  }





}
*/

/*
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import './location_fact.dart';
import '../endpoint.dart';
import 'dart:convert';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final List<LocationFact>? facts;
  Location(
      {required this.id,
      required this.name,
      required this.url,
      required this.facts});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];
    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}
 */