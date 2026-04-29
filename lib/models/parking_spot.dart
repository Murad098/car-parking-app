enum ParkingSpotType { standard, premium, electric, disabled }

enum ParkingSpotStatus { available, occupied, reserved, maintenance }

class ParkingSpot {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final ParkingSpotType type;
  final ParkingSpotStatus status;
  final double pricePerHour;
  final String? imageUrl;
  final int totalSpots;
  final int availableSpots;
  final List<String> amenities;
  final String? description;
  final double rating;
  final int reviewCount;

  ParkingSpot({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.status,
    required this.pricePerHour,
    this.imageUrl,
    required this.totalSpots,
    required this.availableSpots,
    required this.amenities,
    this.description,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'type': type.name,
      'status': status.name,
      'pricePerHour': pricePerHour,
      'imageUrl': imageUrl,
      'totalSpots': totalSpots,
      'availableSpots': availableSpots,
      'amenities': amenities,
      'description': description,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  factory ParkingSpot.fromMap(Map<String, dynamic> map) {
    return ParkingSpot(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      latitude: (map['latitude'] ?? 0.0).toDouble(),
      longitude: (map['longitude'] ?? 0.0).toDouble(),
      type: ParkingSpotType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => ParkingSpotType.standard,
      ),
      status: ParkingSpotStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => ParkingSpotStatus.available,
      ),
      pricePerHour: (map['pricePerHour'] ?? 0.0).toDouble(),
      imageUrl: map['imageUrl'],
      totalSpots: map['totalSpots'] ?? 0,
      availableSpots: map['availableSpots'] ?? 0,
      amenities: List<String>.from(map['amenities'] ?? []),
      description: map['description'],
      rating: (map['rating'] ?? 0.0).toDouble(),
      reviewCount: map['reviewCount'] ?? 0,
    );
  }

  ParkingSpot copyWith({
    String? id,
    String? name,
    String? address,
    double? latitude,
    double? longitude,
    ParkingSpotType? type,
    ParkingSpotStatus? status,
    double? pricePerHour,
    String? imageUrl,
    int? totalSpots,
    int? availableSpots,
    List<String>? amenities,
    String? description,
    double? rating,
    int? reviewCount,
  }) {
    return ParkingSpot(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      type: type ?? this.type,
      status: status ?? this.status,
      pricePerHour: pricePerHour ?? this.pricePerHour,
      imageUrl: imageUrl ?? this.imageUrl,
      totalSpots: totalSpots ?? this.totalSpots,
      availableSpots: availableSpots ?? this.availableSpots,
      amenities: amenities ?? this.amenities,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }
}