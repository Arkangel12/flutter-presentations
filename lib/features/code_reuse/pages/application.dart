import 'package:flutter_presentations/shared/material_import.dart';

class GrouponApp extends StatefulWidget {
  @override
  _GrouponAppState createState() => _GrouponAppState();
}

class _GrouponAppState extends State<GrouponApp> {
  bool _showSplash = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FlutterLogo(
            size: 250,
            style: FlutterLogoStyle.stacked,
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: 480,
              margin: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: _showSplash
                  ? GestureDetector(
                      onTap: () => setState(() => _showSplash = false),
                      child: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: Image(
                            image: AssetImage('assets/image7.png'),
                            height: 100.0,
                          ),
                        ),
                      ),
                    )
                  : Placeholder(),
            ),
          ),
        ),
      ],
    );
  }
}
