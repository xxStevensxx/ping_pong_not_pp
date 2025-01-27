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
      love.graphics.draw(aliens[index].image[math.floor(aliens[index].frame)], aliens[index].x, aliens[index].y)


      love.graphics.print(aliens[index].frame, 75, 150)
      love.graphics.print(aliens[1].y, 175, 250)
      love.graphics.print("speed "..aliens[1].speed, 275, 100)
      love.graphics.print("x "..aliens[1].x, 50, 300)
    end
  end


   function love.keypressed(key)
    if key == "escape" then
      love.event.quit()
    end
   end
