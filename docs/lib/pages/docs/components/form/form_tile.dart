import 'package:shade_ui/shade_ui.dart';
import 'package:docs/pages/docs/components_page.dart';
import '../form/form_example_1.dart';

class FormTile extends StatelessWidget implements IComponentPage {
  const FormTile({super.key});

  @override
  String get title => 'Form';

  @override
  Widget build(BuildContext context) {
    return const ComponentCard(
      name: 'form',
      title: 'Form',
      example: Card(child: FormExample1()),
    );
  }
}
