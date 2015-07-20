// Playground - noun: a place where people can play

import Foundation

let numberFormatter = NSNumberFormatter()

// Showing currency
numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
numberFormatter.stringFromNumber(23.42) // = "$23.42"

// Round to the nearest 0.5
numberFormatter.roundingIncrement = 0.5
numberFormatter.stringFromNumber(23.42) // = "$23.50"

numberFormatter.roundingIncrement = 0.0

// Showing numbers
numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
numberFormatter.stringFromNumber(2003.42) // = "2,003.42"

// Showing percentages
numberFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle
numberFormatter.stringFromNumber(0.95) // = "95%"

let energyFormatter = NSEnergyFormatter()

// Formats the value, given in joules; uses a specific unit
energyFormatter.stringFromValue(5000,
    unit: NSEnergyFormatterUnit.Kilojoule) // = "5,000 kJ"

// Formats the value, given in joules; automatically uses a locale-specific
// unit
energyFormatter.stringFromJoules(50000)
// = "11.95 kcal" if you're in the USA, "50 kJ" if you're
// in Australia

let massFormatter = NSMassFormatter()

// Formats the value, given in kilograms; uses a specific unit
massFormatter.stringFromValue(0.5,
    unit: NSMassFormatterUnit.Kilogram) // = "0.5 kg"

// Formats the value, given in meters; automatically uses a locale-specific
// unit
massFormatter.stringFromKilograms(0.5)
// = "1.1 lb" if you're in the USA, "500 g" if you're
// in Australia

let lengthFormatter = NSLengthFormatter()

// Formats the value, given in meters; uses a specific unit
lengthFormatter.stringFromValue(42.3,
    unit: NSLengthFormatterUnit.Meter) // = "42.3 m"

// Formats the value, given in meters; automatically uses a locale-specific
// unit
lengthFormatter.stringFromMeters(42.3)
// = "46.259 yd" in the USA, "42.3 m" in Australia

let dataFormatter = NSByteCountFormatter()

// Formats the value, given in bytes
dataFormatter.stringFromByteCount(200000) // = "200 KB"

// Count style can be changed; defaults to decimal (2,000 bytes = 2KB)
// Setting this to Binary makes it treat 2,048 = 2KB
dataFormatter.countStyle = NSByteCountFormatterCountStyle.Binary
dataFormatter.stringFromByteCount(200000) // = "195 KB"

// Also formats zero bytes intelligently, as a word
dataFormatter.stringFromByteCount(0) // = "Zero KB"


let dateFormatter = NSDateFormatter()

dateFormatter.dateStyle = .FullStyle
dateFormatter.timeStyle = .ShortStyle

dateFormatter.stringFromDate(NSDate())
// = "Sunday, 19 July 2015 3:46 pm"

dateFormatter.dateFormat = "yyyy.MM.dd"

dateFormatter.dateFromString("2015.10.24")

let components = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitHour, fromDate: NSDate())

components.year
 components.date

