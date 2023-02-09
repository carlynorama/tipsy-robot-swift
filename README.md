# Tipsy Robot

Mastodon Bot written in swift. 


## Project Startup

### Assumptions: 
- You have an application token 
- If using VSCODE  extension "sswg.swift-lang" has been installed 
- Swift 5.7 is installed on the machine (check with `swift --version`)
- A gitignore with the items in `gitignore_example.txt`

### Writing a New Bot: 

If you'd like to start from scratch, here are the steps

1) Run the following commands to get the bot executable started and verify that it can build:

    mkdir your_bot_project_name
    cd your_bot_project_name
    swift package init --type executable
    swift run                                   #will see Hello, world! in console. 

2) Update the `Package.swift` to include `ArgumentParser` and `TrunkLine` or some other MastodonAPI library. See this projects `Package.swift`. Since `TrunkLine` requires `.macOS(.v12)` for now, so does this example. 

3) Note that the `swift package init` command created two directories (`Sources/your_bot_project_name`) and made a file called `your_bot_project_name.swift` in that file is a function that looks like:

    @main
    public struct your_bot_project_name {
        public private(set) var text = "Hello, World!"

        public static func main() {
            print(your_bot_project_name().text)
        }
    }

Some people change this and just have a `main.swift` file in the `Sources/your_bot_project_name` directory which then is the contents of their `@main` function. 





## References & Resources

- [Swift Command Line with Argument Parser](https://www.youtube.com/watch?v=pQt71tLmiac)
- https://www.swift.org/blog/argument-parser/
- https://swiftpackageindex.com/apple/swift-argument-parser/1.2.1/documentation/argumentparser/gettingstarted
- https://github.com/carlynorama/tipsy-robot
