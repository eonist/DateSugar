import Foundation

extension YearMonth {
    /**
     * Returns: 2016'12
     */
    public static func yearMonthKey(year: Int, month: Int) -> Int {
        let monthStr: String = .init(format: "%02d", month) // StringParser.pad(value: month, padCount: 2, padStr: "0")
        let key = Int(String(year) + monthStr)!
        return key
    }
}
extension YearMonth {
    /**
     * Year
     * - IMPORTANT: ⚠️️ must be in this format: 2016'12
     */
    public static func year(ym: Int) -> Int {
        let year = String(ym).prefix(String(ym).count - 2)
        return Int(year)!
    }
    /**
     * Month
     * - IMPORTANT: ⚠️️ must be in this format: 2016'12
     */
    public static func month(ym: Int) -> Int {
        return Int(String(ym).suffix(2))! // .subString().int!
    }
}
