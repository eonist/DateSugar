import Foundation

public class TimeParser {
   /**
    * This method can offset a date with months.
    * Return year and month when offseting with n months
    * - IMPORTANT: ⚠️️ this approache won't work if you include day. Leap years etc. Use Date() and it's utils for that
    * - PARAM: offset: num of months to offset
    * ## EXAMPLES:
    * offset(year: 2016, month: 11, offset: 6)//(year: 2017, month: 5)
    * offset(year: 2016, month: 11, offset: 2)//(year: 2017, month: 1)
    * offset(year: 2016, month: 11, offset: 17)//(year: 2018, month: 4)
    */
   public static func offset(year: Int, month: Int, offset: Int) -> YM {
      let iteratableMonth: Int = month - 1/*we substract 1. Since we need to work with iteration from zero*/
      let monthCount: Int = iteratableMonth + offset
      let leftOverMonths = monthCount % 12
      let yearCount = (monthCount - leftOverMonths) / 12
      let y: Int = year + yearCount
      let m: Int = leftOverMonths + 1//convert from iteratable month to real month value. real month values go from 1 to 12
      return .init(year: y, month: m)
   }
   /**
    * Returns number of months between two dates
    * ## EXAMPLES:
    * TimeParser.numOfMonths(from: (year:2015,month:10), to: (year:2016,month:3))//5
    */
   public static func numOfMonths(from: YM, to: YM) -> Int {
      let numOfYears: Int = to.year - from.year
      let totNumOfMonths: Int = numOfYears * 12
      let begining: Int = totNumOfMonths - from.month
      let numOfMonths: Int = begining + to.month
      return numOfMonths
   }
}
