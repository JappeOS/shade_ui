import 'package:shade_ui/shade_ui.dart';
import 'package:docs/pages/docs/components_page.dart';

class PhoneInputTile extends StatelessWidget implements IComponentPage {
  const PhoneInputTile({super.key});

  @override
  String get title => 'Phone Input';

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      name: 'phone_input',
      title: 'Phone Input',
      scale: 1.5,
      example: Card(
        child: const PhoneInput(
          initialValue: PhoneNumber(Country.indonesia, '81234567890'),
        ).withAlign(Alignment.topLeft),
      ).sized(height: 300),
    );
  }
}
