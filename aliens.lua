
local aliens = {}
local positionArrivee = love.graphics.getWidth()
local largeur = love.graphics.newImage("/marche1.png"):getWidth()
local hauteur = love.graphics.newImage("/marche1.png"):getHeight()
local goBack = false


-- On creer une usine alien avec ses champs
function CreateAlien()    
local alien = {
    image = {},
    x = 0,
    y = math.random(0, love.graphics.getHeight() - hauteur),
    speed = math.random(100, 500),
    largeur = largeur,
    hauteur = hauteur,
    frame = 1,
    scaleX = 0
  }
    table.insert(alien.image,love.graphics.newImage("/marche1.png"))
    table.insert(alien.image,love.graphics.newImage("/marche2.png"))
  return alien
end

-- on creer la fonction qui nous permettra de gerer le nb d'alien
function AddNbAlien(nbAlien)
    for index = 1, nbAlien do 
        table.insert(aliens, CreateAlien())
    end
    return aliens
end

-- on gere l'animation de marche avec un switch de frame de notre alien
function TransitionFrameAlien(aliens, dt)

    --On boucle sur les champs de l'alien
    for index = 1, #aliens do 
        -- on gere la vitesse de transition de chaque frame
        aliens[index].frame = aliens[index].frame + 8 * dt
        if aliens[index].frame >= 3 then
            aliens[index].frame = 1
          end
    end
end


-- ici on gere le deplacement des aliens de gauche a droite avec effet mirroir
function WalkALien(aliens, dt)

    for index = 1, #aliens do
        -- ici le deplacement des aliens
        if aliens[index].x <= positionArrivee - aliens[index].largeur and goBack == false then
            aliens[index].x = aliens[index].x + aliens[index].speed * dt
        end
    end
    print(goBack)
    for index = 1, #aliens do
        -- ici le deplacement des aliens
        if aliens[index].x >= positionArrivee - aliens[index].largeur then
            goBack = not goBack
            if goBack == false then
                aliens[index].x = aliens[index].x - aliens[index].speed * dt
            end
        end
    end
end

function AlienOnStartingBlock(aliens)
    for index =1, #aliens do 
        aliens[index].y = aliens[index].y + aliens[index].hauteur
    end
    return aliens
end


-- if aliens[index].x >= positionArrivee - aliens[index].largeur and goBack == true then
--     aliens[index].x = aliens[index].x - aliens[index].speed * dt
-- end
