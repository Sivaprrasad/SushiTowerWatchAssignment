//
//  InterfaceController.swift
//  SushiTowerWatch Extension
//
//  Created by Uppalapati SivaPrrasad on 04/11/19.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("---WATCH APP LOADED")
        
        if (WCSession.isSupported() == true) {
            // create a communication session with the phone
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }else{print("-----")}
    
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func buttonLeftPressed() {

        if (WCSession.default.isReachable == true) {

            let message = ["name":"left"] as [String : Any]
            
            // Send the message
        WCSession.default.sendMessage(message, replyHandler:nil)
           
        }
    }
    @IBAction func buttonRightPressed() {
        if (WCSession.default.isReachable == true) {

            let message = ["name":"right"] as [String : Any]
            
            // Send the message
        WCSession.default.sendMessage(message, replyHandler:nil)
        }
    }
    
    @IBAction func buttonPowerup() {
        
        }
        
    @IBAction func buttonPausePressed() {
        if (WCSession.default.isReachable == true) {

            let message = ["name":"pause"] as [String : Any]
            
            // Send the message
        WCSession.default.sendMessage(message, replyHandler:nil)
        }
        
    }
    
}
