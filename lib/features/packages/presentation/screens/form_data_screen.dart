import 'dart:io';

import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_form_field.dart';
import 'package:best_touch_training/core/shared_widgets/custom_label_text.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/packages/data/models/form_data_model.dart';
import 'package:best_touch_training/features/packages/presentation/cubit/cubit/packages_cubit.dart';
import 'package:best_touch_training/features/packages/presentation/screens/widgets/custom_bottom_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class FormDataScreen extends StatefulWidget {
  FormDataScreen({super.key});

  @override
  State<FormDataScreen> createState() => _FormDataScreenState();
}

class _FormDataScreenState extends State<FormDataScreen> {
  final TextEditingController carOwnerController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController carBrandController = TextEditingController();

  final TextEditingController carTypeController = TextEditingController();

  final TextEditingController symbolController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  List<File> images = [];
  Future<void> pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        images = selectedImages.map((e) => File(e.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        title: 'استماره البيانات',
      ),
      body: BlocConsumer<PackagesCubit, PackagesState>(
        listener: (context, state) {
          if (state is StoreFormErrorState) {
            showToast(msg: state.message, state: ToastStates.error);
          } else if (state is StoreFormSuccessState) {
            showToast(
                msg: 'تم ارسال البيانات المطلوبه بنجاح',
                state: ToastStates.success);
          }
        },
        builder: (context, state) {
          return ListView(children: [
            Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.greyColor,
                ),
                10.horizontalSpace,
                Text(
                  'برجاء ملئ البيانات التالية',
                  style: regularStyle(size: 12, color: AppColors.greyColor),
                ),
              ],
            ),
            16.verticalSpace,
            const CustomLabelText(
              text: 'اسم صاحب السيارة ',
            ),
            5.verticalSpace,
            CustomTextFormField(
              controller: carOwnerController,
              hint: 'اسم صاحب السياره',
            ),
            16.verticalSpace,
            const CustomLabelText(
              text: 'رقم الهاتف',
            ),
            5.verticalSpace,
            CustomTextFormField(
              controller: phoneController,
              hint: 'رقم الهاتف',
            ),
            16.verticalSpace,
            const CustomLabelText(text: 'محطات غسيل السيارات'),
            4.verticalSpace,
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.hintColor,
                  ),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'محطات غسيل السيارات ',
                    style: regularStyle(size: 12, color: AppColors.hintColor),
                  ),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              
                              return const CustomBottomSheet();
                            });
                      },
                      child: const Icon(Icons.arrow_drop_down))
                ],
              ).paddingAll(17),
            ),
            16.verticalSpace,
            const CustomLabelText(
              text: 'لوحه السياره',
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: symbolController,
                  hint: 'الحروف',
                )),
                10.horizontalSpace,
                Expanded(
                    child: CustomTextFormField(
                  controller: numberController,
                  hint: 'الارقام',
                )),
              ],
            ),
            16.verticalSpace,
            const CustomLabelText(
              text: 'ماركه السياره',
            ),
            5.verticalSpace,
            CustomTextFormField(
              controller: carBrandController,
              hint: 'ماركه السياره',
            ),
            16.verticalSpace,
            const CustomLabelText(
              text: 'نوع السياره',
            ),
            5.verticalSpace,
            CustomTextFormField(
              controller: carTypeController,
              hint: 'نوع السياره',
            ),
            24.verticalSpace,
            Text(
              'برجاء التقاط بعض الصور للسيارة',
              style: regularStyle(size: 14, color: AppColors.labelTextColor),
            ),
            16.verticalSpace,
            Row(
              children: [
                DottedBorder(
                  color: AppColors.hintColor,
                  dashPattern: const [10, 20],
                  child: Container(
                    color: AppColors.hintColor,
                    height: 100,
                    child: InkWell(
                      onTap: () => pickImages(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.dragImage),
                          5.verticalSpace,
                          Text(
                            'رفع الصور',
                            style: regularStyle(
                                size: 14, color: AppColors.greyColor),
                          )
                        ],
                      ).paddingSymmetric(40, 20),
                    ),
                  ),
                ).paddingOnly(right: 10),
                ...List.generate(images.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      images[index],
                      width: 50,
                      height: 100,
                    ),
                  );
                })
              ],
            ),
            20.verticalSpace,
            state is StoreFormLoadingState
                ? const CustomLoadingIndicator()
                : CustomElevatedButton(
                    onPress: () {
                      context.read<PackagesCubit>().storeFormData(FormDataModel(
                            brand: carBrandController.text,
                            images: images,
                            model: 'corola',
                            packageId: 1,
                            vehicleLetter: numberController.text,
                            vehicleNumber: 122,
                            washerId: 1,
                          ));
                    },
                    text: ' تقديم طلب',
                  ),
            50.verticalSpace
          ]);
        },
      ).paddingHorizontal(16),
    );
  }
}
