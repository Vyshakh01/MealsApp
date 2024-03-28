import 'package:flutter/material.dart';
//import 'package:meals/widgets/mainDrawer.dart';
//import 'package:meals/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters "),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[filter.isGlutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(filter.isGlutenFree, isChecked);
            },
            title: Text(
              "Gluten free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include gluten free meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16),
            ),
          ),
          SwitchListTile(
            value: activeFilters[filter.isLactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(filter.isLactoseFree, isChecked);
            },
            title: Text(
              "Lactose free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Lactose free meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16),
            ),
          ),
          SwitchListTile(
            value: activeFilters[filter.isVegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(filter.isVegetarian, isChecked);
            },
            title: Text(
              "Vegetarian ",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include vegetarian meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16),
            ),
          ),
          SwitchListTile(
            value: activeFilters[filter.isVegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(filter.isVegan, isChecked);
            },
            title: Text(
              "Vegan ",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Vegan meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
