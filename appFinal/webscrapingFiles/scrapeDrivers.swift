//
//  scrapeDrivers.swift
//  appFinal
//
//  Created by Thea Yocum on 5/16/26.
//

import SwiftUI
import SwiftSoup

struct driverInfo: Hashable {
    var firstName: String
    var lastName: String
    var image: String
    var flag: String
    var carno: String
    var seasonPos: String
    var seasonPts: String
    var team: String
    var supportedBy: String
    var dob: String
    var bio: String
    var nationality: String
}


func scrapeDrivers(driverNo: String) async -> driverInfo? {
    
    @State var driverData = DriverData()
    
    let urlString = "https://www.f1academy.com/Racing-Series/Drivers/\(driverNo)/empty-string"
    
    print("Accessing the URL \(urlString)")
    
    //create a url from the URLstring
    guard let url = URL(string: urlString) else {
        print("ERROR: Could not create a URL from \(urlString)")
        return nil
    }
    
    //create a URLsession request
    let request = URLRequest(url: url)
    
    do {
        //create a data variable that holds the awaited for urldata
        let (data, _) = try await URLSession.shared.data(for: request)
        
        //create an html from the data
        guard let html = String(data: data, encoding: .utf8) else {
            print("SWIFTSOUP ERROR: Could not create html from url")
            return nil
        }
        
        //parse the html into a document with swift soup
        guard let myDocument = try? SwiftSoup.parse(html) else {
            print("SWIFTSOUP ERROR: Could not create html from url")
            return nil
        }
        
        //create the myDriver and fill with an empty driverInfo struct
        var myDriver = driverInfo(firstName: "", lastName: "", image: "", flag: "", carno: "", seasonPos: "", seasonPts: "", team: "", supportedBy: "", dob: "", bio: "", nationality: "")
        
        let name = "\(try! myDocument.select("div .f1-driver-detail--name").text())"
        let names = name.split(separator: " ")
        let firstName = "\(names[0])"
        let lastName = "\(names[1])"
        
        let image = "\(try! myDocument.select("div .f1-image--wrapper img").attr("data-src"))"
        let flag = "\(try! myDocument.select("div .common-driver-info--flag img").attr("data-src"))"
        let carno = "\(try! myDocument.select("div .common-driver-info--carnumber").text())"
        
        let posAndPts = "\(try! myDocument.select("div .driver-detail--inner-rank").text())"
        let splitPosAndPts = posAndPts.split(separator: " ")
        let seasonPos = "\(splitPosAndPts[0])"
        let seasonPts = "\(splitPosAndPts[1])"
        
        let team = "\(try! myDocument.select("div .driver-detail--cta-group a:eq(0) h2").text())"
        

        let supportedBy = "\(try! myDocument.select("div .common-driver-info driveretail-drivers--info ul li:eq(2) h4"))"
        let dob = "\(try! myDocument.select("div .common-driver-info driveretail-drivers--info ul li:eq(0) h4"))"
        let nationality = "\(try! myDocument.select("div .common-driver-info driveretail-drivers--info ul li:eq(1) h4"))"

        let bio = "\(try! myDocument.select("div .font-text-body p").text())"
        
        //update the myDriver with the scraped driverInfo
        myDriver = driverInfo(firstName: firstName, lastName: lastName, image: image, flag: flag, carno: carno, seasonPos: seasonPos, seasonPts: seasonPts, team: team, supportedBy: supportedBy, dob: dob, bio: bio, nationality: nationality)
        
        return myDriver
        
    } catch {
        print("ERROR: Could not get data from \(url)")
        return nil
    }
}
