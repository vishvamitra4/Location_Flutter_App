import 'package:first_flutter/Location_Detail.dart';
import 'package:flutter/material.dart';
import './models/location.dart';
import './style.dart';

class LocationList extends StatefulWidget
{
  @override
  createState() => _LocationListState();
}


class _LocationListState extends State<LocationList>
{
  List<Location> location = [];
  bool loading = false;
  @override
  void initState(){
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locations" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: RefreshIndicator(
        onRefresh: loadData,
        child: Column(
          children : [
            renderProgressBar(context),
            Expanded(child : _renderListView(context))
          ],),
      )
    );
  }

  Future<void> loadData() async
  {
    if(mounted)
    {
      setState(() {
        loading = true;
      });
      final locations = await Location.fetchAll();
      if(mounted){
        setState(() {
          location = locations;
          loading = false;
        });
      }
    }

  }
  Widget renderProgressBar(BuildContext context)
  {
      return loading ? (const LinearProgressIndicator(
      value: null,
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
    )) : Container();
  }

  Widget _renderListView(BuildContext context){
    return ListView.builder(
      itemCount: location.length,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context , int locationId){
    Location location = this.location[locationId];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: ()=> _navigateToScreen(context, location.id),
    );
  }

  void _navigateToScreen(BuildContext context , int locationId)
  {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => LocationDetail(locationId)),
    );
  }

  Widget _itemThumbnail(Location location){
    if(location.url.isEmpty){
      return Container();
    }

    try {
      return Container(
        constraints: const BoxConstraints.tightFor(width: 100.0),
        child: Image.network(location.url , fit : BoxFit.fitWidth,),
      );
    } catch(err){
      print("Couldn't able to load : ${location.url}");
      return Container();
    }

  }

  Widget _itemTitle(Location location){
    return Text(
      location.name,
      style: Style.smallSize,
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'models/location.dart';
import 'location_detail.dart';
import 'styles.dart';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Locations", style: Styles.navBarTitle)),
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  loadData() async {
    final locations = await Location.fetchAll();
    if (this.mounted) {
      setState(() {
        this.locations = locations;
      });
    }
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final location = this.locations[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemThumbnail(this.locations[index]),
      title: _itemTitle(this.locations[index]),
      onTap: () => _navigateToLocationDetail(context, location.id),
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationID) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(locationID)));
  }

  Widget _itemThumbnail(Location location) {
    if (location.url.isEmpty) {
      return Container();
    }

    try {
      return Container(
        constraints: BoxConstraints.tightFor(height: 100.0),
        child: Image.network(location.url, fit: BoxFit.fitWidth),
      );
    } catch (e) {
      print("could not load image ${location.url}");
      return Container();
    }
  }

  Widget _itemTitle(Location location) {
    return Text('${location.name}', style: Styles.textDefault);
  }
}
 */