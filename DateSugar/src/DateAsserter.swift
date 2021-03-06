import Foundation

public class DateAsserter {
   /**
    * DateAsserter.isDate("17/01/12")//true
    */
   public static func isDate(dateStr: String) -> Bool {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yy/mm/dd"
      let date: Date? = dateFormatter.date(from: dateStr)
      let isValideDate: Bool = date != nil
      return isValideDate
   }
   /**
    * Asserts if a date is in the same hour
    */
   public static func assertHour(_ a: Date, with b: Date) -> Bool {
      return a.year == b.year && a.month == b.month && a.day == b.day && a.hour == b.hour
   }
   /**
    * Asserts if a date is in the same day
    */
   public static func assertDay(_ a: Date, with b: Date) -> Bool {
      return a.year == b.year && a.month == b.month && a.day == b.day
   }
}
