//
//  Closures.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import Foundation

typealias EmptyResult<ReturnType> = () -> ReturnType

typealias SingleResultWithReturn<T, ReturnType> = ((T) -> ReturnType)

typealias SingleResult<T> = SingleResultWithReturn<T, Void>

typealias VoidResult = EmptyResult<Void> // () -> Void
typealias ErrorResult = SingleResult<Error> // (Error) -> Void
