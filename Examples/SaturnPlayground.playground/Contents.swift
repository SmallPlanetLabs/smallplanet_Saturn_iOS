//: Playground - noun: a place where people can play

import UIKit
import Saturn
import XCPlayground

let view = UIView.readFromString("<UIView frame='0,0,100,100' backgroundColor='red'><UILabel text='Ohai!' enabled='true' frame='10,20,80,40' textColor='white' /></UIView>")
XCPlaygroundPage.currentPage.liveView = view as? UIView


let b = Bool(true)