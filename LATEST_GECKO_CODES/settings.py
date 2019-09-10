#!/usr/bin/python
# Modified for Shadow The Hedgehog USA Memory Regions 8/3/2019 by dreamsyntax
# This Python file uses the following encoding: utf-8

# Written in Python v2.7.12 by DRGN of SmashBoards (Daniel R. Cappel).
version = 4.1
# Find the official thread here for usage and other documentation: 
# http://smashboards.com/threads/melee-code-manager-easily-add-codes-to-your-game.416437/
from collections import OrderedDict


# The value below affects the Code Offset Converter in the Tools tab. If set to False, the search will be much slower, but 
# will also have a little better chance of finding a match.
quickSearch = True

# globalFontSize can set the default size of the program's font, even apart from your system's (OS dependant) settings.
# Negative values indicate pixel size, while positive values are standard font points.
globalFontSize = -12

# So far, the value below is only used for determining a default revision when adding new code changes for a mod in the Mod Construction tab.
# You should also have a DOL by this revision in the Original DOLs folder to add such code changes to a mod.
defaultRevision = 'NTSC 1.06' # Should follow the revision string convention of "[region] [version]"


# Below are hex ranges that indicate safe areas (free space) for custom code. Between each set of parenthesis, you have the start of a region, followed 
# by the end of that region. You may add new regions, as long as you follow the same formatting that you see here.
#
# (I recommend making a copy of this file or the line(s) you modify, in case you make a mistake or
# would like to undo it later. Then, you can just comment out the back-up line(s) by preceding it with a '#'.)
#
# Remember that each entry needbs to be followed by a comma, except for the last one.
# If you'd like to remove all of these regions, you still need to preserve the variable here. Just make it equal to an empty 
# pair of brackets, i.e. "commonCodeRegions = []," (note the trailing comma)
#
# You may also add regions. Just be sure that you know what you're doing and have tested the region, and that no regions overlap with one another!
customCodeRegions = OrderedDict([

	( 'NTSC 1.06|TM Region', [ (  0x580660, 0x58165C ) ] ), 	# Total space: 0x1000
	( 'NTSC 1.06|Gen Regions', [ ( 0x515FC5, 0x516FC5 ) ] ), # Total space: 0x1000
	# The following regions are only for use with extended NTSC 1.02 SSBM DOLs
	# Part 1 of Data Section 8
	#( 'NTSC 1.06|Gecko Code Handler Storage', [ ( 0x515FC5, 0x516FC5 ) ] ), # 0x1000
	# Part 2 of Data Section 8
	#( 'NTSC 1.06|Gecko Code List Storage', [ ( 0x516FC5, 0x5190CB ) ] ),  # 0x2106
])


# The Gecko hook (set below) intercepts the game's normal execution to point to the Gecko Codehandler with a standard branch.
# Warning: do not change the hook offsets unless you've first fully uninstalled all Gecko codes from your game.
# Otherwise, the old hook will still remain in your game, and your game will not run unless you manually remove it.
#
# If the regions used for the codelist or codehandler are changed, the next time you open the program and game/DOL,
# any previously installed Gecko codes will not be detected (because the program will be looking in the new region for 
# them), however their code will still be present in the same place as they were before. So you will need to reselect
# and save the mods that you'd like to be installed. And if you want the code in the old regions to be retuned the game's
# original/vanilla hex, use the "Restore" buttons found in the Code-Space Options window (located in the Mods Library tab).
# 
# Note that if Gecko codes are used, the codelist/codehandler will be placed at the start of their respective region,
# defined below. As you can see in the customCodeRegions definitions above, a single region may be one contiguous area, 
# or a collection of several areas. However, any region set for the Gecko codelist or codehandler will only use the first 
# area if there are multiple. The extra space left over in that region may still be used for standard injection mod code 
# and/or standalone functions.
geckoConfiguration = {
	'hookOffsets': { 'NTSC 1.06': 0x377B78 },
	'codelistRegion': 'Gen Regions', # If Gecko codes are used, the codelist will be placed at the start of this region (must exist in customCodeRegions)
	'codehandlerRegion': 'Gen Regions' # If Gecko codes are used, the codehandler will be placed at the start of this region (must exist in customCodeRegions)
} # Recommended defaults: Tournament Mode Region for the codelist, and Aux Code Regions for the codehandler

