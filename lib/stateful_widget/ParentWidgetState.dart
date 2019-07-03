import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  State createState() {
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        onChanged: _handleTapBoxChanged,
        active: _active,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active2' : 'InActive2',
            style: TextStyle(fontSize: 32.0, color: Colors.white70),
          ),
        ),
        width: 220.0,
        height: 220.0,
        decoration: new BoxDecoration(
          color: (active ? Colors.lightGreen[800] : Colors.grey[700]),
        ),
      ),
    );
  }
}
