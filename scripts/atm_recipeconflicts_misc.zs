import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

#packmode normal simplified

print(" =================== Recipe Conflicts =================== ");
print(" ======================================================== ");
/*
	This script is dedicated to any items that have conflicting recipes
*/


//====== Variables ======
	var MekBoilerCasing = <mekanism:basicblock2:7>;
	var planks = <ore:plankWood>;
	var strings = <ore:string>;
	var cobweb = <minecraft:web>;
	var marble = <ore:stoneMarble>;
	var inscab = <ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte});


//====== Misc Tool/Armor Conflicts ======
//
	recipes.remove(<thermalfoundation:tool.sword_bronze:0>);
	recipes.remove(<thermalfoundation:tool.shovel_bronze:0>);
	recipes.remove(<thermalfoundation:tool.hoe_bronze:0>);
	recipes.remove(<thermalfoundation:tool.axe_bronze:0>);
	recipes.remove(<thermalfoundation:tool.pickaxe_bronze:0>);
	recipes.remove(<thermalfoundation:armor.legs_bronze:0>);
	recipes.remove(<thermalfoundation:armor.plate_bronze:0>);
	recipes.remove(<thermalfoundation:armor.helmet_bronze:0>);
	recipes.remove(<thermalfoundation:armor.boots_bronze:0>);
	recipes.remove(<actuallyadditions:item_pickaxe_emerald:0>);
	recipes.remove(<actuallyadditions:item_chest_emerald:0>);
	recipes.remove(<actuallyadditions:item_pants_emerald:0>);


//====== Adv Gen upgrade kit ======
//
	recipes.remove(<advgenerators:upgrade_kit>);
	recipes.addShaped(<advgenerators:upgrade_kit>, [
		[<ore:plateTin>, null, <ore:plateTin>],
		[null, <ore:stickWood>, null],
		[null, <ore:stickWood>, null]
		]);

//====== Forestry gears redundant ======
//
	recipes.remove(<forestry:gear_bronze>);
	recipes.remove(<forestry:gear_copper>);
	recipes.remove(<forestry:gear_tin>);


//====== Recipe tweaks ======
//------ Mostly just due to conflicting recipe overlap
//
	recipes.removeShaped(<stevescarts:modulecomponents:43>);
	recipes.addShaped("fuse", <stevescarts:modulecomponents:43> * 12,
		[[strings, null, null],
		[null, strings, null],
		[null, null, strings]]);


//====== Charcoal ======
//
	recipes.remove(<actuallyadditions:block_misc:5>);    // conflicts with <chisel:block_charcoal2:1>


//====== Constantan Grit ======
// Thermal vs Immersive conflict
//
	recipes.remove(<thermalfoundation:material:100>);


//====== Wooden Rail ======
// Tconstruct vs Extra Rails conflict
//
	recipes.remove(<tconstruct:wood_rail:0>);


//====== Harvestcraft Cotton ======
// Extra recipe not needed, conflicts with seed recipe
//
	recipes.remove(<harvestcraft:cottonitem>);
// ====== Boiler Casing ======
// conflicts with Steel Gear
//
	recipes.remove(MekBoilerCasing);
	recipes.addShaped(<mekanism:basicblock2:7> * 4, [
		[null, <ore:ingotSteel>, null],
		[<ore:ingotSteel>, <ore:plateSteel>, <ore:ingotSteel>],
		[null, <ore:ingotSteel>, null]
	]);

//(Soft Pretzel) <harvestcraft:softpretzelitem:0> * 1 conflicts with [Shapeless] (Crackers) <harvestcraft:crackersitem:0> * 1
	recipes.remove(<harvestcraft:crackersitem:0>);
	recipes.addShapeless(<harvestcraft:crackersitem:0>, [<harvestcraft:crackeritem:0>, <harvestcraft:crackeritem:0>]);

//(Trash Can (Fluid)) <extrautils2:trashcanfluid:0> * 1 conflicts with [Shaped] (Fluid Trash Can) <quantumstorage:trashcanfluid:0> * 1
	recipes.remove(<extrautils2:trashcanfluid:0>);
	recipes.addShapeless(<extrautils2:trashcanfluid:0>, [<quantumstorage:trashcanfluid:0>]);

