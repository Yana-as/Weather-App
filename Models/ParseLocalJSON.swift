//
//  ParseLocalJSON.swift
//  Weather Map
//
//  Created by Yana on 14.09.2020.
//

import Foundation

class LocalJsonParser {
    
    func getData() {
     
        guard let mainUrl = Bundle.main.url(forResource: "countriesToCities", withExtension: "json") else { return }
        decodeData(pathName: mainUrl)
    }
    
    func decodeData(pathName: URL) -> CityList?{
        
        let decoder = JSONDecoder()
        
        do{
            let jsonData = try Data(contentsOf: pathName)
            let cityListData = try decoder.decode(CityListData.self, from: jsonData)
            guard let cityList = CityList(cityListData: cityListData) else {
                return nil
            }
            return cityList
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
