import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? baseCode;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  const CustomTextField({super.key, required this.textEditingController, required this.onChanged, required this.baseCode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        suffix: Text(baseCode ?? ''),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
