// Copyright MyScript. All right reserved.

//
// Refinements of the MyScript Interactive Ink Runtime API for Swift
//

extension IINKParameterSet {
    func boolean(forKey: String) throws -> Bool {
        let v = try __getBooleanForKey(forKey)
        return v.value;
    }
    func number(forKey: String) throws -> Double {
        let v = try __getNumberForKey(forKey)
        return v.value;
    }
}
