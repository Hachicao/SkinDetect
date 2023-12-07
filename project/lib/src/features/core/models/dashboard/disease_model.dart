class DiseaseModel {
  String diseaseId;
  String diseaseName;
  String diseaseOverview;
  String diseaseSymptom;
  String diseaseCause;
  String diseasePrevention;
  String diseasePhoto1;
  String diseasePhoto2;
  String diseasePhoto3;
  String diseasePhoto4;

  DiseaseModel({
    required this.diseaseId,
    required this.diseaseName,
    required this.diseaseOverview,
    required this.diseaseSymptom,
    required this.diseaseCause,
    required this.diseasePrevention,
    required this.diseasePhoto1,
    required this.diseasePhoto2,
    required this.diseasePhoto3,
    required this.diseasePhoto4,
  });
  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      diseaseId: json['diseased_Id'].toString(),
      diseaseName: json['diseased_name'].toString(),
      diseaseOverview: json['diseased_overview'].toString(),
      diseaseSymptom: json['diseased_symptom'].toString(),
      diseaseCause: json['diseased_causes'].toString(),
      diseasePrevention: json['diseased_prevention'].toString(),
      diseasePhoto1: json['disease_photo_1'].toString(),
      diseasePhoto2: json['disease_photo_2'].toString(),
      diseasePhoto3: json['disease_photo_3'].toString(),
      diseasePhoto4: json['diseased_photo_4'].toString(),
    );
  }
}
