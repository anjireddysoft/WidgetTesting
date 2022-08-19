class Album {
  int? id;
  int? userId;
  String? title;

  @override
  String toString() {
    return 'Album{id: $id, userId: $userId, title: $title}';
  }

  Album({this.id, this.userId, this.title});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    return data;
  }
}