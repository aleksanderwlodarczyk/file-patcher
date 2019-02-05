function file_patcher.add_mode(modename)
  if file_patcher.preprocessors[modename] == nil then
    file_patcher.preprocessors[modename] = { }
  end
end