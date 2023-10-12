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
    
    func addData() {
        
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
        
        //Teams
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
        
        lazy var allTeams = [juventus, barcelona, psg, manCity, realMadrid, navi, virtuspro, liverpool, bayernMunich, acMilan, ajax, borussiaDortmund]
        
        //Athletes
        lazy var djokovic = Athlete(firstName: "Novak", lastName: "Djokovic", age: 34, typeOfSport: .tennis, gamesValue: 18, goalsValue: 12, athleteTeam: nil, atheleBigImageName: "djokovicFlag", athleteRole: "TENNIS PLAYER", allKicks: 142, shotOnTarget: 92, goalsScored: 32, foulsWon: 25, foulsConceded: 8, redCards: 0, yellowCards: 2, trophies: nil, teams: nil, citizenship: .Serbia, birthplace: .Other, gender: .male, sport: .tennis, number: 1, iconName: "djokovicLogo")
        lazy var nadal = Athlete(firstName: "Rafael", lastName: "Nadal", age: 35, typeOfSport: .tennis, gamesValue: 20, goalsValue: 15, athleteTeam: nil, atheleBigImageName: "nadalFlag", athleteRole: "TENNIS PLAYER", allKicks: 155, shotOnTarget: 105, goalsScored: 40, foulsWon: 28, foulsConceded: 10, redCards: 0, yellowCards: 1, trophies: nil, teams: nil, citizenship: .Spain, birthplace: .Other, gender: .male, sport: .tennis, number: 2, iconName: "nadaleLogo")
        lazy var ronaldo = Athlete(firstName: "Cristiano", lastName: "Ronaldo", age: 33, typeOfSport: .football, gamesValue: 14, goalsValue: 10, athleteTeam: juventus, atheleBigImageName: "ronaldoLogo", athleteRole: "FORWARD", allKicks: 14, shotOnTarget: 8, goalsScored: 6, foulsWon: 8, foulsConceded: 3, redCards: 1, yellowCards: 3, trophies: [europeanCup, fifaCLubWorldCup, europeanSuperCup, fifaWorldCup], teams: [ronaldoManUtd, ronaldoReal, ronaldoJuventus], citizenship: .Portugal, birthplace: .Portugal, gender: .male, sport: .football, number: 7, iconName: "ronaldoIcon")
        
        lazy var allAthletes = [djokovic, nadal, ronaldo]
        
        //Events
//        let firstEvent = TeamSportEvent(teams: [manCity, barcelona], typeOfSport: .football, title: "Battle at the Etihad: Man City Hosts Barcelona", description: "Get ready for an epic encounter as Manchester City and Barcelona, two football powerhouses, lock horns in a thrilling showdown. Witness top-class football, skillful plays, and intense competition in this highly anticipated match at the Etihad Stadium. Don't miss the chance to experience the magic on the pitch!", date: dateFirstEvent, place: campNou, currency: .EUR, iconName: "EventFirst")
//
//        let secondEvent = TeamSportEvent(teams: [psg, realMadrid], typeOfSport: .football, title: "Battle of Giants: PSG vs. Real Madrid Showdown", description: "Get ready for a football spectacle as Paris Saint-Germain and Real Madrid, two of the biggest names in European football, collide in a thrilling showdown. Join us for an unforgettable night of skill, passion, and drama as these football titans battle it out on the pitch. Don't miss a moment of the action!", date: dateSecondEvent, place: donbassArena, currency: .UAH, iconName: "EventSecond")
//
//        let thirdEvent = TeamSportEvent(teams: [navi, virtuspro], typeOfSport: .cybersport, title: "Legends Collide: Na'Vi vs. Virtus.pro in a Thrilling Encounter", description: "Legends of the esports world collide as Na'Vi and Virtus.pro face off in a match that promises to redefine competitive gaming. Experience the adrenaline, the precision, and the sheer excitement as these esports giants showcase their skills. Don't miss the chance to witness gaming greatness live!", date: dateThirdEvent, place: gameWeb, currency: .USD, iconName: "EventThird")
//
//        let fourthEvent = DoublesSportEvent(athletes: [djokovic, nadal], typeOfSport: .tennis, title: "Tennis Excellence: Djokovic and Nadal Face Off for Glory", description: "The net is set, and the stage is ready for a tennis showdown like no other. Djokovic and Nadal, two giants of the game, face off in a battle that will leave fans on the edge of their seats. Join us for a night of tennis brilliance, where skill, determination, and a quest for victory take center stage. This is tennis at its finest!", date: dateFourthEvent, place: arturAsheStadium, currency: .USD, iconName: "EventFourth")
        
        try! realm.write {
            realm.add(allPlaces, update: .modified)
            realm.add(allTeams, update: .modified)
            realm.add(allAthletes, update: .modified)
        }
    }
}

