//: Playground - noun: a place where people can play

import UIKit
import Saturn
import XCPlayground

let xml =
"<UIView id='root' backgroundColor='#ab49e1' clipsToBounds='false'>" +
    "<NSLayoutConstraint firstItem='root' firstAttribute='centerX' secondItem='parent' secondAttribute='centerX' />" +
    "<NSLayoutConstraint firstItem='root' firstAttribute='centerY' secondItem='parent' secondAttribute='centerY' constant='-50' />" +
    "<NSLayoutConstraint firstItem='root' firstAttribute='width' secondItem='parent' secondAttribute='width' multiplier='0.5' />" +
    "<NSLayoutConstraint firstItem='root' firstAttribute='height' secondItem='parent' secondAttribute='height' multiplier='0.5' />" +
    "<UILabel id='label1' text='Ohai!' enabled='true' textColor='white' textAlignment='center'>" +
        "<NSLayoutConstraint firstItem='label1' firstAttribute='centerX' secondItem='parent' secondAttribute='centerX' constant='0'/>" +
        "<NSLayoutConstraint firstItem='label1' firstAttribute='centerY' secondItem='parent' secondAttribute='centerY' constant='-30'/>" +
    "</UILabel>" +
    "<UIImageView id='image1' image='logo.png' contentMode='ScaleAspectFit'>" +
    "<UIView id='view2' backgroundColor='#00000022' />" +
    "<NSLayoutConstraint ruleSet='fillSuperview' firstItem='view2' />" +
    "</UIImageView>" +
    "<NSLayoutConstraint firstItem='image1' firstAttribute='centerX' secondItem='parent' secondAttribute='centerX' constant='0'/>" +
    "<NSLayoutConstraint firstItem='image1' firstAttribute='centerY' secondItem='parent' secondAttribute='centerY' constant='40'/>" +
    "<NSLayoutConstraint firstItem='image1' firstAttribute='width' secondItem='parent' secondAttribute='width' multiplier='0.5' />" +
    "<NSLayoutConstraint firstItem='image1' firstAttribute='height' secondItem='parent' secondAttribute='height' multiplier='0.5' />" +
"</UIView>"

let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 380))

hostView.layer.borderWidth = 1
hostView.layer.borderColor = UIColor.grayColor().CGColor
hostView.backgroundColor = .whiteColor()

let view = UIView.readFromString(xml, intoParent: hostView)

XCPlaygroundPage.currentPage.liveView = hostView


