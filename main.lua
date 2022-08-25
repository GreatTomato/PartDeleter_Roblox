
local UserInputService = game:GetService("UserInputService")
local bool  = Instance.new("BoolValue", game.Players.LocalPlayer.Character)
bool.Value = false
game:GetService('RunService').Heartbeat:Connect(function()
if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
	if not(bool.Value) then
		function getMouseTarget()
			local cursorPosition = game:GetService("UserInputService"):GetMouseLocation()
			local oray = game.workspace.CurrentCamera:ViewportPointToRay(cursorPosition.x, cursorPosition.y, 0)
			local ray = Ray.new(game.Workspace.CurrentCamera.CFrame.p,(oray.Direction * 1000))
			return workspace:FindPartOnRay(ray)
		end
		local part, mousepos = getMouseTarget()
		part:Destroy()
		bool.Value = true
	end
elseif bool.Value then bool.Value = false end
end)
