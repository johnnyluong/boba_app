
//A database model class for the structure of a boba drink
class DrinkItem {
    final int id;
  final String name;
  final String source;
  final double price;
  final String date;
  final double volume; //in oz


  DrinkItem(
      {this.id, this.name, this.source, this.price, this.date, this.volume});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'source': source,
      'price': price,
      'date': date,
      'volume': volume,
    };
  }

  @override
  String toString() {
    return 'DrinkItem{id: $id, name: $name, source: $source, price: $price, date: $date, volume: $volume}';
  }
}
