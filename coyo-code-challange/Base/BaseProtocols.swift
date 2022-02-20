//
//  BaseProtocols.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

// MARK: - GenericValueProtocol
protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
