{ pkgs, config, ... }:
# NOTE: WIP
{
  ### Email
  programs = {
    mbsync.enable = true;
    msmtp.enable = true;
    notmuch = {
      enable = true;
      hooks = {
        preNew = "mbsync --all";
      };
    };
  };

  accounts.email = {
    accounts.gmail = {
      address = "wesleyjr2002@gmail.com";
      maildir = { path = "gmail"; };
      folders = {
        inbox  = "inbox";
        drafts = "drafts";
        sent   = "sent";
        trash  = "trash";
      };
      # Reserved for gpg configuration
      imap.host = "gmail.com";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
      primary = true;
      realName = "Wesley V. Santos Jr.";
      signature = {
        text = ''
          Wesley V. Santos Jr.
        '';
        showSignature = "append";
      };
      passwordCommand = "mail-password";
      smtp = {
        host = "gmail.com";
      };
      userName = "wesleyjr2002@gmail.com";
    };
  };
}
