#  block和target-action 2种模式实现点击回调

在 Objective-C 中，我们通常使用 block 或 target-action 模式来实现点击事件的回调。

1.使用 Block 实现点击回调（推荐方式）
更加现代、简洁。
类似于 Swift 的闭包或 Flutter 的 onPressed。
更容易绑定上下文和捕获变量。

2.可选：使用 Target-Action 方式（类似 UIButton）
如果你希望更接近 UIKit 原生风格（如 UIButton 的 addTarget:action:forControlEvents:）
那就直接拿到实例添加就行了。

