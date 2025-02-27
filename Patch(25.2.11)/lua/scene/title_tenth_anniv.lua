local task = function()
    slc.ready() -- is_prepare()
end
slc.set_top_most_fade(true)


local seq = one_sheet_seq.create()

seq:set_tex_id( --[[#ui.texture.firstload_logo_ryu10anniv]](UNDEFINED) )
seq:set_size( 2048.0,	1024.0 )
seq:wait_sec( 3.0 )
seq:next_scene( --[[#scene.config.title]](UNDEFINED) )
seq:setup(  )

slc.set_is_take_over_preparing_callback(true)
slc.set_prepared_scene_pause(true)
slc.set_pause_block(true)

slc_execute( task, ... )





