import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    Key? key,
    this.readOnly = false,
    this.autofocus = false,
    this.initialSearchTerm,
    this.onPressed,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  final bool readOnly;
  final bool autofocus;
  final String? initialSearchTerm;
  final VoidCallback? onPressed;
  final void Function(String)? onChanged;
  final void Function(String)? onEditingComplete;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialSearchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s30,
      child: TextFormField(
        controller: _controller,
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        style: const TextStyle(
          fontSize: 12,
        ),
        onChanged: widget.onChanged,
        onEditingComplete: _onEditingComplete,
        onTap: widget.onPressed,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.white,
          filled: true,
          hintText: context.l10n.search,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
        ),
      ),
    );
  }

  void _onEditingComplete() {
    GeneralHelper.dismissKeyboard();
    widget.onEditingComplete?.call(_controller.text);
  }
}
