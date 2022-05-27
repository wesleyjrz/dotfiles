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
		neomutt = {
			enable = true;
			vimKeys = true;
			extraConfig = ''
			# Main options
			set quit  # don't confirm when quitting
			set charset = "utf-8"
			set tmpdir = "~/.local/cache/mutt"
			set header_cache = "~/.local/cache/mutt"
			set message_cache = "~/.local/cache/mutt"

			# Style
			unset sig_dashes  # no dashes before signature
			set date_format = "%Y-%m-%d %H:%M"
			'';
		};
	};

	accounts.email = {
		accounts.gmail = {
			flavor = "gmail.com"; # set IMAP and SMTP automatically (make sure) IMAP is enabled on Gmail settings
			address = "wesleyjr2002@gmail.com";
			maildir = { path = "gmail"; };
			folders = {
				inbox  = "inbox";
				drafts = "drafts";
				sent   = "sent";
				trash  = "trash";
			};
			mbsync = {
				enable = true;
				create = "maildir";
			};
			msmtp.enable = true;
			notmuch.enable = true;
			neomutt.enable = true;
			primary = true;
			realName = "Wesley V. Santos Jr.";
			signature = {
				text = ''
				••• Wesley V. Santos Jr.
				'';
				showSignature = "append";
			};
			passwordCommand = "cat ~/Documents/general/mail-password.txt";
			userName = "wesleyjr2002@gmail.com";
		};
	};
}
