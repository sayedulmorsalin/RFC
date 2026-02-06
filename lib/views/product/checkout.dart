import 'package:flutter/material.dart';
import 'package:rfc/components/button.dart';
import 'package:rfc/components/textfield.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _noteController = TextEditingController();

  String _paymentMethod = 'Cash on Delivery';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle(context, 'Delivery Details'),
              const SizedBox(height: 12),
              CustomTextField(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                controller: _nameController,
                prefixIcon: Icons.person,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                labelText: 'Phone',
                hintText: 'Enter your phone number',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                labelText: 'Address',
                hintText: 'Street, city, zip code',
                controller: _addressController,
                prefixIcon: Icons.location_on,
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                labelText: 'Note (Optional)',
                hintText: 'Any instructions for delivery',
                controller: _noteController,
                prefixIcon: Icons.sticky_note_2,
                maxLines: 2,
              ),
              const SizedBox(height: 24),

              _buildSectionTitle(context, 'Payment Method'),
              const SizedBox(height: 12),
              _buildPaymentTile(context, 'Cash on Delivery', Icons.payments_outlined),
              _buildPaymentTile(context, 'Card', Icons.credit_card),
              _buildPaymentTile(context, 'Wallet', Icons.account_balance_wallet_outlined),
              const SizedBox(height: 24),

              _buildSectionTitle(context, 'Order Summary'),
              const SizedBox(height: 12),
              _buildSummaryCard(context),
              const SizedBox(height: 24),

              CustomButton(
                label: 'Place Order',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Order placed successfully')),
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              Text(
                'By placing this order, you agree to our terms.',
                textAlign: TextAlign.center,
                style: TextStyle(color: scheme.onBackground.withOpacity(0.6), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPaymentTile(BuildContext context, String label, IconData icon) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool selected = _paymentMethod == label;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? scheme.primary : scheme.onSurface.withOpacity(0.2),
          width: selected ? 2 : 1,
        ),
      ),
      child: RadioListTile<String>(
        value: label,
        groupValue: _paymentMethod,
        activeColor: scheme.primary,
        onChanged: (value) {
          if (value == null) return;
          setState(() {
            _paymentMethod = value;
          });
        },
        title: Text(label, style: TextStyle(color: scheme.onSurface)),
        secondary: Icon(icon, color: scheme.onSurface),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    const double subtotal = 24.97;
    const double delivery = 5.00;
    const double total = subtotal + delivery;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _summaryRow(context, 'Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _summaryRow(context, 'Delivery Fee', '\$${delivery.toStringAsFixed(2)}'),
          const Divider(height: 24),
          _summaryRow(
            context,
            'Total',
            '\$${total.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(BuildContext context, String label, String value, {bool isTotal = false}) {
    final TextStyle? base = Theme.of(context).textTheme.bodyLarge;
    final TextStyle? style = base?.copyWith(
      fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
      fontSize: isTotal ? 18 : 16,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }
}
