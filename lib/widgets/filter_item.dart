import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem(
      {super.key,
      required this.value,
      required this.title,
      required this.subtitle,
      required this.onChanged});

  final bool value;
  final String title;
  final String subtitle;
  final Function(bool) onChanged;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.value,
      onChanged: (isChecked) {
        setState(() {
          value = isChecked;
        });
        widget.onChanged(isChecked);
      },
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
