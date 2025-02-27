local task = function()
    slc.ready() -- is_prepare()
  end
  

  slc.set_is_take_over_preparing_callback(true)
  slc.set_prepared_scene_pause(true)
  slc.set_pause_block(true)
  

  slc.set_phase("pre_idle", function()
    return true
  end)
  
  slc.set_phase("main", function()
    return false
  end)
  
  slc.set_phase("end_game_over", function()
    return true
  end)
  

  slc.set_condition("normal_exit", function()
    return true
  end)
  

  slc_execute(task, ...)
  