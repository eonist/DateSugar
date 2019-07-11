import Foundation

//Accessors
extension YearMonthDay {
   public var date: Date? { return Date.createDate(self.year, month: self.month, day: self.day) }
   public var int: Int { return YMD.yearMonthDayKey(ymd: self) }
}
extension YearMonthDay {
    /**
     * Returns: 2016'12'24
     */
    public static func yearMonthDayKey(year: Int, month: Int, day: Int) -> Int {
        let yearMonthKey: Int = YM.yearMonthKey(year: year, month: month)
        let dayStr: String = .init(format: "%02d", day)//StringParser.pad(value: day, padCount: 2, padStr: "0")
        let key = Int((String(yearMonthKey) + dayStr))!
        return key
    }
    public static func yearMonthDayKey(ymd: YMD) -> Int {//convenience
        return yearMonthDayKey(year: ymd.year, month: ymd.month, day: ymd.day)
    }
}
//Utils
extension YearMonthDay {
    public static func ymd(ymd: Int) -> YMD {
        return .init(year: YMD.year(ymd: ymd), month: YMD.month(ymd: ymd), day: YMD.day(ymd: ymd))
    }
    /**
     * Year
     * - IMPORTANT: ⚠️️ must be in this format: 2016'12'24
     */
    public static func year(ymd: Int) -> Int {
      let year = Int(String(ymd).suffix(4))! //ymd.string.subString(0, ymd.string.count - 4).int!
      return year
    }
    /**
     * Month
     * - IMPORTANT: ⚠️️ must be in this format: 2016'12'24
     */
    public static func month(ymd: Int) -> Int {
        let start = String(ymd).index(String(ymd).endIndex, offsetBy: -4)
        let end = String(ymd).index(String(ymd).endIndex, offsetBy: -4)
        return Int(String(ymd)[start..<end])!//subString(ymd.string.count - 4, ymd.string.count - 2).int!
    }
    /**
     * Day
     * - IMPORTANT: ⚠️️ must be in this format: 2016'12'24
     */
    public static func day(ymd: Int) -> Int {
        return Int(String(ymd).suffix(2))!//.string.subString(ymd.string.count - 2, ymd.string.count).int!
    }
}
