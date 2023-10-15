//
//  RealmDB.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 10.10.2023.
//

import Foundation
import UIKit
import RealmSwift

class RealmDB {
    
    let realm = try! Realm()
    
    //Places
    lazy var donbassArena = Place(name: "Donbass Arena", type: .stadium, contry: .Ukraine, maxSpectatorsCount: 52187, typeSport: [TypeOfSport.football.rawValue, TypeOfSport.chess.rawValue, TypeOfSport.volleyball.rawValue], priceFrom: 100, priceTo: 3000, currency: .UAH, adress: "Chelyuskintsiv St, 189E, Donetsk, Donets'ka oblast")
    lazy var arturAsheStadium = Place(name: "Arthur Ashe Stadium", type: .stadium, contry: .UnitedStates, maxSpectatorsCount: 10000, typeSport: [TypeOfSport.tennis.rawValue, TypeOfSport.volleyball.rawValue], priceFrom: 100, priceTo: 3000, currency: .USD, adress: "Flushing Meadows-Corona Park, Queens, NY")
    lazy var campNou = Place(name: "Camp Nou", type: .stadium, contry: .Spain, maxSpectatorsCount: 99354, typeSport: [TypeOfSport.football.rawValue], priceFrom: 60, priceTo: 2500, currency: .EUR, adress: "C. Aristides Maillol, 12, 08028 Barcelona")
    lazy var gameWeb = Place(name: "Game Web Company", type: .internet, contry: .China, maxSpectatorsCount: 30000, typeSport: [TypeOfSport.cybersport.rawValue, TypeOfSport.poker.rawValue], priceFrom: 80, priceTo: 1500, currency: .CNY, adress: "game.web")
    lazy var datunSportsCenter = Place(name: "Datun Sports Center", type: .stadium, contry: .China, maxSpectatorsCount: 30000, typeSport: [TypeOfSport.football.rawValue, TypeOfSport.basketball.rawValue], priceFrom: 80, priceTo: 1500, currency: .CNY, adress: "Datun Rd, Chaoyang District, Beijing")
    lazy var tegelneField = Place(name: "Tegelne Field", type: .stadium, contry: .Germany, maxSpectatorsCount: 25000, typeSport: [TypeOfSport.football.rawValue], priceFrom: 60, priceTo: 1800, currency: .EUR, adress: "Tegelne Stadion, Berlin")
    lazy var newClarkCityArena = Place(name: "New Clark City Arena", type: .stadium, contry: .Philippines, maxSpectatorsCount: 35000, typeSport: [TypeOfSport.football.rawValue, TypeOfSport.volleyball.rawValue], priceFrom: 90, priceTo: 2200, currency: .USD, adress: "New Clark City, Capas, Tarlac")
    lazy var tottenhamStadium = Place(name: "Tottenham Stadium", type: .stadium, contry: .UnitedKingdom, maxSpectatorsCount: 60000, typeSport: [TypeOfSport.football.rawValue], priceFrom: 100, priceTo: 3000, currency: .GBP, adress: "782 High Rd, Tottenham, London N17 0BX")
    lazy var alJanoubStadium = Place(name: "Al Janoub Stadium", type: .stadium, contry: .Qatar, maxSpectatorsCount: 40000, typeSport: [TypeOfSport.football.rawValue], priceFrom: 120, priceTo: 2500, currency: .USD, adress: "Al Janoub, Al Wakrah")
    lazy var puskašArena = Place(name: "Puskás Arena", type: .stadium, contry: .Hungary, maxSpectatorsCount: 67000, typeSport: [TypeOfSport.football.rawValue], priceFrom: 110, priceTo: 2800, currency: .EUR, adress: "Olof Palme stny., 1146 Budapest")
    lazy var o2Arena = Place(name: "O2 Arena", type: .stadium, contry: .UnitedKingdom, maxSpectatorsCount: 20000, typeSport: [TypeOfSport.tennis.rawValue, TypeOfSport.volleyball.rawValue], priceFrom: 80, priceTo: 2600, currency: .GBP, adress: "Peninsula Square, Greenwich, London SE10 0DX")
    lazy var rotterdamAhoy = Place(name: "Rotterdam Ahoy", type: .stadium, contry: .Netherlands, maxSpectatorsCount: 16000, typeSport: [TypeOfSport.tennis.rawValue, TypeOfSport.volleyball.rawValue], priceFrom: 90, priceTo: 2400, currency: .EUR, adress: "Ahoyweg 10, 3084 BA Rotterdam")
    lazy var accorHotelsArena = Place(name: "AccorHotels Arena", type: .stadium, contry: .France, maxSpectatorsCount: 17000, typeSport: [TypeOfSport.tennis.rawValue, TypeOfSport.volleyball.rawValue], priceFrom: 95, priceTo: 2800, currency: .EUR, adress: "8 Boulevard de l'Indépendance, 75012 Paris")
    
