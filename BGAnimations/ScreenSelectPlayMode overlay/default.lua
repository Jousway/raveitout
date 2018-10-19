local defaultzoom = 0.55;
local distance = IsUsingWideScreen() and SCREEN_WIDTH/5 or SCREEN_WIDTH/3;
local shine_index = 1;
if IsUsingWideScreen() then
	default_width = SCREEN_WIDTH+20
else
	default_width = SCREEN_WIDTH
end;

return Def.ActorFrame{

	Def.ActorFrame{

		LoadActor(THEME:GetPathG("","_BGMovies/selplaymode"))..{
			InitCommand=cmd(Center;Cover);
			--InitCommand=cmd(Center;zoomto,default_width,SCREEN_HEIGHT)
		};
		
		LoadActor("fade")..{
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
		};

		LoadActor("top")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP;horizalign,center;vertalign,top;zoom,0.6;);
		};
		
		LoadActor("layer")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+2;horizalign,center;vertalign,top;zoom,0.66;);
		};
		
		LoadFont("monsterrat/_montserrat light 60px")..{	
			InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_TOP+11;zoom,0.35;skewx,-0.15);
			OnCommand=function(self)
				self:uppercase(true);
				self:settext("SELECT YOUR GAMEMODE");
			end;
		};
		
	};



	Def.ActorFrame{


		InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_BOTTOM+500;);
		
		OnCommand=cmd(sleep,0.3;decelerate,0.5;x,distance/2;y,SCREEN_CENTER_Y);
		MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
		MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
		MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
		MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
		MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
		MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
		MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
		MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
		RefreshCommand=function(self)
			if not IsUsingWideScreen() then
				if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) > 2 then
					self:stoptweening():decelerate(.5):x(-distance*2.5);
				else
					self:stoptweening():decelerate(.5):x(distance/2);
				end;
			end;
		end;

		LoadActor(THEME:GetPathG("","PlayModes/Easy"))..{
			InitCommand=cmd(zoom,0.45;x,0;y,0);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
			
				OnCommand=cmd(playcommand,"Refresh");
				MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
				MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
				
				RefreshCommand=function(self)
					if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 0 then
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(defaultzoom);
						self:diffusealpha(1);
						self:pulse();
						self:effectmagnitude(1,1.05,1);
						self:effectperiod(1);
					else
						self:stopeffect();
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(0.5);
						self:diffusealpha(0.45);
					end;
				end;
			
		};

		LoadActor(THEME:GetPathG("","PlayModes/Arcade"))..{
			InitCommand=cmd(zoom,0.45;x,distance;y,0);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
			
				OnCommand=cmd(playcommand,"Refresh");
				MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
				MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
				
				RefreshCommand=function(self)
					if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 1 then
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(defaultzoom);
						self:diffusealpha(1);
						self:pulse();
						self:effectmagnitude(1,1.05,1);
						self:effectperiod(1);
					else
						self:stopeffect();
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(0.5);
						self:diffusealpha(0.45);
					end;
				end;
			
		};
				
		LoadActor(THEME:GetPathG("","PlayModes/Pro"))..{
			InitCommand=cmd(zoom,0.45;x,distance*2);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
			
				OnCommand=cmd(playcommand,"Refresh");
				MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
				MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
				
				RefreshCommand=function(self)
					if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 2 then
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(defaultzoom);
						self:diffusealpha(1);
						self:pulse();
						self:effectmagnitude(1,1.05,1);
						self:effectperiod(1);
					else
						self:stopeffect();
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(0.5);
						self:diffusealpha(0.45);
					end;
				end;				
		};
		LoadActor(THEME:GetPathG("","PlayModes/Mixtapes"))..{
			InitCommand=cmd(zoom,0.45;x,distance*3);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
			
				OnCommand=cmd(playcommand,"Refresh");
				MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
				MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
				
				RefreshCommand=function(self)
					if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 3 then
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(defaultzoom);
						self:diffusealpha(1);
						self:pulse();
						self:effectmagnitude(1,1.05,1);
						self:effectperiod(1);
					else
						self:stopeffect();
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(0.5);
						self:diffusealpha(0.45);
					end;
				end;				
		};
		
		LoadActor(THEME:GetPathG("","PlayModes/Special"))..{
			InitCommand=cmd(zoom,0.45;x,distance*4);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
			
				OnCommand=cmd(playcommand,"Refresh");
				MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
				MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
				MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
				MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
				MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
				
				RefreshCommand=function(self)
					if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 4 then
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(defaultzoom);
						self:diffusealpha(1);
						self:pulse();
						self:effectmagnitude(1,1.05,1);
						self:effectperiod(1);
					else
						self:stopeffect();
						self:stoptweening();
						self:decelerate(0.15);
						self:zoom(0.5);
						self:diffusealpha(0.45);
					end;
				end;				
		};
		--]]
		--VIDEO MASK
		LoadActor(THEME:GetPathG("","PlayModes/mask"))..{
			InitCommand=cmd(MaskSource;zoom,0.45;x,distance;y,0);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
			
			OnCommand=cmd(playcommand,"Refresh");
			MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
			MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
			
			RefreshCommand=function(self)
					self:stoptweening();
					self:decelerate(0.15);
					self:zoom(defaultzoom);
					self:diffusealpha(1);
					self:pulse();
					self:effectmagnitude(1,1.05,1);
					self:effectperiod(1);
				
				if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 0 then
					self:x(0);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 1 then
					self:x(distance);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 2 then
					self:x(distance*2);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 3 then
					self:x(distance*3);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 4 then
					self:x(distance*4);
				else
					self:diffusealpha(0);
				end;
			end;
			
		};
		
		--VIDEO
		Def.Sprite{
			InitCommand=cmd(MaskDest;zoom,0.45;x,distance;y,0);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
		
			OnCommand=cmd(playcommand,"Refresh");
			MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
			MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
			
			RefreshCommand=function(self)
					self:stoptweening();
					self:diffusealpha(0);
					self:sleep(0.15);
					--self:decelerate(0.15);
					self:zoom(defaultzoom);
				--TODO: These should probably be always be loaded into memory, but maybe it's okay
				if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 0 then
					self:x(0);
					self:Load(THEME:GetPathG("","_BGMovies/PlayModeIcons/Easy"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 1 then
					self:x(distance);
					self:Load(THEME:GetPathG("","_BGMovies/PlayModeIcons/Arcade"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 2 then
					self:x(distance*2);
					self:Load(THEME:GetPathG("","_BGMovies/PlayModeIcons/Pro"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 3 then
					self:x(distance*3);
					self:Load(THEME:GetPathG("","_BGMovies/PlayModeIcons/Mixtapes"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 4 then
					self:x(distance*4);
					self:Load(THEME:GetPathG("","_BGMovies/PlayModeIcons/Special"));
				else
					self:diffusealpha(0);
				end;
				self:linear(.3);
				self:diffusealpha(1);
				self:pulse();
				self:effectmagnitude(1,1.05,1);
				self:effectperiod(1);
			end;
			
		};
		
		Def.Sprite{
			Texture="border_ani 6x6";
			InitCommand=cmd(zoom,defaultzoom+0.12;x,distance;y,0;SetAllStateDelays,0.03;animate,true);
			OffCommand=cmd(bouncebegin,0.4;zoom,0);
			OnCommand=cmd(playcommand,"Refresh";playcommand,'Border');
			MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
			MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
			--[[BorderCommand=function(self)	
				self:stoptweening();
				self:sleep(0.03);
				self:Load(THEME:GetCurrentThemeDirectory().."Bganimations/ScreenSelectPlayMode overlay/border_ani/border ("..shine_index..").png");
				if shine_index == 36 then
					self:stoptweening();
					shine_index = 1;
				end;
				shine_index = shine_index+1
				self:queuecommand("Border");
			end;]]
			--This moves the border and makes it bounce
			RefreshCommand=function(self)
				self:stoptweening();
				self:decelerate(0.15);
				self:zoom(defaultzoom+0.12);
				self:diffusealpha(1);
				self:pulse();
				self:effectmagnitude(1,1.05,1);
				self:effectperiod(1);
				if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 0 then
					self:x(0);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 1 then
					self:x(distance);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 2 then
					self:x(distance*2);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 3 then
					self:x(distance*3);
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 4 then
					self:x(distance*4);
				else
					self:diffusealpha(0);
				end;
				--self:queuecommand("Border");
			end;
		};
				
	};

	LoadActor("songartist_name")..{
		InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-50;zoomto,600,15);
		OnCommand=cmd(sleep,0.5;linear,0.5;diffusealpha,1);
	};

	LoadFont("monsterrat/_montserrat semi bold 60px")..{
		Text="Insert text here";				
		InitCommand=cmd(zoom,0.15;CenterX;y,SCREEN_CENTER_Y+190;strokecolor,0,0,0,1;uppercase,true;skewx,-0.2;wrapwidthpixels,4000;diffusealpha,0);
		OnCommand=cmd(sleep,0.5;decelerate,0.6;diffusealpha,1;playcommand,"Refresh");
		OffCommand=cmd(decelerate,0.15;diffusealpha,0);
		MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
		MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
		MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
		MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
		MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
		MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
		MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
		MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
		
		
		RefreshCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 0 then
			self:settext("Easiest Choice. Specially selected songs for those new to rhythm games.");
			end;
			if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 1 then
			self:settext("Standard Choice. Choose from over 200 popular tracks.");
			end;
			if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 2 then
			self:settext("Advanced Choice. Timing will be stricter. Great for competitive play.");
			end;
			if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 3 then
			self:settext("Play through various sets of songs with no breaks in between.");
			end;
			if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 4 then
			self:settext("Simple songs aren't enough... let's try some weird stuff...");
			end;
		end;

	};

		
	--SOUNDS
	Def.ActorFrame{
		MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
		MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
		MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
		MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
		MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
		MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
		MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
		MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
		OnCommand=function(self)
			SOUND:PlayOnce(THEME:GetPathS("","PlayModes/select_game_mode.wav"));
		end;	
		RefreshCommand=function(self)
			local sel = SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber());
			if sel == 0 then mode = "easy"; elseif sel == 1 then mode = "arcade"; elseif sel == 2 then mode = "pro" else mode = "mixtapes" end;
			SOUND:PlayOnce(THEME:GetPathS("","PlayModes/"..mode..".wav"));
			self:sleep(1);
		end;
	};
	--loading splash
	Def.ActorFrame{
		LoadActor(THEME:GetPathG("","PlayModes/splash/Arcade"))..{
			OnCommand=cmd(diffusealpha,0;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
			MenuLeftP1MessageCommand=cmd(playcommand,"Refresh");
			MenuLeftP2MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP1MessageCommand=cmd(playcommand,"Refresh");
			MenuUpP2MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP1MessageCommand=cmd(playcommand,"Refresh");
			MenuRightP2MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP1MessageCommand=cmd(playcommand,"Refresh");
			MenuDownP2MessageCommand=cmd(playcommand,"Refresh");
			RefreshCommand=function(self)
				if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 0 then
					self:Load(THEME:GetPathG("","PlayModes/splash/Easy.png"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 1 then
					self:Load(THEME:GetPathG("","PlayModes/splash/Arcade.png"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 2 then
					self:Load(THEME:GetPathG("","PlayModes/splash/Pro.png"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 3 then
					self:Load(THEME:GetPathG("","PlayModes/splash/Mixtapes.png"));
				elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 4 then
					self:Load(THEME:GetPathG("","PlayModes/splash/Special.png"));
				else
					self:diffusealpha(0);
				end;
			end;
			--TODO: Why does animation not work here? decelerate,.5;
			OffCommand=cmd(Center;Cover;diffusealpha,1);
		};
	};
	--[[
	--left
	LoadActor(THEME:GetPathG("","PlayModes/arrow")) .. {
		InitCommand=cmd(draworder,99;diffusealpha,1;zoom,0.9;pulse;effectperiod,0.26;effecttiming,0.1,0.2,0.2,0.1;effectmagnitude,0.95,1,1;y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X-90);
		MenuLeftP1MessageCommand=cmd(playcommand,"Previous");
		MenuLeftP2MessageCommand=cmd(playcommand,"Previous");
		MenuUpP1MessageCommand=cmd(playcommand,"Previous");
		MenuUpP2MessageCommand=cmd(playcommand,"Previous");
		PreviousCommand=cmd(stoptweening;x,SCREEN_CENTER_X-110;sleep,0.05;decelerate,0.2;x,SCREEN_CENTER_X-90);
	};

	--right
	LoadActor(THEME:GetPathG("","PlayModes/arrow")) .. {
		InitCommand=cmd(rotationz,180;draworder,99;diffusealpha,1;zoom,0.9;pulse;effectperiod,0.26;effecttiming,0.1,0.2,0.2,0.1;effectmagnitude,0.95,1,1;y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X+90);
		MenuRightP1MessageCommand=cmd(playcommand,"Next");
		MenuRightP2MessageCommand=cmd(playcommand,"Next");
		MenuDownP1MessageCommand=cmd(playcommand,"Next");
		MenuDownP2MessageCommand=cmd(playcommand,"Next");
		NextCommand=cmd(stoptweening;x,SCREEN_CENTER_X+110;sleep,0.05;decelerate,0.2;x,SCREEN_CENTER_X+90);
	};
	--]]
		
	OnCommand=function(self)
		if not RIO_FOLDER_NAMES["DefaultArcadeFolder"] then
			groups = getAvailableGroups();
			--TODO: Is this global or something? What's going on?
			total_arcade_folders = #groups;
			RIO_FOLDER_NAMES["DefaultArcadeFolder"] = groups[math.random(2,total_arcade_folders)];
			
			--What?
			--if RIO_FOLDER_NAMES["DefaultArcadeFolder"] == groups[1] then RIO_FOLDER_NAMES["DefaultArcadeFolder"] = groups[7]; end;
		end;
	end;

	OffCommand=function(self)
		
		PREFSMAN:SetPreference("AllowW1",'AllowW1_Never');
		WriteGamePrefToFile("DefaultFail","");
		for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
			GAMESTATE:ApplyGameCommand( "mod,3x,rio,30% mini;", pn );
		end
		setenv("StageBreak",true);
		--[[WritePrefToFile("UserPrefProtimingP1",false);
		WritePrefToFile("UserPrefProtimingP2",false);]]

		if SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 0 then
			-- Easy Mode
			setenv("PlayMode","Easy");
			setenv("HeaderTitle","SELECT MUSIC");
			folder = SONGMAN:GetSongsInGroup(RIO_FOLDER_NAMES["EasyFolder"]);
			randomSong = folder[math.random(1,#folder)]
			GAMESTATE:SetCurrentSong(randomSong);
			GAMESTATE:SetPreferredSong(randomSong);
		elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 1 then
			-- Arcade Mode
			setenv("PlayMode","Arcade");
			setenv("HeaderTitle","SELECT MUSIC");
			
			--[[ we don't want them to be able to access a song from Easy or Special mode, so if the last played song was from there,
			     pick a random song instead.]]
			local lastPlayedSong = PROFILEMAN:GetProfile(GAMESTATE:GetMasterPlayerNumber()):GetLastPlayedSong();
			if lastPlayedSong then
				local lastUsedGroup = lastPlayedSong:GetGroupName();
				if lastUsedGroup == RIO_FOLDER_NAMES["EasyFolder"] or lastUsedGroup == RIO_FOLDER_NAMES["SpecialFolder"] then
					pickRandom = true
				end;
			else
				--If there wasn't a last played song it probably doesn't exist anymore so pick random
				pickRandom = true;
			end;
			
			if pickRandom then
				folder = SONGMAN:GetSongsInGroup(RIO_FOLDER_NAMES["DefaultArcadeFolder"]);
				randomSong = folder[math.random(#folder)]
				GAMESTATE:SetCurrentSong(randomSong);
				GAMESTATE:SetPreferredSong(randomSong);
			else
				GAMESTATE:SetCurrentSong(lastPlayedSong);
			end;
		elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 2 then
			-- Pro Mode
			setenv("HeaderTitle","SELECT MUSIC");
			setenv("PlayMode","Pro");
			
			--same as above
			local lastPlayedSong = PROFILEMAN:GetProfile(GAMESTATE:GetMasterPlayerNumber()):GetLastPlayedSong();
			if lastPlayedSong then
				local lastUsedGroup = lastPlayedSong:GetGroupName();
				if lastUsedGroup == RIO_FOLDER_NAMES["EasyFolder"] or lastUsedGroup == RIO_FOLDER_NAMES["SpecialFolder"] then
					pickRandom = true
				end;
			else
				--If there wasn't a last played song it probably doesn't exist anymore so pick random
				pickRandom = true;
			end;
			
			if pickRandom then
				folder = SONGMAN:GetSongsInGroup(RIO_FOLDER_NAMES["DefaultArcadeFolder"]);
				randomSong = folder[math.random(#folder)]
				GAMESTATE:SetCurrentSong(randomSong);
				GAMESTATE:SetPreferredSong(randomSong);
			else
				GAMESTATE:SetCurrentSong(lastPlayedSong);
			end;
			
			PREFSMAN:SetPreference("AllowW1",'AllowW1_Everywhere');
			--[[WritePrefToFile("UserPrefProtimingP1",false);
			WritePrefToFile("UserPrefProtimingP2",false);]]
			ActiveModifiers["P1"]["BGAMode"] = "Off"
			ActiveModifiers["P2"]["BGAMode"] = "Off"
			for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
				GAMESTATE:ApplyGameCommand( "mod,3x,rhythm;", pn );
			end
		elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 3 then
			-- Mixtapes Mode
			setenv("PlayMode","Mixtapes");
		elseif SCREENMAN:GetTopScreen():GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber()) == 4 then
			-- Special Mode
			local folder = SONGMAN:GetSongsInGroup(RIO_FOLDER_NAMES["SpecialFolder"]);
			local randomSong = folder[math.random(1,#folder)]
			GAMESTATE:SetCurrentSong(randomSong);
			GAMESTATE:SetPreferredSong(randomSong);
			setenv("PlayMode","Special");
		end
		
	end;

};
