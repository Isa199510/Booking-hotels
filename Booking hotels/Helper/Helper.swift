//
//  Helper.swift
//  Booking hotels
//
//  Created by Иса on 23.12.2023.
//

import Foundation


func maskAPhoneNumber(_ phoneNumber: String) -> String {
    let regex = try! NSRegularExpression(pattern: "^\\d{3}\\d{3}\\d{4}$", options: [])
    return regex.stringByReplacingMatches(in: phoneNumber, options: [], range: NSRange(location: 0, length: phoneNumber.utf16.count), withTemplate: "***-***-$3")
}

func isValidEmail(_ email: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
    return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
}

func extractHashtag(_ string: String) -> [String] {
    let regex = try! NSRegularExpression(pattern: "#\\w+", options: [])
    let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
    return matches.map { match in
        (string as NSString).substring(with: match.range)
    }
}

func isValidPassword(_ password: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$", options: [])
    return regex.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.utf16.count)) != nil
}

extension String {
    func formatUserInput(pattern: String) -> String {
        var inputCollection = Array(self)
        var resultCollection: Array<Character> = []
        
        for i in 0 ..< pattern.count {
            let patternCharIndex = String.Index(utf16Offset: i, in: pattern)
            let patternChar = pattern[patternCharIndex]
            
            guard let nextInputChar = inputCollection.first else { break }
            
            if (patternChar == nextInputChar || patternChar == "*") {
                resultCollection.append(nextInputChar)
                inputCollection.removeFirst()
            } else {
                resultCollection.append(patternChar)
            }
        }
        return String(resultCollection)
    }
    
    func formatUserInput2() {
        let inputString = "My phone number is +1 (234) 567-89-00 and another number +7 (111) 222-33-44"
        let mask = "+7 (***) ***-**-**"
        let pattern = "\\+\\d{1,3} \\(\\d{3}\\) \\d{3}-\\d{2}-\\d{2}"
        
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let matches = regex.matches(in: inputString, options: [], range: NSRange(location: 0, length: inputString.utf16.count))
            
            for match in matches {
                let range = Range(match.range, in: inputString)!
                let matchText = inputString[range]
                print("Found: \(matchText)")
            }
        } catch {
            print("Regex error: \(error.localizedDescription)")
        }
    }
}
