import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyLandModel {
  final String id;
  final String? type;
  final String title;
  final String description;
  final String price;
  final Map<String, String> location;
  final List<String> imageUrls;
  final String? listedBy;
  final String facingDirection;
  final String length;
  final String breadth;
  final String plotArea;
  final String postedBy;
  final String postedFrom;
  final String category;
  final String? userId;
  List<String> propertySaved;

  PropertyLandModel(
      {this.id = "",
      this.userId,
      required this.type,
      required this.title,
      required this.description,
      required this.price,
      required this.location,
      required this.imageUrls,
      required this.facingDirection,
      required this.listedBy,
      required this.length,
      required this.breadth,
      required this.plotArea,
      required this.postedBy,
      required this.postedFrom,
      required this.category,
      required this.propertySaved});

  // Factory constructor to create a Property object from a map
  factory PropertyLandModel.fromMap(DocumentSnapshot map) {
    return PropertyLandModel(
        id: map.id,
        type: map['type'],
        title: map['title'],
        description: map['description'],
        price: map['price'],
        location: Map<String, String>.from(map['location']),
        imageUrls: List<String>.from(map['imageUrls']),
        facingDirection: map['facingDirection'],
        listedBy: map['listedBy'],
        length: map['length'],
        breadth: map['breadth'],
        plotArea: map['ploatArea'],
        postedBy: map['postedBy'],
        postedFrom: map['postedFrom'],
        category: map['category'],
        userId: map['userId'],
        propertySaved: List<String>.from(map['propertySaved']));
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
      'facingDirection': facingDirection,
      'listedBy': listedBy,
      'length': length,
      'breadth': breadth,
      'plotArea': plotArea,
      'postedBy': postedBy,
      'postedFrom': postedFrom,
      'category': category,
      'userId': userId,
      'propertySaved': propertySaved
    };
  }
}