    lazy var allPlaces = [donbassArena, arturAsheStadium, campNou, datunSportsCenter, tegelneField, gameWeb, newClarkCityArena, tottenhamStadium, alJanoubStadium, puskašArena, o2Arena, rotterdamAhoy, accorHotelsArena]
    
    //Trophies
    lazy var europeanCup = Trophy(name: "European cup", count: 3, iconName: "eurocup")
    lazy var fifaCLubWorldCup = Trophy(name: "FIFA CLub World cup", count: 3, iconName: "fifaCup")
    lazy var europeanSuperCup = Trophy(name: "European super cup", count: 2, iconName: "uefaCup")
    lazy var fifaWorldCup = Trophy(name: "FIFA World cup", count: 0, iconName: "fifaWorldCup")
    
    // Ronaldo Teams
    lazy var ronaldoManUtd = AthleteTeams(team: "Manchester United", teamColor: .red, fromYearInTeam: 2003, toYearInTeam: 2009, iconName: "manUTeamLogo")
    lazy var ronaldoReal = AthleteTeams(team: "Real Madrid", teamColor: .orange, fromYearInTeam: 2009, toYearInTeam: 2018, iconName: "realTeamLogo")
    lazy var ronaldoJuventus = AthleteTeams(team: "Juventus", teamColor: .white, fromYearInTeam: 2018, toYearInTeam: 2023, iconName: "juventusFlag")
    
    //Football teams
    lazy var juventus = Team(name: "Juventus", createYear: 1897, coach: "Massimiliano Allegri", sport: .football, team: nil, country: .Italy, iconName: "juventusFlag")
    lazy var barcelona = Team(name: "Barcelona", createYear: 1899, coach: "Ronald Koeman", sport: .football, team: nil, country: .Spain, iconName: "barcelonaLogo")
    lazy var psg = Team(name: "Paris Saint-Germain", createYear: 1970, coach: "Mauricio Pochettino", sport: .football, team: nil, country: .France, iconName: "psgLogo")
    lazy var manCity = Team(name: "Manchester City", createYear: 1880, coach: "Pep Guardiola", sport: .football, team: nil, country: .UnitedKingdom, iconName: "mcLogo")
    lazy var realMadrid = Team(name: "Real Madrid", createYear: 1902, coach: "Carlo Ancelotti", sport: .football, team: nil, country: .Spain, iconName: "realLogo")
    lazy var navi = Team(name: "Natus Vincere", createYear: 2009, coach: "Andrey Gorodenskiy", sport: .cybersport, team: nil, country: .Ukraine, iconName: "naviLogo")
    lazy var virtuspro = Team(name: "Virtus.pro", createYear: 2003, coach: "Dzhami Ali", sport: .cybersport, team: nil, country: .Other, iconName: "virtusproLogo")
    lazy var liverpool = Team(name: "Liverpool", createYear: 1892, coach: "Jurgen Klopp", sport: .football, team: nil, country: .UnitedKingdom, iconName: "liverpoolFlag")
    lazy var bayernMunich = Team(name: "Bayern Munich", createYear: 1900, coach: "Julian Nagelsmann", sport: .football, team: nil, country: .Germany, iconName: "bayernMunichFlag")
    lazy var acMilan = Team(name: "AC Milan", createYear: 1899, coach: "Stefano Pioli", sport: .football, team: nil, country: .Italy, iconName: "acMilanFlag")
    lazy var ajax = Team(name: "Ajax", createYear: 1900, coach: "Erik ten Hag", sport: .football, team: nil, country: .Netherlands, iconName: "ajaxFlag")
    lazy var borussiaDortmund = Team(name: "Borussia Dortmund", createYear: 1909, coach: "Marco Rose", sport: .football, team: nil, country: .Germany, iconName: "bvbFlag")
    
