import Foundation

public class DateParser {
   /**
    * Returns relative time like: 2y, 11m, 3w, 4h, 2d, 5m,  3sec (aka: time ago)
    * NOTE: the approche bellow is Naive. There are more elegant ways of doing this. But this offers more customization in the future (It has been upgraded, may need additional testing)
    * EXAMPLE: try? DateParser.relativeTime(from:NSDate(),to:today.offsetByDays(-3))//Output: [(3,"d")] // "\(String(relativeTime.value) + relativeTime.type.rawValue.full)" 3day
    */
   public static func relativeTime(from: Date, to: Date)  -> [(value: Int, type: DateType)] {
      let yearsAgo: Int = numOfYears(from, to: to)
      let monthsAgo: Int = numOfMonths(from, to: to)
      let daysAgo: Int = numOfDays(from, to: to)
      let hoursAgo: Int = numOfHours(from, to: to)
      let minutesAgo: Int = numOfMinutes(from, to: to)
      let secondsAgo: Int = numOfSeconds(from, to: to)
      let weeksAgo: Int = daysAgo >= 7 ? daysAgo / 7 : 0
      let timeUnits: [(value: Int, type: DateType)] = [(yearsAgo, DateType.y), (monthsAgo, DateType.M), (weeksAgo, DateType.w), (daysAgo, DateType.d), (hoursAgo, DateType.h), (minutesAgo, DateType.m), (secondsAgo, DateType.s)]
      return timeUnits.filter {
         $0.value > 0
      }
   }
   /**
    * Returns a date formated like: 201612035959 aka YYYYMMDDHHMMSS
    * NOTE: The purpouse of this method is to provide an easy way to sort dates (as this format is as sortable as it gets)
    * TRIVIA: The name of this time format: ODBC canonical (some argue it's the ISO 8601 format)
    * TRIVIA: The name descendingDate is a name that describes what the format does. It is not the official name (alt: chronologically descending)
    * NOTE: the reverse is: let formatter = DateFormatter();formatter.dateFormat = "yyyyMMddhhmmss";let dateStr:String =  sortedSections[section];let date = formatter.date(from: dateStr)
    */
   public static func descendingDate(_ date: Date) -> String {
      let formatter: DateFormatter = .init()
      formatter.dateFormat = "yyyyMMddHHmmss"
      let dateStr: String = formatter.string(from: date)
      return dateStr
   }
   /**
    * Returns a date instance for time components like: 2016,11,03,15,49,59
    * - IMPORTANT: ⚠️️⚠️️⚠️️ if you pass 0 in any of the arguments the returned date is all wrong, use nil and make sure your var is not 0
    * - Fixme: ⚠️️ should throw
    */
   public static func createDate(_ year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date? {
      if year == 0 || month == 0 || day == 0 {//this may not apply to hour,min,sec so these arent tested
         fatalError("can't be 0")
      }
      let calendar = Calendar.current
      var components = DateComponents()
      if let year = year { components.year = year }
      if let month = month { components.month = month }
      if let day = day { components.day = day }
      if let hour = hour { components.hour = hour }
      if let minute = minute { components.minute = minute }
      if let second = second { components.second = second }
      return calendar.date(from: components)
   }
   /**
    * NOTE: there are also other date styles aviable: MediumStyle, FullStyle, NoStyle, ShortStyle, LongStyle, "EEEE"
    * NOTE: some date style examples: convertedDate: Thursday, 8 December 2016 convertedDate: 8 Dec 2016 convertedDate: 08/12/2016 convertedDate: Thursday
    * EXAMPLE: NSDate().shortDate// outputs: 08/12/2016
    * - Fixme: ⚠️️ move into DateParser
    */
   public static func shortDate(_ date: Date) -> String {// Fixme: move the content bellow into DateParser
      let dateFormatter = DateFormatter()
      dateFormatter.locale = NSLocale.current
      dateFormatter.dateStyle = .short//swift 3 -> was: dateFormatter.style.short
      let convertedDate = dateFormatter.string(from: date)
      return convertedDate
   }
   /**
    * - Fixme: This can be done with a formater. Replace it with this in the future
    */
   public static func simpleDate(_ date: Date) -> String {
      let year: String = .init(date.year)
      let month: String = .init(date.month)
      let day: String = .init(date.day)
      return "\(year)/\(month)/\(day)"
   }
   public static func monthName(_ date: Date) -> String? {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMMM"
      return dateFormatter.string(from: date)
   }
   /**
    * Returns m,t,w,t,f,s,s for date
    */
   public static func shortDayName(_ date: Date) -> String {
      if let dayName = date.dayName, let first = String(dayName).first {
         return String(first)
      } else { return "" }//Fixme: ⚠️️ return nil instead?
   }
   /**
    * Returns Mon,Tue,Wed
    */
   public static func semiShortDayName(_ date: Date) -> String? {
      if let dayName: String = date.dayName {
         let str: String = StringParser.subStr(dayName, 0, 3)
         return str
      }else {
         return nil
      }
   }
   /**
    * Jan, Feb, Mar etc
    */
   public static func shortMonthName(_ date: Date) -> String {
      return date.monthName != nil ? String(date.monthName!.subStr(0, 3)) : ""
   }
   public static func dayName(_ date: Date) -> String? {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "EEEE"
      return dateFormatter.string(from: date)
   }
   /**
    * NOTE: there is also days.location,days.length,range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
    */
   public static func numOfDaysInMonth(_ date: Date) -> Int? {
      let cal = Calendar.current
      guard let days = cal.range(of: .day, in: .month, for: date) else { return nil }
      let length: Int = days.upperBound - days.lowerBound
      return length
   }
   /**
    * Seconds
    */
   public static func numOfSeconds(_ from: Date, to: Date) -> Int {
      let num: Int? = Calendar.current.dateComponents([.second], from: from, to: to).second
      return num ?? 0
   }
   /**
    * Minutes
    */
   public static func numOfMinutes(_ from: Date, to: Date) -> Int {
      let num: Int? = Calendar.current.dateComponents([.minute], from: from, to: to).minute
      return num ?? 0
   }
   /**
    * Hours
    */
   public static func numOfHours(_ from: Date, to: Date) -> Int {
      let num: Int? = Calendar.current.dateComponents([.hour], from: from, to: to).hour
      return num ?? 0
   }
   public static func numOfDays(_ from: Date, to: Date) -> Int {
      let num: Int? = Calendar.current.dateComponents([.day], from: from, to: to).day
      return num ?? 0
   }
   /**
    * Returns number of months between two dates
    */
   public static func numOfMonths(_ from: Date, to: Date) -> Int {
      let num: Int? = Calendar.current.dateComponents([.month], from: from, to: to).month
      return num ?? 0
   }
   /**
    * ## EXAMPLES:
    * let from:Date = DateParser.createDate(2011)!
    * let until:Date = from.offsetByMonths(25)
    * from.numOfYears(until)//2
    */
   public static func numOfYears(_ from: Date, to: Date) -> Int {
      let num: Int? = Calendar.current.dateComponents([.year], from: from, to: to).year
      return num ?? 0
   }
   /**
    * ## EXAMPLES:
    * date("2018-05-01T18:38:43.162Z", format:"yyyy-MM-dd'T'HH:mm:ss.SSSz") //2018-05-01 18:38:43 +0000
    * Format-example: 2018-05-01T18:38:43.162Z (ISO 8601) (standard json)
    * Format: 2018-05-01T18:38:43.162Z -> "Y-MM-dd'T'HH:mm:ssZ"
    * Z - indicates that the time value is the time in Greenwich, England, or UTC time.
    */
   public static func date(_ dateStr: String, format: String) -> Date? {
      let formatter = DateFormatter()
      formatter.dateFormat = format
      let date = formatter.date(from: dateStr)
      return date
   }
   /**
    * Converts seconds into a more readable time format
    * - Note: Very useful when used when performance testing with: abs(startTime.timeIntervalSinceNow)
    * ## Examples:
    * time(secs:5275.3535753853)//01:27:55
    */
   static func time(secs: Double) -> String {
      let seconds: Int = .init(secs) % 60
      let minutes: Int = .init(secs / 60) % 60
      let hours: Int = .init(secs / (60 * 60))
      return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
   }
}

extension DateParser {
   /**
    * Used in the relativeDate method
    */
   public enum DateError: Error {
      case error(String)
   }
   /**
    * Used in the relativeDate method
    */
   public enum DateType: String {
      case y, M, w, d, h, m, s
      var full: String {
         switch self {
         case .y:
            return "year"
         case .M:
            return "month"
         case .w:
            return "week"
         case .d:
            return "day"
         case .h:
            return "hour"
         case .m:
            return "minute"
         case .s:
            return "second"
         }
      }
      /**
       * Minutes, Hours, Seconds etc
       */
      public func rich(value: Int) -> String {
         let isPlural: Bool = value > 1
         return isPlural ? self.full + "s" : self.full
      }
   }
}
fileprivate class StringParser {
   /**
    * substr("Hello from Paris, Texas!!!",11,15); // output: Paris, Texas!!!
    * - NOTE: ref: https://stackoverflow.com/a/39677704/5389500
    */
   static func subStr(_ str: String, _ beginning: Int, _ len: Int) -> String {
      //str.stringRange(str, beginning, len:len)
      let start = str.index(str.startIndex, offsetBy: beginning)
      let end = str.index(str.startIndex, offsetBy: beginning + len)
      let retVal = str[start..<end]//swift 4 upgrade, was: return str.substring(with:range)
      return String(retVal)
   }
}

extension String {
   fileprivate func subStr(_ i: Int, _ len: Int) -> String {/*Convenince*/
      return StringParser.subStr(self, i, len)
   }
}
