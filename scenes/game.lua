game = {}
sti = require('sti')
dt = love.timer.getDelta()

function game.load()
  map = sti('assets/pixelorama/map.lua')
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
  
  enemies = {}
  enemiesImg = love.graphics.newImage('assets/pixelorama/badRobotEnemies.png')
end

function game.update()
  dt = love.timer.getDelta()
  player.reticule.x,player.reticule.y = love.mouse.getPosition()
  mouse_x,mouse_y = love.mouse.getPosition()
  -- movement
  if love.keyboard.isDown('a') then
    player.x = player.x - player.speed * dt
  elseif love.keyboard.isDown('d') then
    player.x = player.x + player.speed * dt
  end
  if love.keyboard.isDown('w') then
    player.y = player.y - player.speed * dt
  elseif love.keyboard.isDown('s') then
    player.y = player.y + player.speed * dt
  end
  -- moves the players bullet
  for i,v in pairs(player.bullets) do
    if v.direction == false then
      v.x = v.x + math.cos(v.angle) * (v.speed) * dt
      v.y = v.y + math.sin(v.angle) * (v.speed) * dt
    end
  end
  moveBulletDirectionWise(player.bullets)
  -- simple logic to make the enemies move towards the player
  for i,v in pairs(enemies) do
    v.angle = math.atan2(player.y-v.y,player.x-v.x)
    v.x = v.x + math.cos(v.angle) * v.speed * dt
    v.y = v.y + math.sin(v.angle) * v.speed * dt
  end
end

function game.draw()
  map:draw()
  --love.graphics.setBackgroundColor(.6,.7,.6)
  --love.graphics.print(dt)
  --draw the enemies
  for i,v in pairs(enemies) do
    love.graphics.draw(enemiesImg,v.x,v.y)
  end
  --draw the player
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
  elseif key == 'x' then
    spawnEnemy()
  elseif key == 'up' then
    shootBulletDirectionWise(up,player.bullets)
  end
end
-- functions below
function playerShoot()
  bullet = {x = player.x,y = player.y,speed = player.speed*4}
  bullet.angle = math.atan2(mouse_y-bullet.y,mouse_x-bullet.x)
  table.insert(player.bullets,bullet)
end
function shootBulletDirectionWise(direction)
  -- valid args are up down left right
  bullet = {x = player.x,y = player.y,speed = player.speed*4,direction = direction}
  table.insert(player.bullets,bullet)
end
function moveBulletDirectionWise(table)
  -- will be nice if i can make the fuction work without a table
 for i,v in pairs(table) do
    if v.direction == 'up' then
      v.y = v.y * v.speed *dt
    elseif v.direction == 'down' then
      v.y = v.y * v.speed * dt
    elseif v.direction == 'left' then
      v.x = v.x *(-v.speed) *dt
    elseif v.direction == 'right' then
      v.x = v.x * v.speed *dt
    end
end
end
function spawnEnemy()
  enemy = {x = 0,y = 0,img = enemy_img,speed = 50,angle = 0}
  table.insert(enemies,enemy)
end

return game