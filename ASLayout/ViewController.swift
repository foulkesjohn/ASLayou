import UIKit
import AsyncDisplayKit

class ViewController: ASViewController {

  private let container = ContainerNode()
  private let child = ChildNode()
  
  init() {
    super.init(node: self.container) // <- this doesn't work
//    super.init(node: self.child) // <- this works
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}