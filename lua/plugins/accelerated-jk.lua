-- accelerated-jk
require("accelerated-jk").setup({
	mode = "time_driven",
	acceleration_motions = { "j", "k", "gj", "gk", "h", "l", "w", "b", "e", "ge" },
	acceleration_limit = 150,
	-- acceleration_table = { 0 },
	acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
	-- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
	enable_deceleration = false,
	deceleration_table = { { 150, 9999 } },
})
