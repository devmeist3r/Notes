import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Criando barra de navegação
        let navController = UINavigationController(rootViewController: FoldersController())
        
        // Colocando titulos grandes para barra iOS
        UINavigationBar.appearance().prefersLargeTitles = true
        
        // Criando tela na mao e definido o ponto de entrada da aplicação
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = navController
        
        return true
    }
}

