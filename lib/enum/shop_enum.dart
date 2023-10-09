enum EnumProductSort {
  discount,
  sortByName,
  lowerToUpperPrice,
  upperToLowerPrice,
  bestSelling,
}

extension EnumProductSortPatternMatch on EnumProductSort {
  String get value {
    switch (this) {
      case EnumProductSort.bestSelling:
        return 'best_selling';
      case EnumProductSort.discount:
        return 'discount';
      case EnumProductSort.sortByName:
        // TODO: Handle this case.
        return 'sort_by_name';
      case EnumProductSort.lowerToUpperPrice:
        // TODO: Handle this case.
        return 'lower_to_upper_price';
      case EnumProductSort.upperToLowerPrice:
        // TODO: Handle this case.
        return 'upper_to_lower_price';
    }
  }
}

extension EnumProductSortDisplayPatternMatch on EnumProductSort {
  String get display {
    switch (this) {
      case EnumProductSort.bestSelling:
        return 'Best selling';
      case EnumProductSort.discount:
        return 'Discount';
      case EnumProductSort.sortByName:
        // TODO: Handle this case.
        return 'Sort by Name';
      case EnumProductSort.lowerToUpperPrice:
        // TODO: Handle this case.
        return 'Lower to Upper price';
      case EnumProductSort.upperToLowerPrice:
        // TODO: Handle this case.
        return 'Upper to Lower Price';
    }
  }
}
