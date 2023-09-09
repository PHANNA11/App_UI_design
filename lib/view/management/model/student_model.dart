class StudentModel {
  late int id;
  late String name;
  late String sex;
  late double subCpro;
  late double subCplusplus;
  late double subJava;
  late double subFlutter;

  double get total => _getTotal();

  StudentModel({
    required this.id,
    required this.name,
    required this.sex,
    required this.subCpro,
    required this.subCplusplus,
    required this.subJava,
    required this.subFlutter,
  });
  double _getTotal() {
    return subCpro + subCplusplus + subJava + subCplusplus;
  }
}
