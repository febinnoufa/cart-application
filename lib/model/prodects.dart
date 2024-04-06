class Prodects {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;
  final Rating rating;

  Prodects({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Prodects.fromJson(Map<String, dynamic> json) {
    return Prodects(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: categoryFromString(json['category']),
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

enum Category {
  ELECTRONICS,
  JEWELRY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING
}

Category categoryFromString(String categoryString) {
  return Category.values.firstWhere((e) => e.toString().split('.').last.toUpperCase() == categoryString.toUpperCase());
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}