local task = function()
  slc.ready() -- is_prepare()
end

slc.set_top_most_fade(true)

local load_wait_func = function()
  return true
end

slc.set_is_take_over_preparing_callback(true)
slc.set_prepared_scene_pause(true)
slc.set_pause_block(true)

local simple_tex = nil
local tex_id = --[[#ui.texture.firstload_logo_ryu]](0x00002a19)

slc.set_phase("pre_idle", function(preset_fade, in_fade)
  slc.clear_bg(0, 0, 0, 255)

  if simple_tex == nil then
    -- top_mostで設定されていないのでfadeし直す
    slc.fade_out_start(preset_fade)
    simple_tex = slc.create_entity("foreground_texture_entity", "foreground_texture_entity", "0")
    simple_tex:load(tex_id)
  end

  -- 読み込み待ち
  if not simple_tex:is_loaded() then return false end
  if not load_wait_func() then
    -- 読み込み待ち
    return false
  end

  simple_tex:set_disp(true)
  return true
end)

local normal_exit_check = false
local elapse_time = 0.0

slc.set_phase("main", function()
  elapse_time = elapse_time + System.ElapsedTime()
  if elapse_time >= 3.0 then
    -- cphase_list_entity::seq_exit_checkに情報を渡す
    normal_exit_check = true
    return false
  end
  return false
end)

slc.set_phase("end_game_over", function()
  if simple_tex ~= nil then
    simple_tex:set_disp(false)
  end

  -- シーン遷移可能か判定
  if not slc.can_transition() then
    return false
  end

  return true
end)

slc.set_condition("normal_exit", function()
  return normal_exit_check
end)

slc.set_condition("normal_exit_branch_01", function()
  return normal_exit_check
end)

slc_execute(task, ...)
