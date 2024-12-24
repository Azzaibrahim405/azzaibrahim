// import 'package:flutter/material.dart';

// class CustomTabbar extends StatelessWidget {
//   const CustomTabbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return     TabBar(
//                   onTap: (value) {
//                     if (value == 0) {
//                       context.read<ReservationCubit>().getAllReservations(
//                             OrderStatus.pending,
//                             // OrderStatus.inProgress
//                           );
//                     } else {
//                       context.read<ReservationCubit>().getAllReservations(
//                             OrderStatus.completed,
//                           );
//                     }
//                   },
//                   indicatorColor: Colors.transparent,
//                   unselectedLabelColor: AppColors.greyColor,
//                   dividerColor: Colors.transparent,
//                   labelColor: Colors.white,
//                   controller: tabController,
//                   tabs: <Widget>[
//                     Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: tabController.index == 0
//                             ? AppColors.primary
//                             : AppColors.greyLight,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: const Text(
//                         ' الحاليه ',
//                       ).paddingSymmetric(35, 7),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: tabController.index == 1
//                             ? AppColors.primary // لون أخضر عند التحديد
//                             : AppColors.greyLight, // لون رمادي عند عدم التحديد
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: const Text('السابقه').paddingSymmetric(35, 7),
//                     ),
//                   ],
//                 ),

//   }
// }
