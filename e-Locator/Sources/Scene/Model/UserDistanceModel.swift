//
//  UnitDistanceModel.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

struct UserDistanceModel {
    let name: String
    let image: UIImage?
    let distanceDescription: String
    
    static func getModel() -> [UserDistanceModel] {
        return [
            UserDistanceModel(name: "Аркадий", image: UIImage(named: "Аркадий"), distanceDescription: "11 км от Вас"),
            UserDistanceModel(name: "Артур", image: UIImage(named: "Артур"), distanceDescription: "10 км от Вас"),
            UserDistanceModel(name: "Виктор", image: UIImage(named: "Виктор"), distanceDescription: "12 км от Вас"),
            UserDistanceModel(name: "Григорий", image: UIImage(named: "Григорий"), distanceDescription: "50 км от Вас"),
            UserDistanceModel(name: "Джиленхол", image: UIImage(named: "Джиленхол"), distanceDescription: "232 км от Вас"),
            UserDistanceModel(name: "Джон", image: UIImage(named: "Джон"), distanceDescription: "430 км от Вас"),
            UserDistanceModel(name: "Евгений", image: UIImage(named: "Евгений"), distanceDescription: "400 км от Вас"),
            UserDistanceModel(name: "Егор", image: UIImage(named: "Егор"), distanceDescription: "20 м от Вас"),
            UserDistanceModel(name: "Лена", image: UIImage(named: "Лена"), distanceDescription: "1 км от Вас"),
            UserDistanceModel(name: "Лида", image: UIImage(named: "Лида"), distanceDescription: "1333 км от Вас"),
            UserDistanceModel(name: "Маша", image: UIImage(named: "Маша"), distanceDescription: "512 км от Вас"),
            UserDistanceModel(name: "Настя", image: UIImage(named: "Настя"), distanceDescription: "43 км от Вас"),
            UserDistanceModel(name: "Никита", image: UIImage(named: "Никита"), distanceDescription: "12 км от Вас"),
            UserDistanceModel(name: "Нюша", image: UIImage(named: "Нюша"), distanceDescription: "20 км от Вас"),
            UserDistanceModel(name: "Обама", image: UIImage(named: "Обама"), distanceDescription: "500 км от Вас"),
            UserDistanceModel(name: "Олег", image: UIImage(named: "Олег"), distanceDescription: "14 км от Вас"),
            UserDistanceModel(name: "Серега", image: UIImage(named: "Серега"), distanceDescription: "32 км от Вас"),
            UserDistanceModel(name: "Фархат", image: UIImage(named: "Фархат"), distanceDescription: "1500 км от Вас"),
            UserDistanceModel(name: "Человек Паук", image: UIImage(named: "Человек_паук"), distanceDescription: "15 км от Вас"),
            UserDistanceModel(name: "Ярослав", image: UIImage(named: "Ярослав"), distanceDescription: "10 км от Вас")
        ]
    }
}