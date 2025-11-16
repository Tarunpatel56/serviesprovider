import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/home/payment_page.dart';
import 'package:healthcare/model/professional_model.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
   final profList? user;
  final String? from;
  const BookingPage({Key? key, required this.user, this.from}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final List services = [
    {"title": "Regular Consultation", "subtitle": "30 min", "price": "\$40"},
    {"title": "Extended Consultation", "subtitle": "60 min", "price": "\$60"},
    {"title": "Follow-up Visit", "subtitle": "20 min", "price": "\$28"},
  ];

  int? selectedServiceIndex;
  DateTime? selectedDate;
  String? selectedTime;

  // TableCalendar state
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List morningSlots = ['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM'];

  final List afternoonSlots = [
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
  ];

  bool get canProceed =>
      selectedServiceIndex != null &&
      selectedDate != null &&
      selectedTime != null;

  @override
  void initState() {
    super.initState();
    _selectedDay = selectedDate ?? _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: canProceed
                  ? () {
                     final fee = double.parse(
  services[selectedServiceIndex!]['price']
      .toString()
      .replaceAll("\$", ""),
);

if (widget.user != null) {
  Get.to(
    PaymentPage(
      provider: widget.user?.tittle ?? '',
      serviceName: services[selectedServiceIndex!]['title'],
      consultationFee: fee,
      date: "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
      time: selectedTime!,
      user: widget.user!,
    ),
  );
}

                     
                       
                      
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: canProceed
                    ? Colors.blue
                    : Colors.grey.shade300,
                foregroundColor: canProceed
                    ? Colors.white
                    : Colors.grey.shade500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.headerBg,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // back button
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Book Appointment',
                    style: AppTextStyles.titleStyle.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                   widget.user?.tittle??'',
                    style: AppTextStyles.subtitleStyle.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      'Select Service',
                      style: AppTextStyles.titleStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 8),

                    // Services
                    Column(
                      children: List.generate(services.length, (index) {
                        final s = services[index];
                        final isSelected = selectedServiceIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedServiceIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue.shade50
                                  : Colors.white,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey.shade300,
                                width: isSelected ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        s['title']!,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        s['subtitle']!,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  s['price']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 12),

                    // Select Date header
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Select Date',
                          style: AppTextStyles.titleStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCalendar(
                          firstDay: DateTime.now().subtract(
                            const Duration(days: 365),
                          ),
                          lastDay: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                          focusedDay: _focusedDay,
                          enabledDayPredicate: (day) {
                            return !day.isBefore(
                              DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                              ),
                            );
                          },

                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                              selectedDate = selectedDay;
                              selectedTime = null;
                            });
                          },
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            leftChevronIcon: const Icon(Icons.chevron_left),
                            rightChevronIcon: const Icon(Icons.chevron_right),
                          ),
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              shape: BoxShape.circle,
                            ),
                            outsideDaysVisible: false,
                          ),
                          calendarBuilders: CalendarBuilders(
                            dowBuilder: (context, day) {
                              final text = [
                                'Sun',
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                              ][day.weekday % 7];
                              return Center(
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Select Time',
                          style: AppTextStyles.titleStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Text(
                      'Morning Slots',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: morningSlots.map((slot) {
                        final isSel = selectedTime == slot;
                        return ChoiceChip(
                          label: Text(
                            slot,
                            style: TextStyle(
                              color: isSel ? Colors.white : Colors.black87,
                            ),
                          ),
                          selected: isSel,
                          onSelected: (v) {
                            setState(() {
                              selectedTime = v ? slot : null;
                            });
                          },
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.grey.shade100,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: isSel ? Colors.blue : Colors.transparent,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 12),
                    Text(
                      'Afternoon Slots',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: afternoonSlots.map((slot) {
                        final isSel = selectedTime == slot;
                        return ChoiceChip(
                          label: Text(
                            slot,
                            style: TextStyle(
                              color: isSel ? Colors.white : Colors.black87,
                            ),
                          ),
                          selected: isSel,
                          onSelected: (v) {
                            setState(() {
                              selectedTime = v ? slot : null;
                            });
                          },
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.grey.shade100,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: isSel ? Colors.blue : Colors.transparent,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Additional Notes (Optional)',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add any special requirements or notes...',
                        fillColor: Colors.grey.shade50,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
