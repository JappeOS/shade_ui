import 'package:shade_ui/shade_ui.dart';

class BadgeExample2 extends StatelessWidget {
  const BadgeExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SecondaryBadge(
      child: Text('Secondary'),
    );
  }
}
