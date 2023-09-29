import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("McFlutter"),
          elevation: 0, // Remove the default shadow under the app bar
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0), // Add padding around the container
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0), // Add padding around all elements
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              8.0), // Add padding around the icon
                          child: Icon(Icons.account_circle, size: 50),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  8.0), // Add padding around the text
                              child: Text(
                                'Flutter McFlutter',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  8.0), // Add padding around the text
                              child: Text('Experienced App Developer'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              8.0), // Add padding around the text
                          child: Text(
                            '123 Main Street',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              8.0), // Add padding around the text
                          child: Text(
                            '(415) 555-0198',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconWithSnackbar(
                          icon: Icons.accessibility,
                          label: 'Accessibility',
                        ),
                        IconWithSnackbar(
                          icon: Icons.timer,
                          label: 'Timer',
                        ),
                        IconWithSnackbar(
                          icon: Icons.phone_android,
                          label: 'Phone Android',
                        ),
                        IconWithSnackbar(
                          icon: Icons.phone_iphone,
                          label: 'Phone iPhone',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconWithSnackbar extends StatefulWidget {
  final IconData icon;
  final String label;

  const IconWithSnackbar({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  _IconWithSnackbarState createState() => _IconWithSnackbarState();
}

class _IconWithSnackbarState extends State<IconWithSnackbar> {
  Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // Toggle the icon color between black and indigo
          iconColor = iconColor == Colors.black ? Colors.indigo : Colors.black;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.label), // Use widget.label here
          ),
        );
      },
      child: Icon(
        widget.icon,
        size: 30,
        color: iconColor, // Use the maintained iconColor
      ),
    );
  }
}
