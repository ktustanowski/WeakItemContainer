//
//  ViewController.swift
//  WeakItemContainer
//
//  Created by Kamil Tustanowski on 08.10.2015.
//  Copyright © 2015 Kamil Tustanowski. All rights reserved.
//

import UIKit

let buttonSide = CGFloat(30)

/* Some delegate object */
class Delegate {
    var id:Int
    
    init(id:Int) {
        self.id = id
        print("Delegate ::\(id):: initialized!")
    }
    
    deinit {
        print("Delegate ::\(id):: dealocated!")
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var buttonCountLabel: UILabel!
    
    var delegates = [Delegate]()
    let weakDelegates = WeakItemContainer<Delegate>()
    
    @IBAction func addDelegates() {
        for _ in 0...99 {
            let delegate = Delegate(id: delegates.count)
            delegates.append(delegate) /* Add delegates to array to maintain strong pointers ane prevent premature deallocation*/
            weakDelegates.append(delegate)
        }

        updateCount()
    }
    
    @IBAction func removeDelegates() {
        delegates.removeAll() /* Remove strong pointers to delegates. After this operation the only place they are holded is weak delegates - but without strong pointers they will deallocate... */
        updateCount() /* ...and automatically be removed from WeakItemContrainer */
    }
    
    func updateCount() {
        let weakDelegatescount = self.weakDelegates.count()
        self.buttonCountLabel.text = "\(weakDelegatescount)"
        print("=========================================================")
        print("WeakDelegates container is holding \(weakDelegatescount) items")
        print("=========================================================")
    }

}

