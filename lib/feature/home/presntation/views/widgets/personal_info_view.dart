import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_password_field.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String currentPassword;
  late String newPassword;

  @override
  void initState() {
    super.initState();
    // Pre-fill with current user data
    name = getUser().name;
    email = getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الملف الشخصي',
        showNotification: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Text(
                  'المعلومات الشخصيه',
                  style: TextStyles.semiBold16.copyWith(
                    color: Color(0xff0C0D0D),
                  ),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  initialValue: name,
                  onSaved: (value) => name = value!,
                  hintText: 'Shehab Faris',
                  textInputType: TextInputType.text,
                  suffixIcon: Icon(Icons.person, color: AppColors.primaryColor),
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  initialValue: email,
                  onSaved: (value) => email = value!,
                  hintText: 'shehab2002@mail.com',
                  textInputType: TextInputType.emailAddress,
                  suffixIcon: Icon(Icons.email, color: AppColors.primaryColor),
                ),
                SizedBox(height: 16),
                Text(
                  ' تغيير كلمة المرور',
                  style: TextStyles.semiBold16.copyWith(
                    color: Color(0xff0C0D0D),
                  ),
                ),
                SizedBox(height: 16),
                CustomPasswordField(
                  hintText: 'كلمة المرور الحاليه',
                  onSaved: (value) => currentPassword = value!,
                ),
                SizedBox(height: 16),
                CustomPasswordField(
                  hintText: 'كلمة المرور الجديده',
                  onSaved: (value) => newPassword = value!,
                ),
                SizedBox(height: 16),
                CustomPasswordField(
                  hintText: 'تأكيد كلمة المرور الجديده ',
                  onSaved: (value) => newPassword = value!,
                ),
                SizedBox(height: 32),
                CustomButton(
                  text: 'حفظ التغييرات',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // TODO: Update user data (e.g., via Firebase or SharedPreferences)
                      // For now, show success and navigate back
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم حفظ التغييرات')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 32),
              ], 
            ),
          ),
        ),
      ),
    );
  }
}
