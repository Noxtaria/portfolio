pad = {}
pad.x = 10
pad.y = 260
pad.largeur = 20
pad.hauteur = 80

pad2 = {}
pad2.x = 770
pad2.y = 260
pad.largeur = 20
pad.hauteur = 80

balle = {}
balle.x = 400
balle.y = 300
balle.largeur = 8
balle.hauteur = 8
balle.vitesse_x = 2
balle.vitesse_y = 2

score_joueur1 = 0
score_joueur2 = 0


function CentreBalle()
  balle.x = love.graphics.getWidth() / 2 - balle.largeur /2
 -- balle.x = balle.x - balle.largeur / 2
  
  balle.y = love.graphics.getHeight() / 2 - balle.hauteur /2
--  balle.y = balle.y - balle.hauteur / 2
  
  balle.vitesse_x = 2
  balle.vitesse_y = 2
end

function love.load()
  
balle.x = love.graphics.getWidth() / 2
balle.x = balle.x - balle.largeur / 2

balle.y = love.graphics.getHeight() / 2
balle.y = balle.y - balle.hauteur / 2

CentreBalle()
  
end

function love.update()
  
if love.keyboard.isDown("s") and pad.y < love.graphics.getHeight() - pad.hauteur then
  pad.y = pad.y + 2
end
if love.keyboard.isDown("z") and pad.y > 0 then
  pad.y = pad.y - 2
end

if love.keyboard.isDown("down") and pad2.y < love.graphics.getHeight() - pad.hauteur then
  pad2.y = pad2.y + 2
end
if love.keyboard.isDown("up") and pad2.y > 0 then
  pad2.y = pad2.y - 2
end

balle.x = balle.x + balle.vitesse_x
balle.y = balle.y + balle.vitesse_y

if balle.x < 0 then
  balle.vitesse_x = balle.vitesse_x * -1
end
if balle.y < 0 then
  balle.vitesse_y = balle.vitesse_y * -1
end
if balle.x > love.graphics.getWidth() - balle.largeur then
  balle.vitesse_x = balle.vitesse_x * -1
end
if balle.x > love.graphics.getWidth() - balle.largeur then
  CentreBalle()
  score_joueur1 = score_joueur1 + 1
end
if balle.y > love.graphics.getHeight() - balle.hauteur then
  balle.vitesse_y = balle.vitesse_y * -1
end

if balle.x <= pad.x + pad.largeur then
  if balle.y + balle.hauteur > pad.y and balle.y < pad.y + pad.hauteur then
    balle.vitesse_x = balle.vitesse_x * -1
end
end

if balle.x + balle.largeur > pad2.x then
  if balle.y + balle.hauteur > pad2.y and balle.y < pad2.y + pad.hauteur then
    balle.vitesse_x = balle.vitesse_x * -1
end
end

if balle.x <= 0 then
  CentreBalle()
  score_joueur2 = score_joueur2 + 1
end

end

function love.draw()

love.graphics.rectangle("fill", pad.x, pad.y, pad.largeur, pad.hauteur)
love.graphics.rectangle("fill", pad2.x, pad2.y, pad.largeur, pad.hauteur)
love.graphics.circle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)

local score = score_joueur1.." - " ..score_joueur2
love.graphics.print(score, 380, 0)

end
