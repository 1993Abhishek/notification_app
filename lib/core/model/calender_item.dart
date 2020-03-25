

class CalenderItem {
  int weekDay;
  String weekDate;
  String date;
  bool isSelected;
  bool isDisable;

  CalenderItem(
      { this.weekDay, this.weekDate, this.isSelected = false, this.isDisable = false, this.date});

  @override
  String toString() {
    return 'CalenderItem{weekName: $weekDay, weekDate: $weekDate ,isSelected : $isSelected,date: $date}';
  }


}
