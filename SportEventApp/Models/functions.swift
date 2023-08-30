//
//  functions.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation


func createEvent(teams: [Team], place: String, description: String ) -> Event {
    var event = Event(eventName: "Чемпионат", date: "20.08.2023", location: "Италия", type: .match, typeSport: .football)
    
    return event
}


let dinamo = Team(players: ["Андрей Ярмоленко", "Артем Беседин"], coach:"Мирча Луческу", replacementPlayer: "витя", teamName: "Динамо", dateCreate: 1927, equipment: .football, typeSport: .football, numberOfSpectators: 42131)

let manchesterCity = Team(players: ["Солли Марч", "Бриан Мбемо"], coach: "Хосеп Гвардиола", replacementPlayer: "анатолий", teamName: "Манчестер Сити", dateCreate: 1894, equipment: .football, typeSport: .football, numberOfSpectators: 42423)


let resultForEvent = createEvent(teams: [dinamo, manchesterCity],  place: "Стадион,Италия", description: "Величайший матч в Истории")



