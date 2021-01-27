
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

  Rating.fromMap(Map json){
    beerId = json['beer'];
    rating = json['score'] != null ? json['score'] * 5: null;
    sweetness = (json['sweetness'] != null) ? json['sweetness'] * 100: null;
    dryness = (json['dryness'] != null) ? json['dryness'] * 100 : null;
    sourness = (json['sour'] != null) ? json['sour'] * 100 : null;
    bitterness = (json['bitterness'] != null) ? json['bitterness'] * 100: null;
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
      'score': (rating != null) ? rating/5: null,
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