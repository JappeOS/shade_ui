import 'package:shade_ui/shade_ui.dart';

class ButtonExample2 extends StatelessWidget {
  const ButtonExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: () {},
      child: const Text('Secondary'),
    );
  }
}
