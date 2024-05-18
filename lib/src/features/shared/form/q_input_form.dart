import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/src/core/constants/q_colors.dart';
import 'package:todolist/src/core/constants/q_constants.dart';

class QInputForm extends StatefulWidget {
  const QInputForm({
    this.labelText,
    this.note = const SizedBox(),
    this.controller,
    this.initialValue,
    this.value,
    this.onSaved,
    this.errorText,
    super.key,
    this.onChanged,
    this.autofillHints,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.decoration,
    this.textAlign = TextAlign.left,
    this.style,
    this.focusNode,
    this.maxLength,
    this.autofocus = false,
    this.isDense = false,
    this.inputFormatters,
    this.prefixIcon,
    this.validator,
    this.hintText,
    this.contentPadding,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.onTap,
    this.textInputAction,
    this.prefixIconWidget,
    this.onEditingComplete,
    this.helperText,
  });
  final String? Function(String?)? onSaved;
  final String? labelText;
  final TextEditingController? controller;
  final String? value;
  final String? errorText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final String? initialValue;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;
  final int? maxLength;
  final bool autofocus;
  final IconData? prefixIcon;
  final Widget? prefixIconWidget;
  final Widget? suffixIcon;
  final Widget note;
  final FocusNode? focusNode;
  // style
  final TextAlign textAlign;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;

  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final String? helperText;

  final TextInputAction? textInputAction;

  @override
  State<QInputForm> createState() => _XInputCustomState();
}

class _XInputCustomState extends State<QInputForm> {
  String get value => widget.value ?? '';

  bool obscureText = false;
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  void didUpdateWidget(QInputForm oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Widget? buildActions() {
      final List<Widget> actions = [];
      if (widget.obscureText) {
        actions.add(
          IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              // size: Theme.of(context).iconTheme.size,
              // color: Theme.of(context).colorScheme.background,
            ),
          ),
        );
      }

      if (widget.suffixIcon != null) {
        actions.add(widget.suffixIcon!);
      }

      if (actions.isEmpty) {
        return null;
      }
      if (actions.length == 1) {
        return actions[0];
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      );
    }

    if (widget.helperText == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.labelText ?? '',
                style: const TextStyle(
                    fontSize: 14.0,
                    color: QColors.grey_100,
                    fontWeight: FontWeight.bold),
              ),
              widget.note
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          SizedBox(height: 50, child: _field(buildActions)),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _field(buildActions),
          const SizedBox(height: QConstants.kPaddingXS),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: QConstants.kPaddingL,
          //   ),
          //   child: Text(
          //     widget.helperText!,
          //     style: Theme.of(context).textTheme.bodySmall,
          //   ),
          // ),
        ],
      );
    }
  }

  TextFormField _field(Widget? Function() buildActions) {
    return TextFormField(
      enableSuggestions: false,
      autocorrect: false,
      onSaved: widget.onSaved,
      autofillHints: widget.autofillHints,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      obscuringCharacter: '*',
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      style: widget.style,
      textAlign: widget.textAlign,
      obscureText: obscureText,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      scrollPhysics: const BouncingScrollPhysics(),
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelStyle: widget.readOnly
              ? const TextStyle(
                  color: QColors.grey_80, fontWeight: FontWeight.bold)
              : null,
          focusedBorder: widget.readOnly ? InputBorder.none : null,
          fillColor: QColors.white,
          contentPadding: widget.contentPadding ??
              EdgeInsets.only(
                left: QConstants.kPaddingL,
                right: widget.suffixIcon == null ? QConstants.kPaddingL : 0,
              ),
          isDense: widget.isDense,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  size: QConstants.kPaddingL,
                )
              : widget.prefixIconWidget,
          hintText: widget.hintText,
          // labelText: widget.labelText,
          errorText: widget.errorText,
          filled: true,
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: buildActions(),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: QColors.white, width: 1),
            // ),
          )),
    );
  }
}
