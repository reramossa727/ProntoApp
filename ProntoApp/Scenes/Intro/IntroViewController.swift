//
//  IntroViewController.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/26/19.
//  Copyright © 2019 reramos. All rights reserved.
//


import UIKit
import Lottie

class IntroViewController: UIViewController {
    
    @IBOutlet var animationView: AnimationView!
    var viewModel: IntroViewModel?
    var coordinator: IntroCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = IntroViewModel()
       createAnimation()
        
        self.perform(#selector(self.goToHome), with: nil, afterDelay: 3.0)
        
    }
    
    
    func createAnimation(){
        
        animationView.animation = Animation.named("loading")
        animationView.contentMode = .scaleAspectFit
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: LottieLoopMode.loop,
                           completion: { (finished) in
                            if finished {
                                print("Animation Complete")
                            } else {
                                print("Animation cancelled")
                            }
        })
        
    }

    
    @objc func goToHome() {
        if let list = viewModel?.listRestaurant.value{
            let prontoAppCoordinator = ProntoAppCoordinator(listRest: list)
            prontoAppCoordinator.start(listRest: [])
        }
        
    }
}
