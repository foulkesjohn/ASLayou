import Foundation
import AsyncDisplayKit

class ChildNode: ASDisplayNode,
                 ASCollectionDataSource,
                 ASCollectionDelegate {
  
  private let collectionNode = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
  private var data = [Int](1...100)
  
  override init() {
    super.init()
    self.usesImplicitHierarchyManagement = true
  }
  
  override func didLoad() {
    super.didLoad()
    self.collectionNode.dataSource = self
    self.collectionNode.delegate = self
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.data.count
  }
  
  func collectionView(collectionView: ASCollectionView, nodeBlockForItemAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
    return {
      return ChildNodeCell(number: self.data[indexPath.row])
    }
  }
  
  override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
    self.collectionNode.position = CGPointZero;
    self.collectionNode.sizeRange = ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max)
    return ASStaticLayoutSpec(children: [self.collectionNode])
  }
  
}