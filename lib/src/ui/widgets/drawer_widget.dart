import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> _drawerItems = [
      UserAccountsDrawerHeader(
        accountName: Text("kadhum "),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text(''),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 5),
        color: Colors.orange,
        child: ListTile(
          leading: Icon(Icons.language),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Switch language'),
              SizedBox(
                width: 10,
              ),
              Container(
                // width: 2.0,
                margin: EdgeInsets.only(top: 5),
                color: Colors.orange,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: SwitchWidget(),
                            // height: 10.0,
                            // width: 50.0,
                          ),
                          // Text(
                          //   'Value : $status',
                          //   style:
                          //       TextStyle(color: Colors.black, fontSize: 20.0),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 5),
        color: Colors.orange,
        child: ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 5),
        color: Colors.orange,
        child: ListTile(
          leading: Icon(Icons.contacts),
          title: Text("Contact Us"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    ];
    return Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.red,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: _drawerItems,
        ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  SwitchWidget({
    Key key,
  }) : super(key: key);

  bool status = false;

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (value) {
        setState(() {
          widget.status = value;
          print(widget.status.toString());
        });
      },
      value: widget.status,
      activeColor: Colors.green,
      inactiveTrackColor: Colors.red,
    );
  }
}
