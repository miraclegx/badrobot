game = {}

dt = love.timer.getDelta()

function game.load()
  love.mouse.setVisible(false)
  player = {x = 100,
    y = 100,
    speed = 100,
    img = love.graphics.newImage('assets/pixelorama/badRobot.png'),
    exhaustFlame = love.graphics.newImage('assets/pixelorama/exhaust.png'),
    reticule = {img = love.graphics.newImage('assets/pixelorama/reticule.png'),
      x = 0,y = 0},
    bulletImg = love.graphics.newImage('assets/pixelorama/bullet.png'),
    bullets = {}
  }
end

function game.update()
  dt = love.timer.getDelta()
  player.reticule.x,player.reticule.y = love.mouse.getPosition()
  mouse_x,mouse_y = love.mouse.getPosition()
  -- movement
  if love.keyboard.isDown('left') then
    player.x = player.x - player.speed * dt
  elseif love.keyboard.isDown('right') then
    player.x = player.x + player.speed * dt
  end
  if love.keyboard.isDown('up') then
    player.y = player.y - player.speed * dt
  elseif love.keyboard.isDown('down') then
    player.y = player.y + player.speed * dt
  end
  -- moves the players bullet
  for i,v in pairs(player.bullets) do
    v.x = v.x + math.cos(v.angle) * (v.speed) * dt
    v.y = v.y + math.sin(v.angle) * (v.speed) * dt
  end
end

function game.draw()
  love.graphics.setBackgroundColor(.6,.7,.6)
  --love.graphics.print(dt)
  love.graphics.draw(player.img,player.x,player.y)
  --draw the bullets
  for i,v in pairs(player.bullets) do
    love.graphics.draw(player.bulletImg,v.x,v.y)
  end
  love.graphics.draw(player.reticule.img,player.reticule.x,player.reticule.y)
end

function game.keypressed(key)
  if key == 'space' then
    playerShoot()
  end
end
-- functions below
function playerShoot()
  bullet = {x = player.x,y = player.y,speed = player.speed*4}
  bullet.angle = math.atan2(mouse_y-bullet.y,mouse_x-bullet.x)
  table.insert(player.bullets,bullet)
end
function  drawFromTable(table)
  for i,v in pairs(table) do
    love.graphics.draw()
  end
end

return game