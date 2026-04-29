import 'package:uuid/uuid.dart';
import '../models/booking.dart';

class BookingService {
  final List<Booking> _bookings = [];
  final _uuid = const Uuid();

  Future<List<Booking>> getUserBookings(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _bookings.where((booking) => booking.userId == userId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<List<Booking>> getBookingHistory(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _bookings.where((booking) => 
      booking.userId == userId && 
      (booking.status == BookingStatus.completed || booking.status == BookingStatus.cancelled)
    ).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<List<Booking>> getActiveBookings(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _bookings.where((booking) => 
      booking.userId == userId && 
      (booking.status == BookingStatus.confirmed || booking.status == BookingStatus.active)
    ).toList();
  }

  Future<Booking?> getBookingById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _bookings.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<Booking> createBooking({
    required String userId,
    required String parkingSpotId,
    required String parkingSpotName,
    required String parkingSpotAddress,
    required DateTime startTime,
    required DateTime endTime,
    required double totalPrice,
    String? vehicleNumber,
    String? vehicleType,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final booking = Booking(
      id: _uuid.v4(),
      userId: userId,
      parkingSpotId: parkingSpotId,
      parkingSpotName: parkingSpotName,
      parkingSpotAddress: parkingSpotAddress,
      startTime: startTime,
      endTime: endTime,
      totalPrice: totalPrice,
      status: BookingStatus.confirmed,
      vehicleNumber: vehicleNumber,
      vehicleType: vehicleType,
      createdAt: DateTime.now(),
    );
    
    _bookings.add(booking);
    return booking;
  }

  Future<Booking> updateBookingStatus(String bookingId, BookingStatus status) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final index = _bookings.indexWhere((booking) => booking.id == bookingId);
    if (index == -1) {
      throw Exception('Booking not found');
    }
    
    final updatedBooking = _bookings[index].copyWith(status: status);
    _bookings[index] = updatedBooking;
    return updatedBooking;
  }

  Future<void> cancelBooking(String bookingId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final index = _bookings.indexWhere((booking) => booking.id == bookingId);
    if (index == -1) {
      throw Exception('Booking not found');
    }
    
    _bookings[index] = _bookings[index].copyWith(status: BookingStatus.cancelled);
  }

  Future<double> calculatePrice(double pricePerHour, DateTime startTime, DateTime endTime) async {
    final duration = endTime.difference(startTime);
    final hours = duration.inMinutes / 60.0;
    return pricePerHour * hours;
  }
}