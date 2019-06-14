import 'package:flutter_presentations/shared/material_import.dart';

class DeclarativeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.black),
      child: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Image.asset(
                  'assets/jetpack.png',
                  height: 300,
                ),
                Text('Compose'),
              ],
            ),
            TableRow(
              children: [
                Transform.translate(
                  offset: Offset(-22, 0),
                  child: Image.asset(
                    'assets/swiftui.png',
                    height: 300,
                  ),
                ),
                Text('SwiftUI'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
