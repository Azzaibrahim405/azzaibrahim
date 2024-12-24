import 'package:best_touch_training/core/database/remote/api_keys.dart';

class AdditionQuantityModel {
  int additionId;
  int quantity;
  AdditionQuantityModel({
    required this.additionId,
    required this.quantity,
  });
  toJson() => {
        ApiKeys.additionId: additionId,
        ApiKeys.quantity: quantity,
      };
}
