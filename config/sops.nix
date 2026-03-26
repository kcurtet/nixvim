# ============================================================================
# SOPS - Automatic encryption/decryption of secrets files
# ============================================================================
# Automatically decrypts secrets.yaml files on open and encrypts on save
{
  config,
  lib,
  pkgs,
  ...
}: {
  # Autocommand to handle SOPS encrypted files
  autoGroups = {
    sops-group = {
      clear = true;
    };
  };

  autoCmd = [
    {
      # Decrypt on read (before reading the buffer)
      event = ["BufReadPre"];
      pattern = ["secrets.yaml" "*/secrets/*.yaml" "*/secrets/*.yml" "*.secret.yaml"];
      callback = lib.mkForce null; # Clear any existing
      group = "sops-group";
    }
    {
      # Decrypt after reading (replace encrypted content with decrypted)
      event = ["BufReadPost"];
      pattern = ["secrets.yaml" "*/secrets/*.yaml" "*/secrets/*.yml" "*.secret.yaml"];
      callback = ''
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local filepath = vim.api.nvim_buf_get_name(bufnr)
          
          -- Check if file is SOPS encrypted (contains ENC[)
          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 10, false)
          local is_encrypted = false
          for _, line in ipairs(lines) do
            if line:match("ENC%[") then
              is_encrypted = true
              break
            end
          end
          
          if not is_encrypted then
            return -- Not encrypted, nothing to do
          end
          
          -- Decrypt using sops
          local decrypted = vim.fn.systemlist({"sops", "--decrypt", filepath})
          if vim.v.shell_error ~= 0 then
            vim.notify("Failed to decrypt " .. filepath .. ": " .. table.concat(decrypted, "\n"), vim.log.levels.ERROR)
            return
          end
          
          -- Replace buffer content with decrypted content
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, decrypted)
          vim.bo[bufnr].modified = false
          vim.b[bufnr].sops_encrypted = true
          
          vim.notify("SOPS: Decrypted " .. vim.fn.fnamemodify(filepath, ":t"), vim.log.levels.INFO)
        end
      '';
      group = "sops-group";
    }
    {
      # Encrypt before writing
      event = ["BufWritePre"];
      pattern = ["secrets.yaml" "*/secrets/*.yaml" "*/secrets/*.yml" "*.secret.yaml"];
      callback = ''
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          
          -- Only encrypt if we decrypted it (or it's a new secrets file)
          if not vim.b[bufnr].sops_encrypted and not vim.b[bufnr].sops_new then
            return
          end
          
          local filepath = vim.api.nvim_buf_get_name(bufnr)
          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
          
          -- Write decrypted content to temp file
          local tmpfile = vim.fn.tempname()
          vim.fn.writefile(lines, tmpfile)
          
          -- Encrypt using sops (encrypt in place)
          local result = vim.fn.system({"sops", "--encrypt", "--in-place", tmpfile})
          if vim.v.shell_error ~= 0 then
            vim.notify("Failed to encrypt: " .. result, vim.log.levels.ERROR)
            vim.fn.delete(tmpfile)
            return
          end
          
          -- Read encrypted content and replace buffer
          local encrypted = vim.fn.readfile(tmpfile)
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, encrypted)
          vim.fn.delete(tmpfile)
        end
      '';
      group = "sops-group";
    }
    {
      # After writing, restore decrypted content in buffer
      event = ["BufWritePost"];
      pattern = ["secrets.yaml" "*/secrets/*.yaml" "*/secrets/*.yml" "*.secret.yaml"];
      callback = ''
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          
          if not vim.b[bufnr].sops_encrypted and not vim.b[bufnr].sops_new then
            return
          end
          
          local filepath = vim.api.nvim_buf_get_name(bufnr)
          
          -- Read the encrypted file we just wrote and decrypt back to buffer
          local decrypted = vim.fn.systemlist({"sops", "--decrypt", filepath})
          if vim.v.shell_error ~= 0 then
            return -- Might fail if file wasn't actually encrypted
          end
          
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, decrypted)
          vim.bo[bufnr].modified = false
          
          vim.notify("SOPS: Encrypted and saved", vim.log.levels.INFO)
        end
      '';
      group = "sops-group";
    }
    {
      # Mark new secrets files
      event = ["BufNewFile"];
      pattern = ["secrets.yaml" "*/secrets/*.yaml" "*/secrets/*.yml" "*.secret.yaml"];
      callback = ''
        function()
          vim.b[vim.api.nvim_get_current_buf()].sops_new = true
        end
      '';
      group = "sops-group";
    }
  ];

  # Command to manually toggle encryption status
  userCommands = {
    SopsEncrypt = {
      command = ''
        function()
          vim.b.sops_encrypted = true
          vim.notify("Marked for SOPS encryption on save", vim.log.levels.INFO)
        end
      '';
      desc = "Mark current buffer for SOPS encryption";
    };
    SopsDecrypt = {
      command = ''
        function()
          local filepath = vim.api.nvim_buf_get_name(0)
          local decrypted = vim.fn.systemlist({"sops", "--decrypt", filepath})
          if vim.v.shell_error ~= 0 then
            vim.notify("Failed to decrypt: " .. table.concat(decrypted, "\n"), vim.log.levels.ERROR)
            return
          end
          vim.api.nvim_buf_set_lines(0, 0, -1, false, decrypted)
          vim.b.sops_encrypted = true
          vim.notify("Decrypted", vim.log.levels.INFO)
        end
      '';
      desc = "Manually decrypt current SOPS file";
    };
    SopsStatus = {
      command = ''
        function()
          if vim.b.sops_encrypted then
            print("SOPS: Encrypted (will encrypt on save)")
          elseif vim.b.sops_new then
            print("SOPS: New file (will encrypt on save)")
          else
            print("SOPS: Not managed")
          end
        end
      '';
      desc = "Show SOPS status for current buffer";
    };
  };

  # Ensure sops is available
  extraPackages = [pkgs.sops];
}
