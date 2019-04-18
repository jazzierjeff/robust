

extern class Instance{
    var Archivable : Bool;
    var ClassName(default, never) : String;
    var DataCost(default, never) : Int;
    var Name : String;
    var Parent : Instance;
    var RoboxLocked : Bool;

    static function Instantiate(type : Class<Dynamic>) : Instance{
        return newFunc(Type.getClassName(type));
    }

    @:native("new")
    static function newFunc(type : String) : Instance;

    function ClearAllChildren() : Void;
    function Clone() : Instance;
    function Destroy() : Void;
    function FindFirstAncestor(name : String) : Instance;
    function FindFirstAncestorOfClass(className : String) : Instance;
    function FindFirstAncestorWhichIsA(className : String) : Instance;
    function FindFirstChild(name : String, recursive : Bool) : Instance;
    function FindFirstChildOfClass(className : String) : Instance;
    function FindFirstChildWhichIsA(className : String, recusrive : Bool) : Instance;
    function GetChildren() : Instance[];
    function GetDebugId(scopeLength : Int) : String;
    function GetDescendants() : Instance[];
    function GetFullName() : String;
    function GetPropertyChangedSignal(property : String) : RBXScriptSignal;
    function IsA(className : String) : Bool;
    function IsAncestorOf(descendant : Instance) : Bool;
    function IsDescendantOf(ancestor : Instance) : Bool;
    function WaitForChild(childName : String, timeOut : Float) : Instance;
}