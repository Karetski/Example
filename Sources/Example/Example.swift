public struct Some<Type> {
    private let instance: Type?

    public enum Error: Swift.Error {
        case some(instance: Type?)
    }

    public init(_ instance: Type?) {
        self.instance = instance
    }

    public func make() throws {
        throw Error.some(instance: instance)
    }
}

class Foo {
    static func test() {
        do {
            try Some("String").make()
        } catch Some.Error.some(let instance) {
            print("(instance)")
        } catch {
        }
    }
}
