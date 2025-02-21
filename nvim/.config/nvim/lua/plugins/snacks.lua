return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{ "<leader>n", ":lua require('snacks').notifier.show_history()<cr>", desc = "Notifications History" },
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer Snacks (root dir)",
		},
		-- {
		-- 	"<leader>fE",
		-- 	function()
		-- 		Snacks.explorer()
		-- 	end,
		-- 	desc = "Explorer Snacks (cwd)",
		-- },
	},
	opts = {
		notifier = {},
		lazygit = {},
		explorer = {},
		dashboard = {
			preset = {
				header = [[
               ;               ,           
             ,;                 '.         
            ;:                   :;        
           ::                     ::       
           ::                     ::       
           ':                     :        
            :.                    :        
         ;' ::                   ::  '     
        .'  ';                   ;'  '.    
       ::    :;                 ;:    ::   
       ;      :;.             ,;:     ::   
       :;      :;:           ,;"      ::   
       ::.      ':;  ..,.;  ;:'     ,.;:   
        "'"...   '::,::::: ;:   .;.;""'    
            '"""....;:::::;,;.;"""         
        .:::.....'"':::::::'",...;::::;.   
       ;:' '""'"";.,;:::::;.'""""""  ':;   
      ::'         ;::;:::;::..         :;  
     ::         ,;:::::::::::;:..       :: 
     ;'     ,;;:;::::::::::::::;";..    ':.
    ::     ;:"  ::::::"""'::::::  ":     ::
     :.    ::   ::::::;  :::::::   :     ; 
      ;    ::   :::::::  :::::::   :    ;  
       '   ::   ::::::....:::::'  ,:   '   
        '  ::    :::::::::::::"   ::       
           ::     ':::::::::"'    ::       
           ':       """""""'      ::       
            ::                   ;:        
            ':;                 ;:"        
              ';              ,;'          
        ]],
				keys = {
					-- {
					-- 	icon = " ",
					-- 	key = "f",
					-- 	desc = "Find File",
					-- 	action = ":lua Snacks.dashboard.pick('files')",
					-- },
					{
						icon = " ",
						key = "n",
						desc = "Notifications history",
						action = ":lua require('snacks').notifier.show_history()",
					},
					-- {
					-- 	icon = " ",
					-- 	key = "g",
					-- 	desc = "Find Text",
					-- 	action = ":lua Snacks.dashboard.pick('live_grep')",
					-- },
					-- {
					-- 	icon = " ",
					-- 	key = "r",
					-- 	desc = "Recent Files",
					-- 	action = ":lua Snacks.dashboard.pick('oldfiles')",
					-- },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					-- { icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},

			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
	},
}
