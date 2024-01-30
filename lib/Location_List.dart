import 'package:first_flutter/Location_Detail.dart';
import 'package:flutter/material.dart';
import './models/location.dart';
import './style.dart';


class LocationList extends StatelessWidget
{
  final List<Location> location;
  LocationList(this.location);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location List" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context , int locationId){
    Location location = this.location[locationId];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: ()=> _navigateToScreen(context, locationId),
    );
  }

  void _navigateToScreen(BuildContext context , int locationId)
  {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => LocationDetail(locationId)),
    );
  }

  Widget _itemThumbnail(Location location){
    return Container(
      constraints: const BoxConstraints.tightFor(width: 150.0),
      child: Image.network(location.url , fit : BoxFit.fitWidth,),
    );
  }

  Widget _itemTitle(Location location){
    return Text(
      location.text,
      style: Style.smallSize,
    );
  }
}