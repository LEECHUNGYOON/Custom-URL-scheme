@objc class CustomUrlScheme : CDVPlugin {
    @objc(test:)

     

    func test(command: CDVInvokedUrlCommand) {
        // 플러그인 내용 작성하기
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        print("CustomUrlScheme - test")
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }

    @available(iOS 9.0, *)
     public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewController = appDelegate.window?.rootViewController as! ViewController
        
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let items = urlComponents?.queryItems
        
        viewController.title = items?.first?.name
        viewController.text.text = items?.first?.value
        
        return true
    }

   
}
