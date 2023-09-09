//
//  Places.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 07.09.2023.
//

import Foundation
import UIKit

// Creation of 2 instances of the "Place" class

let staplesCenter = Place(
    address: "1111 S Figueroa St, Los Angeles, CA 90015, United States",
    capacity: 19000,
    suitableFor: [.team(.basketball)],
    ticketPrice: 50.0,
    tickets: lakersVsBullsTickets
)

let unitedCenter = Place(
    address: "1901 W Madison St, Chicago, IL 60612, United States",
    capacity: 23500,
    suitableFor: [.team(.basketball)],
    ticketPrice: 40.0,
    tickets: lakersVsBullsTickets
)

