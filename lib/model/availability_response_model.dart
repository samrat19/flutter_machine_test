class AvailabilityResponseModel {
  int? status;
  String? message;
  List<Listed>? listed;

  AvailabilityResponseModel({this.status, this.message, this.listed});

  AvailabilityResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['listed'] != null) {
      listed = <Listed>[];
      json['listed'].forEach((v) {
        listed!.add(Listed.fromJson(v));
      });
    }
  }
}

class Listed {
  String? businessName;
  String? image;
  String? rating;
  String? id;
  String? address;
  String? description;
  List<RestaurantType>? restaurantType;
  List<TimeAvailable>? timeAvailable;
  String? seatAvailable;
  String? getTime;
  String? serviceProvider;
  String? price;

  Listed(
      {this.businessName,
        this.image,
        this.rating,
        this.id,
        this.address,
        this.description,
        this.restaurantType,
        this.timeAvailable,
        this.seatAvailable,
        this.getTime,
        this.serviceProvider,
        this.price});

  Listed.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    image = json['image'];
    rating = json['rating'];
    id = json['id'];
    address = json['address'];
    description = json['description'];
    if (json['restaurant_type'] != null) {
      restaurantType = <RestaurantType>[];
      json['restaurant_type'].forEach((v) {
        restaurantType!.add(RestaurantType.fromJson(v));
      });
    }
    if (json['time_available'] != null) {
      timeAvailable = <TimeAvailable>[];
      json['time_available'].forEach((v) {
        timeAvailable!.add(TimeAvailable.fromJson(v));
      });
    }
    seatAvailable = json['seat_available'];
    getTime = json['get_time'];
    serviceProvider = json['service_provider'];
    price = json['price'].toString();
  }
}

class RestaurantType {
  String? name;
  String? id;

  RestaurantType({this.name, this.id});

  RestaurantType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}

class TimeAvailable {
  String? time;

  TimeAvailable({this.time});

  TimeAvailable.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }
}