import 'package:shade_ui/shade_ui.dart';

class BadgeExample1 extends StatelessWidget {
  const BadgeExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBadge(
      child: Text('Primary'),
    );
  }
}
