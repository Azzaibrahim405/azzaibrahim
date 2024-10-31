import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_form_field.dart';
import 'package:best_touch_training/core/shared_widgets/custom_label_text.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/core/validation/validation.dart';
import 'package:best_touch_training/features/auth/data/models/get_profile_model/get_profile_model/profile_data.dart';
import 'package:best_touch_training/features/profile/data/models/update_profile_model/update_profile_request.dart';
import 'package:best_touch_training/features/profile/presentation/cubit/cubit/update_profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  ProfileData? profileData;

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewasswordController = TextEditingController();

// Requesting storage permission
  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  final ImagePicker _picker = ImagePicker();
  String? _base64Image; // To store the base64 image string

  // Function to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    try {
      await requestStoragePermission();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Convert the image file to base64
        File imageFile = File(image.path);
        final bytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(bytes);

        setState(() {
          _base64Image = base64Image;
        });

        print("Base64 Image: $_base64Image");
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  late TextEditingController userController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void initState() {
    userController = TextEditingController(text: profileData?.name ?? '');
    phoneController = TextEditingController(text: profileData?.phone);
    emailController = TextEditingController(text: profileData?.email);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var updateCubit = sl<UpdateProfileCubit>();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: SimpleAppBar(
          context: context,
          title: 'تعديل الملف الشخصي',
          leading: true,
        ),
        body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileErrorState) {
              showToast(msg: state.message, state: ToastStates.error);
            } else if (state is UpdateProfileSuccessState) {
              navigate(context: context, route: Routes.layout);
              showToast(
                  msg: "تم تعديل الملف الشخصي بنجاح",
                  state: ToastStates.success);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: ListView(
                children: [
                  25.verticalSpace,
                  Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: CachedNetworkImage(
                          imageUrl: profileData?.avatar ?? ''),
                    ),
                  ),
                  24.verticalSpace,
                  const CustomLabelText(
                    text: 'اسم المستخدم',
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    hint: '',
                    controller: userController,
                    validator: (val) => ValidationHelper.validate(val),
                  ),
                  24.verticalSpace,
                  const CustomLabelText(
                    text: 'رقم الهاتف',
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    controller: phoneController,
                  ),
                  24.verticalSpace,
                  const CustomLabelText(
                    text: 'البريد الالكتروني',
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    controller: emailController,
                  ),
                  24.verticalSpace,
                  const CustomLabelText(
                    text: 'كلمه المرور',
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    hint: '*****',
                    controller: passwordController,
                    isPassword: true,
                  ),
                  24.verticalSpace,
                  24.verticalSpace,
                  const CustomLabelText(
                    text: 'كلمه المرور الجديده',
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    hint: '*****',
                    controller: newPasswordController,
                    isPassword: true,
                  ),
                  24.verticalSpace,
                  16.verticalSpace,
                  const CustomLabelText(
                    text: 'تأكيد كلمه المرور الجديده',
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    hint: '*****',
                    controller: confirmNewasswordController,
                    isPassword: true,
                  ),
                  24.verticalSpace,
                  state is UpdateProfileLoadingState
                      ? const CustomLoadingIndicator()
                      : CustomElevatedButton(
                          text: 'تعديل',
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              context.read<UpdateProfileCubit>().updateProfile(
                                    UpdateProfileRequest(
                                      // avatar:
                                      //     updateCubit.profileData?.avatar ?? '',
                                      email: emailController.text,
                                      name: userController.text,
                                      oldPassword: passwordController.text,
                                      newPassword: newPasswordController.text,
                                      confirmNewPassword:
                                          confirmNewasswordController.text,
                                    ),
                                  );
                            }
                          },
                        ),
                  TextButton(
                      onPressed: () {
                        navigate(context: context, route: Routes.enterPassword);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.trash),
                          8.horizontalSpace,
                          Text(
                            'حذف الحساب',
                            style: regularStyle(size: 14, color: Colors.red),
                          )
                        ],
                      ))
                ],
              ).paddingAll(16),
            );
          },
        ));
  }
}
