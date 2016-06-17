import Foundation
import AsyncDisplayKit

class ChildNodeCell: ASCellNode {
  
  let textNode = ASTextNode()
  
  init(number: Int) {
    super.init()
    self.usesImplicitHierarchyManagement = true
    self.textNode.attributedString = NSAttributedString(string: String(number))
  }
  
  override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let stack = ASStackLayoutSpec.verticalStackLayoutSpec()
    stack.setChildren([self.textNode])
    return stack
  }
  
}
