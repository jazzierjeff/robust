import haxe.macro.Context;
import haxe.macro.Expr;

class InstantiateMacro {
    public static function build():Array<Field>{
        var fields = Context.getBuildFields();

        var targetType = Context.getLocalType();
        var targetName = Context.getLocalClass().get().name;

        var meta = Context.getLocalClass().get().meta;
        if(meta.has(":native")){
            var nativeName = haxe.macro.ExprTools.getValue(meta.extract(":native")[0].params[0]);

            fields.push({
                name: "Instantiate",
                access: [Access.APublic, Access.AStatic, Access.AInline],
                kind: FieldType.FFun({
                    params: [],
                    args: [],
                    ret: Context.toComplexType(targetType),
                    expr: macro {
                        return cast Instance.newFunc($v{nativeName});
                    },
                }),
                pos: Context.currentPos(),

            });
        }
        else{
            fields.push({
                name: "Instantiate",
                access: [Access.APublic, Access.AStatic, Access.AInline],
                kind: FieldType.FFun({
                    params: [],
                    args: [],
                    ret: Context.toComplexType(targetType),
                    expr: macro {
                        return cast Instance.newFunc($v{targetName});
                    },
                }),
                pos: Context.currentPos(),

            });
        }

        return fields;
    }
}