//
//  AuthErrorExtension.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 08/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import FirebaseAuth

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "Un autre compte possède cette e-mail"
        case .userNotFound:
            return "Ce compte n'existe pas"
        case .userDisabled:
            return "Ce compte a été désactivé"
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Cette e-mail est invalide"
        case .networkError:
            return "Erreur de réseau, réeessaye !"
        case .weakPassword:
            return "Mot de passe trop faible, il faut au moins 6 caractères"
        case .wrongPassword:
            return "Ce mot de passe est incorrect"
        default:
            return "Tu as fait une erreur ! Vérifie les infos"
        }
    }
}
