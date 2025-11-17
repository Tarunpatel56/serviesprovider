import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:healthcare/home/Booking_confirmed.dart';
import 'package:healthcare/model/professional_model.dart';
import 'package:healthcare/utils/color_util.dart';

class PaymentPage extends StatefulWidget {
  final profList user;
  final String? from;
  final String provider;
  final String serviceName;
  final double consultationFee;
  final String date;
  final String time;

  const PaymentPage({
    super.key,
    required this.provider,
    required this.serviceName,
    required this.consultationFee,
    required this.date,
    required this.time,
    required this.user,
    this.from,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedMethod = 0;

  bool agreed = false;

  // Service Tax Logic
  double get serviceTax => widget.consultationFee * 0.09;
  double get totalAmount => widget.consultationFee + serviceTax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: agreed
              ? () {
                  Get.to(BookingConfirmed(user: widget.user, provider: widget.provider??'', serviceName: widget.provider??'', consultationFee: widget.consultationFee, date: widget.date??'', time:widget.time??'',));
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: agreed ? Colors.blue : Colors.grey.shade300,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(
            "Pay \$${totalAmount.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ), appBar: AppBar(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        actionsPadding: EdgeInsets.all(10),
        elevation: 10,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Payment\nComplete your booking",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         
            

              const SizedBox(height: 15),

              // Booking Summary
              const Text(
                "Booking Summary",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              summaryRow("Provider", widget.provider),
              summaryRow("Service", widget.serviceName),
              summaryRow("Date", widget.date),
              summaryRow("Time", widget.time),
              summaryRow("Consultation Fee", "\$${widget.consultationFee}"),
              summaryRow(
                "Service Tax (5%)",
                "\$${serviceTax.toStringAsFixed(2)}",
              ),
              summaryRow(
                "Total Amount",
                "\$${totalAmount.toStringAsFixed(2)}",
                isBlue: true,
              ),

              const SizedBox(height: 20),
              const Text(
                "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Payment Options
              paymentTile(0, Icons.credit_card, "Credit/Debit Card"),
              paymentTile(1, Icons.account_balance_wallet, "Digital Wallet"),
              paymentTile(2, Icons.phone_android, "UPI Payment"),

              const SizedBox(height: 20),

              if (selectedMethod == 0) buildCardForm(),

              if (selectedMethod == 1)
                Row(
                  children: [
                    Checkbox(
                      value: agreed,
                      onChanged: (v) => setState(() => agreed = v!),
                    ),
                    const Expanded(
                      child: Text(
                        "I agree to the cancellation and refund policy",
                      ),
                    ),
                  ],
                ),

              // UPI Input
              if (selectedMethod == 2) buildUPIInput(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget summaryRow(String title, String value, {bool isBlue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              color: isBlue ? Colors.blue : Colors.black,
              fontWeight: isBlue ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentTile(int index, IconData icon, String title) {
    bool isSelected = selectedMethod == index;

    return GestureDetector(
      onTap: () => setState(() => selectedMethod = index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
          color: isSelected ? Colors.blue.shade50 : Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
            if (isSelected) const Icon(Icons.check_circle, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget buildCardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Card Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        inputField("Card Number", "1234 5678 9012 3456"),
        Row(
          children: [
            Expanded(child: inputField("Expiry Date", "MM/YY")),
            const SizedBox(width: 10),
            Expanded(child: inputField("CVV", "123")),
          ],
        ),
        inputField("Cardholder Name", "John Doe"),
        Row(
          children: [
            Checkbox(
              value: agreed,
              onChanged: (v) => setState(() => agreed = v!),
            ),
            const Expanded(
              child: Text("I agree to the cancellation and refund policy"),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildUPIInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "UPI Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        inputField("UPI ID", "yourname@upi"),
        Row(
          children: [
            Checkbox(
              value: agreed,
              onChanged: (v) => setState(() => agreed = v!),
            ),
            const Expanded(
              child: Text("I agree to the cancellation and refund policy"),
            ),
          ],
        ),
      ],
    );
  }

  Widget inputField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
