//
//  Constants.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit
import Nuke

public struct SystemDate {
    public var day: Int = 0
    public var month: String = ""
    public var year: Int = 0
    public var hour: String = ""
    public var dayInWeek: String = ""
}


struct ProntoAppConstants {
    
    static let defaultCellLoadImage = UIImage(named: "newPH")
    static let defaultNukeOptions = ImageLoadingOptions(placeholder: ProntoAppConstants.defaultCellLoadImage, transition: .fadeIn(duration: 0.33))
    
}

func delay(seconds: Double, completion: @escaping () -> Void) {
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}
