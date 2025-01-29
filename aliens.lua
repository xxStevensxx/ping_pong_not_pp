
local aliens = {}
local positionArrivee = love.graphics.getWidth()
local largeur = love.graphics.newImage("/marche1.png"):getWidth()
local hauteur = love.graphics.newImage("/marche1.png"):getHeight()


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
    scaleX = 0,
    trajectoire = 1
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
        local alien = aliens[index]
        -- on gere la vitesse de transition de chaque frame
        alien.frame = alien.frame + 10 * dt
        if alien.frame >= 3 then
            alien.frame = 1
          end
    end
end


-- ici on gere le deplacement des aliens de gauche a droite avec effet mirroir
function WalkALien(aliens, dt)
    for index = 1, #aliens do
        local alien = aliens[index]
        -- ici on gere le deplacement des aliens et l'inversion
        if alien.trajectoire == 1 then
            alien.x = alien.x + alien.speed * dt
        else 
            alien.x = alien.x - alien.speed * dt
        end
        -- On gere la limite de deplacement des aliens dans le sens allée
        if alien.x <= positionArrivee/8 - alien.largeur  then
            alien.trajectoire = 1
        end
        -- On gere la limite de deplacement des aliens dans le sens retour
        if alien.x >= positionArrivee - alien.largeur/2 then
            alien.trajectoire = 2
        end
    end
end

