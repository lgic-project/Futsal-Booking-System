List<Venue> venueListFromJson(List<dynamic> venueJson) => List<Venue>.from(
    venueJson.map((venueJsonList) => Venue.fromJson(venueJsonList)));

class Venue {
  int? id;
  String? name;
  String? image;
  String? cost;
  String? description;
  String? rules;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Venue(
      {this.id,
      this.name,
      this.image,
      this.cost,
      this.description,
      this.rules,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    cost = json['cost'];
    description = json['description'];
    rules = json['rules'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['cost'] = cost;
    data['description'] = description;
    data['rules'] = rules;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}
