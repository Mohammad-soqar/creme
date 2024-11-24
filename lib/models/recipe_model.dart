class RecipeModel {
  final String title;
  final String chef;
  final int cookingTime; // in minutes
  final int preparationTime; // in minutes
  final List<String> ingredients; // list of ingredients
  final List<String> videoUrls; // list of video URLs

  RecipeModel({
    required this.title,
    required this.chef,
    required this.cookingTime,
    required this.preparationTime,
    required this.ingredients,
    required this.videoUrls,
  });

  // Derived property: Calculates total cooking time
  int get cookingOverallTime => cookingTime + preparationTime;

  // Factory constructor for JSON deserialization
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      title: json['title'] as String,
      chef: json['chef'] as String,
      cookingTime: json['cookingTime'] as int,
      preparationTime: json['preparationTime'] as int,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      videoUrls: List<String>.from(json['videoUrls'] ?? []),
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'chef': chef,
      'cookingTime': cookingTime,
      'preparationTime': preparationTime,
      'ingredients': ingredients,
      'videoUrls': videoUrls,
    };
  }

  // Helper method for pretty-printing the recipe
  @override
  String toString() {
    return '''
    Recipe: $title
    Chef: $chef
    Cooking Time: $cookingTime mins
    Preparation Time: $preparationTime mins
    Total Time: ${cookingOverallTime} mins
    Ingredients: ${ingredients.join(', ')}
    Videos: ${videoUrls.join(', ')}
    ''';
  }
}
