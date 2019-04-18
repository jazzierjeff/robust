abstract Vector3(Vector3Impl){

    public inline function new(x:Float, y:Float, z:Float)
    {
        this = Vector3Impl.newFunc(x, y, z);
    }
    
    @:op(A + B)
    public inline function add(rhs:Vector3Impl):Vector3Impl
    {
        return Vector3Impl.newFunc(this.x + rhs.x, this.y + rhs.y, this.z + rhs.z);
    }
}

@:native("Vector3")
extern class Vector3Impl{
    @:native("new")
    static function newFunc(x:Float, y:Float, z:Float) : Vector3Impl;
    var x : Float;
    var y : Float;
    var z : Float;
}