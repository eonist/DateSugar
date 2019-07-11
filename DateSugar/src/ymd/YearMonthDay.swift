import Foundation
/**
 * Makes it easier to work with Year,Month,Day. NDDate is overkill for year and month aritmetic, for day it is used to calc leap years etc
 * - NOTE: the drawback of making it hashable is that it's harder to debug the key so don't do it
 */
public typealias YMD = YearMonthDay
public struct YearMonthDay {
    public let year: Int, month: Int, day: Int
}
