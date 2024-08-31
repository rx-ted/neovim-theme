local function get_file_extension(filename)
  return filename:match("^.*%.(%w+)$")
end

local function scandir(directory)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls -a "' .. directory .. '"')
  if pfile == nil then
    return t
  end
  for filename in pfile:lines() do
    if not (filename == "." or filename == "..") then
      i = i + 1
      t[i] = filename
    end
  end
  pfile:close()
  return t
end

---find files
---@param dir string
---@param t table
---@return table
local function find_files(dir, t)
  local files = scandir(dir)
  for _, file in ipairs(files) do
    local full_path = dir .. "/" .. file
    if vim.fn.isdirectory(full_path) == 1 then
      find_files(full_path, t)
    else
      table.insert(t, full_path)
    end
  end
  return t
end

---select if it's equal to pattern, return it.
---@param dir string
---@param pattern string
---@return string | nil
local function select_or_return_file(dir, pattern)
  local files = {}
  for _, value in ipairs(find_files(dir, {})) do
    if get_file_extension(value) == pattern then
      table.insert(files, value)
    end
  end

  if #files == 0 then
    print("No " .. pattern .. " files found.")
    return nil
  elseif #files == 1 then
    print("Found one " .. pattern .. " file:")

    print(files[1])
    return files[1]
  else
    -- 显示选项让用户选择
    local choice = nil
    for i, file in ipairs(files) do
      print(i .. ": " .. file)
    end
    while choice == nil or choice < 1 or choice > #files do
      choice = tonumber(vim.fn.input("Enter the number of the file to use: "))
    end
    return files[choice]
  end
end

return {
  scandir = scandir,
  find_files = find_files,
  select_or_return_file = select_or_return_file,
}
