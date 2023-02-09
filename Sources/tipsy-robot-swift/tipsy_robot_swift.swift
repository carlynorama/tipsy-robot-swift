import Foundation
import ArgumentParser


@main
public struct tipsy_robot_swift {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(tipsy_robot_swift().text)
    }
}
