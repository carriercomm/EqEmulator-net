
/****** Object:  UserDefinedFunction [dbo].[GetZoneIDForShortName]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EvoZak
-- Create date: 11.28.2008
-- Description:	Returns the integer ID for a given zone short name
-- =============================================
CREATE FUNCTION [dbo].[GetZoneIDForShortName]
(
	@ZoneShortName varchar(16)
)
RETURNS int
WITH RETURNS NULL ON NULL INPUT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ZoneID int

	IF @ZoneShortName = 'NONE'
		SET @ZoneID = 0
	ELSE
		SELECT @ZoneID = ZoneID FROM Zone WHERE ShortName = @ZoneShortName

	-- Return the result of the function
	RETURN @ZoneID

END

GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[CharName] [varchar](64) NULL,
	[Password] [varchar](50) NULL,
	[Status] [smallint] NOT NULL,
	[LSAccountID] [int] NULL,
	[GMSpeed] [bit] NOT NULL,
	[Revoked] [bit] NOT NULL,
	[IPAddress] [varchar](100) NULL,
	[HideMe] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Books]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[Name] [varchar](30) NOT NULL,
	[BookText] [text] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Character]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Character](
	[CharacterID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Surname] [varchar](64) NULL,
	[Class] [tinyint] NULL,
	[Race] [smallint] NULL,
	[Gender] [tinyint] NULL,
	[CharLevel] [tinyint] NOT NULL,
	[XP] [int] NOT NULL,
	[STR] [smallint] NULL,
	[STA] [smallint] NULL,
	[AGI] [smallint] NULL,
	[DEX] [smallint] NULL,
	[WIS] [smallint] NULL,
	[INT] [smallint] NULL,
	[CHA] [smallint] NULL,
	[Deity] [int] NULL,
	[Face] [tinyint] NULL,
	[EyeColor1] [tinyint] NULL,
	[EyeColor2] [tinyint] NULL,
	[HairStyle] [tinyint] NULL,
	[HairColor] [tinyint] NULL,
	[Beard] [tinyint] NULL,
	[BeardColor] [tinyint] NULL,
	[PracticePoints] [int] NULL,
	[HP] [int] NULL,
	[Mana] [int] NULL,
	[Endurance] [int] NULL,
	[HungerLevel] [int] NULL,
	[ThirstLevel] [int] NULL,
	[Languages] [char](28) NULL,
	[Skills] [char](75) NULL,
	[Title] [varchar](32) NULL,
	[Suffix] [varchar](32) NULL,
	[Platinum] [int] NOT NULL,
	[Gold] [int] NOT NULL,
	[Silver] [int] NOT NULL,
	[Copper] [int] NOT NULL,
	[BankedPlatinum] [int] NOT NULL,
	[BankedGold] [int] NOT NULL,
	[BankedSilver] [int] NOT NULL,
	[BankedCopper] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Heading] [float] NULL,
	[ZoneName] [varchar](40) NULL,
	[ZoneID] [smallint] NULL,
	[GMStatus] [tinyint] NOT NULL,
	[GroupID] [int] NULL,
	[LastSeenDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CharacterBind]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterBind](
	[CharacterBindID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[ZoneID] [smallint] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Heading] [float] NOT NULL,
 CONSTRAINT [PK_CharacterBind] PRIMARY KEY CLUSTERED 
(
	[CharacterBindID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Door]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Door](
	[DoorID] [int] IDENTITY(1,1) NOT NULL,
	[Ordinal] [smallint] NOT NULL,
	[ZoneID] [smallint] NOT NULL,
	[DoorName] [varchar](32) NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Heading] [float] NOT NULL,
	[OpenType] [smallint] NOT NULL,
	[GuildID] [smallint] NULL,
	[LockPick] [smallint] NOT NULL,
	[KeyItemID] [int] NULL,
	[TriggerDoor] [smallint] NULL,
	[TriggerType] [smallint] NULL,
	[DoorParam] [int] NOT NULL,
	[DestZoneID] [smallint] NULL,
	[DestX] [float] NULL,
	[DestY] [float] NULL,
	[DestZ] [float] NULL,
	[DestHeading] [float] NULL,
	[InvertState] [bit] NOT NULL,
	[Incline] [int] NOT NULL,
	[Size] [smallint] NOT NULL,
 CONSTRAINT [PK_Door] PRIMARY KEY CLUSTERED 
(
	[DoorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grid]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grid](
	[GridID] [int] NOT NULL,
	[ZoneID] [smallint] NOT NULL,
	[WanderType] [tinyint] NOT NULL,
	[PauseType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Grid] PRIMARY KEY CLUSTERED 
(
	[GridID] ASC,
	[ZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GridEntries]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GridEntries](
	[GridID] [int] NOT NULL,
	[ZoneID] [smallint] NOT NULL,
	[Ordinal] [smallint] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Heading] [float] NOT NULL,
	[Pause] [smallint] NOT NULL,
 CONSTRAINT [PK_GridEntries] PRIMARY KEY CLUSTERED 
(
	[GridID] ASC,
	[ZoneID] ASC,
	[Ordinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[SlotID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Charges] [tinyint] NULL,
	[Color] [bigint] NOT NULL,
	[AugSlot1] [int] NULL,
	[AugSlot2] [int] NULL,
	[AugSlot3] [int] NULL,
	[AugSlot4] [int] NULL,
	[AugSlot5] [int] NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[MinStatus] [tinyint] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[ChaBonus] [smallint] NOT NULL,
	[DexBonus] [smallint] NOT NULL,
	[IntBonus] [smallint] NOT NULL,
	[WisBonus] [smallint] NOT NULL,
	[AgiBonus] [smallint] NOT NULL,
	[StaBonus] [smallint] NOT NULL,
	[StrBonus] [smallint] NOT NULL,
	[AttackBonus] [smallint] NOT NULL,
	[ACBonus] [smallint] NOT NULL,
	[Accuracy] [smallint] NOT NULL,
	[IsArtifact] [bit] NOT NULL,
	[AugRestrict] [int] NOT NULL,
	[AugSlot1Type] [tinyint] NOT NULL,
	[AugSlot1Vis] [tinyint] NOT NULL,
	[AugSlot2Type] [tinyint] NOT NULL,
	[AugSlot2Vis] [tinyint] NOT NULL,
	[AugSlot3Type] [tinyint] NOT NULL,
	[AugSlot3Vis] [tinyint] NOT NULL,
	[AugSlot4Type] [tinyint] NOT NULL,
	[AugSlot4Vis] [tinyint] NOT NULL,
	[AugSlot5Type] [tinyint] NOT NULL,
	[AugSlot5Vis] [tinyint] NOT NULL,
	[AugType] [int] NOT NULL,
	[Avoidance] [smallint] NOT NULL,
	[BagSize] [tinyint] NOT NULL,
	[BagSlots] [tinyint] NOT NULL,
	[BagType] [tinyint] NOT NULL,
	[BagWeightReduc] [tinyint] NOT NULL,
	[BaneDmgBodyAmt] [smallint] NOT NULL,
	[BaneDmgRaceAmt] [smallint] NOT NULL,
	[BaneDmgBody] [smallint] NOT NULL,
	[BaneDmgRace] [smallint] NOT NULL,
	[BardType] [int] NOT NULL,
	[BardValue] [int] NOT NULL,
	[Book] [tinyint] NOT NULL,
	[EffectCastTime] [int] NOT NULL,
	[ClickEffectCastTime] [int] NOT NULL,
	[CharmFile] [varchar](32) NOT NULL,
	[CharmFileID] [int] NOT NULL,
	[Classes] [int] NOT NULL,
	[Color] [bigint] NULL,
	[CombatEffects] [tinyint] NOT NULL,
	[ExtraDmgSkill] [int] NOT NULL,
	[ExtraDmgAmt] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[CRBonus] [smallint] NOT NULL,
	[DRBonus] [smallint] NOT NULL,
	[FRBonus] [smallint] NOT NULL,
	[MRBonus] [smallint] NOT NULL,
	[PRBonus] [smallint] NOT NULL,
	[Damage] [smallint] NOT NULL,
	[DamageShield] [smallint] NOT NULL,
	[Deity] [int] NOT NULL,
	[Delay] [int] NOT NULL,
	[AugDistiller] [int] NOT NULL,
	[DotShielding] [int] NOT NULL,
	[ClickType] [int] NOT NULL,
	[ClickLevelReq] [smallint] NOT NULL,
	[ClickLevelMax] [smallint] NOT NULL,
	[ElemDmgType] [tinyint] NOT NULL,
	[ElemDmgAmt] [smallint] NOT NULL,
	[EnduranceBonus] [int] NOT NULL,
	[FactionAmt1] [int] NOT NULL,
	[FactionAmt2] [int] NOT NULL,
	[FactionAmt3] [int] NOT NULL,
	[FactionAmt4] [int] NOT NULL,
	[FactionMod1] [int] NOT NULL,
	[FactionMod2] [int] NOT NULL,
	[FactionMod3] [int] NOT NULL,
	[FactionMod4] [int] NOT NULL,
	[BookFileName] [varchar](32) NOT NULL,
	[FocusEffectSpellID] [int] NOT NULL,
	[FVNoDrop] [bit] NOT NULL,
	[HastePct] [tinyint] NOT NULL,
	[HPBonus] [int] NOT NULL,
	[Regen] [int] NOT NULL,
	[Icon] [int] NOT NULL,
	[IDFile] [varchar](30) NOT NULL,
	[ItemClass] [tinyint] NOT NULL,
	[ItemType] [tinyint] NOT NULL,
	[LdonPrice] [int] NOT NULL,
	[LdonTheme] [int] NOT NULL,
	[Ldonsold] [int] NOT NULL,
	[Light] [tinyint] NOT NULL,
	[Lore] [varchar](80) NOT NULL,
	[LoreGroup] [int] NOT NULL,
	[IsMagic] [bit] NOT NULL,
	[ManaBonus] [int] NOT NULL,
	[ManaRegen] [int] NOT NULL,
	[EnduranceRegen] [int] NOT NULL,
	[Material] [int] NOT NULL,
	[MaxCharges] [smallint] NOT NULL,
	[NoDrop] [tinyint] NOT NULL,
	[NoRent] [tinyint] NOT NULL,
	[HasPendingLoreFlag] [bit] NOT NULL,
	[ProcRate] [int] NOT NULL,
	[Races] [int] NOT NULL,
	[Range] [int] NOT NULL,
	[RecLevel] [int] NOT NULL,
	[RecSkill] [int] NOT NULL,
	[ReqLevel] [int] NOT NULL,
	[SellRate] [float] NOT NULL,
	[Shielding] [int] NOT NULL,
	[Size] [tinyint] NOT NULL,
	[skillmodtype] [int] NOT NULL,
	[skillmodvalue] [int] NOT NULL,
	[slots] [int] NOT NULL,
	[clickeffect] [int] NOT NULL,
	[spellshield] [int] NOT NULL,
	[strikethrough] [int] NOT NULL,
	[stunresist] [int] NOT NULL,
	[IsSummoned] [bit] NOT NULL,
	[tradeskills] [int] NOT NULL,
	[favor] [int] NOT NULL,
	[weight] [int] NOT NULL,
	[Benefit] [tinyint] NOT NULL,
	[booktype] [int] NOT NULL,
	[recastdelay] [int] NOT NULL,
	[recasttype] [int] NOT NULL,
	[guildfavor] [int] NOT NULL,
	[IsAttuneable] [bit] NOT NULL,
	[nopet] [bit] NOT NULL,
	[pointtype] [int] NOT NULL,
	[potionbelt] [int] NOT NULL,
	[potionbeltslots] [int] NOT NULL,
	[stacksize] [int] NOT NULL,
	[notransfer] [bit] NOT NULL,
	[stackable] [bit] NOT NULL,
	[proceffect] [int] NOT NULL,
	[proctype] [int] NOT NULL,
	[proclevel2] [int] NOT NULL,
	[proclevel] [int] NOT NULL,
	[worneffect] [int] NOT NULL,
	[worntype] [int] NOT NULL,
	[wornlevel2] [int] NOT NULL,
	[wornlevel] [int] NOT NULL,
	[focustype] [int] NOT NULL,
	[focuslevel2] [int] NOT NULL,
	[focuslevel] [int] NOT NULL,
	[scrolleffect] [int] NOT NULL,
	[scrolltype] [int] NOT NULL,
	[scrolllevel2] [int] NOT NULL,
	[scrolllevel] [int] NOT NULL,
	[lorefile] [varchar](32) NOT NULL,
	[svcorruption] [int] NOT NULL,
	[augslot1unk2] [int] NOT NULL,
	[augslot2unk2] [int] NOT NULL,
	[augslot3unk2] [int] NOT NULL,
	[augslot4unk2] [int] NOT NULL,
	[augslot5unk2] [int] NOT NULL,
	[questitemflag] [int] NOT NULL,
	[clickunk5] [int] NOT NULL,
	[clickunk6] [varchar](32) NOT NULL,
	[clickunk7] [int] NOT NULL,
	[procunk1] [int] NOT NULL,
	[procunk2] [int] NOT NULL,
	[procunk3] [int] NOT NULL,
	[procunk4] [int] NOT NULL,
	[procunk6] [varchar](32) NOT NULL,
	[procunk7] [int] NOT NULL,
	[wornunk1] [int] NOT NULL,
	[wornunk2] [int] NOT NULL,
	[wornunk3] [int] NOT NULL,
	[wornunk4] [int] NOT NULL,
	[wornunk5] [int] NOT NULL,
	[wornunk6] [varchar](32) NOT NULL,
	[wornunk7] [int] NOT NULL,
	[focusunk1] [int] NOT NULL,
	[focusunk2] [int] NOT NULL,
	[focusunk3] [int] NOT NULL,
	[focusunk4] [int] NOT NULL,
	[focusunk5] [int] NOT NULL,
	[focusunk6] [varchar](32) NOT NULL,
	[focusunk7] [int] NOT NULL,
	[scrollunk1] [int] NOT NULL,
	[scrollunk2] [int] NOT NULL,
	[scrollunk3] [int] NOT NULL,
	[scrollunk4] [int] NOT NULL,
	[scrollunk5] [int] NOT NULL,
	[scrollunk6] [varchar](32) NOT NULL,
	[scrollunk7] [int] NOT NULL,
	[purity] [int] NOT NULL,
	[evolvinglevel] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginAccount]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginAccount](
	[LoginAccountID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IPAddress] [varchar](20) NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginAccount] PRIMARY KEY CLUSTERED 
(
	[LoginAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loot]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loot](
	[LootID] [int] IDENTITY(1,1) NOT NULL,
	[MinCash] [int] NOT NULL,
	[MaxCash] [int] NOT NULL,
 CONSTRAINT [PK_Loot] PRIMARY KEY CLUSTERED 
(
	[LootID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LootDrops]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LootDrops](
	[LootDropID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemCharges] [tinyint] NOT NULL,
	[Equipable] [bit] NOT NULL,
	[Probability] [tinyint] NOT NULL,
 CONSTRAINT [PK_LootDrops] PRIMARY KEY CLUSTERED 
(
	[LootDropID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LootEntries]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LootEntries](
	[LootID] [int] NOT NULL,
	[LootDropID] [int] NOT NULL,
	[MaxDrops] [tinyint] NOT NULL,
	[Probability] [tinyint] NOT NULL,
 CONSTRAINT [PK_LootEntries_1] PRIMARY KEY CLUSTERED 
(
	[LootID] ASC,
	[LootDropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MemorizedSpells]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemorizedSpells](
	[MemorizedSpellsID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[SpellID] [smallint] NOT NULL,
	[SlotID] [tinyint] NOT NULL,
 CONSTRAINT [PK_MemorizedSpells] PRIMARY KEY CLUSTERED 
(
	[MemorizedSpellsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NameFilter]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NameFilter](
	[NameFilterID] [int] IDENTITY(1,1) NOT NULL,
	[Filter] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NameFilter] PRIMARY KEY CLUSTERED 
(
	[NameFilterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Npc]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Npc](
	[NpcID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[SurName] [varchar](100) NULL,
	[NpcLevel] [tinyint] NOT NULL,
	[Race] [smallint] NOT NULL,
	[NpcClass] [tinyint] NOT NULL,
	[BodyType] [tinyint] NULL,
	[Hp] [int] NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[Texture] [tinyint] NOT NULL,
	[HelmTexture] [tinyint] NOT NULL,
	[Size] [float] NOT NULL,
	[HpRegenRate] [int] NOT NULL,
	[ManaRegenRate] [int] NOT NULL,
	[LootId] [int] NULL,
	[MerchantId] [int] NOT NULL,
	[NpcSpellsId] [int] NOT NULL,
	[NpcFactionId] [int] NOT NULL,
	[MinDamage] [int] NOT NULL,
	[MaxDamage] [int] NOT NULL,
	[NpcSpecialAttacks] [varchar](36) NULL,
	[AggroRadius] [int] NOT NULL,
	[Face] [int] NOT NULL,
	[HairStyleLuclin] [int] NOT NULL,
	[HairColorLuclin] [int] NOT NULL,
	[EyeColorLuclin] [int] NOT NULL,
	[EyeColor2Luclin] [int] NOT NULL,
	[BeardColorLuclin] [int] NOT NULL,
	[BeardLuclin] [int] NOT NULL,
	[MeleeTexture1] [int] NOT NULL,
	[MeleeTexture2] [int] NOT NULL,
	[RunSpeed] [float] NOT NULL,
	[MR] [smallint] NOT NULL,
	[CR] [smallint] NOT NULL,
	[DR] [smallint] NOT NULL,
	[FR] [smallint] NOT NULL,
	[PR] [smallint] NOT NULL,
	[SeeInvis] [bit] NOT NULL,
	[SeeInvisUndead] [bit] NOT NULL,
	[SeeHide] [bit] NOT NULL,
	[SeeImprovedHide] [bit] NOT NULL,
	[QGlobal] [bit] NOT NULL,
	[AC] [int] NOT NULL,
	[NpcAggro] [bit] NOT NULL,
	[SpawnLimit] [tinyint] NOT NULL,
	[AttackSpeed] [float] NOT NULL,
	[Findable] [bit] NOT NULL,
	[Trackable] [bit] NOT NULL,
	[STR] [smallint] NOT NULL,
	[STA] [smallint] NOT NULL,
	[DEX] [smallint] NOT NULL,
	[AGI] [smallint] NOT NULL,
	[INT] [smallint] NOT NULL,
	[WIS] [smallint] NOT NULL,
	[CHA] [smallint] NOT NULL,
	[IsBot] [bit] NOT NULL,
	[Attack] [smallint] NOT NULL,
	[Accuracy] [int] NOT NULL,
 CONSTRAINT [PK_Npc] PRIMARY KEY CLUSTERED 
(
	[NpcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServerConfig]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerConfig](
	[LongName] [varchar](100) NOT NULL,
	[ShortName] [varchar](32) NOT NULL,
	[NewUserDefaultStatus] [smallint] NOT NULL,
	[Expansions] [smallint] NOT NULL,
	[PVP] [bit] NOT NULL,
	[StartZone] [int] NOT NULL,
	[StartingPlat] [smallint] NOT NULL,
	[StartingGold] [smallint] NOT NULL,
	[GroupXPBonus] [float] NOT NULL,
	[MOTD] [varchar](100) NULL,
	[ZoneAddress] [varchar](100) NOT NULL,
	[ZoneLocalAddress] [varchar](100) NOT NULL,
	[ZonePortLow] [smallint] NOT NULL,
	[ZonePortHigh] [smallint] NOT NULL,
	[ChatHost] [varchar](255) NOT NULL,
	[ChatPort] [int] NOT NULL,
	[MailHost] [varchar](255) NOT NULL,
	[MailPort] [int] NOT NULL,
	[InitNumZoneServers] [tinyint] NOT NULL,
	[AutosaveIntervalSec] [int] NOT NULL,
	[BaseHitChance] [float] NOT NULL,
	[NPCBonusHitChance] [float] NOT NULL,
	[HitFallOffMinor] [int] NOT NULL,
	[HitFallOffModerate] [int] NOT NULL,
	[HitFallOffMajor] [int] NOT NULL,
	[HitBonusPerLevel] [float] NOT NULL,
	[XPModifier] [float] NOT NULL,
	[LevelCap] [tinyint] NOT NULL,
	[PCRegenMultiplier] [float] NOT NULL,
	[XPLossModifier] [float] NOT NULL,
	[LevelDeathDoesXPLoss] [tinyint] NOT NULL,
	[LevelDeathLeavesItems] [tinyint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SkillCaps]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillCaps](
	[SkillCapID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [tinyint] NOT NULL,
	[Class] [tinyint] NOT NULL,
	[Level] [tinyint] NOT NULL,
	[Cap] [smallint] NOT NULL,
 CONSTRAINT [PK_SkillCaps] PRIMARY KEY CLUSTERED 
(
	[SkillCapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spawn]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spawn](
	[SpawnID] [int] NOT NULL,
	[SpawnGroupID] [int] NOT NULL,
	[ZoneID] [smallint] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Heading] [float] NOT NULL,
	[RespawnTime] [int] NOT NULL,
	[Variance] [smallint] NOT NULL,
	[PathGrid] [int] NOT NULL,
	[TimeLeft] [int] NOT NULL,
	[Condition] [int] NOT NULL,
	[ConditionValue] [int] NOT NULL,
 CONSTRAINT [PK_Spawn] PRIMARY KEY CLUSTERED 
(
	[SpawnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpawnCondition]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpawnCondition](
	[ZoneID] [smallint] NOT NULL,
	[CondID] [int] NOT NULL,
	[Value] [smallint] NOT NULL,
	[OnChange] [tinyint] NOT NULL,
	[Name] [varchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SpawnCondition_1] PRIMARY KEY CLUSTERED 
(
	[ZoneID] ASC,
	[CondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpawnGroup]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpawnGroup](
	[SpawnGroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[SpawnLimit] [tinyint] NOT NULL,
 CONSTRAINT [PK_SpawnGroup] PRIMARY KEY CLUSTERED 
(
	[SpawnGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpawnGroupEntry]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpawnGroupEntry](
	[SpawnGroupID] [int] NOT NULL,
	[NpcID] [int] NOT NULL,
	[Chance] [smallint] NOT NULL,
 CONSTRAINT [PK_SpawnGroupEntry_1] PRIMARY KEY CLUSTERED 
(
	[SpawnGroupID] ASC,
	[NpcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spellbook]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spellbook](
	[SpellbookID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[SpellID] [smallint] NOT NULL,
	[SlotID] [smallint] NOT NULL,
 CONSTRAINT [PK_Spellbook] PRIMARY KEY CLUSTERED 
(
	[SpellbookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spells]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Spells](
	[SpellID] [smallint] NOT NULL,
	[SpellName] [varchar](46) NOT NULL,
	[TeleportZone] [varchar](32) NULL,
	[MsgYouCast] [varchar](64) NULL,
	[MsgOtherCast] [varchar](64) NULL,
	[MsgCastOnYou] [varchar](64) NULL,
	[MsgCastOnOther] [varchar](64) NULL,
	[MsgSpellFades] [varchar](64) NULL,
	[Range] [float] NULL,
	[AOERange] [float] NULL,
	[PushBack] [float] NULL,
	[PushUp] [float] NULL,
	[CastTime] [int] NOT NULL,
	[RecoveryTime] [int] NULL,
	[RecastTime] [int] NULL,
	[BuffDurationFormula] [int] NULL,
	[BuffDuration] [int] NULL,
	[AEDuration] [int] NULL,
	[Mana] [smallint] NOT NULL,
	[EffectBaseValue1] [float] NULL,
	[EffectBaseValue2] [float] NULL,
	[EffectBaseValue3] [float] NULL,
	[EffectBaseValue4] [float] NULL,
	[EffectBaseValue5] [float] NULL,
	[EffectBaseValue6] [float] NULL,
	[EffectBaseValue7] [float] NULL,
	[EffectBaseValue8] [float] NULL,
	[EffectBaseValue9] [float] NULL,
	[EffectBaseValue10] [float] NULL,
	[EffectBaseValue11] [float] NULL,
	[EffectBaseValue12] [float] NULL,
	[EffectLimitValue1] [float] NULL,
	[EffectLimitValue2] [float] NULL,
	[EffectLimitValue3] [float] NULL,
	[EffectLimitValue4] [float] NULL,
	[EffectLimitValue5] [float] NULL,
	[EffectLimitValue6] [float] NULL,
	[EffectLimitValue7] [float] NULL,
	[EffectLimitValue8] [float] NULL,
	[EffectLimitValue9] [float] NULL,
	[EffectLimitValue10] [float] NULL,
	[EffectLimitValue11] [float] NULL,
	[EffectLimitValue12] [float] NULL,
	[EffectMaxValue1] [float] NULL,
	[EffectMaxValue2] [float] NULL,
	[EffectMaxValue3] [float] NULL,
	[EffectMaxValue4] [float] NULL,
	[EffectMaxValue5] [float] NULL,
	[EffectMaxValue6] [float] NULL,
	[EffectMaxValue7] [float] NULL,
	[EffectMaxValue8] [float] NULL,
	[EffectMaxValue9] [float] NULL,
	[EffectMaxValue10] [float] NULL,
	[EffectMaxValue11] [float] NULL,
	[EffectMaxValue12] [float] NULL,
	[OldSpellIcon] [smallint] NULL,
	[OldMemIcon] [smallint] NULL,
	[Reagent1] [int] NULL,
	[Reagent2] [int] NULL,
	[Reagent3] [int] NULL,
	[Reagent4] [int] NULL,
	[ReagentAmount1] [int] NULL,
	[ReagentAmount2] [int] NULL,
	[ReagentAmount3] [int] NULL,
	[ReagentAmount4] [int] NULL,
	[NoExpendReagent1] [int] NULL,
	[NoExpendReagent2] [int] NULL,
	[NoExpendReagent3] [int] NULL,
	[NoExpendReagent4] [int] NULL,
	[SpellValueFormula1] [smallint] NULL,
	[SpellValueFormula2] [smallint] NULL,
	[SpellValueFormula3] [smallint] NULL,
	[SpellValueFormula4] [smallint] NULL,
	[SpellValueFormula5] [smallint] NULL,
	[SpellValueFormula6] [smallint] NULL,
	[SpellValueFormula7] [smallint] NULL,
	[SpellValueFormula8] [smallint] NULL,
	[SpellValueFormula9] [smallint] NULL,
	[SpellValueFormula10] [smallint] NULL,
	[SpellValueFormula11] [smallint] NULL,
	[SpellValueFormula12] [smallint] NULL,
	[LightType] [int] NULL,
	[GoodEffect] [smallint] NOT NULL,
	[Activated] [int] NULL,
	[ResistType] [smallint] NULL,
	[EffectId1] [smallint] NULL,
	[EffectId2] [smallint] NULL,
	[EffectId3] [smallint] NULL,
	[EffectId4] [smallint] NULL,
	[EffectId5] [smallint] NULL,
	[EffectId6] [smallint] NULL,
	[EffectId7] [smallint] NULL,
	[EffectId8] [smallint] NULL,
	[EffectId9] [smallint] NULL,
	[EffectId10] [smallint] NULL,
	[EffectId11] [smallint] NULL,
	[EffectId12] [smallint] NULL,
	[TargetType] [smallint] NOT NULL,
	[BaseFizzle] [tinyint] NOT NULL,
	[Skill] [smallint] NOT NULL,
	[ZoneType] [smallint] NULL,
	[EnvironmentType] [smallint] NULL,
	[TimeOfDay] [int] NULL,
	[WarriorReqLevel] [smallint] NULL,
	[ClericReqLevel] [smallint] NULL,
	[PaladinReqLevel] [smallint] NULL,
	[RangerReqLevel] [smallint] NULL,
	[ShadowknightReqLevel] [smallint] NULL,
	[DruidReqLevel] [smallint] NULL,
	[MonkReqLevel] [smallint] NULL,
	[BardReqLevel] [smallint] NULL,
	[RogueReqLevel] [smallint] NULL,
	[ShamanReqLevel] [smallint] NULL,
	[NecromancerReqLevel] [smallint] NULL,
	[WizardReqLevel] [smallint] NULL,
	[MagicianReqLevel] [smallint] NULL,
	[EnchanterReqLevel] [smallint] NULL,
	[BeastlordReqLevel] [smallint] NULL,
	[BeserkerReqLevel] [smallint] NULL,
	[CastingAnimation] [smallint] NULL,
	[TargetAnimation] [smallint] NULL,
	[TravelType] [int] NULL,
	[SpellAffectIndex] [smallint] NULL,
	[BertoxRestrict] [smallint] NOT NULL,
	[BrellRestrict] [smallint] NOT NULL,
	[CazicRestrict] [smallint] NOT NULL,
	[ErollisiRestrict] [smallint] NOT NULL,
	[BristlebaneRestrict] [smallint] NOT NULL,
	[InnorukRestrict] [smallint] NOT NULL,
	[KaranaRestrict] [smallint] NOT NULL,
	[MithanielRestrict] [smallint] NOT NULL,
	[PrexusRestrict] [smallint] NOT NULL,
	[QuelliousRestrict] [smallint] NOT NULL,
	[RallosRestrict] [smallint] NOT NULL,
	[RodcetRestrict] [smallint] NOT NULL,
	[SolusekRestrict] [smallint] NOT NULL,
	[TribunalRestrict] [smallint] NOT NULL,
	[TunareRestrict] [smallint] NOT NULL,
	[VeeshanRestrict] [smallint] NOT NULL,
	[NewIcon] [smallint] NULL,
	[SpellAnimation] [smallint] NULL,
	[Uninterruptable] [smallint] NOT NULL,
	[ResistDiff] [smallint] NULL,
	[DotStackingExempt] [int] NULL,
	[Deletable] [int] NULL,
	[RecourseLink] [smallint] NULL,
	[ShortBuffBox] [smallint] NULL,
	[DescriptionID] [int] NULL,
	[TypeDescriptionID] [int] NULL,
	[EffectDescriptionID] [int] NULL,
	[BonusHate] [int] NULL,
	[EnduranceCost] [int] NULL,
	[EnduranceTimerIdx] [int] NULL,
	[HateAdded] [smallint] NULL,
	[EnduranceUpkeep] [int] NULL,
	[NumHits] [int] NULL,
	[PVPResistBase] [float] NULL,
	[PVPResistCalc] [float] NULL,
	[PVPResistCap] [float] NULL,
	[SpellCategory] [int] NULL,
	[CanBeMGB] [smallint] NULL,
	[NoDispell] [smallint] NULL,
	[NPCCategory] [smallint] NULL,
	[NPCUsefulness] [int] NULL,
 CONSTRAINT [PK_Spells] PRIMARY KEY CLUSTERED 
(
	[SpellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StartingItems]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StartingItems](
	[StartingItemID] [int] NOT NULL,
	[Race] [smallint] NOT NULL,
	[Class] [smallint] NOT NULL,
	[DeityID] [smallint] NOT NULL,
	[ZoneID] [smallint] NULL,
	[ItemID] [int] NOT NULL,
	[ItemCharges] [tinyint] NOT NULL,
	[GM] [bit] NOT NULL,
	[Slot] [smallint] NOT NULL,
 CONSTRAINT [PK_StartingItems] PRIMARY KEY CLUSTERED 
(
	[StartingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StartZone]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StartZone](
	[StartZoneID] [int] IDENTITY(1,1) NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[ZoneID] [smallint] NOT NULL,
	[BindZoneID] [smallint] NULL,
	[BindX] [float] NULL,
	[BindY] [float] NULL,
	[BindZ] [float] NULL,
	[PlayerChoice] [tinyint] NOT NULL,
	[PlayerClass] [tinyint] NOT NULL,
	[PlayerDeity] [smallint] NOT NULL,
	[PlayerRace] [smallint] NOT NULL,
 CONSTRAINT [PK_StartZone] PRIMARY KEY CLUSTERED 
(
	[StartZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorldServer]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorldServer](
	[WorldConfigID] [int] IDENTITY(1,1) NOT NULL,
	[LongName] [varchar](100) NOT NULL,
	[ShortName] [varchar](32) NOT NULL,
	[MaxClientsAllowed] [smallint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[ServerType] [tinyint] NOT NULL,
	[IPAddress] [varchar](20) NOT NULL,
 CONSTRAINT [PK_WorldConfig] PRIMARY KEY CLUSTERED 
(
	[WorldConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zone](
	[ZoneID] [smallint] NOT NULL,
	[ShortName] [varchar](16) NOT NULL,
	[LongName] [varchar](100) NOT NULL,
	[SafeX] [float] NOT NULL,
	[SafeY] [float] NOT NULL,
	[SafeZ] [float] NOT NULL,
	[MinLevel] [tinyint] NOT NULL,
	[MinStatus] [tinyint] NOT NULL,
	[MaxClients] [smallint] NULL,
	[Weather] [tinyint] NULL,
	[UnderWorld] [float] NOT NULL,
	[MinClip] [float] NOT NULL,
	[MaxClip] [float] NOT NULL,
	[FogMinClip] [float] NOT NULL,
	[FogMaxClip] [float] NOT NULL,
	[FogBlue] [tinyint] NOT NULL,
	[FogRed] [tinyint] NOT NULL,
	[FogGreen] [tinyint] NOT NULL,
	[Sky] [tinyint] NOT NULL,
	[ZType] [tinyint] NOT NULL,
	[XPMultiplier] [float] NOT NULL,
	[WalkSpeed] [float] NOT NULL,
	[TimeType] [tinyint] NOT NULL,
	[FogRed1] [tinyint] NOT NULL,
	[FogGreen1] [tinyint] NOT NULL,
	[FogBlue1] [tinyint] NOT NULL,
	[FogMinClip1] [float] NOT NULL,
	[FogMaxClip1] [float] NOT NULL,
	[FogRed2] [tinyint] NOT NULL,
	[FogGreen2] [tinyint] NOT NULL,
	[FogBlue2] [tinyint] NOT NULL,
	[FogMinClip2] [float] NOT NULL,
	[FogMaxClip2] [float] NOT NULL,
	[FogRed3] [tinyint] NOT NULL,
	[FogGreen3] [tinyint] NOT NULL,
	[FogBlue3] [tinyint] NOT NULL,
	[FogMinClip3] [float] NOT NULL,
	[FogMaxClip3] [float] NOT NULL,
	[FogRed4] [tinyint] NOT NULL,
	[FogGreen4] [tinyint] NOT NULL,
	[FogBlue4] [tinyint] NOT NULL,
	[FogMinClip4] [float] NOT NULL,
	[FogMaxClip4] [float] NOT NULL,
	[FlagIDNeeded] [int] NULL,
	[CanBind] [bit] NOT NULL,
	[CanCombat] [bit] NOT NULL,
	[CanLevitate] [bit] NOT NULL,
	[CanCastOutdoorSpells] [bit] NOT NULL,
	[CanBindOthers] [bit] NOT NULL,
 CONSTRAINT [PK_Zone] PRIMARY KEY CLUSTERED 
(
	[ZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ZonePoint]    Script Date: 5/2/2013 2:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZonePoint](
	[ZonePointID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneID] [smallint] NOT NULL,
	[Number] [smallint] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Heading] [float] NOT NULL,
	[TargetX] [float] NOT NULL,
	[TargetY] [float] NOT NULL,
	[TargetZ] [float] NOT NULL,
	[TargetHeading] [float] NOT NULL,
	[ZoneInstance] [smallint] NULL,
	[TargetZoneID] [smallint] NOT NULL,
 CONSTRAINT [PK_ZonePoint] PRIMARY KEY CLUSTERED 
(
	[ZonePointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_GMSpeed]  DEFAULT ((0)) FOR [GMSpeed]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Revoked]  DEFAULT ((0)) FOR [Revoked]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_HideMe]  DEFAULT ((0)) FOR [HideMe]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_CharLevel]  DEFAULT ((1)) FOR [CharLevel]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_XP]  DEFAULT ((0)) FOR [XP]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Platinum]  DEFAULT ((0)) FOR [Platinum]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Gold]  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Silver]  DEFAULT ((0)) FOR [Silver]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Copper]  DEFAULT ((0)) FOR [Copper]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_BankedPlatinum]  DEFAULT ((0)) FOR [BankedPlatinum]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_BankedGold]  DEFAULT ((0)) FOR [BankedGold]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_BankedSilver]  DEFAULT ((0)) FOR [BankedSilver]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_BankedCopper]  DEFAULT ((0)) FOR [BankedCopper]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_X]  DEFAULT ((0)) FOR [X]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Y]  DEFAULT ((0)) FOR [Y]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Z]  DEFAULT ((0)) FOR [Z]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_IsGM]  DEFAULT ((0)) FOR [GMStatus]
GO
ALTER TABLE [dbo].[Door] ADD  CONSTRAINT [DF_Door_Size]  DEFAULT ((100)) FOR [Size]
GO
ALTER TABLE [dbo].[LoginAccount] ADD  CONSTRAINT [DF_LoginAccount_LastLoginDate]  DEFAULT (getdate()) FOR [LastLoginDate]
GO
ALTER TABLE [dbo].[LoginAccount] ADD  CONSTRAINT [DF_LoginAccount_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Npc] ADD  CONSTRAINT [DF_Npc_Findable]  DEFAULT ((0)) FOR [Findable]
GO
ALTER TABLE [dbo].[Npc] ADD  CONSTRAINT [DF_Npc_Trackable]  DEFAULT ((1)) FOR [Trackable]
GO
ALTER TABLE [dbo].[Npc] ADD  CONSTRAINT [DF_Npc_IsBot]  DEFAULT ((0)) FOR [IsBot]
GO
ALTER TABLE [dbo].[ServerConfig] ADD  CONSTRAINT [DF_ServerConfig_PVP]  DEFAULT ((0)) FOR [PVP]
GO
ALTER TABLE [dbo].[ServerConfig] ADD  CONSTRAINT [DF_ServerConfig_StartZone]  DEFAULT ((1)) FOR [StartZone]
GO
ALTER TABLE [dbo].[ServerConfig] ADD  CONSTRAINT [DF_ServerConfig_StartingPlat]  DEFAULT ((0)) FOR [StartingPlat]
GO
ALTER TABLE [dbo].[ServerConfig] ADD  CONSTRAINT [DF_ServerConfig_StartingGold]  DEFAULT ((0)) FOR [StartingGold]
GO
ALTER TABLE [dbo].[SpawnCondition] ADD  CONSTRAINT [DF_SpawnCondition_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_BertoxRestrict]  DEFAULT ((0)) FOR [BertoxRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_BrellRestrict]  DEFAULT ((0)) FOR [BrellRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_CazicRestrict]  DEFAULT ((0)) FOR [CazicRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_ErollisiRestrict]  DEFAULT ((0)) FOR [ErollisiRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_BristlebaneRestrict]  DEFAULT ((0)) FOR [BristlebaneRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_InnorukRestrict]  DEFAULT ((0)) FOR [InnorukRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_KaranaRestrict]  DEFAULT ((0)) FOR [KaranaRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_MithanielRestrict]  DEFAULT ((0)) FOR [MithanielRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_PrexusRestrict]  DEFAULT ((0)) FOR [PrexusRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_QuelliousRestrict]  DEFAULT ((0)) FOR [QuelliousRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_RallosRestrict]  DEFAULT ((0)) FOR [RallosRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_RodcetRestrict]  DEFAULT ((0)) FOR [RodcetRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_SolusekRestrict]  DEFAULT ((0)) FOR [SolusekRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_TribunalRestrict]  DEFAULT ((0)) FOR [TribunalRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_TunareRestrict]  DEFAULT ((0)) FOR [TunareRestrict]
GO
ALTER TABLE [dbo].[Spells] ADD  CONSTRAINT [DF_Spells_VeeshanRestrict]  DEFAULT ((0)) FOR [VeeshanRestrict]
GO
ALTER TABLE [dbo].[WorldServer] ADD  CONSTRAINT [DF_WorldConfig_Locked]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_SafeX]  DEFAULT ((0)) FOR [SafeX]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_SafeY]  DEFAULT ((0)) FOR [SafeY]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_SafeZ]  DEFAULT ((0)) FOR [SafeZ]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_MinLevel]  DEFAULT ((0)) FOR [MinLevel]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_MinStatus]  DEFAULT ((0)) FOR [MinStatus]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_UnderWorld]  DEFAULT ((0)) FOR [UnderWorld]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_MinClip]  DEFAULT ((450)) FOR [MinClip]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_MaxClip]  DEFAULT ((450)) FOR [MaxClip]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMinClip]  DEFAULT ((450)) FOR [FogMinClip]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMaxClip]  DEFAULT ((450)) FOR [FogMaxClip]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogBlue]  DEFAULT ((0)) FOR [FogBlue]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogRed]  DEFAULT ((0)) FOR [FogRed]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogGreen]  DEFAULT ((0)) FOR [FogGreen]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_Sky]  DEFAULT ((1)) FOR [Sky]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_XPMultiplier]  DEFAULT ((1.0)) FOR [XPMultiplier]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_WalkSpeed]  DEFAULT ((0.4)) FOR [WalkSpeed]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_TimeType]  DEFAULT ((2)) FOR [TimeType]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogRed1]  DEFAULT ((0)) FOR [FogRed1]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogGreen1]  DEFAULT ((0)) FOR [FogGreen1]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogBlue1]  DEFAULT ((0)) FOR [FogBlue1]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMinClip1]  DEFAULT ((450)) FOR [FogMinClip1]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMaxClip1]  DEFAULT ((450)) FOR [FogMaxClip1]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogRed2]  DEFAULT ((0)) FOR [FogRed2]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogGreen2]  DEFAULT ((0)) FOR [FogGreen2]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogBlue2]  DEFAULT ((0)) FOR [FogBlue2]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMinClip2]  DEFAULT ((450)) FOR [FogMinClip2]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMaxClip2]  DEFAULT ((450)) FOR [FogMaxClip2]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogRed3]  DEFAULT ((0)) FOR [FogRed3]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogGreen3]  DEFAULT ((0)) FOR [FogGreen3]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogBlue3]  DEFAULT ((0)) FOR [FogBlue3]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMinClip3]  DEFAULT ((450)) FOR [FogMinClip3]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMaxClip3]  DEFAULT ((450)) FOR [FogMaxClip3]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogRed4]  DEFAULT ((0)) FOR [FogRed4]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogGreen4]  DEFAULT ((0)) FOR [FogGreen4]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogBlue4]  DEFAULT ((0)) FOR [FogBlue4]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMinClip4]  DEFAULT ((450)) FOR [FogMinClip4]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_FogMaxClip4]  DEFAULT ((450)) FOR [FogMaxClip4]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_CanBind]  DEFAULT ((1)) FOR [CanBind]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_CanCombat]  DEFAULT ((1)) FOR [CanCombat]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_CanLevitate]  DEFAULT ((1)) FOR [CanLevitate]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_CanCastOutdoorSpells]  DEFAULT ((1)) FOR [CanCastOutdoorSpells]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF_Zone_CanBindOthers]  DEFAULT ((0)) FOR [CanBindOthers]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Account]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Zone] FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Zone]
GO
ALTER TABLE [dbo].[CharacterBind]  WITH CHECK ADD  CONSTRAINT [FK_CharacterBind_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([CharacterID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CharacterBind] CHECK CONSTRAINT [FK_CharacterBind_Character]
GO
ALTER TABLE [dbo].[CharacterBind]  WITH CHECK ADD  CONSTRAINT [FK_CharacterBind_Zone] FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[CharacterBind] CHECK CONSTRAINT [FK_CharacterBind_Zone]
GO
ALTER TABLE [dbo].[Door]  WITH CHECK ADD  CONSTRAINT [FK_Door_Zone] FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[Door] CHECK CONSTRAINT [FK_Door_Zone]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([CharacterID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Character]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Items]
GO
ALTER TABLE [dbo].[LootDrops]  WITH CHECK ADD  CONSTRAINT [FK_LootDrops_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[LootDrops] CHECK CONSTRAINT [FK_LootDrops_Items]
GO
ALTER TABLE [dbo].[LootEntries]  WITH CHECK ADD  CONSTRAINT [FK_LootEntries_Loot] FOREIGN KEY([LootID])
REFERENCES [dbo].[Loot] ([LootID])
GO
ALTER TABLE [dbo].[LootEntries] CHECK CONSTRAINT [FK_LootEntries_Loot]
GO
ALTER TABLE [dbo].[MemorizedSpells]  WITH CHECK ADD  CONSTRAINT [FK_MemorizedSpells_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([CharacterID])
GO
ALTER TABLE [dbo].[MemorizedSpells] CHECK CONSTRAINT [FK_MemorizedSpells_Character]
GO
ALTER TABLE [dbo].[MemorizedSpells]  WITH CHECK ADD  CONSTRAINT [FK_MemorizedSpells_Spells] FOREIGN KEY([SpellID])
REFERENCES [dbo].[Spells] ([SpellID])
GO
ALTER TABLE [dbo].[MemorizedSpells] CHECK CONSTRAINT [FK_MemorizedSpells_Spells]
GO
ALTER TABLE [dbo].[Npc]  WITH CHECK ADD  CONSTRAINT [FK_Npc_Loot] FOREIGN KEY([LootId])
REFERENCES [dbo].[Loot] ([LootID])
GO
ALTER TABLE [dbo].[Npc] CHECK CONSTRAINT [FK_Npc_Loot]
GO
ALTER TABLE [dbo].[Spawn]  WITH NOCHECK ADD  CONSTRAINT [FK_Spawn_SpawnGroup] FOREIGN KEY([SpawnGroupID])
REFERENCES [dbo].[SpawnGroup] ([SpawnGroupID])
GO
ALTER TABLE [dbo].[Spawn] CHECK CONSTRAINT [FK_Spawn_SpawnGroup]
GO
ALTER TABLE [dbo].[Spawn]  WITH CHECK ADD  CONSTRAINT [FK_Spawn_Zone] FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[Spawn] CHECK CONSTRAINT [FK_Spawn_Zone]
GO
ALTER TABLE [dbo].[SpawnCondition]  WITH CHECK ADD  CONSTRAINT [FK_SpawnCondition_Zone] FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[SpawnCondition] CHECK CONSTRAINT [FK_SpawnCondition_Zone]
GO
ALTER TABLE [dbo].[SpawnGroupEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_SpawnGroupEntry_Npc] FOREIGN KEY([NpcID])
REFERENCES [dbo].[Npc] ([NpcID])
GO
ALTER TABLE [dbo].[SpawnGroupEntry] CHECK CONSTRAINT [FK_SpawnGroupEntry_Npc]
GO
ALTER TABLE [dbo].[SpawnGroupEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_SpawnGroupEntry_SpawnGroup] FOREIGN KEY([SpawnGroupID])
REFERENCES [dbo].[SpawnGroup] ([SpawnGroupID])
GO
ALTER TABLE [dbo].[SpawnGroupEntry] CHECK CONSTRAINT [FK_SpawnGroupEntry_SpawnGroup]
GO
ALTER TABLE [dbo].[Spellbook]  WITH CHECK ADD  CONSTRAINT [FK_Spellbook_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([CharacterID])
GO
ALTER TABLE [dbo].[Spellbook] CHECK CONSTRAINT [FK_Spellbook_Character]
GO
ALTER TABLE [dbo].[Spellbook]  WITH CHECK ADD  CONSTRAINT [FK_Spellbook_Spells] FOREIGN KEY([SpellID])
REFERENCES [dbo].[Spells] ([SpellID])
GO
ALTER TABLE [dbo].[Spellbook] CHECK CONSTRAINT [FK_Spellbook_Spells]
GO
ALTER TABLE [dbo].[StartingItems]  WITH CHECK ADD  CONSTRAINT [FK_StartingItems_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[StartingItems] CHECK CONSTRAINT [FK_StartingItems_Items]
GO
ALTER TABLE [dbo].[StartZone]  WITH CHECK ADD  CONSTRAINT [FK_StartZone_Zone] FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[StartZone] CHECK CONSTRAINT [FK_StartZone_Zone]
GO
ALTER TABLE [dbo].[StartZone]  WITH CHECK ADD  CONSTRAINT [FK_StartZone_Zone1] FOREIGN KEY([BindZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[StartZone] CHECK CONSTRAINT [FK_StartZone_Zone1]
GO
ALTER TABLE [dbo].[ZonePoint]  WITH CHECK ADD  CONSTRAINT [FK_ZonePoint_Zone] FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[ZonePoint] CHECK CONSTRAINT [FK_ZonePoint_Zone]
GO
USE [master]
GO
ALTER DATABASE [EQEmulator] SET  READ_WRITE 
GO
