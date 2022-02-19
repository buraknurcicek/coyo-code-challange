//
//  BaseProtocols.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
