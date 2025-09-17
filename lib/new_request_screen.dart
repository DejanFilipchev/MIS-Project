import 'package:flutter/material.dart';
import 'package:mis_project/request_model.dart';
import 'package:mis_project/request_storage.dart';
import 'package:table_calendar/table_calendar.dart';

class NewRequestScreen extends StatefulWidget {
  const NewRequestScreen({super.key});

  @override
  State<NewRequestScreen> createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _lessonController = TextEditingController();

  bool? _ukimProject;

  Map<String, bool> expenses = {
    "Неплатено": false,
    "Платено од други места": false,
    "Платено од сопствена картичка": false,
    "Платено ФИНКИ": false,
    "Друго": false,
    "Платено од проект на ФИНКИ": false,
    "Одмор": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset("assets/header.png", fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text("Изберете датум:", style: TextStyle(fontWeight: FontWeight.bold)),
                TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  rangeSelectionMode: _rangeSelectionMode,
                  onRangeSelected: (start, end, focusedDay) {
                    setState(() {
                      _rangeStart = start;
                      _rangeEnd = end;
                      _focusedDay = focusedDay;
                      _rangeSelectionMode = RangeSelectionMode.toggledOn;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Датум од: ${_rangeStart != null ? "${_rangeStart!.day}/${_rangeStart!.month}/${_rangeStart!.year}" : "-"}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Датум до: ${_rangeEnd != null ? "${_rangeEnd!.day}/${_rangeEnd!.month}/${_rangeEnd!.year}" : "-"}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const Text("Држава:"),
                TextField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Дополнете",
                  ),
                ),

                const SizedBox(height: 20),
                const Text("Причина за отсутство:"),
                TextField(
                  controller: _reasonController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Внесете причина...",
                  ),
                ),

                const SizedBox(height: 20),
                const Text("Трошоци:", style: TextStyle(fontWeight: FontWeight.bold)),
                Column(
                  children: expenses.keys.map((key) {
                    return CheckboxListTile(
                      title: Text(key),
                      value: expenses[key],
                      onChanged: (val) {
                        setState(() {
                          expenses[key] = val ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),
                const Text("Патувањето е од проект кој се води од УКИМ?", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text("Да"),
                        value: true,
                        groupValue: _ukimProject,
                        onChanged: (val) {
                          setState(() {
                            _ukimProject = val;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text("Не"),
                        value: false,
                        groupValue: _ukimProject,
                        onChanged: (val) {
                          setState(() {
                            _ukimProject = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const Text("Одвивање на настава за време на отсуството:", style: TextStyle(fontWeight: FontWeight.bold)),
                TextField(
                  controller: _lessonController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Внесете информации...",
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Откажи"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final newRequest = Request(
                          fromDate: _rangeStart,
                          toDate: _rangeEnd,
                          country: _countryController.text,
                          reason: _reasonController.text,
                          expenses: Map.from(expenses),
                          ukimProject: _ukimProject,
                          lessonInfo: _lessonController.text,
                        );

                        RequestStorage().addRequest(newRequest);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text("Потврди"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "© 2025 - Факултет за Информатички Науки и Компјутерско Инженерство",
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
