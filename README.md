# StringUtils

A description of this package.
## How To Use
* Swift

```swift
import StringUtils

titleLabel.attributedText = AttributedStringBuilder()
    .append("Sample text")
    .with(UIColor.red)
    .with(UIFont.boldSystemFont(ofSize: 15))
    .append("Sample text")
    .with(UIColor.blue)
    .with(UIFont.italicSystemFont(ofSize: 13))
    .attributedString()
            
let userName: String?
lblUnfollow.text = NotEmptyStringBuilder()
    .append("Sample name")
    .append(": ")
    .append(userName)
    .append("?").build()          
```
