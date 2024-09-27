import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/widgets/filter_item.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            value: activeFilters[Filter.glutenFree]!,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
          ),
          FilterItem(
            value: activeFilters[Filter.vegan]!,
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
          ),
          FilterItem(
            value: activeFilters[Filter.vegetarian]!,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FilterItem(
            value: activeFilters[Filter.lactoseFree]!,
            title: 'Lactos-free',
            subtitle: 'Only include lactos-free meals.',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
