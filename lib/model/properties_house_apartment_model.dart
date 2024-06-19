import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyHouseAndApartmentModel {
  final String id;

  final String? type;
  final String title;
  final String description;
  final String price;
  final Map<String, String> location;
  final List<String> imageUrls;
  final String? furnishing;
  final String? constructionStatus;
  final String? listedBy;
  final String? carParking;
  final String? bedrooms;
  final String? bathrooms;
  final String areaftsq;
  final String? floors;
  final String facingDirection;
  final String postedBy;
  final String? userImg;
  final String postedFrom;
  final String category;
  final String userId;
  final List<String> propertySaved;
  DateTime? timestamp;
  int isAccepted = 0;
  bool hide = false;
  bool isSold = false;

  PropertyHouseAndApartmentModel({
    this.id = "",
    required this.type,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.imageUrls,
    required this.furnishing,
    required this.constructionStatus,
    required this.carParking,
    required this.facingDirection,
    required this.listedBy,
    required this.bedrooms,
    required this.bathrooms,
    required this.areaftsq,
    required this.floors,
    required this.postedBy,
    required this.userImg,
    required this.postedFrom,
    required this.category,
    required this.userId,
    required this.propertySaved,
    this.timestamp,
    required this.hide,
    required this.isAccepted,
    required this.isSold,
  });

  // Factory constructor to create a Property object from a map
  factory PropertyHouseAndApartmentModel.fromMap(DocumentSnapshot map) {
    return PropertyHouseAndApartmentModel(
      id: map.id,
      type: map['type'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      location: Map<String, String>.from(map['location']),
      imageUrls: List<String>.from(map['imageUrls']),
      furnishing: map['furnishing'],
      constructionStatus: map['constructionStatus'],
      carParking: map['carParking'],
      facingDirection: map['facingDirection'],
      areaftsq: map['areaftsq'],
      floors: map['floors'],
      bedrooms: map['bedrooms'],
      bathrooms: map['bathrooms'],
      listedBy: map['listedBy'],
      postedBy: map['postedBy'],
      userImg: map['userImg'],
      postedFrom: map['postedFrom'],
      category: map['category'],
      userId: map['userId'],
      hide: map['hide'],
      isAccepted: map['isAccepted'],
      isSold: map['isSold'],
      propertySaved: List<String>.from(map['propertySaved']),
      timestamp: (map["timestamp"] as Timestamp?)?.toDate(),
    );
  }

  // Method to convert Property object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'description': description,
      'price': price,
      'location': location,
      'imageUrls': imageUrls,
      'furnishing': furnishing,
      'constructionStatus': constructionStatus,
      'carParking': carParking,
      'facingDirection': facingDirection,
      'areaftsq': areaftsq,
      'floors': floors,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'listedBy': listedBy,
      'postedBy': postedBy,
      'userImg': userImg,
      'postedFrom': postedFrom,
      'category': category,
      'userId': userId,
      'hide': hide,
      'isAccepted': isAccepted,
      'isSold': isSold,
      'propertySaved': propertySaved,
      "timestamp": timestamp != null
          ? Timestamp.fromDate(timestamp!)
          : FieldValue.serverTimestamp(),
    };
  }
}
