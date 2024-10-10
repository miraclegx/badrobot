game = {}

dt = love.timer.getDelta()

function game:load()
  love.mouse.setVisible(false)
  player = {x = 100,
    y = 100,
    speed = 100,
    img = love.graphics.newImage('assets/pixelorama/badRobot.png'),
    exhaustFlame = love.graphics.newImage('assets/pixelorama/exhaust.png'),
    reticule = {img = love.graphics.newImage('assets/pixelorama/reticule.png'),
      x = 0,y = 0}
  }
end

function game:update()
  player.reticule.x,player.reticule.y = love.mouse.getPosition()
  -- movement
  if love.keyboard.isDown('left') then
    player.x = player.x - 2 * dt
  elseif love.keyboard.isDown('right') then
    player.x = player.x + 2 * dt
  end
  if love.keyboard.isDown('up') then
    player.y = player.y - 2 * dt
  elseif love.keyboard.isDown('down') then
    player.y = player.y + 2 * dt
  end
end

function game:draw()
  love.graphics.setBackgroundColor(.6,.7,.6)
  love.graphics.draw(player.img,player.x,player.y)
  love.graphics.draw(player.reticule.img,player.reticule.x,player.reticule.y)
end

function game:keypressed(key)
  
end

return game