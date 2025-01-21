//
//  ErrorRequest.swift
//  AppTempo
//
//  Created by Thiago Neves on 21/01/25.
//
import Foundation

enum ErrorRequest: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorURLRequest(Swift.Error)
    case errorUrl(urlString: String)
    case errorDetail(detail: String)
}
