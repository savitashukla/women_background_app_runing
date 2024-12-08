import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/images_url.dart';

class CommonDropdown extends StatefulWidget {
  const CommonDropdown({super.key});

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  String? initialItem;
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Flexible(
        flex: 1,
        child: DropdownMenu<String>(
          initialSelection: initialItem,
          trailingIcon: SvgPicture.asset(ImagesUrl.dropdownIcon),
          selectedTrailingIcon: const Icon(Icons.expand_less),
          inputDecorationTheme:
              const InputDecorationTheme(border: InputBorder.none),
          onSelected: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              initialItem = " _ ${value!}";
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ),
    );
  }
}
