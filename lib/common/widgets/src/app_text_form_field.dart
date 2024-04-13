import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_base/gen/colors.gen.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormFieldLoadingIndicator extends StatelessWidget {
  const AppFormFieldLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: const CircularProgressIndicator(),
    );
  }
}

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.obscureText = false,
    this.isRounded = false,
    this.maxLength,
    this.inputFormatters,
    this.leading,
    this.trailing,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  }) : super(key: key);

  AppTextFormField.email({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength = 50,
    this.inputFormatters,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = false,
        isRounded = false,
        // TODO Andy: Add Image Path here
        leading = Container(),
        // leading = Image.asset(
        //   Assets.emailIcon.path,
        //   width: ImageSizes.size20,
        //   height: ImageSizes.size20,
        // ),
        keyboardType = TextInputType.emailAddress,
        super(key: key);

  AppTextFormField.name({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength = 255,
    this.inputFormatters,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = false,
        isRounded = false,
        // TODO Andy: Add Image Path here
        leading = Container(),
        // leading = Image.asset(
        //   Assets.accountDrawerIcon.path,
        //   width: ImageSizes.size20,
        //   height: ImageSizes.size20,
        // ),
        keyboardType = TextInputType.name,
        super(key: key);

  AppTextFormField.phone({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength = 50,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = false,
        isRounded = false,
        inputFormatters = [FilteringTextInputFormatter.digitsOnly],
        // TODO Andy: Add Image Path here
        leading = Container(),
        // leading = Image.asset(
        //   Assets.phone.path,
        //   width: ImageSizes.size20,
        //   height: ImageSizes.size20,
        // ),
        keyboardType = TextInputType.phone,
        super(key: key);

  AppTextFormField.password({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.obscureText = true,
    this.maxLength = 50,
    this.inputFormatters,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : isRounded = false,
        // TODO Andy: Add Image Path here
        leading = Container(),
        // leading = Image.asset(
        //   Assets.lock.path,
        //   width: ImageSizes.size20,
        //   height: ImageSizes.size20,
        // ),
        keyboardType = null,
        super(key: key);

  AppTextFormField.idCard({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength = 50,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = false,
        isRounded = false,
        inputFormatters = [FilteringTextInputFormatter.digitsOnly],
        // TODO Andy: Add Image Path here
        leading = Container(),
        // leading = Image.asset(
        //   Assets.idCard.path,
        //   width: ImageSizes.size20,
        //   height: ImageSizes.size20,
        // ),
        keyboardType = TextInputType.number,
        super(key: key);

  AppTextFormField.referral({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength,
    this.inputFormatters,
    this.trailing,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = false,
        isRounded = false,
        // TODO Andy: Add Image Path here
        leading = Container(),
        // leading = Image.asset(
        //   Assets.referral.path,
        //   width: ImageSizes.size20,
        //   height: ImageSizes.size20,
        // ),
        super(key: key);

  AppTextFormField.location({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength = 60,
    this.inputFormatters,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = false,
        isRounded = false,
        // TODO Andy: Add Image Path here
        leading = Container(),
        // leading = Image.asset(
        //   Assets.location.path,
        //   width: ImageSizes.size20,
        //   height: ImageSizes.size20,
        // ),
        keyboardType = TextInputType.streetAddress,
        super(key: key);

  const AppTextFormField.rounded({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLength,
    this.inputFormatters,
    this.trailing,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : isRounded = true,
        leading = null,
        super(key: key);

  const AppTextFormField.roundedPassword({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength,
    this.inputFormatters,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = true,
        isRounded = true,
        leading = null,
        keyboardType = null,
        super(key: key);

  AppTextFormField.roundedPin({
    Key? key,
    this.formFieldKey,
    required this.name,
    this.initialValue,
    this.label,
    this.hintText,
    this.isRequired = false,
    this.readOnly = false,
    this.maxLength,
    this.trailing,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.autoValidateMode,
  })  : obscureText = true,
        isRounded = true,
        leading = null,
        inputFormatters = [FilteringTextInputFormatter.digitsOnly],
        keyboardType = TextInputType.number,
        super(key: key);

  final GlobalKey<FormBuilderFieldState>? formFieldKey;
  final String name;
  final String? initialValue;
  final String? label;
  final String? hintText;
  final AutovalidateMode? autoValidateMode;
  final bool isRequired;
  final bool readOnly;
  final bool obscureText;
  final FocusNode? focusNode;

  /// Returns a rounded version of this widget with rounded borders
  /// and smaller text. It is not recommended to set leading and
  /// trailing widgets when this property is set to true.
  final bool isRounded;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? leading;
  final Widget? trailing;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String)? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;

  static const errorStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ColorName.errorRedFf3333,
  );

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late GlobalKey<FormBuilderFieldState> _fieldKey;
  late String? _initialValue;
  late TextStyle _textFieldTextStyle;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _fieldKey = widget.formFieldKey ?? GlobalKey<FormBuilderFieldState>();
    _initialValue = widget.initialValue;
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });
    _textFieldTextStyle = TextStyle(
      fontSize: widget.isRounded ? 12 : 16,
      fontWeight: FontWeight.w400,
      color: ColorName.darkGray495057,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initialValue != widget.initialValue) {
      _initialValue = widget.initialValue;
      _controller.value = TextEditingValue(text: _initialValue ?? '');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '${widget.label!}${widget.isRequired ? '*' : ''}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorName.darkGray495057,
              ),
            ),
          ),
        Focus(
          canRequestFocus: false,
          onFocusChange: _onFocusChange,
          child: FormBuilderTextField(
            focusNode: widget.focusNode,
            key: _fieldKey,
            name: widget.name,
            controller: _controller,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            inputFormatters: widget.inputFormatters,
            style: _textFieldTextStyle,
            onSubmitted: widget.onFieldSubmitted,
            onChanged: _onChanged,
            validator: widget.validator,
            autovalidateMode: widget.autoValidateMode,
            decoration: InputDecoration(
              // AGMO loongyeat: This cannot be 0. If null,
              // it is not multiline either. To get multiline
              // errors, give it an insane max number of lines.
              errorMaxLines: 100,
              contentPadding: widget.isRounded
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                  : null,
              isDense: widget.isRounded,
              prefixIcon: widget.leading,
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 30,
                maxHeight: 24,
              ),
              suffixIcon: widget.trailing != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: widget.trailing,
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: _textFieldTextStyle,
              counterText: '',
              border: widget.isRounded
                  ? const OutlineInputBorder()
                  : const UnderlineInputBorder(),
              enabledBorder: widget.isRounded
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.darkGray495057.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    )
                  : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.darkGray495057.withOpacity(0.2),
                      ),
                    ),
              disabledBorder: widget.isRounded
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.darkGray495057.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    )
                  : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.darkGray495057.withOpacity(0.1),
                      ),
                    ),
              focusedBorder: widget.isRounded
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorName.black),
                      borderRadius: BorderRadius.circular(6),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorName.black),
                    ),
              errorBorder: widget.isRounded
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.errorRedFf3333.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    )
                  : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.errorRedFf3333.withOpacity(0.2),
                      ),
                    ),
              errorStyle: AppTextFormField.errorStyle,
            ),
          ),
        ),
      ],
    );
  }

  void _onFocusChange(bool isFocused) {
    if (!isFocused) {
      widget.onEditingComplete?.call(_controller.text);
    }
  }

  void _onChanged(String? value) {
    _fieldKey.currentState?.validate();
    widget.onChanged?.call(value);
  }
}
