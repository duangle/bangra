bang ;

struct TestStruct packed i8 i32

declare somef
    function TestStruct
        array i64 5
        vector i32 4

declare printf
    function i32 (* i8) ...

defvalue hello-world
    bitcast
        global ""
            "Hello World!\n"
        * i8

run
    define "" ()
        function void
        label ""
            call printf
                bitcast
                    global ""
                        "running in compiler!\n"
                    * i8
            ret ;

define main ()
    function void
    label ""
        call printf hello-world
        cond-br
            const-int i1 1
            label then
            label else
    label then
        defvalue c0
            bitcast
                global "" "Choice 1\n"
                * i8
        br
            label done
    label else
        defvalue c1
            bitcast
                global "" "Choice 2\n"
                * i8
        br
            label done
    label done
        call printf
            phi
                * i8
                c0 then
                c1 else
        ret ;

run main
