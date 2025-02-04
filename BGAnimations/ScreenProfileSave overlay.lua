local t = Def.ActorFrame{
	LoadFont("Common Normal")..{
		Text=ScreenString("Saving Profiles");
		InitCommand=cmd(xy,_screen.cx,_screen.h+30;diffuse,color("1,1,1,1");shadowlength,1);
		OffCommand=cmd(linear,0.15;diffusealpha,0);
	};
};

--NEXT STAGE
local curstage = GAMESTATE:GetCurrentStage()
if RIO.Hearts.CheckHearts() then
	curstage = "Stage_Extra1"
elseif GAMESTATE:GetCurrentStageIndex() > 3 then
	curstage = Stage[4];
elseif curstage == "Stage_Extra1" or curstage == "Stage_Final" then --It will say this if you use snap tracks, which we don't want because it's not actually the extra stage.
	curstage = Stage[GAMESTATE:GetCurrentStageIndex()+1]
end;
--SCREENMAN:SystemMessage(curstage)

--Time until each video ends, I guess.
local delay_time = {
	Stage_1st = 8;
	Stage_2nd = 8;
	Stage_3rd = 7;
	Stage_4th = 10;
	Stage_5th = 10;
	Stage_6th = 10;
	Stage_Final = 9;
	Stage_Extra1 = 9;
};

local NextStageSleepTime = delay_time[curstage];
local WallpaperSleepTime = 5;
local bg = THEME:GetPathG("","_BGMovies/nextstage_"..curstage);
local sound = THEME:GetPathS("","nextstage_"..curstage)

if curstage == 'Stage_Event' then
	ran_nst = {"Stage_2nd","Stage_3rd","Stage_4th"};
	random_name = ran_nst[math.random(1,#ran_nst)]
	bg = THEME:GetPathG("","_BGMovies/nextstage_"..random_name);
	sound = THEME:GetPathS("","nextstage_"..random_name)
	NextStageSleepTime = delay_time[random_name];
end;
local UseNextStage = true;

if RIO.Hearts.MaxHeartsLeftForAnyPlayer() > 0 then
	--pass, already true
else
	NextStageSleepTime = 0;
	UseNextStage = false;
end;

if UseNextStage then
	t[#t+1] = LoadActor(bg)..{
		InitCommand=cmd(visible,UseNextStage;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,NextStageSleepTime;queuecommand,"Wall");
		WallCommand=cmd(linear,0.25;diffuse,color("#000000");diffusealpha,1;linear,0.25;diffusealpha,0);
	};
end;


t[#t+1] = LoadActor(sound)..{
	OnCommand=function(self)
		if UseNextStage then self:queuecommand('Play'); end;
	end;
	PlayCommand=cmd(stop;play);
	OffCommand=cmd(stop;)
};


		
t[#t+1] = Def.Actor {
	BeginCommand=function(self)
		self:sleep(NextStageSleepTime+WallpaperSleepTime);
		self:queuecommand("Load");
	end;
	LoadCommand=function()
		--Workaround for SaveProfileCustom not being called by SM
		for player in ivalues(GAMESTATE:GetHumanPlayers()) do
			local profileDir = PROFILEMAN:GetProfileDir(ProfileSlot[PlayerNumber:Reverse()[player]+1]);
			SaveProfileCustom(PROFILEMAN:GetProfile(player),profileDir);
			--If there are no stages left, save extra data needed for memory cards.
			if RIO.Hearts.Values["HeartsLeft"][tonumber(string.match(player, "%d"))] < 1 then
				if PROFILEMAN:ProfileWasLoadedFromMemoryCard(player) then
					SaveMemcardProfileData(player);
				end;
				--Remove player manually because SM doesn't know when to do it because we're using hearts.
				GAMESTATE:UnjoinPlayer(player)
				--SCREENMAN:SystemMessage("Unjoined "..player)
			end;
		end;
		SCREENMAN:GetTopScreen():Continue();
	end;
};

if RIO.DoDebug then
	t[#t+1] = LoadFont("Common Normal")..{	--percentage scoring P1
		InitCommand=cmd(zoom,2;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		Text=curstage.." - Delay: "..NextStageSleepTime;
	};
	
	t[#t+1] = LoadFont("Common Normal")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;addy,100);
		Text="P1 HEARTS: "..RIO.Hearts.Values["HeartsLeft"][1].."\nP2 HEARTS: "..RIO.Hearts.Values["HeartsLeft"][2].."\nMAX HEARTS: "..RIO.Hearts.MaxHeartsLeftForAnyPlayer();
	};
end;
return t;
