import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/TimePointPrice.dart';
import '../data/timebalances.dart';

//SimpleTimeSeriesChart getChart(int timeScaleIndex){
//  List<TimePointPrice> filteredData = timeScaleFilter(timeScaleIndex);
//
//  List<charts.Series<TimePointPrice, DateTime>> prepedData = getTimeSeriesBalanceData(filteredData);
//
//  SimpleTimeSeriesChart chart = SimpleTimeSeriesChart(prepedData, animate: true,);
//
//  return chart;
//
//}
List<charts.Series<TimePointPrice, DateTime>> getDayBalance() {
  return [
    new charts.Series<TimePointPrice, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimePointPrice sales, _) => sales.time,
      measureFn: (TimePointPrice sales, _) => sales.sales,
      data: currentBalanceData.sublist(0,10),
    )
  ];
}
List<charts.Series<TimePointPrice, DateTime>> getMonthBalance() {
  return [
    new charts.Series<TimePointPrice, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimePointPrice sales, _) => sales.time,
      measureFn: (TimePointPrice sales, _) => sales.sales,
      data: currentBalanceData.sublist(0,20),
    )
  ];
}
List<charts.Series<TimePointPrice, DateTime>> getYearBalance() {
  return [
    new charts.Series<TimePointPrice, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimePointPrice sales, _) => sales.time,
      measureFn: (TimePointPrice sales, _) => sales.sales,
      data: currentBalanceData,
    )
  ];
}

class SimpleTimeSeriesChart extends StatelessWidget {
    

  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate = true});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimePointPrice, DateTime>> _createSampleData() {
    final data = [
      new TimePointPrice(new DateTime(2017, 9, 12), 15),
      new TimePointPrice(new DateTime(2017, 9, 19), 5),
      new TimePointPrice(new DateTime(2017, 9, 26), 25),
      new TimePointPrice(new DateTime(2017, 10, 3), 100),
      new TimePointPrice(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimePointPrice, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimePointPrice sales, _) => sales.time,
        measureFn: (TimePointPrice sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
