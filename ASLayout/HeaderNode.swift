import Foundation
import AsyncDisplayKit

class HeaderNode: ASDisplayNode {
  
  private let button1 = ASButtonNode()
  private let button2 = ASButtonNode()
  var childSelected: (Int -> Void)?
  
  override init() {
    super.init()
    self.usesImplicitHierarchyManagement = true
    self.button1.setAttributedTitle(NSAttributedString(string: "child one"), forState: .Normal)
    self.button2.setAttributedTitle(NSAttributedString(string: "child two"), forState: .Normal)
  }
  
  override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let stack = ASStackLayoutSpec.horizontalStackLayoutSpec()
    stack.setChildren([self.button1, self.button2])
    return stack
  }
  
}