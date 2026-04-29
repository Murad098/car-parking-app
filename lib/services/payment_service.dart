import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  // In production, these would come from your backend
  // For demo purposes, we'll use test keys
  static const String _publishableKey = 'pk_test_your_stripe_publishable_key';
  static const String _secretKey = 'sk_test_your_stripe_secret_key';

  Future<void> initializeStripe() async {
    Stripe.publishableKey = _publishableKey;
    // In production, you'd use a backend to create the PaymentIntent
    // and get the client secret
  }

  Future<Map<String, dynamic>> createPaymentIntent({
    required double amount,
    required String currency,
    required String customerId,
  }) async {
    // In production, this would call your backend API
    // which would use the Stripe secret key to create a PaymentIntent
    
    // Mock response for demo
    await Future.delayed(const Duration(milliseconds: 500));
    
    return {
      'clientSecret': 'pi_mock_client_secret_${DateTime.now().millisecondsSinceEpoch}',
      'amount': (amount * 100).toInt(), // Stripe uses cents
      'currency': currency,
    };
  }

  Future<bool> processPayment({
    required String paymentIntentClientSecret,
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvc,
  }) async {
    // In production, you'd use Stripe's card payment method
    // For demo, we'll simulate a successful payment
    
    await Future.delayed(const Duration(seconds: 2));
    
    // Simulate payment processing
    // In real implementation:
    // 1. Create a CardDetails from the input
    // 2. Call Stripe.instance.confirmPayment
    
    return true;
  }

  Future<Map<String, dynamic>> getPaymentMethods(String customerId) async {
    // In production, fetch from Stripe API
    await Future.delayed(const Duration(milliseconds: 500));
    
    return {
      'paymentMethods': [
        {
          'id': 'pm_mock_1',
          'card': {
            'brand': 'visa',
            'last4': '4242',
            'expMonth': 12,
            'expYear': 2025,
          },
        },
      ],
    };
  }

  Future<void> addPaymentMethod({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvc,
  }) async {
    // In production, use Stripe to tokenize and save the card
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> removePaymentMethod(String paymentMethodId) async {
    // In production, call Stripe API to delete the payment method
    await Future.delayed(const Duration(milliseconds: 300));
  }

  String formatAmount(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  String getCardBrandIcon(String brand) {
    switch (brand.toLowerCase()) {
      case 'visa':
        return '💳 Visa';
      case 'mastercard':
        return '💳 Mastercard';
      case 'amex':
        return '💳 American Express';
      default:
        return '💳 Card';
    }
  }
}