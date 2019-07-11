import Foundation

extension Date {
   /**
    * Fixme: ⚠️️ Use explicit params
    */
   public static func createDate(_ year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date? {/*Convenience*/
      return DateParser.createDate(year, month: month, day: day, hour: hour, minute: minute, second: second)
   }
   public var numOfDaysInMonth: Int? {/*Convenience*/
      return DateParser.numOfDaysInMonth(self)
   }
   public var dayName: String? {/*Convenience*/
      return DateParser.dayName(self)
   }
   public var shortDayName: String {/*Convenience*/
      return DateParser.shortDayName(self)
   }
   public var monthName: String? {/*Convenience*/
      return DateParser.monthName(self)
   }
   public var shortMonthName: String {/*Convenience*/
      return DateParser.shortMonthName(self)
   }
   public var shortDate: String {/*Convenience*/
      return DateParser.shortDate(self)
   }
   public var simpleDate: String {/*Convenience*/
      return DateParser.simpleDate(self)
   }
   public func offsetByDays(_ days: Int) -> Date? {/*Convenience*/
      return DateModifier.offsetByDays(self, days: days)
   }
   public func offsetByMonths(_ months: Int) -> Date? {/*Convenience*/
      return DateModifier.offsetByMonths(self, months: months)
   }
   public func offsetByYears(_ years: Int) -> Date? {/*Convenience*/
      return DateModifier.offsetByYears(self, years: years)
   }
   public func numOfDays(_ until: Date) -> Int {/*Convenience*/
      return DateParser.numOfDays(self, to: until)
   }
   public func numOfMonths(_ until: Date) -> Int {/*Convenience*/
      return DateParser.numOfMonths(self, to: until)
   }
   public func numOfYears(_ until: Date) -> Int {/*Convenience*/
      return DateParser.numOfYears(self, to: until)
   }
   public var hour: Int { return Calendar.current.component(.hour, from: self) }
   public var day: Int { return Calendar.current.component(.day, from: self) }
   public var month: Int { return Calendar.current.component(.month, from: self) }
   public var year: Int { return Calendar.current.component(.year, from: self) }
   /**
    * let date = Date(); sleep(3); date.secsSinceStart//3.0
    */
   public var secsSinceStart: Double { return abs(self.timeIntervalSinceNow) }
}
