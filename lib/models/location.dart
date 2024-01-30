import './location_fact.dart';
class Location
{
  final String text;
  final String url;
  final List<LocationFact> facts;
  Location({required this.text , required this.url , required this.facts});
}