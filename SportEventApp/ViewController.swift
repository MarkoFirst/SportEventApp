//
//  ViewController.swift
//  SportEventApp
//
//  Created by MF-Citrus on 25.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

/*
 Не розумію що робити з contains з версією iOS від 16 версії. Тому обрав запропоновані xcodoм зміни - @available(iOS 16.0, *)
*/

@available(iOS 16.0, *)
func createEvent(teams: [Team], date: String, title: String, place: Place, description: String) -> Event? {
    var typeOfSport = teams.enumerated().map( {$1.sport} )
    var description = "The event type of \(typeOfSport[0]) with the participation of teams \(teams.enumerated().map( { "\($1.name)"}).joined(separator: " - ")) will be held on \(date) at \(place.name), the price of participation in the event is from \(place.priceFrom) to \(place.priceTo)."
   
    if Set(typeOfSport).count == 1 && place.typeSport.contains(Set(typeOfSport)){
        return TeamSportEvent(teams: teams, typeOfSport: typeOfSport[0], title: title, description: description, date: date, place: place, currency: place.currency)
    }
    
    return nil
}
    


@available(iOS 16.0, *)
let fun = createEvent(teams:
                [
                    Team(name: "FC Shakhtar", createYear: 1936, coach: "Patrick van Leeuwen", sport: .football, team:
                            [
                                Athlete(firstName: "Ivan", lastName: "Ivanenko", age: 29, citizenship: .Afghanistan, birthplace: .Albania, gender: .male, sport: .football, number: 20),
                                Athlete(firstName: "Mykola", lastName: "Konotenko", age: 83, citizenship: .Ukraine, birthplace: .Afghanistan, gender: .male, sport: .basketball, number: 2)
                            ], country: .Ukraine),
                    Team(name: "Dynamo", createYear: 1912, coach: "Artem", sport: .football, team:
                            [
                                Athlete(firstName: "Dima", lastName: "Dimov", age: 89, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 18),
                                Athlete(firstName: "Sasha", lastName: "Sashov", age: 37, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 19)
                            ], country: .Ukraine)
                ],
            date: "12/12/2023",
            title: "World Cup",
            place: Place(name: "Donbass Arena", type: .stadium, contry: .Ukraine, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH), description: "Final")

