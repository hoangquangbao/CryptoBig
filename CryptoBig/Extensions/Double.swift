//
//  Double.swift
//  CryptoBig
//
//  Created by Quang Bao on 05/06/2022.
//

import Foundation

extension Double {

//MARK: 2 Decimals
        ///Converts a Double into a Currency with 2 decimal places
        ///```
        ///Convert 1234.56 to $1,234.56
        ///```
        private var currencyFormatter2: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            //formatter.locale = .current // <- default value
            //formatter.currencyCode = "usd" // <- change currency
            //formatter.currencySymbol = "$" // <- change currency symbol
            return formatter
        }
        
        ///Converts a Double into a Currency as a String with 2 decimal places
        ///```
        ///Convert 1234.56 to "$1,234.56"
        ///```
        func asCurrencyWith2Decimals() -> String {
            let number = NSNumber(value: self)
            return currencyFormatter2.string(from: number) ?? "$0.00"
        }
    
//MARK: 2-6 Decimals
//MARK: Định dạng một số thành kiểu đơn vị tiền tệ
    ///Converts a Double into a Currency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        //formatter.locale = .current // <- default value
        //formatter.currencyCode = "usd" // <- change currency
        //formatter.currencySymbol = "$" // <- change currency symbol
        return formatter
    }
    
//MARK: Ép kết quả trên thành kiểu String
    ///Converts a Double into a Currency as a String with 2-6 decimal places
    ///```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }

//MARK: Với giá trị %, ta chỉ lấy 2 số sau dấu thập phân
    ///Converts a Double into string representation
    ///```
    ///Convert 1.2345 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
//MARK: Thêm % symbol
    ///Converts a Double into string representation with percent symbol
    ///```
    ///Convert 1.2345 to "1.23%"
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
