enum BookingStatus { pending, confirmed, active, completed, cancelled }

class Booking {
  final String id;
  final String userId;
  final String parkingSpotId;
  final String parkingSpotName;
  final String parkingSpotAddress;
  final DateTime startTime;
  final DateTime endTime;
  final double totalPrice;
  final BookingStatus status;
  final String? paymentId;
  final String? vehicleNumber;
  final String? vehicleType;
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.userId,
    required this.parkingSpotId,
    required this.parkingSpotName,
    required this.parkingSpotAddress,
    required this.startTime,
    required this.endTime,
    required this.totalPrice,
    required this.status,
    this.paymentId,
    this.vehicleNumber,
    this.vehicleType,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'parkingSpotId': parkingSpotId,
      'parkingSpotName': parkingSpotName,
      'parkingSpotAddress': parkingSpotAddress,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'totalPrice': totalPrice,
      'status': status.name,
      'paymentId': paymentId,
      'vehicleNumber': vehicleNumber,
      'vehicleType': vehicleType,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      parkingSpotId: map['parkingSpotId'] ?? '',
      parkingSpotName: map['parkingSpotName'] ?? '',
      parkingSpotAddress: map['parkingSpotAddress'] ?? '',
      startTime: DateTime.parse(map['startTime']),
      endTime: DateTime.parse(map['endTime']),
      totalPrice: (map['totalPrice'] ?? 0.0).toDouble(),
      status: BookingStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => BookingStatus.pending,
      ),
      paymentId: map['paymentId'],
      vehicleNumber: map['vehicleNumber'],
      vehicleType: map['vehicleType'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Booking copyWith({
    String? id,
    String? userId,
    String? parkingSpotId,
    String? parkingSpotName,
    String? parkingSpotAddress,
    DateTime? startTime,
    DateTime? endTime,
    double? totalPrice,
    BookingStatus? status,
    String? paymentId,
    String? vehicleNumber,
    String? vehicleType,
    DateTime? createdAt,
  }) {
    return Booking(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      parkingSpotId: parkingSpotId ?? this.parkingSpotId,
      parkingSpotName: parkingSpotName ?? this.parkingSpotName,
      parkingSpotAddress: parkingSpotAddress ?? this.parkingSpotAddress,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      paymentId: paymentId ?? this.paymentId,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      vehicleType: vehicleType ?? this.vehicleType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Duration get duration => endTime.difference(startTime);

  bool get isActive => status == BookingStatus.active;
  bool get isPending => status == BookingStatus.pending;
  bool get isConfirmed => status == BookingStatus.confirmed;
  bool get isCompleted => status == BookingStatus.completed;
  bool get isCancelled => status == BookingStatus.cancelled;
}