// import 'package:date_picker_timetable/date_picker_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:taskstore/services/notificationsServicesPage.dart';
// import 'package:taskstore/services/themeServicesPage.dart';
// import 'package:taskstore/ui/addTaskPage.dart';
// import 'package:taskstore/ui/themePage.dart';
// import 'package:taskstore/ui/widgets/buttonPage.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// class _HomePageState extends State<HomePage> {
//   DateTime _selectedDate  = DateTime.now();
//   var notifyHelper;
//   @override
//   void initState() {
//     super.initState();
//     notifyHelper = NotifyHelper();
//     notifyHelper.requestIOSPermissions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(),
//       body: Column(
//         children: [
//           _addTaskBar(),
//           _addDateBar(),
          
//         ],
//       ),
//     );
//   }
//   _addDateBar(){
//     return Expanded(
      
//       child: Column(
        
//         children: [
//           DatePicker(
            
//               DateTime.now(),
//               height:100,
//               width:80,
//               initialSelectedDate: DateTime.now(),
//               selectionColor: Theme.of(context).canvasColor,
//               selectedTextColor: Colors.white,
//               dateTextStyle: GoogleFonts.lato(
//                 textStyle: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//                 color: const Color.fromARGB(255, 0, 0, 0)
//               ),
//               ),
//               dayTextStyle: GoogleFonts.lato(
//                 textStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: const Color.fromARGB(255, 0, 0, 0)
//               ),
//               ),
//               monthTextStyle: GoogleFonts.lato(
//                 textStyle: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: const Color.fromARGB(255, 0, 0, 0)
//               ),
//               ),
//               onDateChange: (date){
//                 _selectedDate = date;
//               },
//             ),
//           Container(
//             margin: const EdgeInsets.only(top: 20,left: 20),
//             child: Text('Selected Date: $_selectedDate',
//           style: TextStyle(fontSize: 20),)
//           ),
//         ],
//       ),
//     );
//   }
//   _addTaskBar() {
//     return Container(
//       margin: EdgeInsets.only(left: 20, top: 10, right: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   DateFormat.yMMMd().format(DateTime.now()),
//                   style: subHeadingStyle,
//                 ),
//                 Text(
//                   "Today",
//                   style: subHeadingStyle,
//                 ),
//               ],
//             ),
//           ),
//           MyButton(label: "+ Add Task", onTap: () => Get.to(AddTaskPage()))
//         ],
//       ),
//     );
//   }
  

//   _appBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: context.theme.backgroundColor,
//       leading: GestureDetector(
//         onTap: () {
//           ThemeServices().switchTheme();
//         },
//         child: Icon(
//           Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
//           size: 20,
//           color: Get.isDarkMode ? Colors.white : Colors.black,
//         ),
//       ),
//       actions: [
//         CircleAvatar(
//             // backgroundImage: AssetImage(
//             //   'assets/images/4323015.png',
//             // ),
//             )
//         // SizedBox(
//         //   width: 20,
//         // )
//       ],
//     );
//   }
// }

// // class DatePicker {

// // }