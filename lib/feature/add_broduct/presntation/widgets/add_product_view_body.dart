import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_form_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: const Column(
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Discription',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
