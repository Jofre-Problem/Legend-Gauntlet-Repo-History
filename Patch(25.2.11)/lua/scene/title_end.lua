local task = function()
    slc.ready() -- is_prepare()
end

slc.set_normal_exit(true)

slc_execute( task, ... )



