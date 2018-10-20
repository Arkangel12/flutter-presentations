import 'package:flutter/material.dart';

class DesignersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image35.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Text('Designers')),
    );
  }
}

class UmphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image39.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Umph',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class LessTestingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image31.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(alignment: Alignment.topCenter, child: Text('Less Testing')),
    );
  }
}

class DevelopersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image41.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Developers',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Center(
              child: Text(
            'Prepare a Workshop',
            textAlign: TextAlign.center,
          )),
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/image44.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ManagersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image40.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Text('Managers', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class MergingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image18.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: const [
          Expanded(
            flex: 6,
            child: SizedBox(),
          ),
          Expanded(
            flex: 4,
            child: Text('Merging Teams', style: TextStyle(color: Colors.white),
             textAlign: TextAlign.right,),
          ),
        ],
      ),
    );
  }
}