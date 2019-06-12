import 'package:flutter_presentations/shared/material_import.dart';

class CI extends StatelessWidget {
  const CI({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('CI'),
          Expanded(
            child: Image.asset('assets/pipeline.png'),
          )
        ],
      ),
    );
  }
}
