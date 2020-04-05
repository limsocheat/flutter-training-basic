import 'package:angkordev/screens/about_screen.dart';
import 'package:angkordev/screens/contact_screen.dart';
import 'package:angkordev/screens/favorite_screen.dart';
import 'package:angkordev/widgets/angkordev_list_tile_widget.dart';
import 'package:flutter/material.dart';

class GlobalDrawerWidget extends StatelessWidget {
  const GlobalDrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scstylecaster.files.wordpress.com/2019/08/blackpink.jpg'),
              ),
              accountName: Text('Lim Socheat'),
              accountEmail: Text('limsocheat111@gmail.com'),
              otherAccountsPictures: <Widget>[
                IconButton(
                  icon: Icon(Icons.access_alarm),
                  onPressed: () {
                    //
                  },
                ),
                IconButton(
                  icon: Icon(Icons.category),
                  onPressed: () {
                    //
                  },
                )
              ],
            ),
//                child: Container(
//                  color: Colors.green,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        SizedBox(
//                          height: 80,
//                          width: 80,
//                          child: CircleAvatar(
//                            backgroundColor: Colors.green,
//                            backgroundImage: NetworkImage(
//                                'https://scstylecaster.files.wordpress.com/2019/08/blackpink.jpg'),
//                          ),
//                        ),
//                        Text('Angkor Dev'),
//                        Text('infO@angkordev.com'),
//                      ],
//                    ),
//                  ),
//                ),
          ),
          AngkorDevListTile(
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              );
            },
            leadingIcon: Icons.info,
            title: 'About Us',
            subTitle: 'check out more',
            trailingIcon: Icons.arrow_right,
          ),
          AngkorDevListTile(
            leadingIcon: Icons.phone,
            title: 'Contact Us',
            subTitle: 'get in touch',
            trailingIcon: Icons.arrow_right,
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactScreen(),
                ),
              );
            },
          ),
          AngkorDevListTile(
            leadingIcon: Icons.favorite_border,
            title: 'Favourite',
            subTitle: 'All Favorite News',
            trailingIcon: Icons.arrow_right,
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}