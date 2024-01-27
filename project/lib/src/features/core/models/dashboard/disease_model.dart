class DiseaseModel {
  String diseaseId;
  String diseaseName;
  String diseaseOverview;
  String diseaseSymptom;
  String diseaseCause;
  String diseasePrevention;
  List<String> imageURls;

  DiseaseModel({
    required this.diseaseId,
    required this.diseaseName,
    required this.diseaseOverview,
    required this.diseaseSymptom,
    required this.diseaseCause,
    required this.diseasePrevention,
    required this.imageURls,
  });
  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      diseaseId: json['diseased_Id'].toString(),
      diseaseName: json['diseased_name'].toString(),
      diseaseOverview: json['diseased_overview'].toString(),
      diseaseSymptom: json['diseased_symptom'].toString(),
      diseaseCause: json['diseased_causes'].toString(),
      diseasePrevention: json['diseased_prevention'].toString(),
      imageURls: List<String>.from(json['diseased_image_folder']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'diseased_Id': diseaseId,
      'diseased_name': diseaseName,
      'diseased_overview': diseaseOverview,
      'diseased_symptom': diseaseSymptom,
      'diseased_causes': diseaseCause,
      'diseased_prevention': diseasePrevention,
      'imageURls': imageURls,
    };
  }
}
