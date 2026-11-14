import Foundation

@main
struct ModuleEnablerMigrationCheck {
    static func main() {
        let old = URL(fileURLWithPath: "/Applications/MacNTFS.app/Contents/Extensions/NTFSModule.appex")
        let active = URL(fileURLWithPath: "/Applications/Mountee.app/Contents/Extensions/MounteeFSKit.appex")
        let duplicate = URL(fileURLWithPath: "/tmp/DerivedData/Mountee.app/Contents/Extensions/MounteeFSKit.appex")
        precondition(ModuleEnabler.extensionPathsToRemove(legacy: [old], current: [active, duplicate], active: active)
                     == [old, duplicate])
        precondition(ModuleEnabler.extensionPathsToRemove(legacy: [], current: [active], active: active).isEmpty)
        print("module enablement migration checks passed")
    }
}
