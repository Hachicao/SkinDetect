class DiseaseModel {
  late String diseaseId;
  late String diseaseName;
  late String diseaseOverview;
  late String diseaseSymptom;
  late String diseaseCause;
  late String diseasePrevention;

  DiseaseModel({
    required this.diseaseId,
    required this.diseaseName,
    required this.diseaseOverview,
    required this.diseaseSymptom,
    required this.diseaseCause,
    required this.diseasePrevention,
  });
  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      diseaseId: json['diseased_Id'].toString(),
      diseaseName: json['diseased_name'].toString(),
      diseaseOverview: json['diseased_overview'].toString(),
      diseaseSymptom: json['diseased_symptom'].toString(),
      diseaseCause: json['diseased_causes'].toString(),
      diseasePrevention: json['diseased_prevention'].toString(),
    );
  }
}
