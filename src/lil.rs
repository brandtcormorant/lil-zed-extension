use zed_extension_api::{self as zed, settings::LspSettings, LanguageServerId, Result, Worktree};

struct LilExtension;

impl zed::Extension for LilExtension {
    fn new() -> Self {
        LilExtension
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<zed::Command> {
        let settings_path = LspSettings::for_worktree("lil", worktree)
            .ok()
            .and_then(|s| s.binary)
            .and_then(|b| b.path)
            .filter(|p| p.contains('/'));

        let binary = settings_path
            .or_else(|| worktree.which("lil"))
            .ok_or_else(|| {
                "lil not found on PATH. Install lil or configure the binary path in Zed settings: {\"lsp\": {\"lil\": {\"binary\": {\"path\": \"/path/to/lil\"}}}}".to_string()
            })?;

        Ok(zed::Command {
            command: binary,
            args: vec!["lsp".to_string()],
            env: Vec::new(),
        })
    }
}

zed::register_extension!(LilExtension);
