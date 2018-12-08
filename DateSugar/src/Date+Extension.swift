import Foundation

extension Date{
   /**
    * TODO: ⚠️️ Use explicit params
    */
   static func createDate(_ year:Int? = nil, month:Int? = nil, day:Int? = nil, hour:Int? = nil, minute:Int? = nil, second:Int? = nil)->Date?{/*Convenience*/
      return DateParser.createDate(year, month:month, day:day, hour:hour, minute:minute, second:second)
   }
   var numOfDaysInMonth:Int?{/*Convenience*/
      return DateParser.numOfDaysInMonth(self)
   }
   var dayName:String? {/*Convenience*/
      return DateParser.dayName(self)
   }
   var shortDayName:String{/*Convenience*/
      return DateParser.shortDayName(self)
   }
   var monthName:String? {/*Convenience*/
      return DateParser.monthName(self)
   }
   var shortMonthName:String{/*Convenience*/
      return DateParser.shortMonthName(self)
   }
   var shortDate:String{/*Convenience*/
      return DateParser.shortDate(self)
   }
   var simpleDate:String{/*Convenience*/
      return DateParser.simpleDate(self)
   }
   func offsetByDays(_ days:Int)->Date?{/*Convenience*/
      return DateModifier.offsetByDays(self,days: days)
   }
   func offsetByMonths(_ months:Int)->Date?{/*Convenience*/
      return DateModifier.offsetByMonths(self, months: months)
   }
   func offsetByYears(_ years:Int)->Date?{/*Convenience*/
      return DateModifier.offsetByYears(self, years: years)
   }
   func numOfDays(_ until:Date)->Int{/*Convenience*/
      return DateParser.numOfDays(self, to:until)
   }
   func numOfMonths(_ until:Date)->Int{/*Convenience*/
      return DateParser.numOfMonths(self, to:until)
   }
   func numOfYears(_ until:Date)->Int{/*Convenience*/
      return DateParser.numOfYears(self, to:until)
   }
   var hour:Int {return Calendar.current.component(.hour, from:self)}
   var day:Int {return Calendar.current.component(.day, from:self)}
   var month:Int {return Calendar.current.component(.month, from:self)}
   var year:Int {return Calendar.current.component(.year, from:self)}
   
   /**
    * let date = Date(); sleep(3); date.secsSinceStart//3.0
    */
   var secsSinceStart:Double{return abs(self.timeIntervalSinceNow)}
}


