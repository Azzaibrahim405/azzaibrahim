import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/features/services/data/models/addition_quantity_model.dart';

class OrderBody {
  int? washerId;
  int? serviceId;
  int? sizeId;
  List<AdditionQuantityModel>? additions;
  OrderBody({
    this.washerId,
    this.serviceId,
    this.additions,
    this.sizeId,
  });
  toJson() => {
        ApiKeys.washerId: washerId,
        ApiKeys.serviceId: serviceId,
        ApiKeys.sizeId: sizeId,
        'additions': additions
      };
}
