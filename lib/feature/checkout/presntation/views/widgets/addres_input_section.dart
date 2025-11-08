import 'package:e_coomerce_fruit/core/widgets/custom_text_form_field.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddresInputSection extends StatelessWidget {
  const AddresInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity!.name =
                      value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context
                          .read<OrderInputEntity>()
                          .shippingAddressEntity!
                          .email =
                      value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context
                          .read<OrderInputEntity>()
                          .shippingAddressEntity!
                          .address =
                      value!;
                },
                hintText: ' العنوان',
                textInputType: TextInputType.text,
              ),

              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity!.city =
                      value!;
                },
                hintText: 'المدينه',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context
                          .read<OrderInputEntity>()
                          .shippingAddressEntity!
                          .addresDetails =
                      value!;
                },
                hintText: ' رقم الطابق , رقم الشقة ..',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context
                          .read<OrderInputEntity>()
                          .shippingAddressEntity!
                          .phone =
                      value!;
                },
                hintText: 'رقم الهاتف',
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
