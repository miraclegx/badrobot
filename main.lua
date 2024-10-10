-- started october 10th
  Player = require('objs/player')
  
  currentScene = player
	function love.load()
    currentScene.load()
	end

	function love.update(dt)
    currentScene.update()
	end

	function love.draw()
    currentScene.draw()
	end

	function love.keypressed(key)
		if key =='' then

		end
	end	

