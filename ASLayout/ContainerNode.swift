import Foundation
import AsyncDisplayKit

class ContainerNode: ASDisplayNode {
  
  private let headerNode = HeaderNode()
  private let childOne = ChildNode()
  private let childTwo = ChildNode()
  private var selectedChild: Int = 0
  
  override init() {
    super.init()
    self.usesImplicitHierarchyManagement = true
    self.headerNode.backgroundColor = UIColor.grayColor()
  }
  
  override func layoutDidFinish() {
    super.layoutDidFinish()
    self.headerNode.childSelected = self.childSelected
  }
  
  private func childSelected(child: Int) {
    self.selectedChild = child
    self.transitionLayoutWithAnimation(false,
                                       shouldMeasureAsync: false,
                                       measurementCompletion: nil)
  }
  
  override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let stack = ASStackLayoutSpec.verticalStackLayoutSpec()
    let selectedNode = [self.childOne, self.childTwo][self.selectedChild]
    selectedNode.flexGrow = true
    stack.setChildren([self.headerNode, selectedNode])
    return stack
  }
}