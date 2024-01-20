import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  final List<Color> _randomColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.deepPurple,
    Colors.deepOrangeAccent,
    Colors.yellowAccent,
    Colors.indigo,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.mainGradientColor.withOpacity(0.1),
                  AppColors.white
                ],
              ),
            ),
            child: TableCalendar(
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTextStyles.black14Medium,
              ),
              daysOfWeekHeight: 30,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: AppColors.main.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: AppColors.main,
                  shape: BoxShape.circle,
                ),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              locale: 'ru',
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.blackOpacity65,
                    ),
                  ),
                ),
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: AppTextStyles.black16Regular.copyWith(
                  color: AppColors.blackOpacity65,
                ),
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(
                  () {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  },
                );
              },
            ),
          ),
          Gap(10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 76,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'ПН',
                            style: AppTextStyles.black16Regular,
                          ),
                          Text(
                            '25',
                            style: AppTextStyles.black20Bold,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Akademia",
                          style: AppTextStyles.black16Regular,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              _randomColors
                                  .elementAt(index % _randomColors.length)
                                  .withAlpha(70),
                              AppColors.white
                            ],
                          ),
                          boxShadow: const [
                            AppTheme.boxShadow,
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Gap(20),
        ],
      ),
    );
  }
}
