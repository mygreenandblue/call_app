import 'package:call_app/views/user_screen/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    final title = 'ContactList';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(title),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  title: Text(
                    'John Judah',
                  ),
                  subtitle: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2348031980943'),
                      Text('2348031980943'),
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetail(),
                        ));
                  },
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_purple.png'),
                  ),
                  title: Text('Bisola Akanbi'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Text('Another data');
                  },
                  onLongPress: () {
                    Text('Data');
                  },
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Eghosa Iku'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  title: Text(
                    'Andrew Ndebuisi',
                  ),
                  subtitle: Text('2348034280943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_green.png'),
                  ),
                  title: Text('Arinze Dayo'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_red.png'),
                  ),
                  title: Text('Wakara Zimbu'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_yellow.png'),
                  ),
                  title: Text('Emaechi Chinedu'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  title: Text('Osaretin Igbinomwanhia'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Osagumwenro Nosa'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Osagumwenro Nosa'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Osagumwenro Nosa'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Osagumwenro Nosa'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Osagumwenro Nosa'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Osagumwenro Nosa'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                new Divider(
                  height: 1.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('images/avatar_brown.png'),
                  ),
                  title: Text('Osagumwenro Nosa'),
                  subtitle: Text('2348031980943'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
