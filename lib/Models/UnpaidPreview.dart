class UnpaidBillPreview {
  String month, year;
  int amount;

  UnpaidBillPreview(this.month, this.year, this.amount);
}

class Post {
  int userId, id;
  String title, body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(dynamic json) {
   return Post(json['userId'] as int, json['id'] as int, json['title'] as String, json['body'] as String);
  }
}
