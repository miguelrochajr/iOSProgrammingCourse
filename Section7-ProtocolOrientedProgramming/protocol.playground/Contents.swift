import Foundation
import UIKit

var newName = "Miguel's Padlock"

newName.characters.count

let index = newName.index(newName.startIndex, offsetBy: 4)


newName = newName[newName.startIndex..<index]

var name = newName





while (name.characters.count<12) {
    //print(1)
    name = name + " "
}

name.characters.count
