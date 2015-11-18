//: [Previous](@previous)

//: [Next](@next)

//: Playground - noun: a place where people can play

// Note: UIControls in playgrounds are not interactive atm
// changing the highlighted and selected properties can emulate changes


import UIKit
import Saturn
import XCPlayground

let xml =
"<UIView id='root' backgroundColor='#ab49e1' clipsToBounds='false'>" +
    "<NSLayoutConstraint firstItem='root' ruleSet='fillSuperview' />" +
    "<UILabel id='label1' text='Ohai!' enabled='true' textColor='white' textAlignment='center'>" +
    "<NSLayoutConstraint firstItem='label1' firstAttribute='centerX' secondItem='parent' secondAttribute='centerX' constant='0'/>" +
    "<NSLayoutConstraint firstItem='label1' firstAttribute='centerY' secondItem='parent' secondAttribute='top' constant='30'/>" +
    "</UILabel>" +
    "<UIButton id='button1' backgroundColor='#6666BBFF' contentVerticalAlignment='top' contentHorizontalAlignment='center' highlighted='true' selected='true'>" +
        "<UIButtonState state='normal' title='Normal'/>" +
        "<UIButtonState state='highlighted' title='Highlighted'/>" +
        "<UIButtonState state='selected' title='Selected'/>" +
        "<UIButtonState state='selected,highlighted' title='Selected &amp; Highlighted'/>" +
        "<NSLayoutConstraint firstItem='button1' firstAttribute='centerX' secondItem='parent' secondAttribute='centerX' constant='0'/>" +
        "<NSLayoutConstraint firstItem='button1' firstAttribute='centerY' secondItem='parent' secondAttribute='centerY' constant='30'/>" +
        "<NSLayoutConstraint firstItem='button1' firstAttribute='height' constant='80'/>" +
        "<NSLayoutConstraint firstItem='button1' firstAttribute='width' constant='250'/>" +
    "</UIButton>" +
    "<UIButton id='button2' backgroundColor='#6666BBFF' highlighted='false' selected='false'>" +
        "<UIButtonState state='normal' image='logo_sm.png'/>" +
        "<NSLayoutConstraint firstItem='button2' firstAttribute='centerX' secondItem='parent' secondAttribute='centerX' constant='0'/>" +
        "<NSLayoutConstraint firstItem='button2' firstAttribute='centerY' secondItem='parent' secondAttribute='centerY' constant='130'/>" +
    "</UIButton>" +
"</UIView>"

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 600))

hostView.layer.borderWidth = 1
hostView.layer.borderColor = UIColor.grayColor().CGColor
hostView.backgroundColor = .whiteColor()

let view = UIView.readFromString(xml, intoParent: hostView)

XCPlaygroundPage.currentPage.liveView = hostView
