//
//  MockUserLocationModel.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//
/*
 -23.634594, -46.721980
 -----------------------
 latitude: -23.640669, longtitude: -46.706594
 

 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 latitude: -12.067430, longtitude: -77.024038
 */


import Foundation

struct MockUserLocationModel: Codable {
    let name: String
    let imageName: String
    var latitude: Double
    var longtitude: Double
    
    static func getModel() -> [MockUserLocationModel] {
        return [
            MockUserLocationModel(name: "Аркадий", imageName: "Аркадий", latitude: -23.640669, longtitude: -46.706594),
            MockUserLocationModel(name: "Артур", imageName: "Артур", latitude: -34.615222, longtitude: -58.457506),
            MockUserLocationModel(name: "Виктор", imageName: "Виктор",  latitude: -22.841945, longtitude: -43.296876),
            MockUserLocationModel(name: "Григорий", imageName: "Григорий", latitude: -41.245552, longtitude: 174.794212),
            MockUserLocationModel(name: "Джиленхол", imageName: "Джиленхол", latitude: -41.245552, longtitude: 174.794212),
            MockUserLocationModel(name: "Джон", imageName: "Джон", latitude: 35.968122, longtitude: 139.948931),
            MockUserLocationModel(name: "Евгений", imageName: "Евгений", latitude: 40.359158, longtitude: -3.746477),
            MockUserLocationModel(name: "Егор", imageName: "Егор", latitude: 55.793432, longtitude: -4.235104),
            MockUserLocationModel(name: "Лена", imageName: "Лена", latitude: 28.576056, longtitude: 77.275326),
            MockUserLocationModel(name: "Лида", imageName: "Лида", latitude: 24.463345, longtitude: 54.384821),
            MockUserLocationModel(name: "Маша", imageName: "Маша", latitude: 26.167700, longtitude: -80.188399),
            MockUserLocationModel(name: "Настя", imageName: "Настя", latitude: 50.949156, longtitude: -114.047826),
            MockUserLocationModel(name: "Никита", imageName: "Никита", latitude: 31.353584, longtitude: 121.497928),
            MockUserLocationModel(name: "Нюша", imageName: "Нюша", latitude: 56.824370, longtitude: 60.603209),
            MockUserLocationModel(name: "Обама", imageName: "Обама", latitude: 35.192499, longtitude: 129.104031),
            MockUserLocationModel(name: "Олег", imageName: "Олег", latitude: -37.842344, longtitude: 144.749481),
            MockUserLocationModel(name: "Серега", imageName: "Серега", latitude: 40.734960, longtitude: -111.855668),
            MockUserLocationModel(name: "Фархат", imageName: "Фархат", latitude: 59.894137, longtitude: 30.426065),
            MockUserLocationModel(name: "Человек Паук", imageName: "Человек_паук", latitude: 40.464638, longtitude: 17.263752),
            MockUserLocationModel(name: "Ярослав", imageName: "Ярослав", latitude: 6.621085, longtitude: 3.339477)
        ]
    }
}
