-- started october 10th
  --Player = require('objs/player')
  Game = require('scenes/game')
  
  currentScene = game
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
    currentScene.keypressed(key)
	end	

