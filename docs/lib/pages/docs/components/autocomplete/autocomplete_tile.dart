import 'package:docs/pages/docs/components_page.dart';
import 'package:shade_ui/shade_ui.dart';

class AutocompleteTile extends StatelessWidget implements IComponentPage {
  const AutocompleteTile({super.key});

  @override
  String get title => 'Autocomplete';

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      name: 'autocomplete',
      title: 'Autocomplete',
      scale: 1.2,
      example: Card(
        child: Column(
          children: [
            TextField(
              placeholder: const Text('Search fruits...'),
              trailing: const Icon(LucideIcons.search),
            ),
            const Gap(8),
            OutlinedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                    style: const ButtonStyle.ghost(),
                    onPressed: () {},
                    child: const Text('Apple'),
                  ),
                  Button(
                    style: const ButtonStyle.ghost(),
                    onPressed: () {},
                    child: const Text('Banana'),
                  ),
                  Button(
                    style: const ButtonStyle.ghost(),
                    onPressed: () {},
                    child: const Text('Cherry'),
                  ),
                ],
              ),
            ),
          ],
        ).withPadding(all: 16),
      ),
    );
  }
}
