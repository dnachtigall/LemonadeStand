//
//  ViewController.swift
//  LemonadeStand
//
//  Created by David Nachtigall on 11.01.15.
//  Copyright (c) 2015 David Nachtigall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Struct init
    var player = Player(aBalance: 10, aIceCubes: 1, aLemons: 1)
    var price = Prices()
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

    // Function for ViewUpdate
    
    func updateMyView() {
        
        self.currentBalanceLabel.text = "$\(player.balance)"
        
        // Control Flow for Display for Lemon and Lemons and Ice Cube and Ice Cubes
        if player.iceCubes == 1 {
                self.currentIceLabel.text = "\(player.iceCubes) Ice Cube"
            }
            else {
                self.currentIceLabel.text = "\(player.iceCubes) Ice Cubes"
            }
            if player.lemons == 1 {
                self.currentLemonsLabel.text = "\(player.lemons) Lemon"
            }
            else {
                self.currentLemonsLabel.text = "\(player.lemons) Lemons"
            }
        
        self.lemonsToMixLabel.text = "\(lemonsInTheMix)"
        self.iceCubesToMixLabel.text = "\(iceCubesinTheMix)"
        self.lemonsToPurchaseLabel.text = "\(lemonsPurchased)"
        self.iceCubesToPurchaseLabel.text = "\(iceCubesPurchased)"
        
    }
    
    // FunctionForWarning
    
    func presentAWarning(header: String = "Warning", message: String) {
        
    var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    // second container Buttons
    
    @IBAction func purchaseLemonPlusButtonPressed(sender: UIButton) {
        if player.balance >= price.lemons {
        lemonsPurchased += 1
        player.lemons += 1
        player.balance -= price.lemons
        updateMyView()
        }
        else {
            presentAWarning(message: "Insufficent Funds")
        }
        
    }

    @IBAction func purchaseLemonMinusButtonPressed(sender: UIButton) {
        if lemonsPurchased >= 1 {
        lemonsPurchased -= 1
        player.lemons -= 1
        player.balance += price.lemons
        updateMyView()
        }
        else {
        presentAWarning(message: "You have no Lemons left to return.")
        }
    }
    
    @IBAction func purchaseIceCubesPlusButtonPressed(sender: UIButton) {
        if player.balance >= price.iceCubes {
            iceCubesPurchased += 1
            player.balance -= price.iceCubes
            player.iceCubes += 1
            updateMyView()
        }
        else {
        presentAWarning(message: "Insufficent Funds")
        }
        
        
    }
    
    @IBAction func purchaseIceCubesMinusButtonPressed(sender: UIButton) {
        if iceCubesPurchased >= 1 {
            iceCubesPurchased -= 1
            player.balance += price.iceCubes
            player.iceCubes -= 1
            updateMyView()
        }
        else {
            presentAWarning(message: "You have no Ice Cubes left to return")
        }
        
    }
    
    // Third Container Buttons
    
    @IBAction func lemonsMixPlusButtonPressed(sender: UIButton) {
        if player.lemons >= 1 {
        // Lock players in, no selling of lemons after mixing
        lemonsPurchased = 0
        lemonsInTheMix += 1
        player.lemons -= 1
        updateMyView()
        }
        else {
            presentAWarning(message: "There are no Lemons left")
        }
    }
    
    @IBAction func lemonsMixMinusButtonPressed(sender: UIButton) {
        if lemonsInTheMix >= 1 {
            lemonsPurchased = 0
            lemonsInTheMix -= 1
            player.lemons += 1
            updateMyView()
        }
        else {
            presentAWarning(message: "There are no Lemons in the mix left")
        }
    }
    
    
    @IBAction func iceCubesMixPlusButtonPressed(sender: UIButton) {
        if player.iceCubes >= 1 {
            // Lock player in to no sell any more icecubes
            iceCubesPurchased = 0
            iceCubesinTheMix += 1
            player.iceCubes -= 1
            updateMyView()
        }
        else {
            presentAWarning(message: "There are no Ice Cubes left")
        }
    }
    
    
    @IBAction func iceCubesMixMinusButtonPressed(sender: UIButton) {
        if iceCubesinTheMix >= 1 {
            iceCubesPurchased = 0
            iceCubesinTheMix -= 1
            player.iceCubes += 1
            updateMyView()
        }
        else {
            presentAWarning(message: "There are no Ice Cubes in the mix left")
        }

    }
    
    
    //fourth Container buttons
    
    @IBAction func startButtonPressed(sender: UIButton) {
        
        if lemonsInTheMix < 1 || iceCubesinTheMix < 1 {
            presentAWarning(message: "There needs to be ice and lemons in your lemonade!")
        }
        else {
        let lemonToIceRatio = Float(lemonsInTheMix) / Float(iceCubesinTheMix)
        var myLemonadeType: String
        if lemonToIceRatio > 1 {
            myLemonadeType = "acidic"
        }
        else if lemonToIceRatio == 1 {
            myLemonadeType = "equal parts"
        }
        else if lemonToIceRatio < 1 {
            myLemonadeType = "diluted"
        }
        else {
            println("invaild Ratio")
            myLemonadeType = "error"
        }
        let numberOfCustomers = (Int(arc4random_uniform(UInt32(10)))) + 1
        let customerPreferences = LemonadeBrain.makePreferences(numberOfCustomers)
        println("\(lemonToIceRatio)")
        println("Number of Customers\(numberOfCustomers)")
        println("\(customerPreferences)")
        println("\(myLemonadeType)")
        var sales = 0
            for i in 0...(customerPreferences.count - 1) {
                if customerPreferences[i] == myLemonadeType {
                   sales += 1
                    println("Customer Number \(i) purchased")
                }
                else {
                    println("Customer Number \(i) did not purchase")
                }
                
            }
        lemonsInTheMix = 0
        iceCubesinTheMix = 0
        lemonsPurchased = 0
        iceCubesPurchased = 0
        player.balance += sales
        updateMyView()
        }
    
        
        
        
    }
    
}

