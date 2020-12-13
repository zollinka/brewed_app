
class Rating{
  String beerId;
  double rating;
  double sweetness;
  double dryness;
  double sourness;
  double bitterness;
  String fruit;

  Rating(this.beerId);

  Rating.fromJson(Map json){
    beerId = json['beerId'];
    rating = json['rating'];
    sweetness = json['sweet'];
    dryness = json['dry'];
    sourness = json['sour'];
    bitterness = json['bitter'];
    fruit = json['fruit'];
  }

  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'beerId': beerId,
      'sweet': sweetness,
      'bitter':bitterness,
      'dry': dryness,
      'fruit': fruit,
      'sour': sourness,
    };}

  Map<String, dynamic> toJson(String userId) {
    return {
      'score': rating/5,
      'beer': beerId,
      'sweetness': (sweetness != null) ? sweetness/100: null,
      'bitterness':(bitterness!= null) ? bitterness/100: null,
      'dryness': (dryness!= null) ? dryness/100: null,
      'sour': (sourness!= null) ? sourness/100: null,
      'userIdentifier': userId
    };}

  static List<Rating> listFromJson(List<dynamic> responseBody){
    return responseBody.map<Rating>((json) => Rating.fromJson(json)).toList();
  }
}