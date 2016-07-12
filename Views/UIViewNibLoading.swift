import UIKit

public extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        let nib = UINib(nibName: T.readableClassName(), bundle: NSBundle(forClass: T.self))
        let vs = nib.instantiateWithOwner(.None, options: .None)
        return vs[0] as! T
    }

    func loadFromNib<T: UIView>() -> T {
        let nib = UINib(nibName: self.dynamicType.readableClassName(), bundle: NSBundle(forClass: self.dynamicType))
        let vs = nib.instantiateWithOwner(self, options: .None)
        return vs[0] as! T
    }
}


extension NSObject {
    func readableClassName() -> String {
        return self.dynamicType.readableClassName()
    }
    
    class func readableClassName() -> String {
        let classString = NSStringFromClass(self)
        let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(classString.startIndex ..< classString.endIndex), locale: nil)
        return range.map { classString.substringFromIndex($0.endIndex) } ?? classString
    }
}