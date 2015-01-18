//
//  ViewController.swift
//  LemonadeStand
//
//  Created by David Nachtigall on 11.01.15.
//  Copyright (c) 2015 David Nachtigall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Player init
    var player = Player()
    
    //vars
    
    var lemonsPurchased = 0
    var iceCubesPurchased = 0
    var lemonsInTheMix = 0
    var iceCubesinTheMix = 0
    
    
    //Outlets
    
    // Uper Container
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var currentIceLabel: UILabel!
    @IBOutlet weak var currentLemonsLabel: UILabel!
    
    // second Container
    @IBOutlet weak var lemonsToPurchaseLabel: UILabel!
    @IBOutlet weak var iceCubesToPurchaseLabel: UILabel!
    
    // Third Container
    @IBOutlet weak var lemonsToMixLabel: UILabel!
    @IBOutlet weak var iceCubesToMixLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateMyView()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Functions for View
    
    func updateMyView() {
        
        self.currentBalanceLabel.text = "$\(player.balance)"
        self.currentIceLabel.text = "\(player.iceCubes)"
        self.currentLemonsLabel.text = "\(player.lemons)"
        self.lemonsToMixLabel.text = "\(lemonsInTheMix)"
        self.iceCubesToMixLabel.text = "\(iceCubesinTheMix)"
        self.lemonsToPurchaseLabel.text = "\(lemonsPurchased)"
        self.iceCubesToPurchaseLabel.text = "\(iceCubesPurchased)"
    }
    
    // FunctionForWarning
    
    func presentAWarning(header: String = "Warning!", message:String) {
        
    var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    // second container Buttons
    
    @IBAction func purchaseLemonPlusButtonPressed(sender: UIButton) {
        if player.balance >= 2 {
        lemonsPurchased += 1
        player.balance -= 2
        updateMyView()
        }
        else {
            presentAWarning(message: "Insufficent Funds")
        }
        
    }

    @IBAction func purchaseLemonMinusButtonPressed(sender: UIButton) {
        if lemonsPurchased >= 1 {
        lemonsPurchased -= 1
        player.balance += 2
        updateMyView()
        }
        else {
        presentAWarning(message: "You have no Lemons left to return.")
        }
    }
    
    @IBAction func purchaseIceCubesPlusButtonPressed(sender: UIButton) {
    }
    
    @IBAction func purchaseIceCubesMinusButtonPressed(sender: UIButton) {
    }
    
    // Third Container Buttons
    
    @IBAction func lemonsMixPlusButtonPressed(sender: UIButton) {
    }
    
    @IBAction func lemonsMixMinusButtonPressed(sender: UIButton) {
    }
    
    
    @IBAction func iceCubesMixPlusButtonPressed(sender: UIButton) {
    }
    
    
    @IBAction func iceCubesMixMinusButtonPressed(sender: UIButton) {
    }
    
    
    //fourth Container buttons
    
    @IBAction func startButtonPressed(sender: UIButton) {
    }
    
    
    
}