//(Trash Can) <extrautils2:trashcan:0> * 1 conflicts with [Shaped] (Trash Can) <quantumstorage:trashcan:0> * 1
	recipes.remove(<extrautils2:trashcan:0>);
	recipes.addShapeless(<extrautils2:trashcan:0>, [<quantumstorage:trashcan:0>]);

//(Uranium Seeds) <mysticalagriculture:uranium_seeds:0> * 1 conflicts with [Shaped] (Yellorium Seeds) <mysticalagriculture:yellorium_seeds:0> * 1
	recipes.remove(<mysticalagriculture:yellorium_seeds:0>);

//(Bricks Wall) <ceramics:clay_wall:0> * 6 conflicts with [Shaped] (Brick Wall) <quark:brick_wall:0> * 6
	//conflict resolved by disabling in quark config

//(Mini Chest) <extrautils2:minichest:0> * 9 conflicts with [Shapeless] (Oak Chest) <minecraft:chest:0> * 1
	// mini chest works from oak chest, not conflicting in practice

//====== CC Modem (future block chisel) ======
//
	recipes.remove(<computercraft:cable:1>);
	recipes.addShaped(<computercraft:cable:1>, [
		[<ore:stone>, <computercraft:cable>, <ore:stone>],
		[<computercraft:cable>, <ore:dustRedstone>, <computercraft:cable>],
		[<ore:stone>, <computercraft:cable>, <ore:stone>]
		]);


//====== Sawdust Paper CardboardBox ======
//
	recipes.remove(<minecraft:paper>);

	recipes.addShapeless(<minecraft:paper>*1, [<ore:dustWood>, <ore:dustWood>, <ore:dustWood>, <ore:dustWood>]);
	recipes.addShaped(<minecraft:paper>*1, [[<ore:sugarcane>, <ore:sugarcane>, <ore:sugarcane>]]);
	recipes.addShapedMirrored(<minecraft:paper>*3, [
		[<ore:cropRice>, null, null],
		[null, <ore:cropRice>, null],
		[null, null, <ore:cropRice>]
		]);
	recipes.addShapeless(<minecraft:paper>*6, [<ore:dustWood>, <ore:dustWood>, <ore:dustWood>, <liquid:water>*1000]);

	recipes.remove(<mekanism:cardboardbox>);
	recipes.addShaped(<mekanism:cardboardbox>, [
		[null, <storagedrawers:tape>.anyDamage(), null],
		[<thermalfoundation:material:801>, <thermalfoundation:material:801>, <thermalfoundation:material:801>],
		[<thermalfoundation:material:801>, <thermalfoundation:material:801>, <thermalfoundation:material:801>]
		]);

	//Rice Dough
	recipes.remove(<actuallyadditions:item_misc:9>);
	recipes.addShapeless(<actuallyadditions:item_misc:9>*2, [<ore:cropRice>, <ore:cropRice>, <ore:cropRice>, <ore:cropRice>]);


//====== TiCo Moss ======
//
	recipes.remove(<tconstruct:materials:18>);
	recipes.addShapeless(<tconstruct:materials:18>, [<ore:blockMossy>, <ore:blockMossy>, <ore:blockMossy>, <ore:blockMossy>]);


//====== Iron Stick ======
//
	<ore:stickIron>.add(<tconstruct:tool_rod>.withTag({Material: "iron"}));

//====== Wax Capsule ======
//
   recipes.remove(<forestry:capsule>);
   recipes.addShaped(<forestry:capsule> * 3, [
      [null, null, null],
      [<harvestcraft:beeswaxitem>, <harvestcraft:beeswaxitem>, <harvestcraft:beeswaxitem>],
      [null, null, null]
      ]);
   recipes.addShaped(<forestry:capsule> * 3, [
      [null, null, null],[<forestry:beeswax>,
      <forestry:beeswax>, <forestry:beeswax>],
      [null, null, null]
      ]);

//====== Iron Frame ======
//
   recipes.remove(<advgenerators:iron_frame>);
   recipes.addShaped(<advgenerators:iron_frame> * 2,
      [[<ore:ingotIron>, null, <ore:ingotIron>],
      [null, null, null],
      [<ore:ingotIron>, null, <ore:ingotIron>]]);
