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

///*
// Не розумію що робити з contains з версією iOS від 16 версії. Тому обрав запропоновані xcodoм зміни - @available(iOS 16.0, *)
//*/
//var events: [Event] = []
//
//@available(iOS 16.0, *)
//func createDoubleSportEvent(athletes: [Athlete], date: String, title: String, place: Place, description: String) -> Event? {
//    let typeOfSport = athletes.enumerated().map( {$1.sport} )
//    let description = "The event type of \(typeOfSport[0]) with the participation of athletes \(athletes.enumerated().map( { "\($1.firstName) \($1.lastName)"}).joined(separator: " - ")) will be held on \(date) at \(place.name), the price of participation in the event is from \(place.priceFrom) to \(place.priceTo)."
//
//    if Set(typeOfSport).count == 1 && place.typeSport.contains(Set(typeOfSport)){
//        let event = DoublesSportEvent(athletes: athletes, typeOfSport: typeOfSport[0], title: title, description: description, date: date, place: place, currency: place.currency)
//        events.append(event)
//        return event
//    }
//
//    return nil
//}
//        
//
//
//
//@available(iOS 16.0, *)
//func createEvent(teams: [Team], date: String, title: String, place: Place, description: String) -> Event? {
//    let typeOfSport = teams.enumerated().map( {$1.sport} )
//    let description = "The event type of \(typeOfSport[0]) with the participation of teams \(teams.enumerated().map( { "\($1.name)"}).joined(separator: " - ")) will be held on \(date) at \(place.name), the price of participation in the event is from \(place.priceFrom) to \(place.priceTo)."
//   
//    if Set(typeOfSport).count == 1 && place.typeSport.contains(Set(typeOfSport)){
//        let event = TeamSportEvent(teams: teams, typeOfSport: typeOfSport[0], title: title, description: description, date: date, place: place, currency: place.currency)
//        events.append(event)
//        return event
//    }
//    
//    return nil
//}
//
//
//@available(iOS 16.0, *)
//let firstEvent = createEvent(teams:
//                [
//                    Team(name: "Manchester City", createYear: 1936, coach: "Patrick van Leeuwen", sport: .football, team:
//                            [
//                                Athlete(firstName: "Ivan", lastName: "Ivanenko", age: 29, citizenship: .Afghanistan, birthplace: .Albania, gender: .male, sport: .football, number: 20, icon: nil),
//                                Athlete(firstName: "Mykola", lastName: "Konotenko", age: 83, citizenship: .Ukraine, birthplace: .Afghanistan, gender: .male, sport: .basketball, number: 2, icon: nil)
//                            ], country: .UnitedKingdom, icon: UIImage(imageLiteralResourceName: "mcLogo")),
//                    Team(name: "Barcelona FC", createYear: 1912, coach: "Irina", sport: .football, team:
//                            [
//                                Athlete(firstName: "Dima", lastName: "Dimov", age: 89, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 18, icon: nil),
//                                Athlete(firstName: "Sasha", lastName: "Sashov", age: 37, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 19, icon: nil)
//                            ], country: .Spain, icon: UIImage(imageLiteralResourceName: "barcelonaLogo"))
//                ],
//            date: "Mon, March 23, 21",
//            title: "World Cup",
//            place: Place(name: "Donbass Arena", type: .stadium, contry: .Ukraine, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH), description: "Отбор")
//
//@available(iOS 16.0, *)
//let secondEvent = createEvent(teams:
//                [
//                    Team(name: "Paris Saint-Germain", createYear: 1936, coach: "Kate", sport: .football, team:
//                            [
//                                Athlete(firstName: "Ivan", lastName: "Ivanenko", age: 29, citizenship: .Afghanistan, birthplace: .Albania, gender: .male, sport: .football, number: 20, icon: nil),
//                                Athlete(firstName: "Mykola", lastName: "Konotenko", age: 83, citizenship: .Ukraine, birthplace: .Afghanistan, gender: .male, sport: .basketball, number: 2, icon: nil)
//                            ], country: .France, icon: UIImage(imageLiteralResourceName: "psgLogo")),
//                    Team(name: "Real Madrid", createYear: 1912, coach: "Viktor", sport: .football, team:
//                            [
//                                Athlete(firstName: "Dima", lastName: "Dimov", age: 89, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 18, icon: nil),
//                                Athlete(firstName: "Sasha", lastName: "Sashov", age: 37, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 19, icon: nil)
//                            ], country: .Spain, icon: UIImage(imageLiteralResourceName: "realLogo"))
//                ],
//            date: "Fri, Febr 24, 11",
//            title: "World Cup",
//            place: Place(name: "Wembley", type: .stadium, contry: .UnitedKingdom, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH), description: "Final")
//
//@available(iOS 16.0, *)
//let thirdEvent = createEvent(teams:
//                [
//                    Team(name: "Navi", createYear: 1936, coach: "Vasiliy", sport: .cybersport, team:
//                            [
//                                Athlete(firstName: "Ivan", lastName: "Ivanenko", age: 29, citizenship: .Afghanistan, birthplace: .Albania, gender: .male, sport: .football, number: 20, icon: nil),
//                                Athlete(firstName: "Mykola", lastName: "Konotenko", age: 83, citizenship: .Ukraine, birthplace: .Afghanistan, gender: .male, sport: .basketball, number: 2, icon: nil)
//                            ], country: .Ukraine, icon: UIImage(imageLiteralResourceName: "naviLogo")),
//                    Team(name: "Virtus pro", createYear: 1912, coach: "Sasha", sport: .cybersport, team:
//                            [
//                                Athlete(firstName: "Dima", lastName: "Dimov", age: 89, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 18, icon: nil),
//                                Athlete(firstName: "Sasha", lastName: "Sashov", age: 37, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 19, icon: nil)
//                            ], country: .Other, icon: UIImage(imageLiteralResourceName: "virtusproLogo"))
//                ],
//            date: "Wed, Jan 24, 01",
//            title: "World Cyber Cup",
//                             place: OnlinePlace(urlAdress: "www.game.com", language: [.English], name: "Game.com", type: .internet, contry: .UnitedStates, maxSpectatorsCount: 1000, typeSport: [.cybersport], priceFrom: 100, priceTo: 1000, currency: .USD),
//                             description: "1/4 Final")
//
//@available(iOS 16.0, *)
//let fourthEvent = createDoubleSportEvent(athletes:
//                            [
//                                Athlete(firstName: "Novak", lastName: "Djokovic", age: 29, citizenship: .Spain, birthplace: .Spain, gender: .male, sport: .tennis, number: nil, icon: UIImage(imageLiteralResourceName: "djokovicLogo")),
//                                Athlete(firstName: "Rafael", lastName: "Nadal ", age: 40, citizenship: .Serbia, birthplace: .Serbia, gender: .male, sport: .tennis, number: nil, icon: UIImage(imageLiteralResourceName: "nadaleLogo")),
//                            ],
//                            date: "Mon, Jul 24, 12",
//                            title: "World Cup",
//                            place: Place(name: "Arthur Ashe Stadium", type: .stadium, contry: .UnitedStates, maxSpectatorsCount: 10000, typeSport: [.tennis, .volleyball], priceFrom: 100, priceTo: 3000, currency: .USD), description: "Friendly game")




