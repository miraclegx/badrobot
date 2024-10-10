player = {}

dt = love.timer.getDelta()
function player:load()
  player = {x = 100,
    y = 100,
    speed = 100,
    img = love.graphics.newImage('assets/pixelorama/badRobot.png')}
end

function player:update()
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

function player:draw()
  love.graphics.setBackgroundColor(.6,.7,.6)
  love.graphics.draw(player.img,player.x,player.y)
end

function player:keypressed(key)
  
end

return player