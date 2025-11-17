class msgListModel {
  String? image;
  String? tittle;
  String? subtittle;

  msgListModel({this.image, this.tittle, this.subtittle});

  msgListModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    tittle = json['tittle'];
    subtittle = json['subtittle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['tittle'] = this.tittle;
    data['subtittle'] = this.subtittle;
    return data;
  }
}