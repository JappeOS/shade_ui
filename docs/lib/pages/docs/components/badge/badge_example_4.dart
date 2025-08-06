import 'package:shade_ui/shade_ui.dart';

class BadgeExample4 extends StatelessWidget {
  const BadgeExample4({super.key});

  @override
  Widget build(BuildContext context) {
    return const DestructiveBadge(
      child: Text('Destructive'),
    );
  }
}
