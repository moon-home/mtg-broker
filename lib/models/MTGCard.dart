class MTGCard {
  String id;
  String name;
  String normalImageURL;
  double price;
  int amount;

  MTGCard({this.id, this.name, this.normalImageURL, this.price, this.amount=1});
  factory MTGCard.fromJson(Map<String, dynamic> json) {

    print('id: ${json['id']}');
    print('name: ${json['name']}');
    print('normalImageURL: ${json['image_uris']['normal']}');
    print('price: ${json['prices']['usd']}');
    print('-------------------------------------------');
    double p;
    try{
      p = double.parse(json['prices']['usd']);
    }catch(e){
      p=0;
    }
    print('p: $p');
    return MTGCard(
      id: json["id"] as String,
      name: json["name"] as String,
      normalImageURL: json["image_uris"]["normal"] as String,
      price:p,
      amount: 1,
    );
  }
//  factory MTGCard.fromJson(Map<String, dynamic> json) {
//    double p;
//    json["prices"]["usd"] == 'null'?p=0:p=double.parse(json["prices"]["usd"]);
//    print('price:');
//    print(json["prices"]["usd"]);
//    print(json["prices"]["usd"].runtimeType);
//    print(p);
//    return MTGCard(
//      id: json["id"] as String,
//      name: json["name"] as String,
//      normalImageURL: json["image_uris"]["normal"] as String,
//      price:p,
//      amount: 1,
//    );
//  }

}