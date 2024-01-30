import 'package:first_flutter/mocks/mock_location.dart';
import 'package:flutter/material.dart';
import './models/location.dart';
import './style.dart';

class LocationDetail extends StatelessWidget
{
  final int locationId;
  LocationDetail(this.locationId);
  @override
  Widget build(BuildContext context)
  {
    var location = MockLocation.fetch(locationId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.text,
          style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, location),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context , Location location)
  {
    List<Widget> result = [];
    result.add(_bannerImage(location.url, 180.0));
    result.addAll(_section(context , location));
    return result;
  }

  List<Widget> _section(BuildContext context , Location location)
  {
    List<Widget> result = [];

    for(int i = 0; i < location.facts.length; i++)
    {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }

  Widget _sectionTitle(String S){
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(
        S,
        textAlign: TextAlign.left,
        style: Style.largeSize,
      ),
    );
  }
  
  Widget _sectionText(String S) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
      child: Text(
        S,
        style: Style.smallSize,
      )
    );
  }
  
  Widget _bannerImage(String url , double height)
  {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url , fit : BoxFit.fitWidth),
    );
  }


}


/*
Widget Section(String title , Color color)
  {
    return Container(
      decoration: BoxDecoration(
        color : color,
      ),
      child: Text(title),
    );
  }
 */