// import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
// import 'package:best_touch_training/core/utils/app_colors.dart';
// import 'package:best_touch_training/core/utils/app_text_style.dart';
// import 'package:best_touch_training/core/utils/extensions.dart';

// import 'package:best_touch_training/features/services/presentation/cubit/additions_service_cubit/cubit/addition_services_cubit.dart';
// import 'package:best_touch_training/features/services/presentation/screens/widgets/additions_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ReservationConfirmationScreen extends StatelessWidget {
//   const ReservationConfirmationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var cubit = context.read<AdditionServicesCubit>();
//     return Scaffold(
//         appBar: SimpleAppBar(
//           context: context,
//           title: 'تأكيد الحجز',
//         ),
//         body: ListView(
//           children: [
//             Card(
//               color: Colors.white,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${cubit.contentParams?.sizeName ?? ''} - ${cubit.contentParams?.name}',
//                         style: semiBold(
//                           size: 14,
//                           color: AppColors.labelTextColor,
//                         ),
//                       ),
//                       Text(
//                         'عدد 2 كرسي',
//                         style:
//                             regularStyle(size: 12, color: AppColors.greyColor),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     '${cubit.contentParams?.price} ر.س',
//                     style: semiBold(size: 16, color: AppColors.deepGrey),
//                   )
//                 ],
//               ).paddingSymmetric(16, 25),
//             ),
//             20.verticalSpace,
//             Text(
//               'الخدمات المقدمه',
//               style: semiBold(size: 16, color: AppColors.labelTextColor),
//             ),
//             16.verticalSpace,
//             Html(
//               data: cubit.contentParams?.description ?? '',
//             ),
//             20.verticalSpace,
//             Text(
//               'الخدمات الاضافيه',
//               style: semiBold(size: 16, color: AppColors.labelTextColor),
//             ),
//             16.verticalSpace,
//             SizedBox(
//               height: 300,
//               child: ListView.separated(
//                 itemBuilder: (context, index) {
//                   final paidAdditional = cubit.paidAdditionalList[index];

//                   return AdditionsItem(
//                     additionModel: cubit.selectedPaidAdditionsList[index],
//                     value: cubit.isSelectedId(additionId: paidAdditional.id),
//                     onChanged: (_) {
//                       cubit.toggleCheckbox(paidAdditional.id);
//                     },
//                   );
//                 },
//                 separatorBuilder: (context, index) => 16.verticalSpace,
//                 itemCount: cubit.selectedPaidAdditionsList.length,
//               ),
//             ),
//           ],
//         ).paddingHorizontal(16));
//   }
// }
