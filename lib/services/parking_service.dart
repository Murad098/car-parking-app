import '../models/parking_spot.dart';

class ParkingService {
  // Mock data for demo purposes
  // In production, this would connect to Firebase Firestore
  
  final List<ParkingSpot> _mockParkingSpots = [
    ParkingSpot(
      id: '1',
      name: 'Downtown Parking',
      address: '123 Main Street, City Center',
      latitude: 40.7128,
      longitude: -74.0060,
      type: ParkingSpotType.standard,
      status: ParkingSpotStatus.available,
      pricePerHour: 5.0,
      totalSpots: 50,
      availableSpots: 15,
      amenities: ['CCTV', 'Security Guard', 'Elevator', 'Restroom'],
      description: 'Secure parking in downtown area with 24/7 security',
      rating: 4.5,
      reviewCount: 120,
    ),
    ParkingSpot(
      id: '2',
      name: 'Mall Parking Complex',
      address: '456 Shopping Avenue',
      latitude: 40.7580,
      longitude: -73.9855,
      type: ParkingSpotType.premium,
      status: ParkingSpotStatus.available,
      pricePerHour: 8.0,
      totalSpots: 200,
      availableSpots: 45,
      amenities: ['CCTV', 'Security Guard', 'EV Charging', 'Car Wash'],
      description: 'Premium parking at the city mall with additional services',
      rating: 4.8,
      reviewCount: 250,
    ),
    ParkingSpot(
      id: '3',
      name: 'Airport Long-term Parking',
      address: 'Airport Road, Terminal 2',
      latitude: 40.6413,
      longitude: -73.7781,
      type: ParkingSpotType.standard,
      status: ParkingSpotStatus.available,
      pricePerHour: 15.0,
      totalSpots: 500,
      availableSpots: 120,
      amenities: ['CCTV', 'Shuttle Service', 'Restroom', 'Food Court'],
      description: 'Long-term parking for airport travelers',
      rating: 4.2,
      reviewCount: 180,
    ),
    ParkingSpot(
      id: '4',
      name: 'EV Charging Station',
      address: '789 Electric Avenue',
      latitude: 40.7484,
      longitude: -73.9857,
      type: ParkingSpotType.electric,
      status: ParkingSpotStatus.available,
      pricePerHour: 10.0,
      totalSpots: 20,
      availableSpots: 8,
      amenities: ['EV Charging', 'CCTV', 'Waiting Area'],
      description: 'Dedicated EV charging parking spots with fast chargers',
      rating: 4.7,
      reviewCount: 85,
    ),
    ParkingSpot(
      id: '5',
      name: 'Stadium Parking',
      address: 'Sports Complex, Stadium Road',
      latitude: 40.8296,
      longitude: -73.9262,
      type: ParkingSpotType.standard,
      status: ParkingSpotStatus.reserved,
      pricePerHour: 12.0,
      totalSpots: 300,
      availableSpots: 0,
      amenities: ['CCTV', 'Security Guard', 'Food Stalls'],
      description: 'Parking for stadium events',
      rating: 4.0,
      reviewCount: 90,
    ),
    ParkingSpot(
      id: '6',
      name: 'Premium City Parking',
      address: '101 Luxury Lane',
      latitude: 40.7614,
      longitude: -73.9776,
      type: ParkingSpotType.premium,
      status: ParkingSpotStatus.available,
      pricePerHour: 15.0,
      totalSpots: 30,
      availableSpots: 5,
      amenities: ['CCTV', 'Valet Service', 'Car Detailing', 'Lounge'],
      description: 'Premium valet parking in luxury district',
      rating: 4.9,
      reviewCount: 200,
    ),
    ParkingSpot(
      id: '7',
      name: 'Beach Parking',
      address: 'Coastal Highway, Beach Area',
      latitude: 40.5789,
      longitude: -73.9700,
      type: ParkingSpotType.standard,
      status: ParkingSpotStatus.available,
      pricePerHour: 6.0,
      totalSpots: 100,
      availableSpots: 35,
      amenities: ['CCTV', 'Beach Access', 'Showers'],
      description: 'Parking near the beach with direct beach access',
      rating: 4.3,
      reviewCount: 75,
    ),
    ParkingSpot(
      id: '8',
      name: 'Disabled Parking Zone',
      address: '202 Accessibility Road',
      latitude: 40.7505,
      longitude: -73.9934,
      type: ParkingSpotType.disabled,
      status: ParkingSpotStatus.available,
      pricePerHour: 3.0,
      totalSpots: 10,
      availableSpots: 4,
      amenities: ['Wheelchair Access', 'CCTV', 'Assistance'],
      description: 'Dedicated parking for disabled persons',
      rating: 4.6,
      reviewCount: 45,
    ),
  ];

  Future<List<ParkingSpot>> getAllParkingSpots() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockParkingSpots;
  }

  Future<List<ParkingSpot>> getAvailableParkingSpots() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockParkingSpots
        .where((spot) => spot.status == ParkingSpotStatus.available && spot.availableSpots > 0)
        .toList();
  }

  Future<ParkingSpot?> getParkingSpotById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mockParkingSpots.firstWhere((spot) => spot.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<ParkingSpot>> searchParkingSpots(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final lowerQuery = query.toLowerCase();
    return _mockParkingSpots.where((spot) {
      return spot.name.toLowerCase().contains(lowerQuery) ||
          spot.address.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  Future<List<ParkingSpot>> filterByType(ParkingSpotType type) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockParkingSpots.where((spot) => spot.type == type).toList();
  }

  Future<List<ParkingSpot>> filterByPriceRange(double minPrice, double maxPrice) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockParkingSpots.where((spot) {
      return spot.pricePerHour >= minPrice && spot.pricePerHour <= maxPrice;
    }).toList();
  }
}