    // Basketball teams
    lazy var lakers = Team(name: "Los Angeles Lakers", createYear: 1947, coach: "Frank Vogel", sport: .basketball, team: nil, country: .UnitedStates, iconName: "lakersFlag")
    lazy var celtics = Team(name: "Boston Celtics", createYear: 1946, coach: "Ime Udoka", sport: .basketball, team: nil, country: .UnitedStates, iconName: "celticsFlag")
    lazy var warriors = Team(name: "Golden State Warriors", createYear: 1946, coach: "Steve Kerr", sport: .basketball, team: nil, country: .UnitedStates, iconName: "warriorsFlag")
    lazy var bulls = Team(name: "Chicago Bulls", createYear: 1966, coach: "Billy Donovan", sport: .basketball, team: nil, country: .UnitedStates, iconName: "bullsFlag")
    lazy var raptors = Team(name: "Toronto Raptors", createYear: 1995, coach: "Nick Nurse", sport: .basketball, team: nil, country: .Canada, iconName: "raptorsFlag")
    lazy var spurs = Team(name: "San Antonio Spurs", createYear: 1967, coach: "Gregg Popovich", sport: .basketball, team: nil, country: .UnitedStates, iconName: "spursFlag")
    
    lazy var allTeams = [juventus, barcelona, psg, manCity, realMadrid, navi, virtuspro, liverpool, bayernMunich, acMilan, ajax, borussiaDortmund, lakers, celtics, warriors, bulls, raptors, spurs]
    
    //Athletes
    lazy var djokovic = Athlete(firstName: "Novak", lastName: "Djokovic", age: 34, typeOfSport: .tennis, gamesValue: 18, goalsValue: 12, athleteTeam: nil, atheleBigImageName: "djokovicFlag", athleteRole: "TENNIS PLAYER", allKicks: 142, shotOnTarget: 92, goalsScored: 32, foulsWon: 25, foulsConceded: 8, redCards: 0, yellowCards: 2, trophies: nil, teams: nil, citizenship: .Serbia, birthplace: .Other, gender: .male, sport: .tennis, number: 1, iconName: "djokovicLogo")
    lazy var nadal = Athlete(firstName: "Rafael", lastName: "Nadal", age: 35, typeOfSport: .tennis, gamesValue: 20, goalsValue: 15, athleteTeam: nil, atheleBigImageName: "nadalFlag", athleteRole: "TENNIS PLAYER", allKicks: 155, shotOnTarget: 105, goalsScored: 40, foulsWon: 28, foulsConceded: 10, redCards: 0, yellowCards: 1, trophies: nil, teams: nil, citizenship: .Spain, birthplace: .Other, gender: .male, sport: .tennis, number: 2, iconName: "nadaleLogo")
    lazy var ronaldo = Athlete(firstName: "Cristiano", lastName: "Ronaldo", age: 33, typeOfSport: .football, gamesValue: 14, goalsValue: 10, athleteTeam: juventus, atheleBigImageName: "ronaldoLogo", athleteRole: "FORWARD", allKicks: 14, shotOnTarget: 8, goalsScored: 6, foulsWon: 8, foulsConceded: 3, redCards: 1, yellowCards: 3, trophies: [europeanCup, fifaCLubWorldCup, europeanSuperCup, fifaWorldCup], teams: [ronaldoManUtd, ronaldoReal, ronaldoJuventus], citizenship: .Portugal, birthplace: .Portugal, gender: .male, sport: .football, number: 7, iconName: "ronaldoIcon")
    