# The following codehandler is a modified version of the one posted and discussed here: http://smashboards.com/threads/ssbm-dol-that-accepts-gecko-codes.403755/
# This will only be added to the DOL if Gecko Codes are used.
geckoCodehandler = ('9421FF58900100087C0802A6900100AC7C0000269001000C7C0902A6900100107C0102A690010014BC6100187F2000A6633A2000735AF9FF7F400124D8410098' # 1 line = 64 bytes
					'D86100A03FE080003E80CC00A3944010639500FFB2B440107FA802A63DE0445261EF474E63E718083CC080007CD03378390000003C6000D06063C0DE808F0000'
					'7C03200040820018808F00047C0320004082000C39EF00084800004C7FA803A6B3944010C8410098C86100A07F2000A6800100AC7C0803A68001000C7C0FF120'
					'800100107C0903A6800100147C0103A6B861001880010008382100A84C00012C4E800020806F0000808F000439EF0008710900012F89000039200000546A1F7E'
					'54653F7E746B1000546301FE4082000C54CC000C480000087E0C83782E0500002C0A000141A0002C41A200E42C0A000341A001AC418202502C0A0005418002D4'
					'41A204E02C0A000741A0050C480005F07D8C1A142C050003418200484181006040BEFF842E0500014191002C548A843E419200107C8961AE392900014800000C'
					'7C89632E39290002354AFFFF40A0FFE44BFFFF54558C003A908C00004BFFFF487C892378409E04C83529FFFF418004C07CA978AE7CA961AE4BFFFFF039EF0008'
					'40BEFF2480AFFFF8816FFFFC54B1043E54AA853E54A5273E2E8500014196001041B500147C8961AE480000107C89632E480000087C89612E7C845A147D298A14'
					'354AFFFF4080FFD44BFFFEDC546907FF418200105508F87E710900012F8900002E8500042D8A00055108083C409E0078418D04B87D8C1A14418C000C41940030'
					'4800001C40940010558C003A816C00004800001C558C003CA16C00007C8920F85529843E7D6B48385484043E7F0B204070A90003418200182C09000241820018'
					'4181001C409A002048000018419A00184800001041990010480000084198000861080001408EFE404194FE3C816FFFF8409E0020706C00084182000C710C0001'
					'41820010398B0010518B033648000008556B0716916FFFF84BFFFE0C40BEFE08546916BA546E87FE2D8E00002E05000470AE00032E8E00024194001441960050'
					'7C6407347C847A14480000685465A7FF4182000C7D27482E7C844A14418E00087C8C22142E8E00014196000880840000546367FF4182003C4090000C7C843214'
					'480000307C848214480000285465A7FF4182000C7D27482E7C844A144090000C7CCC212E4BFFFD807E0C212E4BFFFD784090000C7C8623784BFFFD6C7C902378'
					'4BFFFD6454891E78392900402C05000241800048546B500341820014418100084800001041BEFD404800000840BEFD382C0500034181001041A200107DE7482E'
					'4BFFFD247DE7492E7C64073454841A787DEF22144BFFFD1040BEFD0C7CA74A14409200145464043E91E50000908500044BFFFCF4812500042C09000041A2FCE8'
					'3929FFFF9125000481E500004BFFFCD840BEFCD4546B16BA7F475A14813A0000546E67BE419200842E050005409001742E050003409000902E050001546587FF'
					'418200087C8C22142F0E00014092002441B90018419A000C88840000480000F8A0840000480000F080840000480000E85473E53E41B90020419A001099240000'
					'3884000148000018B1240000388400024800000C91240000388400043673FFFF4080FFD44BFFFC40546587FF418200087C84621471C500014182009C7C844A14'
					'48000094546A87BE548E16BA7E677214409200083A6FFFFC809A000081330000714B0001418200087C9A2378714B0002418200107D334B7840B200087E6C9A14'
					'5465673F2C05000940800054480000797C892214480000407C8921D6480000387D242378480000307D242038480000287D242278480000207D24203048000018' 
					'7D242430480000105D24203E480000087D242630909A00004BFFFB8C2C05000A4181FB84C05A0000C07300004182000CEC43102A48000008EC4300B2D05A0000'
					'4BFFFB647D4802A654A51E787D4A2A14809A0000813300007D4803A64E80002040BEFB445469C03E7D8E6378480000354192000C7E312214480000087D292214'
					'5464C43F38A000004182FB1C7D4588AE7D4549AE38A500017C0520004BFFFFEC2E8A0004553136BA2C11003C7E27882E408200087DD1737841960008A2310000'
					'552956BA2C09003C7D27482E408200087DC9737841960008A12900004E8000202C050004408000287C8923787DC3621455CE003C4BFFFFAD7C8420F85484043E'
					'7D2B20387E2420384BFFFBC4546BE43E4BFFFBBC7C9A23785484183840920020409E000C7DE803A64E8000217DE47A1460000000600000004BFFFA6C2E050003'
					'4191005C3CA048007D836214558C003A4092002040BEFA505744003A7C8C2050508501BA506507FE90AC00004BFFFA3840BEFFBC7D2C7850512501BA90AC0000'
					'398C00047D6F2214396BFFFC7D2B6050512501BA90AB00004BFFFF942E050006419200284BFFFB28558C843E5744843E575A043E7C0C20004180FBA87C0CD000'
					'4080FBA04BFFF9E05745FFFE68A50001710300017C0518004182001C511A0FBC6B5A00025745FFFF418200086B5A0001934FFFFC534807FE4BFFF9AC2C0B0000'
					'418201382C050001418200182C050002418200142C050003418200704BFFF94054CC000C5497463E5498C43E5484063E409E00FC56F906317D9A63787F43D214'
					'575A003A418200187EF707747EF700D01F3700023B3900047F59D0502C1700004182001C3B2000007EE903A6A37A00047F79CA783B5A00024200FFF47C18C800'
					'408200AC4BFFFE905108083C409E009C5477B003418100884180008C547E063E1FDE00025497001E6EF880002C1800004082000862F730005498801E1F3E0004'
					'7F19C0503B2000001F5900047F6FD02E7F57D02E3B3900017C17C040418100347C19F000418100147C1AD8004182FFDC3AF700044BFFFFD0806FFFF860630300'
					'906FFFF892EFFFFC7EF0BB784800001C806FFFF860630100906FFFF861080001480000087C9023785464063E1C8400087DE47A144BFFF8704092000C39000000'
					'48000014546906FF546567FE7D084C305517FFFF408200087D082A785485001F418200087CA62B785485801F418200087CB02B784BFFF8300000000000DEADBEEF000000') 
					# Total size: 0x8C4 bytes (4488 characters). The length of this must be aligned to the nearest 4 bytes.
