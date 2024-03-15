import 'package:date_picker_timetable/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taskstore/controllers/taskController.dart';
import 'package:taskstore/models/taskModel.dart';
import 'package:taskstore/services/notificationsServicesPage.dart';
import 'package:taskstore/services/themeServicesPage.dart';
import 'package:taskstore/ui/addTaskPage.dart';
import 'package:taskstore/ui/themePage.dart';
import 'package:taskstore/ui/widgets/buttonPage.dart';
import 'package:taskstore/ui/widgets/taskTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(
        child: Obx(
      () => ListView.builder(
        itemCount: _taskController.taskList.length,
        itemBuilder: (_, index) {
          print(_taskController.taskList.length);
          // return GestureDetector(
          //   onTap: () {
          //     _taskController.delete(_taskController.taskList[index]);
          //     _taskController.getTasks();
          //   },
          return AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              child: FadeInAnimation(
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          // _taskController.delete(_taskController.taskList[index]);
                          // _taskController.getTasks();
                          _showBottomSheet(
                              context, _taskController.taskList[index]);
                        },
                        child: TaskTile(_taskController.taskList[index]))
                  ],
                ),
              ),
            ),
          );
          // );
        },
      ),
    ));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? darkGreyColor : Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? darkGreyColor : Colors.grey[300],
              ),
            ),
            Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: "Task Completed",
                    onTap: () {
                      // task.isCompleted = 1;
                      // _taskController.updateTask(task);
                      _taskController.markTaskCompleted(task.id!);
                      Get.back();
                    },
                    colorr: blueOreo,
                    context: context,
                  ),
            _bottomSheetButton(
              label: "Delete Task",
              onTap: () {
                // task.isCompleted = 1;
                // _taskController.updateTask(task);
                _taskController.delete(task);
                //_taskController.getTasks();
                Get.back();
              },
              colorr: Colors.red[100]!,
              context: context,
            ),
            SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
              label: "Close",
              onTap: () {
                // task.isCompleted = 1;
                // _taskController.updateTask(task);
                Get.back();
              },
              colorr: Colors.red[100]!,
              isClose: true,
              context: context,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color colorr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          // horizontal: 16,
          vertical: 4,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : colorr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : colorr,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
            // GoogleFonts.poppins(
            //   color: Colors.white,
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            // ),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Expanded(
      child: Column(
        children: [
          DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            locale: 'en_US', // Set locale to English (United States)
            initialSelectedDate: DateTime.now(),
            selectionColor: Theme.of(context).primaryColorDark,
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            dayTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            monthTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            onDateChange: (date) {
              _selectedDate = date;
            },
          ),
          // SizedBox(height: 5),
          // Text(
          //   'Selected Date: ${DateFormat.yMMMd().format(_selectedDate)}',
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          // ),
          // _showTasks(),
        ],
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: subTitleStyle1,
                ),
              ],
            ),
          ),
          MyButton(
            label: "Add",
            onTap: () async {
              await Get.to(() => AddTaskPage());
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
            // backgroundImage: AssetImage(
            //   'assets/images/4323015.png',
            // ),
            )
        // SizedBox(
        //   width: 20,
        // )
      ],
    );
  }
}
