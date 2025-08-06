import 'package:shade_ui/shade_ui.dart';

class ToggleExample1 extends StatefulWidget {
  const ToggleExample1({super.key});

  @override
  _ToggleExample1State createState() => _ToggleExample1State();
}

class _ToggleExample1State extends State<ToggleExample1> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Toggle(
      value: value,
      onChanged: (v) {
        setState(() {
          value = v;
        });
      },
      child: const Text('Toggle'),
    );
  }
}
