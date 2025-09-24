Ayos! 🔥 Salamat sa full list ng mga seeds/plants.
Gagawan na kita ng Rayfield Auto-Buy UI na may dropdown (para piliin mo kung anong seed), at isang Buy button lang para i-trigger.


---

📜 Full Script (Auto-Buy Seeds UI)

--// Check Game ID (Plants Vs Brainrot only)
if game.GameId ~= 127742093697776 then
    warn("❌ This script only works for Plants Vs Brainrot")
    return
end

--// Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--// Create Window
local Window = Rayfield:CreateWindow({
   Name = "Plants Vs Brainrot Hub",
   LoadingTitle = "Plants Vs Brainrot Script",
   LoadingSubtitle = "by You",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PVZBrainrotHub",
      FileName = "Config"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false -- 🔓 no key system
})

--// Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)

--// Section
local Section = MainTab:CreateSection("Auto-Buy Seeds")

--// Function to Buy Item
local function BuyItem(itemName)
    local args = {
        [1] = {
            [1] = itemName;
            [2] = ""; -- fixed constant
        };
    }
    game:GetService("ReplicatedStorage")
        :WaitForChild("BridgeNet2", 9e9)
        :WaitForChild("dataRemoteEvent", 9e9)
        :FireServer(unpack(args))
end

--// Seed List
local Seeds = {
    "Cactus",
    "Strawberry",
    "Pumpkin",
    "Sunflower",
    "Dragon Fruit",
    "Eggplant",
    "Watermelon",
    "Cocotank",
    "Carnivorous Plant",
    "Mr Carrot",
    "Tomatrio"
}

--// Selected Seed (default)
getgenv().SelectedSeed = Seeds[1]

--// Dropdown to select seed
MainTab:CreateDropdown({
   Name = "Choose Seed",
   Options = Seeds,
   CurrentOption = Seeds[1],
   Flag = "SeedDropdown",
   Callback = function(Option)
      getgenv().SelectedSeed = Option
      Rayfield:Notify({
         Title = "Seed Selected",
         Content = "You selected: " .. Option,
         Duration = 3
      })
   end,
})

--// Buy Button
MainTab:CreateButton({
   Name = "Buy Selected Seed",
   Callback = function()
      if getgenv().SelectedSeed then
         BuyItem(getgenv().SelectedSeed)
      end
   end,
})


---

🔑 Features:

Dropdown menu → piliin mo kung anong seed.

Buy button → auto-send sa server gamit yung tamang remote.

Pwede mong ulit-ulitin nang mabilis, wala nang mano-mano.



---

❓Gusto mo ba dagdagan ko pa ng Auto-Buy Loop (hal. tuloy-tuloy siyang bibili ng selected seed habang naka-toggle on), o sapat na muna yung manual button?

