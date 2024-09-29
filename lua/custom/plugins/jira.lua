local function loadEnv()
  local envfile = vim.fn.stdpath 'config' .. '/.env'
  local env = {}
  local file = io.open(envfile, 'r')
  if not file then
    return
  end

  for line in file:lines() do
    local key, value = line:match '([^=]+)=([^=]+)'
    if key and value then
      env[string.lower(key)] = value
    end
  end

  file:close()
  return env
end

return {
  'Funk66/jira.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local env = loadEnv()
    if env == nil then
      return
    end
    require('jira').setup {
      domain = env['jira_domain'],
      user = env['jira_user'],
      token = env['jira_api_token'],
      key = env['jira_project_key'],
    }
  end,
  cond = function()
    local env = loadEnv()
    if env == nil then
      return false
    end
    return env['jira_domain'] ~= nil and env['jira_user'] ~= nil and env['jira_api_token'] ~= nil and env['jira_project_key'] ~= nil
  end,
  keys = function()
    local jira = require 'jira'
    return {
      { '<leader>jv', jira.view_issue, desc = 'View issue' },
      { '<leader>jo', jira.open_issue, desc = 'Open in browser' },
    }
  end,
}
