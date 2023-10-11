//
//  a.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 06.10.2023.
//

import UIKit
import RealmSwift

class RealmEventsDataBase: Object {
    @Persisted dynamic var eventName:           String
    @Persisted dynamic var eventDescription:    String
    @Persisted dynamic var eventImageData:      Data?
    @Persisted dynamic var eventDate:           String
    @Persisted dynamic var firstTeamPlaying:    String
    @Persisted dynamic var secondTeamPlaying:   String
    
}
