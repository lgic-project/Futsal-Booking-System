import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leo_futsal/utils/colors.dart';
import 'package:leo_futsal/utils/custom_text_styles.dart';
import 'package:leo_futsal/utils/image_path.dart';
import 'package:leo_futsal/utils/validators.dart';

class CustomPasswordField extends StatelessWidget {
  final String hint;
  final FocusNode? focusNode;
  final bool eye;
  final VoidCallback onEyeClick;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final String? labelText;

  const CustomPasswordField({
    Key? key,
    required this.hint,
    required this.eye,
    required this.onEyeClick,
    required this.controller,
    required this.textInputAction,
    this.validator,
    this.onSubmitted,
    this.focusNode,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        focusNode: focusNode,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        validator: validator ?? Validators.checkPasswordField,
        obscureText: eye,
        maxLines: 1,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          label: labelText != null
              ? Text(
                  labelText ?? "",
                  style: CustomTextStyles.f16W400(
                    color: AppColors.primaryColor,
                  ),
                )
              : null,
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: AppColors.secondaryTextColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.errorColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.errorColor),
          ),
          suffixIcon: IconButton(
            onPressed: onEyeClick,
            icon: (eye)
                ? SvgPicture.asset(
                    ImagePath.eyeOff,
                    height: 12,
                    colorFilter: const ColorFilter.mode(
                        AppColors.secondaryTextColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  )
                : SvgPicture.asset(
                    ImagePath.eye,
                    height: 12,
                    colorFilter: ColorFilter.mode(
                        AppColors.secondaryTextColor.withOpacity(0.5),
                        BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
          ),
          errorStyle: const TextStyle(fontSize: 10),
          hintText: hint,
          hintStyle:
              CustomTextStyles.f16W400(color: AppColors.secondaryTextColor),
        ),
        style: CustomTextStyles.f16W400(),
      ),
    );
  }
}
