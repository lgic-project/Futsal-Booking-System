List<Order> orderListFromJson(List<dynamic> orderJson) => List<Order>.from(
    orderJson.map((orderJsonList) => Order.fromJson(orderJsonList)));


class Order {
  int? id;
  int? userId;
  String? startDate;
  String? endDate;
  int? total;
  String? paymentMethod;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
      this.userId,
      this.startDate,
      this.endDate,
      this.total,
      this.paymentMethod,
      this.createdAt,
      this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    total = json['total'];
    paymentMethod = json['payment_method'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['total'] = total;
    data['payment_method'] = paymentMethod;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}