//
//  CityList.swift
//  Weather Map
//
//  Created by Yana on 14.09.2020.
//

import Foundation

struct CityList {
    
    var cityNamesArr: [String] = []
    
    init?(cityListData: CityListData) {
        
        for (_ , cities) in cityListData.cityList {
            for city in cities {
                cityNamesArr.append(city)
            }
        }
    }
}
