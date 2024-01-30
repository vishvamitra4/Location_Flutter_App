import '../models/location.dart';
import '../models/location_fact.dart';

class MockLocation extends Location
{
  static final List<Location>items = [
    Location(
        text: "Hey Person - 1",
        url : "https://images.unsplash.com/photo-1613323593608-abc90fec84ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
        facts: <LocationFact>[
          LocationFact(
            title: "Scaffold",
            text: "It seems like you are using the Scaffold widget in Flutter to create a basic app with an AppBar and a body containing some text. If your AppBar is not displaying a background, it could be due to a few ",
          ),
          LocationFact(
            title: "Default Theme Issue",
            text: "Check if your app's theme has a default background color. If the theme doesn't specify a background color, the AppBar might not have a background. You can set a theme for your app in the MaterialApp widget.",
          ),      ]
    ),
    Location(
        text: "Hey Person - 2",
        url : "https://plus.unsplash.com/premium_photo-1676637000058-96549206fe71?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        facts: <LocationFact>[
          LocationFact(
            title: "Scaffold",
            text: "It seems like you are using the Scaffold widget in Flutter to create a basic app with an AppBar and a body containing some text. If your AppBar is not displaying a background, it could be due to a few ",
          ),
          LocationFact(
            title: "Default Theme Issue",
            text: "Check if your app's theme has a default background color. If the theme doesn't specify a background color, the AppBar might not have a background. You can set a theme for your app in the MaterialApp widget.",
          ),      ]
    ),
    Location(
        text: "Hey Person - 3",
        url : "https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        facts: <LocationFact>[
          LocationFact(
            title: "Scaffold",
            text: "It seems like you are using the Scaffold widget in Flutter to create a basic app with an AppBar and a body containing some text. If your AppBar is not displaying a background, it could be due to a few ",
          ),
          LocationFact(
            title: "Default Theme Issue",
            text: "Check if your app's theme has a default background color. If the theme doesn't specify a background color, the AppBar might not have a background. You can set a theme for your app in the MaterialApp widget.",
          ),      ]
    ),
    Location(
        text: "Hey Person - 4",
        url : "https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1894&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        facts: <LocationFact>[
          LocationFact(
            title: "Scaffold",
            text: "It seems like you are using the Scaffold widget in Flutter to create a basic app with an AppBar and a body containing some text. If your AppBar is not displaying a background, it could be due to a few ",
          ),
          LocationFact(
            title: "Default Theme Issue",
            text: "Check if your app's theme has a default background color. If the theme doesn't specify a background color, the AppBar might not have a background. You can set a theme for your app in the MaterialApp widget.",
          ),      ]
    ),
  ];
  static Location fetchAny()
  {
    return MockLocation.items[0];
  }

  static List<Location> fetchAll()
  {
    return MockLocation.items;
  }

  static Location fetch(int index){
    return MockLocation.items[index];
  }
}