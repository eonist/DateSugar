import Foundation

public typealias YM = YearMonth
public struct YearMonth {
   public let year: Int, month: Int
   public init(year: Int, month: Int) {
      self.year = year
      self.month = month
   }
}
