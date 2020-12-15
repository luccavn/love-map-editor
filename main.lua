require "config"

function love.load()
	love.mouse.setVisible(false)
	cursor = love.graphics.newImage("res/cursor.png")
	tileset = love.graphics.newImage("tilesets/" .. tileset_name)
	selecting_tile = false
end

function love.keypressed(key)
	if key == "g" then
		show_grid = not show_grid
	elseif key == "s" then
		show_selection = not show_selection
	elseif key == "t" then
		selecting_tile = not selecting_tile
	end
end

function love.update(_dt)
	window_width, window_height = love.graphics.getDimensions()
	mouse_x, mouse_y = love.mouse.getPosition()
	selection_i, selection_j = math.floor(mouse_x/grid_width), math.floor(mouse_y/grid_height)
	selection_x, selection_y = selection_i*grid_width, selection_j*grid_height
end

function love.draw()
	love.graphics.draw(cursor, mouse_x-3, mouse_y-1)

	if show_grid then
		for i = 0, window_width, grid_width do
			love.graphics.line(i, 0, i, window_height)
		end
		for j = 0, window_height, grid_height do
			love.graphics.line(0, j, window_width, j)
		end
	end

	if show_selection then
		love.graphics.rectangle("line", selection_x, selection_y, grid_width, grid_height)
	end
end
