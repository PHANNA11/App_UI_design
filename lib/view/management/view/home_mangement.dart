import 'package:design_ex/view/management/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeManagementScreen extends StatefulWidget {
  const HomeManagementScreen({super.key});

  @override
  State<HomeManagementScreen> createState() => _HomeManagementScreenState();
}

class _HomeManagementScreenState extends State<HomeManagementScreen> {
  List<StudentModel> listStudent = [
    StudentModel(
      id: 1,
      name: 'Thida',
      sex: 'F',
      subCpro: 60,
      subCplusplus: 78.5,
      subJava: 90,
      subFlutter: 89,
    ),
    StudentModel(
      id: 54,
      name: 'Kosal',
      sex: 'M',
      subCpro: 87,
      subCplusplus: 50.5,
      subJava: 50,
      subFlutter: 76,
    ),
    StudentModel(
      id: 87,
      name: 'Davy',
      sex: 'F',
      subCpro: 34,
      subCplusplus: 78.5,
      subJava: 90,
      subFlutter: 89,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management'),
      ),
      body: DataTable(
        columnSpacing: 15,
        // headingTextStyle:
        //     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('C')),
          DataColumn(label: Text('C++')),
          DataColumn(label: Text('Java')),
          DataColumn(label: Text('Flutter')),
          DataColumn(label: Text('Total'))
        ],
        rows: List.generate(
            listStudent.length,
            (index) => DataRow(
                  cells: [
                    DataCell(Text(listStudent[index].id.toString())),
                    DataCell(Text(listStudent[index].name)),
                    DataCell(
                        Text(listStudent[index].subCpro.toStringAsFixed(2))),
                    DataCell(Text(
                        listStudent[index].subCplusplus.toStringAsFixed(2))),
                    DataCell(
                        Text(listStudent[index].subJava.toStringAsFixed(2))),
                    DataCell(
                        Text(listStudent[index].subFlutter.toStringAsFixed(2))),
                    DataCell(Text(listStudent[index].total.toStringAsFixed(2))),
                  ],
                )),
      ),
    );
  }
}
