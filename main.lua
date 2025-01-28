-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
  end
  
-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

require("aliens")

local aliens = {}

  function love.load()
    aliens = AddNbAlien(10)
  end
  
  function love.update(dt)
    TransitionFrameAlien(aliens, dt)
    WalkALien(aliens, dt)
  end
  
  function love.draw()
    for index = 1, #aliens do
      local sens = 1
      local a = aliens[index]
      if a.trajectoire == 2 then
        sens = -1
      end
      love.graphics.draw(a.image[math.floor(a.frame)], a.x, a.y, 0, sens, 1, a.largeur/2)
      love.graphics.print("x "..aliens[1].x)
      love.graphics.print("position arrivé "..love.graphics.getWidth(), 0, 50)
      love.graphics.print("Trajectoire"..aliens[1].trajectoire, 0, 90)
    end
  end

   function love.keypressed(key)
    if key == "escape" then
      love.event.quit()
    end
   end
