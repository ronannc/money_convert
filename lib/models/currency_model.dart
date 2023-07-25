class Currency{
  final String fromCurrency;
  final String toCurrency;
  final String name;
  final String high;
  final String low;
  final String bidVariation;
  final String percentageChange;
  final String bidPrice;
  final String askPrice;
  final String updatedAtTimestamp;
  final String updatedAtDate;

  Currency({
    required this.fromCurrency,
    required this.toCurrency,
    required this.name,
    required this.high,
    required this.low,
    required this.bidVariation,
    required this.percentageChange,
    required this.bidPrice,
    required this.askPrice,
    required this.updatedAtTimestamp,
    required this.updatedAtDate,
  });

  factory Currency.fromJson(Map<String, dynamic> json){
    return Currency(
        fromCurrency: json['fromCurrency'],
        toCurrency: json['toCurrency'],
        name: json['name'],
        high: json['high'],
        low: json['low'],
        bidVariation: json['bidVariation'],
        percentageChange: json['percentageChange'],
        bidPrice: json['bidPrice'],
        askPrice: json['askPrice'],
        updatedAtTimestamp: json['updatedAtTimestamp'],
        updatedAtDate: json['updatedAtDate'],

    );
  }
}