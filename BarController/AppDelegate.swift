import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        setupTabBar()
        return true
    }
    
    private func setupTabBar() {
        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .black
        
        let firstScreen = UINavigationController(rootViewController: ViewController())
        firstScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondScreen = UINavigationController(rootViewController: ViewController2())
        secondScreen.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "pencil.circle"), selectedImage: UIImage(systemName: "pencil.circle.fill"))
        
        let thirdScreen = UINavigationController(rootViewController: ViewController3())
        thirdScreen.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "rotate.3d"), selectedImage: UIImage(systemName: "rotate.3d.fill"))
       
        tabBar.viewControllers = [firstScreen, secondScreen, thirdScreen]
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    

}
