local M = {}
function AddTemplateFileType()
    vim.filetype.add {
    pattern = {
      ['.*/templates/.(%a+)'] = function(path, bufnr, ext)
        if ext == 'gohtml' or ext == 'templ' then
          return 'html'
        end
    end,
    },
  }
end

return M