    lazy var allAthletes = [djokovic, nadal, ronaldo]
    
    func addData() {
                
        try! realm.write {
            realm.add(allPlaces, update: .modified)
            realm.add(allTeams, update: .modified)
            realm.add(allAthletes, update: .modified)
        }
    }
    
    func createDefaultEvents() {
        
        //Default events date
        let firstEventDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 23, hour: 18, minute: 0))!
        let secondEventDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 29, hour: 12, minute: 30))!
        let thirdEventDate = Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 8, hour: 15, minute: 45))!
        let fourthEventDate = Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 24, hour: 20, minute: 0))!
        let fifthEventDate = Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 19, hour: 14, minute: 15))!
        let sixthEventDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 20, hour: 16, minute: 30))!
        let seventhEventDate = Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 2, hour: 19, minute: 45))!
        let eighthEventDate = Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 12, hour: 11, minute: 0))!
        let ninthEventDate = Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 22, hour: 13, minute: 15))!
        let tenthEventDate = Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 13, hour: 17, minute: 30))!
        
        //Default events
        createDefaultEvents(participants: [manCity, barcelona], title: "Battle at the Etihad: Man City Hosts Barcelona", desc: "Get ready for an epic encounter as Manchester City and Barcelona, two football powerhouses, lock horns in a thrilling showdown. Witness top-class football, skillful plays, and intense competition in this highly anticipated match at the Etihad Stadium. Don't miss the chance to experience the magic on the pitch!", date: firstEventDate, typeOfSport: .football, place: donbassArena, image: UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [lakers, warriors], title: "NBA Clash: Lakers vs Warriors", desc: "Witness an intense NBA matchup as the Los Angeles Lakers face off against the Golden State Warriors. The rivalry continues in this thrilling basketball game featuring some of the best players in the league. Get ready for slam dunks, three-pointers, and fast-paced action!", date: secondEventDate, typeOfSport: .basketball, place: arturAsheStadium, image: UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [psg, realMadrid], title: "UEFA Champions League Final: PSG vs Real Madrid", desc: "It's the grand finale of the UEFA Champions League! Juventus and Real Madrid battle it out for the coveted title. Watch as two football giants clash in an epic showdown filled with skillful moves, spectacular goals, and championship glory. Don't miss the excitement!", date: thirdEventDate, typeOfSport: .football, place: campNou, image: UIImage(named: "EventSecond")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [navi, virtuspro], title: "Esports Showdown: Natus Vincere vs Virtus.pro", desc: "Experience the thrill of esports as Natus Vincere and Virtus.pro go head-to-head in a highly anticipated showdown. Watch top-tier players compete in intense battles, showcasing their skills in cybersport. Be prepared for strategic moves, quick reflexes, and nail-biting moments!", date: fourthEventDate, typeOfSport: .cybersport, place: gameWeb, image: UIImage(named: "EventThird")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [bayernMunich, acMilan], title: "European Football Classic: Bayern Munich vs AC Milan", desc: "Don't miss this classic European football matchup as Bayern Munich takes on AC Milan. Two football powerhouses with a rich history face off in a battle of skill and determination. Get ready for a night of thrilling goals, beautiful plays, and intense competition!", date: fifthEventDate, typeOfSport: .football, place: tegelneField, image: UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [djokovic, nadal], title: "Tennis Masters Showdown: Djokovic vs Nadal", desc: "Experience the brilliance of tennis as Novak Djokovic and Rafael Nadal showcase their skills in a Masters Showdown. These two tennis legends go head-to-head in a match filled with powerful serves, precise shots, and incredible athleticism. Tennis enthusiasts, this is an event you don't want to miss!", date: sixthEventDate, typeOfSport: .tennis, place: o2Arena, image: UIImage(named: "EventFourth")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [bulls, celtics], title: "NBA Clash: Chicago Bulls vs Boston Celtics", desc: "Witness an intense NBA clash as the Chicago Bulls go head-to-head against the Boston Celtics. Brace yourself for a thrilling basketball match featuring incredible plays, strategic moves, and fierce competition at the Datun Sports Center!", date: seventhEventDate, typeOfSport: .basketball, place: datunSportsCenter, image: UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [warriors, raptors], title: "NBA Showdown: Golden State Warriors vs Toronto Raptors", desc: "Get ready for an epic NBA showdown between the Golden State Warriors and the Toronto Raptors. Witness the clash of titans as these two formidable teams compete for basketball supremacy. Join us at the New Clark City Arena for an evening of dazzling plays and unforgettable moments!", date: eighthEventDate, typeOfSport: .basketball, place: newClarkCityArena, image: UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [liverpool, barcelona], title: "Football Fiesta: Liverpool vs Barcelona", desc: "Join the football fiesta as Liverpool and Barcelona bring their A-game to the pitch. Expect a thrilling match full of goals, skillful plays, and intense competition. Get ready to cheer for your favorite team in this epic showdown at the Tottenham Stadium!", date: ninthEventDate, typeOfSport: .football, place: tottenhamStadium, image: UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!)
        createDefaultEvents(participants: [spurs, raptors], title: "NBA Showdown: San Antonio Spurs vs Toronto Raptors", desc: "Experience the excitement of NBA basketball as the San Antonio Spurs take on the Toronto Raptors. Watch as these two talented teams battle for supremacy on the court. Don't miss the fast-paced action, incredible dunks, and three-pointers at the Rotterdam Ahoy!", date: tenthEventDate, typeOfSport: .basketball, place: rotterdamAhoy, image: UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!)
    }

    
    private func addEvent(event: Event) {
        try! realm.write {
            realm.add(event, update: .error)
        }
    }
    
    func createDefaultEvents(participants: [Participant], title: String, desc: String, date: Date, typeOfSport: TypeOfSport, place: Place, image: Data?) {
        let place_ = realm.objects(Place.self).filter( {$0.name == place.name} ).first
        switch participants {
        case is [Team]:
            guard let firstTeam = participants[0] as? Team,
                  let secondTeam = participants[1] as? Team else {
                return
            }
            let first = realm.objects(Team.self).filter( {$0.name == firstTeam.name} ).first
            let second = realm.objects(Team.self).filter( {$0.name == secondTeam.name} ).first
            let teamsList = List<Team>()
            teamsList.append(objectsIn: [first!, second!])

            let event = TeamSportEvent()
            event.title = title
            event.desc = desc
            event.date = date
            event.typeOfSport = typeOfSport.rawValue
            event.place = place_
            event.currency = place_?.currency ?? CurrencyList.USD.rawValue
            event.icon = image
            event.teams = teamsList

            addEvent(event: event)

        case is [Athlete]:
            guard let firstAthlete = participants[0] as? Athlete,
                  let secondAthlete = participants[1] as? Athlete else {
                return
            }
            let first = realm.objects(Athlete.self).filter( {$0.lastName == firstAthlete.lastName} ).first
            let second = realm.objects(Athlete.self).filter( {$0.lastName == secondAthlete.lastName} ).first
            let athletesList = List<Athlete>()
            athletesList.append(objectsIn: [first!, second!])

            let event = DoublesSportEvent()
            event.title = title
            event.desc = desc
            event.date = date
            event.typeOfSport = typeOfSport.rawValue
            event.place = place_
            event.currency = place_?.currency ?? CurrencyList.USD.rawValue
            event.icon = image
            event.athletes = athletesList

            addEvent(event: event)

        default: return
        }
    }
}

