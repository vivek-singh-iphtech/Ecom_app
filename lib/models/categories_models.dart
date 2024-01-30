class Categories {
  final int id;
  final String title;
 

  Categories({
    required this.id,
    required this.title,
 
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      title: json['title'],
    );
  }
}

