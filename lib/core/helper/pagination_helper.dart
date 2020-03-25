abstract class PaginationHelper {
  static final int itemRequestThreshold = 10;
  static final int createdNewItemRequestThreshold = 2;

  void handleItemCreated(int index);

  void showLoadingIndicator();

  void removeLoadingIndicator();

  Future initiateDataFetching();
}
