extends PanelContainer

enum MutationSources {
	CITY,
	RURAL,
	INSTITUTION
}

enum TableCType {
	CITY,
	RURAL,
	INSTITUTION
}

enum TableDType {
	ERROR = -1,
	URBAN,
	PET,
	FARM,
	WILD,
	ZOO,
	LAB,
	GENEMOD
}

const ATTRIBUTES_TABLE: Dictionary[int,Array] = {
	1:[-4,10,2,-2,19],
	2:[-4,15,2,-2,18],
	3:[-4,20,2,-2,17],
	4:[-3,24,2,-1,16],
	5:[-3,28,2,-1,15],
	6:[-2,32,2,0,14],
	7:[-2,36,2,0,13],
	8:[-1,40,2,1,12],
	9:[-1,43,3,1,11],
	10:[0,46,3,1,10],
	11:[0,49,3,1,9],
	12:[1,52,3,2,8],
	13:[1,55,3,2,7],
	14:[2,58,3,3,6],
	15:[2,60,4,3,5],
	16:[3,62,4,4,4],
	17:[3,64,4,4,3],
	18:[4,66,4,5,2],
	19:[4,68,4,5,1],
	20:[4,70,4,5,0],
	21:[5,71,5,6,-2],
	22:[5,72,5,6,-4],
	23:[5,73,5,6,-6],
	24:[6,74,5,7,-8],
	25:[6,75,6,7,-10],
	26:[6,76,6,7,-12],
	27:[7,77,6,8,-14],
	28:[7,78,7,8,-16],
	29:[7,79,7,8,-18],
	30:[8,80,8,9,-20]
}

const DAMAGE_DICE: Dictionary[int,String] = {
	-2:"-2R",
	-1:"-1R",
	0:"0",
	1:"1d6",
	2:"1d8",
	3:"1d10",
	4:"1d12",
	5:"2d8",
	6:"2d10",
	7:"2d12",
	8:"3d10",
	9:"3d12"
}

const NOW_URBAN_SPECIES_TABLE: Dictionary[int,String] = {
	1:"res://Resources/Species/Mutants in the Now/Bat, Little Brown.tres",
	2:"res://Resources/Species/Mutants in the Now/Bat, Little Brown.tres",
	3:"res://Resources/Species/Mutants in the Now/Bat, Little Brown.tres",
	4:"res://Resources/Species/Mutants in the Now/Bat, Little Brown.tres",
	5:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	6:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	7:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	8:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	9:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	10:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	11:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	12:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	13:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	14:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	15:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	16:"res://Resources/Species/Mutants in the Now/Cat, Maine Coon.tres",
	17:"res://Resources/Species/Mutants in the Now/Cat, Maine Coon.tres",
	18:"res://Resources/Species/Mutants in the Now/Cat, Maine Coon.tres",
	19:"res://Resources/Species/Mutants in the Now/Cockroach, American.tres",
	20:"res://Resources/Species/Mutants in the Now/Cockroach, American.tres",
	21:"res://Resources/Species/Mutants in the Now/Cockroach, American.tres",
	22:"res://Resources/Species/Mutants in the Now/Cockroach, American.tres",
	23:"res://Resources/Species/Mutants in the Now/Coyote, Mexican.tres",
	24:"res://Resources/Species/Mutants in the Now/Coyote, Mexican.tres",
	25:"res://Resources/Species/Mutants in the Now/Coyote, Mexican.tres",
	26:"res://Resources/Species/Mutants in the Now/Deer, White Tailed.tres",
	27:"res://Resources/Species/Mutants in the Now/Deer, White Tailed.tres",
	28:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	29:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	30:"res://Resources/Species/Mutants in the Now/Dog, Bulldog.tres",
	31:"res://Resources/Species/Mutants in the Now/Dog, Bulldog.tres",
	32:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	33:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	34:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	35:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	36:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	37:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	38:"res://Resources/Species/Mutants in the Now/Falcon, Peregrine.tres",
	39:"res://Resources/Species/Mutants in the Now/Falcon, Peregrine.tres",
	40:"res://Resources/Species/Mutants in the Now/Fox, Red.tres",
	41:"res://Resources/Species/Mutants in the Now/Fox, Red.tres",
	42:"res://Resources/Species/Mutants in the Now/Gull, Ring Billed.tres",
	43:"res://Resources/Species/Mutants in the Now/Gull, Ring Billed.tres",
	44:"res://Resources/Species/Mutants in the Now/Gull, Ring Billed.tres",
	45:"res://Resources/Species/Mutants in the Now/Gull, Ring Billed.tres",
	46:"res://Resources/Species/Mutants in the Now/Gull, Ring Billed.tres",
	47:"res://Resources/Species/Mutants in the Now/Hawk, Red-Tailed.tres",
	48:"res://Resources/Species/Mutants in the Now/Hawk, Red-Tailed.tres",
	49:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	50:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	51:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	52:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	53:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	54:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	55:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	56:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	57:"res://Resources/Species/Mutants in the Now/Opossum, Virginia.tres",
	58:"res://Resources/Species/Mutants in the Now/Opossum, Virginia.tres",
	59:"res://Resources/Species/Mutants in the Now/Opossum, Virginia.tres",
	60:"res://Resources/Species/Mutants in the Now/Owl, Great Horned.tres",
	61:"res://Resources/Species/Mutants in the Now/Owl, Great Horned.tres",
	62:"res://Resources/Species/Mutants in the Now/Pigeon, Common.tres",
	63:"res://Resources/Species/Mutants in the Now/Pigeon, Common.tres",
	64:"res://Resources/Species/Mutants in the Now/Pigeon, Common.tres",
	65:"res://Resources/Species/Mutants in the Now/Pigeon, Common.tres",
	66:"res://Resources/Species/Mutants in the Now/Pigeon, Common.tres",
	67:"res://Resources/Species/Mutants in the Now/Pigeon, Common.tres",
	68:"res://Resources/Species/Mutants in the Now/Pigeon, Common.tres",
	69:"res://Resources/Species/Mutants in the Now/Rabbit, European.tres",
	70:"res://Resources/Species/Mutants in the Now/Rabbit, European.tres",
	71:"res://Resources/Species/Mutants in the Now/Rabbit, European.tres",
	72:"res://Resources/Species/Mutants in the Now/Rabbit, European.tres",
	73:"res://Resources/Species/Mutants in the Now/Raccoon, Common.tres",
	74:"res://Resources/Species/Mutants in the Now/Raccoon, Common.tres",
	75:"res://Resources/Species/Mutants in the Now/Raccoon, Common.tres",
	76:"res://Resources/Species/Mutants in the Now/Raccoon, Common.tres",
	77:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	78:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	79:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	80:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	81:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	82:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	83:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	84:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	85:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	86:"res://Resources/Species/Mutants in the Now/Raven, Common.tres",
	87:"res://Resources/Species/Mutants in the Now/Raven, Common.tres",
	88:"res://Resources/Species/Mutants in the Now/Raven, Common.tres",
	89:"res://Resources/Species/Mutants in the Now/Skunk, Striped.tres",
	90:"res://Resources/Species/Mutants in the Now/Skunk, Striped.tres",
	91:"res://Resources/Species/Mutants in the Now/Skunk, Striped.tres",
	92:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	93:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	94:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	95:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	96:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	97:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	98:"res://Resources/Species/Mutants in the Now/Turtle, Red-Eared Slider.tres",
	99:"res://Resources/Species/Mutants in the Now/Turtle, Red-Eared Slider.tres",
	100:"res://Resources/Species/Mutants in the Now/Turtle, Red-Eared Slider.tres"
}

const NOW_PET_SPECIES_TABLE: Dictionary[int,String] = {
	1:"res://Resources/Species/Mutants in the Now/Axolotl.tres",
	2:"res://Resources/Species/Mutants in the Now/Canary, Domestic.tres",
	3:"res://Resources/Species/Mutants in the Now/Canary, Domestic.tres",
	4:"res://Resources/Species/Mutants in the Now/Canary, Domestic.tres",
	5:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	6:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	7:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	8:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	9:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	10:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	11:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	12:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	13:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	14:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	15:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	16:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	17:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	18:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	19:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	20:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	21:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	22:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	23:"res://Resources/Species/Mutants in the Now/Cat, Maine Coon.tres",
	24:"res://Resources/Species/Mutants in the Now/Cat, Maine Coon.tres",
	25:"res://Resources/Species/Mutants in the Now/Cat, Maine Coon.tres",
	26:"res://Resources/Species/Mutants in the Now/Cat, Maine Coon.tres",
	27:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	28:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	29:"res://Resources/Species/Mutants in the Now/Chinchilla, Long-Tailed.tres",
	30:"res://Resources/Species/Mutants in the Now/Chinchilla, Long-Tailed.tres",
	31:"res://Resources/Species/Mutants in the Now/Gecko, Common Leopard.tres",
	32:"res://Resources/Species/Mutants in the Now/Gecko, Common Leopard.tres",
	33:"res://Resources/Species/Mutants in the Now/Goldfish.tres",
	34:"res://Resources/Species/Mutants in the Now/Goldfish.tres",
	35:"res://Resources/Species/Mutants in the Now/Goldfish.tres",
	36:"res://Resources/Species/Mutants in the Now/Goldfish.tres",
	37:"res://Resources/Species/Mutants in the Now/Goldfish.tres",
	38:"res://Resources/Species/Mutants in the Now/Goldfish.tres",
	39:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	40:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	41:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	42:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	43:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	44:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	45:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	46:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	47:"res://Resources/Species/Mutants in the Now/Dog, Bulldog.tres",
	48:"res://Resources/Species/Mutants in the Now/Dog, Bulldog.tres",
	49:"res://Resources/Species/Mutants in the Now/Dog, Bulldog.tres",
	50:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	51:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	52:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	53:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	54:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	55:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	56:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	57:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	58:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	59:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	60:"res://Resources/Species/Mutants in the Now/Dog, Welsh Corgi.tres",
	61:"res://Resources/Species/Mutants in the Now/Dog, Welsh Corgi.tres",
	62:"res://Resources/Species/Mutants in the Now/Dog, Welsh Corgi.tres",
	63:"res://Resources/Species/Mutants in the Now/Dog, Welsh Corgi.tres",
	64:"res://Resources/Species/Mutants in the Now/Dog, Yorkshire Terrier.tres",
	65:"res://Resources/Species/Mutants in the Now/Dog, Yorkshire Terrier.tres",
	66:"res://Resources/Species/Mutants in the Now/Dog, Yorkshire Terrier.tres",
	67:"res://Resources/Species/Mutants in the Now/Dog, Yorkshire Terrier.tres",
	68:"res://Resources/Species/Mutants in the Now/Ferret.tres",
	69:"res://Resources/Species/Mutants in the Now/Ferret.tres",
	70:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	71:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	72:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	73:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	74:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	75:"res://Resources/Species/Mutants in the Now/Hedgehog, African Pygmy.tres",
	76:"res://Resources/Species/Mutants in the Now/Hedgehog, African Pygmy.tres",
	77:"res://Resources/Species/Mutants in the Now/Iguana, Green.tres",
	78:"res://Resources/Species/Mutants in the Now/Iguana, Green.tres",
	79:"res://Resources/Species/Mutants in the Now/Iguana, Green.tres",
	80:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	81:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	82:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	83:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	84:"res://Resources/Species/Mutants in the Now/Parrot, Amazon.tres",
	85:"res://Resources/Species/Mutants in the Now/Parrot, Amazon.tres",
	86:"res://Resources/Species/Mutants in the Now/Pig, Miniature.tres",
	87:"res://Resources/Species/Mutants in the Now/Pig, Miniature.tres",
	88:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	89:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	90:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	91:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	92:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	93:"res://Resources/Species/Mutants in the Now/Snake, Boa Constrictor.tres",
	94:"res://Resources/Species/Mutants in the Now/Snake, Boa Constrictor.tres",
	95:"res://Resources/Species/Mutants in the Now/Tarantula, Chilean Rose.tres",
	96:"res://Resources/Species/Mutants in the Now/Tarantula, Chilean Rose.tres",
	97:"res://Resources/Species/Mutants in the Now/Turtle, Common Box.tres",
	98:"res://Resources/Species/Mutants in the Now/Turtle, Common Box.tres",
	99:"res://Resources/Species/Mutants in the Now/Turtle, Red-Eared Slider.tres",
	100:"res://Resources/Species/Mutants in the Now/Turtle, Red-Eared Slider.tres"
}

const NOW_FARM_SPECIES_TABLE: Dictionary[int, String] = {
	1:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	2:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	3:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	4:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	5:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	6:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	7:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	8:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	9:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	10:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	11:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	12:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	13:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	14:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	15:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	16:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	17:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	18:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	19:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	20:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	21:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	22:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	23:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	24:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	25:"res://Resources/Species/Mutants in the Now/Chicken, White Leghorn.tres",
	26:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	27:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	28:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	29:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	30:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	31:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	32:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	33:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	34:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	35:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	36:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	37:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	38:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	39:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	40:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	41:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	42:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	43:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	44:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	45:"res://Resources/Species/Mutants in the Now/Cow, Holstein.tres",
	46:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	47:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	48:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	49:"res://Resources/Species/Mutants in the Now/Dog, Great Dane.tres",
	50:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	51:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	52:"res://Resources/Species/Mutants in the Now/Dog, Welsh Corgi.tres",
	53:"res://Resources/Species/Mutants in the Now/Dog, Welsh Corgi.tres",
	54:"res://Resources/Species/Mutants in the Now/Donkey, North American.tres",
	55:"res://Resources/Species/Mutants in the Now/Donkey, North American.tres",
	56:"res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres",
	57:"res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres",
	58:"res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres",
	59:"res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres",
	60:"res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres",
	61:"res://Resources/Species/Mutants in the Now/Goat, Saanen.tres",
	62:"res://Resources/Species/Mutants in the Now/Goat, Saanen.tres",
	63:"res://Resources/Species/Mutants in the Now/Goat, Saanen.tres",
	64:"res://Resources/Species/Mutants in the Now/Goat, Saanen.tres",
	65:"res://Resources/Species/Mutants in the Now/Goose, Emden.tres",
	66:"res://Resources/Species/Mutants in the Now/Goose, Emden.tres",
	67:"res://Resources/Species/Mutants in the Now/Horse, American Quarter.tres",
	68:"res://Resources/Species/Mutants in the Now/Horse, American Quarter.tres",
	69:"res://Resources/Species/Mutants in the Now/Horse, American Quarter.tres",
	70:"res://Resources/Species/Mutants in the Now/Horse, American Quarter.tres",
	71:"res://Resources/Species/Mutants in the Now/Horse, American Quarter.tres",
	72:"res://Resources/Species/Mutants in the Now/Horse, American Quarter.tres",
	73:"res://Resources/Species/Mutants in the Now/Horse, American Quarter.tres",
	74:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	75:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	76:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	77:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	78:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	79:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	80:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	81:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	82:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	83:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	84:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	85:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	86:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	87:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	88:"res://Resources/Species/Mutants in the Now/Pig, American Yorkshire.tres",
	89:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	90:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	91:"res://Resources/Species/Mutants in the Now/Sheep, Hampshire.tres",
	92:"res://Resources/Species/Mutants in the Now/Sheep, Hampshire.tres",
	93:"res://Resources/Species/Mutants in the Now/Sheep, Hampshire.tres",
	94:"res://Resources/Species/Mutants in the Now/Sheep, Hampshire.tres",
	95:"res://Resources/Species/Mutants in the Now/Sheep, Hampshire.tres",
	96:"res://Resources/Species/Mutants in the Now/Sheep, Hampshire.tres",
	97:"res://Resources/Species/Mutants in the Now/Turkey, Wild or Domestic.tres",
	98:"res://Resources/Species/Mutants in the Now/Turkey, Wild or Domestic.tres",
	99:"res://Resources/Species/Mutants in the Now/Turkey, Wild or Domestic.tres",
	100:"res://Resources/Species/Mutants in the Now/Turkey, Wild or Domestic.tres"
}

const NOW_WILD_SPECIES_TABLE: Dictionary[int, String] = {
	1:"res://Resources/Species/Mutants in the Now/Alligator, American.tres",
	2:"res://Resources/Species/Mutants in the Now/Alligator, American.tres",
	3:"res://Resources/Species/Mutants in the Now/Armadillo, Nine-Banded.tres",
	4:"res://Resources/Species/Mutants in the Now/Armadillo, Nine-Banded.tres",
	5:"res://Resources/Species/Mutants in the Now/Badger, American.tres",
	6:"res://Resources/Species/Mutants in the Now/Badger, American.tres",
	7:"res://Resources/Species/Mutants in the Now/Bat, Little Brown.tres",
	8:"res://Resources/Species/Mutants in the Now/Bat, Little Brown.tres",
	9:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	10:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	11:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	12:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	13:"res://Resources/Species/Mutants in the Now/Beaver, North American.tres",
	14:"res://Resources/Species/Mutants in the Now/Beaver, North American.tres",
	15:"res://Resources/Species/Mutants in the Now/Bison, American.tres",
	16:"res://Resources/Species/Mutants in the Now/Bison, American.tres",
	17:"res://Resources/Species/Mutants in the Now/Boar, Wild.tres",
	18:"res://Resources/Species/Mutants in the Now/Boar, Wild.tres",
	19:"res://Resources/Species/Mutants in the Now/Bobcat (Red Lynx).tres",
	20:"res://Resources/Species/Mutants in the Now/Caribou, Barren-Ground.tres",
	21:"res://Resources/Species/Mutants in the Now/Caribou, Barren-Ground.tres",
	22:"res://Resources/Species/Mutants in the Now/Cougar.tres",
	23:"res://Resources/Species/Mutants in the Now/Cougar.tres",
	24:"res://Resources/Species/Mutants in the Now/Coyote, Mexican.tres",
	25:"res://Resources/Species/Mutants in the Now/Crocodile, American.tres",
	26:"res://Resources/Species/Mutants in the Now/Deer, White Tailed.tres",
	27:"res://Resources/Species/Mutants in the Now/Deer, White Tailed.tres",
	28:"res://Resources/Species/Mutants in the Now/Dolphin, Bottlenose.tres",
	29:"res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres",
	30:"res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres",
	31:"res://Resources/Species/Mutants in the Now/Eagle, Bald.tres",
	32:"res://Resources/Species/Mutants in the Now/Falcon, Peregrine.tres",
	33:"res://Resources/Species/Mutants in the Now/Fly, Horse.tres",
	34:"res://Resources/Species/Mutants in the Now/Fly, Horse.tres",
	35:"res://Resources/Species/Mutants in the Now/Fox, Arctic.tres",
	36:"res://Resources/Species/Mutants in the Now/Fox, Red.tres",
	37:"res://Resources/Species/Mutants in the Now/Fox, Red.tres",
	38:"res://Resources/Species/Mutants in the Now/Frog, Bull.tres",
	39:"res://Resources/Species/Mutants in the Now/Frog, Bull.tres",
	40:"res://Resources/Species/Mutants in the Now/Gar, Alligator.tres",
	41:"res://Resources/Species/Mutants in the Now/Gila Monster.tres",
	42:"res://Resources/Species/Mutants in the Now/Goose, Canada.tres",
	43:"res://Resources/Species/Mutants in the Now/Goose, Canada.tres",
	44:"res://Resources/Species/Mutants in the Now/Groundhog.tres",
	45:"res://Resources/Species/Mutants in the Now/Groundhog.tres",
	46:"res://Resources/Species/Mutants in the Now/Gull, Ring Billed.tres",
	47:"res://Resources/Species/Mutants in the Now/Hawk, Red-Tailed.tres",
	48:"res://Resources/Species/Mutants in the Now/Hummingbird, Ruby-Throated.tres",
	49:"res://Resources/Species/Mutants in the Now/Lynx, Canadian.tres",
	50:"res://Resources/Species/Mutants in the Now/Mole, Eastern.tres",
	51:"res://Resources/Species/Mutants in the Now/Mole, Eastern.tres",
	52:"res://Resources/Species/Mutants in the Now/Moose.tres",
	53:"res://Resources/Species/Mutants in the Now/Mountain Goat, Rocky.tres",
	54:"res://Resources/Species/Mutants in the Now/Mouse, Deer.tres",
	55:"res://Resources/Species/Mutants in the Now/Mouse, Deer.tres",
	56:"res://Resources/Species/Mutants in the Now/Muskox.tres",
	57:"res://Resources/Species/Mutants in the Now/Muskrat.tres",
	58:"res://Resources/Species/Mutants in the Now/Nightcrawler (L. Terrestris).tres",
	59:"res://Resources/Species/Mutants in the Now/Octopus, Common.tres",
	60:"res://Resources/Species/Mutants in the Now/Octopus, Flapjack.tres",
	61:"res://Resources/Species/Mutants in the Now/Opossum, Virginia.tres",
	62:"res://Resources/Species/Mutants in the Now/Otter, North American River.tres",
	63:"res://Resources/Species/Mutants in the Now/Otter, North American River.tres",
	64:"res://Resources/Species/Mutants in the Now/Orca.tres",
	65:"res://Resources/Species/Mutants in the Now/Pika, Collared.tres",
	66:"res://Resources/Species/Mutants in the Now/Porcupine, North American.tres",
	67:"res://Resources/Species/Mutants in the Now/Prairie Dog.tres",
	68:"res://Resources/Species/Mutants in the Now/Rabbit, European.tres",
	69:"res://Resources/Species/Mutants in the Now/Raccoon, Common.tres",
	70:"res://Resources/Species/Mutants in the Now/Raccoon, Common.tres",
	71:"res://Resources/Species/Mutants in the Now/Raven, Common.tres",
	72:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	73:"res://Resources/Species/Mutants in the Now/Roadrunner, Greater.tres",
	74:"res://Resources/Species/Mutants in the Now/Salamander, Red-Backed.tres",
	75:"res://Resources/Species/Mutants in the Now/Salamander, Red-Backed.tres",
	76:"res://Resources/Species/Mutants in the Now/Seal, Harbor.tres",
	77:"res://Resources/Species/Mutants in the Now/Sea Lion, California.tres",
	78:"res://Resources/Species/Mutants in the Now/Shark, Great White.tres",
	79:"res://Resources/Species/Mutants in the Now/Shark, Great White.tres",
	80:"res://Resources/Species/Mutants in the Now/Shrew, Cinereus.tres",
	81:"res://Resources/Species/Mutants in the Now/Skunk, Striped.tres",
	82:"res://Resources/Species/Mutants in the Now/Skunk, Striped.tres",
	83:"res://Resources/Species/Mutants in the Now/Snake, Garter.tres",
	84:"res://Resources/Species/Mutants in the Now/Snake, Garter.tres",
	85:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	86:"res://Resources/Species/Mutants in the Now/Squirrel, Eastern Gray.tres",
	87:"res://Resources/Species/Mutants in the Now/Toad, Eastern American.tres",
	88:"res://Resources/Species/Mutants in the Now/Toad, Eastern American.tres",
	89:"res://Resources/Species/Mutants in the Now/Turkey, Wild or Domestic.tres",
	90:"res://Resources/Species/Mutants in the Now/Turtle, Common Box.tres",
	91:"res://Resources/Species/Mutants in the Now/Turtle, Red-Eared Slider.tres",
	92:"res://Resources/Species/Mutants in the Now/Turtle, Alligator Snapping.tres",
	93:"res://Resources/Species/Mutants in the Now/Turtle, Alligator Snapping.tres",
	94:"res://Resources/Species/Mutants in the Now/Vulture, Turkey.tres",
	95:"res://Resources/Species/Mutants in the Now/Walrus.tres",
	96:"res://Resources/Species/Mutants in the Now/Weasel, Long-Tailed.tres",
	97:"res://Resources/Species/Mutants in the Now/Whale, Humpback.tres",
	98:"res://Resources/Species/Mutants in the Now/Wolf, Gray.tres",
	99:"res://Resources/Species/Mutants in the Now/Wolf, Gray.tres",
	100:"res://Resources/Species/Mutants in the Now/Wolverine.tres"
}

const NOW_ZOO_SPECIES_TABLE: Dictionary[int,String] = {
	1:"res://Resources/Species/Mutants in the Now/Alligator, American.tres",
	2:"res://Resources/Species/Mutants in the Now/Alligator, American.tres",
	3:"res://Resources/Species/Mutants in the Now/Alligator, American.tres",
	4:"res://Resources/Species/Mutants in the Now/Axolotl.tres",
	5:"res://Resources/Species/Mutants in the Now/Axolotl.tres",
	6:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	7:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	8:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	9:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	10:"res://Resources/Species/Mutants in the Now/Bear, Grizzly.tres",
	11:"res://Resources/Species/Mutants in the Now/Capybara.tres",
	12:"res://Resources/Species/Mutants in the Now/Capybara.tres",
	13:"res://Resources/Species/Mutants in the Now/Cheetah.tres",
	14:"res://Resources/Species/Mutants in the Now/Cheetah.tres",
	15:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	16:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	17:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	18:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	19:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	20:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	21:"res://Resources/Species/Mutants in the Now/Dolphin, Bottlenose.tres",
	22:"res://Resources/Species/Mutants in the Now/Dolphin, Bottlenose.tres",
	23:"res://Resources/Species/Mutants in the Now/Dolphin, Bottlenose.tres",
	24:"res://Resources/Species/Mutants in the Now/Dolphin, Bottlenose.tres",
	25:"res://Resources/Species/Mutants in the Now/Dolphin, Bottlenose.tres",
	26:"res://Resources/Species/Mutants in the Now/Elephant, African.tres",
	27:"res://Resources/Species/Mutants in the Now/Elephant, African.tres",
	28:"res://Resources/Species/Mutants in the Now/Elephant, African.tres",
	29:"res://Resources/Species/Mutants in the Now/Elephant, African.tres",
	30:"res://Resources/Species/Mutants in the Now/Elephant, African.tres",
	31:"res://Resources/Species/Mutants in the Now/Elephant, African.tres",
	32:"res://Resources/Species/Mutants in the Now/Giraffe, Reticulated.tres",
	33:"res://Resources/Species/Mutants in the Now/Giraffe, Reticulated.tres",
	34:"res://Resources/Species/Mutants in the Now/Gorilla, Western Lowland.tres",
	35:"res://Resources/Species/Mutants in the Now/Gorilla, Western Lowland.tres",
	36:"res://Resources/Species/Mutants in the Now/Gorilla, Western Lowland.tres",
	37:"res://Resources/Species/Mutants in the Now/Gorilla, Western Lowland.tres",
	38:"res://Resources/Species/Mutants in the Now/Gorilla, Western Lowland.tres",
	39:"res://Resources/Species/Mutants in the Now/Gorilla, Western Lowland.tres",
	40:"res://Resources/Species/Mutants in the Now/Hippopotamus.tres",
	41:"res://Resources/Species/Mutants in the Now/Hippopotamus.tres",
	42:"res://Resources/Species/Mutants in the Now/Hyena, Spotted.tres",
	43:"res://Resources/Species/Mutants in the Now/Hyena, Spotted.tres",
	44:"res://Resources/Species/Mutants in the Now/Kangaroo, Red.tres",
	45:"res://Resources/Species/Mutants in the Now/Kangaroo, Red.tres",
	46:"res://Resources/Species/Mutants in the Now/Kangaroo, Red.tres",
	47:"res://Resources/Species/Mutants in the Now/Lion, African.tres",
	48:"res://Resources/Species/Mutants in the Now/Lion, African.tres",
	49:"res://Resources/Species/Mutants in the Now/Lion, African.tres",
	50:"res://Resources/Species/Mutants in the Now/Lion, African.tres",
	51:"res://Resources/Species/Mutants in the Now/Monkey, Capuchin.tres",
	52:"res://Resources/Species/Mutants in the Now/Monkey, Capuchin.tres",
	53:"res://Resources/Species/Mutants in the Now/Monkey, Capuchin.tres",
	54:"res://Resources/Species/Mutants in the Now/Monkey, Capuchin.tres",
	55:"res://Resources/Species/Mutants in the Now/Panda, Giant.tres",
	56:"res://Resources/Species/Mutants in the Now/Panda, Giant.tres",
	57:"res://Resources/Species/Mutants in the Now/Panda, Giant.tres",
	58:"res://Resources/Species/Mutants in the Now/Panda, Red.tres",
	59:"res://Resources/Species/Mutants in the Now/Panda, Red.tres",
	60:"res://Resources/Species/Mutants in the Now/Panda, Red.tres",
	61:"res://Resources/Species/Mutants in the Now/Pangolin, Giant.tres",
	62:"res://Resources/Species/Mutants in the Now/Pangolin, Giant.tres",
	63:"res://Resources/Species/Mutants in the Now/Parrot, Amazon.tres",
	64:"res://Resources/Species/Mutants in the Now/Parrot, Amazon.tres",
	65:"res://Resources/Species/Mutants in the Now/Penguin, Emperor (Now).tres",
	66:"res://Resources/Species/Mutants in the Now/Penguin, Emperor (Now).tres",
	67:"res://Resources/Species/Mutants in the Now/Octopus, Common.tres",
	68:"res://Resources/Species/Mutants in the Now/Octopus, Common.tres",
	69:"res://Resources/Species/Mutants in the Now/Opossum, Grey Short-Tailed.tres",
	70:"res://Resources/Species/Mutants in the Now/Orca.tres",
	71:"res://Resources/Species/Mutants in the Now/Orca.tres",
	72:"res://Resources/Species/Mutants in the Now/Orca.tres",
	73:"res://Resources/Species/Mutants in the Now/Orca.tres",
	74:"res://Resources/Species/Mutants in the Now/Ostrich, Common.tres",
	75:"res://Resources/Species/Mutants in the Now/Ostrich, Common.tres",
	76:"res://Resources/Species/Mutants in the Now/Otter, Sea.tres",
	77:"res://Resources/Species/Mutants in the Now/Otter, Sea.tres",
	78:"res://Resources/Species/Mutants in the Now/Platypus, Duck-Billed.tres",
	79:"res://Resources/Species/Mutants in the Now/Platypus, Duck-Billed.tres",
	80:"res://Resources/Species/Mutants in the Now/Rhinoceros, White.tres",
	81:"res://Resources/Species/Mutants in the Now/Rhinoceros, White.tres",
	82:"res://Resources/Species/Mutants in the Now/Sea Lion, California.tres",
	83:"res://Resources/Species/Mutants in the Now/Sea Lion, California.tres",
	84:"res://Resources/Species/Mutants in the Now/Secretarybird.tres",
	85:"res://Resources/Species/Mutants in the Now/Secretarybird.tres",
	86:"res://Resources/Species/Mutants in the Now/Snake, Boa Constrictor.tres",
	87:"res://Resources/Species/Mutants in the Now/Snake, Boa Constrictor.tres",
	88:"res://Resources/Species/Mutants in the Now/Snake, Gaboon Viper.tres",
	89:"res://Resources/Species/Mutants in the Now/Snake, Gaboon Viper.tres",
	90:"res://Resources/Species/Mutants in the Now/Snake, King Cobra.tres",
	91:"res://Resources/Species/Mutants in the Now/Snake, King Cobra.tres",
	92:"res://Resources/Species/Mutants in the Now/Tiger, Bengal.tres",
	93:"res://Resources/Species/Mutants in the Now/Tiger, Bengal.tres",
	94:"res://Resources/Species/Mutants in the Now/Tiger, Bengal.tres",
	95:"res://Resources/Species/Mutants in the Now/Tiger, Bengal.tres",
	96:"res://Resources/Species/Mutants in the Now/Tiger, Bengal.tres",
	97:"res://Resources/Species/Mutants in the Now/Tortoise, Galapagos.tres",
	98:"res://Resources/Species/Mutants in the Now/Tortoise, Galapagos.tres",
	99:"res://Resources/Species/Mutants in the Now/Wolf, Gray.tres",
	100:"res://Resources/Species/Mutants in the Now/Wolf, Gray.tres"
}

const NOW_LAB_SPECIES_TABLE: Dictionary[int,String] = {
	1:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	2:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	3:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	4:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	5:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	6:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	7:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	8:"res://Resources/Species/Mutants in the Now/Cat, American Shorthair.tres",
	9:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	10:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	11:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	12:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	13:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	14:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	15:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	16:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	17:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	18:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	19:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	20:"res://Resources/Species/Mutants in the Now/Chimpanzee, Common.tres",
	21:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	22:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	23:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	24:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	25:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	26:"res://Resources/Species/Mutants in the Now/Dog, Beagle.tres",
	27:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	28:"res://Resources/Species/Mutants in the Now/Dog, Golden Retriever.tres",
	29:"res://Resources/Species/Mutants in the Now/Frog, African Clawed.tres",
	30:"res://Resources/Species/Mutants in the Now/Frog, African Clawed.tres",
	31:"res://Resources/Species/Mutants in the Now/Frog, African Clawed.tres",
	32:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	33:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	34:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	35:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	36:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	37:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	38:"res://Resources/Species/Mutants in the Now/Guinea Pig, American.tres",
	39:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	40:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	41:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	42:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	43:"res://Resources/Species/Mutants in the Now/Hamster, Syrian.tres",
	44:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	45:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	46:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	47:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	48:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	49:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	50:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	51:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	52:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	53:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	54:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	55:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	56:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	57:"res://Resources/Species/Mutants in the Now/Monkey, Rhesus Macaque.tres",
	58:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	59:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	60:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	61:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	62:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	63:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	64:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	65:"res://Resources/Species/Mutants in the Now/Mouse, House.tres",
	66:"res://Resources/Species/Mutants in the Now/Opossum, Grey Short-Tailed.tres",
	67:"res://Resources/Species/Mutants in the Now/Opossum, Grey Short-Tailed.tres",
	68:"res://Resources/Species/Mutants in the Now/Pig, Miniature.tres",
	69:"res://Resources/Species/Mutants in the Now/Pig, Miniature.tres",
	70:"res://Resources/Species/Mutants in the Now/Pig, Miniature.tres",
	71:"res://Resources/Species/Mutants in the Now/Pig, Miniature.tres",
	72:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	73:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	74:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	75:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	76:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	77:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	78:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	79:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	80:"res://Resources/Species/Mutants in the Now/Rabbit, New Zealand White.tres",
	81:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	82:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	83:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	84:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	85:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	86:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	87:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	88:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	89:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	90:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	91:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	92:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	93:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	94:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	95:"res://Resources/Species/Mutants in the Now/Rat, Brown.tres",
	96:"res://Resources/Species/Mutants in the Now/Sheep, Finn-Dorset.tres",
	97:"res://Resources/Species/Mutants in the Now/Sheep, Finn-Dorset.tres",
	98:"res://Resources/Species/Mutants in the Now/Sheep, Finn-Dorset.tres",
	99:"res://Resources/Species/Mutants in the Now/Sheep, Finn-Dorset.tres",
	100:"res://Resources/Species/Mutants in the Now/Sheep, Finn-Dorset.tres"
}

const NOW_GENEMOD_SPECIES_TABLE: Dictionary[int, String] = {
	1:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	2:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	3:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	4:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	5:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	6:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	7:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	8:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	9:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	10:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	11:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	12:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	13:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	14:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	15:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	16:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	17:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	18:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	19:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	20:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	21:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	22:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	23:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	24:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	25:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	26:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	27:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	28:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	29:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	30:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	31:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	32:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	33:"res://Resources/Species/Mutants in the Now/Genemod/Chinchilla, Mutant Blue.tres",
	34:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	35:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	36:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	37:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	38:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	39:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	40:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	41:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	42:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	43:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	44:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	45:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	46:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	47:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	48:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	49:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	50:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	51:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	52:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	53:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	54:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	55:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	56:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	57:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	58:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	59:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	60:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	61:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	62:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	63:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	64:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	65:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	66:"res://Resources/Species/Mutants in the Now/Genemod/Mouse, Slinky.tres",
	67:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	68:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	69:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	70:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	71:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	72:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	73:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	74:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	75:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	76:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	77:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	78:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	79:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	80:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	81:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	82:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	83:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	84:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	85:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	86:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	87:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	88:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	89:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	90:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	91:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	92:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	93:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	94:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	95:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	96:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	97:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	98:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	99:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres",
	100:"res://Resources/Species/Mutants in the Now/Genemod/Pig, Flying.tres"
}

var base_takebacks := 0
var takebacks_modifier := 0
var takebacks_used := 0
var base_group_takebacks := 0
var group_takebacks_modifier := 0
var group_takebacks_used := 0
var cognition := 0
var determination := 0
var affinity := 0
var perception := 0
var strength := 0
var prowess := 0
var endurance := 0
var speed := 0
var source_of_mutation: MutationSources
var mentor_source_of_mutation: MutationSources
var hp := 0
var sht := 0
var will := 0
var size_rating := 0
var lift := 0
var move := 0
var character_traits: Array[Trait]
var character_subtraits: Array[Trait]
var species: Species
var base_goop: int
var goop_used: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ((base_takebacks + takebacks_modifier) - takebacks_used) <= 0:
		if %Step3.visible == true:
			%CognitionRerollButton.disabled = true
			%DeterminationRerollButton.disabled = true
			%AffinityRerollButton.disabled = true
			%PerceptionRerollButton.disabled = true
			%StrengthRerollButton.disabled = true
			%ProwessRerollButton.disabled = true
			%EnduranceRerollButton.disabled = true
			%SpeedRerollButton.disabled = true
	if (%GroupType.selected == 1 or %GroupType.selected == 2) and ((base_group_takebacks + group_takebacks_modifier) - group_takebacks_used) <= 0:
		if %Step4.visible == true:
			%SourceOfMutationRerollButton.disabled = true
			%SourceOfMutationSwapButton.disabled = true
			%BackgroundTableRerollButton.disabled = true
			%BackgroundTableSwapButton.disabled = true
	elif (%GroupType.selected == 0) and ((base_takebacks + takebacks_modifier) - takebacks_used) <= 0:
		if %Step4.visible == true:
			%SourceOfMutationRerollButton.disabled = true
			%SourceOfMutationSwapButton.disabled = true
			%BackgroundTableRerollButton.disabled = true
			%BackgroundTableSwapButton.disabled = true
	if %GroupType.selected == 2 and ((base_group_takebacks + group_takebacks_modifier) - group_takebacks_used) <= 0:
		if %Step4.visible == true:
			%TableCRerollButton.disabled = true
			%TableCSwapButton.disabled = true
			%TableDRerollButton.disabled = true
			%TableDSwapButton.disabled = true
	elif ((base_takebacks + takebacks_modifier) - takebacks_used) <= 0:
		if %Step4.visible == true:
			%TableCRerollButton.disabled = true
			%TableCSwapButton.disabled = true
			%TableDRerollButton.disabled = true
			%TableDSwapButton.disabled = true
	
	if %StatsContainer.visible == true:
		%GOOPLabel.text = "GOO-P: " + str(goop_used) + "/" + str(base_goop)


func update_takebacks() -> void:
	%TakebacksLabel.text = "Takebacks: " + str((base_takebacks + takebacks_modifier) - takebacks_used)
	%GroupTakebacksLabel.text = "Group Takebacks: " + str((base_group_takebacks + group_takebacks_modifier) - group_takebacks_used)


func roll_attribute() -> int:
	return randi_range(1,6)+randi_range(1,6)+randi_range(1,6)+randi_range(1,6)


func update_cognition() -> void:
	%CognitionRoll.text = str(cognition)
	
	if ATTRIBUTES_TABLE[cognition][0] >= 0:
		%COGValueLabel.text = "+"
	else:
		%COGValueLabel.text = ""
	%COGValueLabel.text += str(ATTRIBUTES_TABLE[cognition][0])
	
	%CognitionSkillBaseLabel.text = str(ATTRIBUTES_TABLE[cognition][1]) + "%"
	
	%CognitionSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[cognition][2]) + "%"
	
	%CognitionDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[cognition][3]]
	
	if ATTRIBUTES_TABLE[cognition][4] >= 0:
		%CognitionGOOPBonusLabel.text = "+"
	else:
		%CognitionGOOPBonusLabel.text = ""
	%CognitionGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[cognition][4])


func update_determination() -> void:
	%DeterminationRoll.text = str(determination)
	
	if ATTRIBUTES_TABLE[determination][0] >= 0:
		%DETValueLabel.text = "+"
	else:
		%DETValueLabel.text = ""
	%DETValueLabel.text += str(ATTRIBUTES_TABLE[determination][0])
	
	%DeterminationSkillBaseLabel.text = str(ATTRIBUTES_TABLE[determination][1]) + "%"
	
	%DeterminationSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[determination][2]) + "%"
	
	%DeterminationDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[determination][3]]
	
	if ATTRIBUTES_TABLE[determination][4] >= 0:
		%DeterminationGOOPBonusLabel.text = "+"
	else:
		%DeterminationGOOPBonusLabel.text = ""
	%DeterminationGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[determination][4])


func update_affinity() -> void:
	%AffinityRoll.text = str(affinity)
	
	if ATTRIBUTES_TABLE[affinity][0] >= 0:
		%AFFValueLabel.text = "+"
	else:
		%AFFValueLabel.text = ""
	%AFFValueLabel.text += str(ATTRIBUTES_TABLE[affinity][0])
	
	%AffinitySkillBaseLabel.text = str(ATTRIBUTES_TABLE[affinity][1]) + "%"
	
	%AffinitySkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[affinity][2]) + "%"
	
	%AffinityDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[affinity][3]]
	
	if ATTRIBUTES_TABLE[affinity][4] >= 0:
		%AffinityGOOPBonusLabel.text = "+"
	else:
		%AfinityGOOPBonusLabel.text = ""
	%AffinityGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[affinity][4])


func update_perception() -> void:
	%PerceptionRoll.text = str(perception)
	
	if ATTRIBUTES_TABLE[perception][0] >= 0:
		%PERValueLabel.text = "+"
	else:
		%PERValueLabel.text = ""
	%PERValueLabel.text += str(ATTRIBUTES_TABLE[perception][0])
	
	%PerceptionSkillBaseLabel.text = str(ATTRIBUTES_TABLE[perception][1]) + "%"
	
	%PerceptionSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[perception][2]) + "%"
	
	%PerceptionDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[perception][3]]
	
	if ATTRIBUTES_TABLE[perception][4] >= 0:
		%PerceptionGOOPBonusLabel.text = "+"
	else:
		%PerceptionGOOPBonusLabel.text = ""
	%PerceptionGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[perception][4])


func update_strength() -> void:
	%StrengthRoll.text = str(strength)
	
	if ATTRIBUTES_TABLE[strength][0] >= 0:
		%STRValueLabel.text = "+"
	else:
		%STRValueLabel.text = ""
	%STRValueLabel.text += str(ATTRIBUTES_TABLE[strength][0])
	
	%StrengthSkillBaseLabel.text = str(ATTRIBUTES_TABLE[strength][1]) + "%"
	
	%StrengthSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[strength][2]) + "%"
	
	%StrengthDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[strength][3]]
	
	if ATTRIBUTES_TABLE[strength][4] >= 0:
		%StrengthGOOPBonusLabel.text = "+"
	else:
		%StrengthGOOPBonusLabel.text = ""
	%StrengthGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[strength][4])


func update_prowess() -> void:
	%ProwessRoll.text = str(prowess)
	
	if ATTRIBUTES_TABLE[prowess][0] >= 0:
		%PROValueLabel.text = "+"
	else:
		%PROValueLabel.text = ""
	%PROValueLabel.text += str(ATTRIBUTES_TABLE[prowess][0])
	
	%ProwessSkillBaseLabel.text = str(ATTRIBUTES_TABLE[prowess][1]) + "%"
	
	%ProwessSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[prowess][2]) + "%"
	
	%ProwessDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[prowess][3]]
	
	if ATTRIBUTES_TABLE[prowess][4] >= 0:
		%ProwessGOOPBonusLabel.text = "+"
	else:
		%ProwessGOOPBonusLabel.text = ""
	%ProwessGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[prowess][4])


func update_endurance() -> void:
	%EnduranceRoll.text = str(endurance)
	
	if ATTRIBUTES_TABLE[endurance][0] >= 0:
		%ENDValueLabel.text = "+"
	else:
		%ENDValueLabel.text = ""
	%ENDValueLabel.text += str(ATTRIBUTES_TABLE[endurance][0])
	
	%EnduranceSkillBaseLabel.text = str(ATTRIBUTES_TABLE[endurance][1]) + "%"
	
	%EnduranceSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[endurance][2]) + "%"
	
	%EnduranceDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[endurance][3]]
	
	if ATTRIBUTES_TABLE[endurance][4] >= 0:
		%EnduranceGOOPBonusLabel.text = "+"
	else:
		%EnduranceGOOPBonusLabel.text = ""
	%EnduranceGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[endurance][4])


func update_speed() -> void:
	%SpeedRoll.text = str(speed)
	
	if ATTRIBUTES_TABLE[speed][0] >= 0:
		%SPDValueLabel.text = "+"
	else:
		%SPDValueLabel.text = ""
	%SPDValueLabel.text += str(ATTRIBUTES_TABLE[speed][0])
	
	%SpeedSkillBaseLabel.text = str(ATTRIBUTES_TABLE[speed][1]) + "%"
	
	%SpeedSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[speed][2]) + "%"
	
	%SpeedDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[speed][3]]
	
	if ATTRIBUTES_TABLE[speed][4] >= 0:
		%SpeedGOOPBonusLabel.text = "+"
	else:
		%SpeedGOOPBonusLabel.text = ""
	%SpeedGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[speed][4])


func update_stats() -> void:
	update_cognition()
	update_determination()
	update_affinity()
	update_perception()
	update_strength()
	update_prowess()
	update_endurance()
	update_speed()


func determine_source_of_mutation(die_roll: int) -> MutationSources:
	%SourceOfMutationRoll.text = str(die_roll)
	
	if die_roll in range(1,41):
		return MutationSources.CITY
	elif die_roll in range(41,71):
		return MutationSources.RURAL
	else:
		return MutationSources.INSTITUTION

func update_source_of_mutation() -> void:
	match source_of_mutation:
		MutationSources.CITY:
			%SourceOfMutationDescriptionLabel.text = "[b]CHEMICAL LEAK:[/b] Goop leaked from an industrial site, commercial laboratory, or personal lab, either by negligence or sabotage."
		MutationSources.RURAL:
			%SourceOfMutationDescriptionLabel.text = "[b]TRANSPORTATION ACCIDENT:[/b] Goop spilled due to a crash, theft, or mishap."
		MutationSources.INSTITUTION:
			%SourceOfMutationDescriptionLabel.text = "[b]EXPERIMENTATION RESULT:[/b] There was a deliberate experiment on an animal using Goop."

func determine_background(die_roll: int, initial_mutation_source: MutationSources) -> String:
	var result = ""
	
	match initial_mutation_source:
		MutationSources.CITY:
			if die_roll in range(1,11):
				result = "[b]SELF-TAUGHT SURVIVOR:[/b] You scraped by alone. While you’ve had contact with humans, you had no guardian and survived via instincts and hard lessons. Gain: one basic or wild skill package, an additional wild skill package, four hobbies, a survivor equipment package (scavenger or urban), +2 Determination, +2 Will, +10 SHT, and +A on initiative rolls.[br][br]"
			elif die_roll in range(11,31):
				result = "[b]FRINGES OF SOCIETY:[/b] A street community adopted you: a homeless community, undocumented immigrants, runaways, etc. In turn, you assist them. Gain: one basic skill package, one street skill package, one wild skill package, four hobbies, a survivor equipment package (scavenger or urban), +2 to Perception, +1 CTCT, and +5 SHT.[br][br]"
			elif die_roll in range(31,41):
				result = "[b]RAISED BY A HUMAN:[/b] A human or human family adopted and raised you in secret. This is a relatively healthy home; if you want a more troubled past, check with your group first. Gain: two basic skill packages, one professional skill package, five hobbies, one basic equipment package, +2 to Cognition, and +1 CTCT.[br][br]"
			elif die_roll in range(41,51):
				result = "[b]RAISED BY A MUTANT:[/b] An experienced mutant mentored you. Roll for the mutant’s source and background, then gain the same packages and bonuses.[br][br]"
			elif die_roll in range(51,66):
				result = "[b]RAISED BY A MUTANT COMMUNITY:[/b] A clandestine group of mutant animals found and raised you. In return, you keep their secrets. Gain: one basic skill package, one street skill package, one wild skill package, four hobbies, one survivor or basic equipment package, +2 Speed, +1 WILL, and Value: Community.[br][br]"
			elif die_roll in range(66,81):
				result = "[b]ADOPTED BY AN INSTITUTION:[/b] A large institution caught you early in life, and you grew up there.[br][br]"
			elif die_roll in range(81,86):
				result = "[b]FLED TO THE WILD:[/b] You escaped the city early in life, growing up in the wild.[br][br]"
			else:
				result += "[b]SWALLOWED BY THE SHADOWS:[/b] A covert group (criminal or espionage) raised you as an agent. Gain: two covert skill packages, one basic skill package, one hobby, one agent equipment package, +2 Prowess, +2 Speed, and +A on dramatic rolls to avoid notice. Your fighting style may be a secret fighting style.[br][br]"
		MutationSources.RURAL:
			if die_roll in range(1,21):
				result += "[[b]LARGELY FERAL:[/b] You have avoided meaningful contact with humanity and have yet to be encultured. Gain: two wild skill packages, five hobbies, a survivor equipment package (scavenger or wild), +2 Strength, +2 Endurance, +2 Speed, and +A to any dramatic roll to find food, shelter, or avoid danger in the wild. The character starts without language. To understand and speak a language, they must spend a hobby to do so, and an additional hobby to write.[br][br]]"
			elif die_roll in range(21,41):
				result += "[b]SELF-TAUGHT SURVIVOR:[/b] You scraped by alone. While you’ve had contact with humans, you had no guardian and survived via instincts and hard lessons. Gain: one basic or wild skill package, an additional wild skill package, four hobbies, a survivor equipment package (scavenger or wild), +2 Determination, +2 Will, +10 SHT, and +A on initiative rolls.[br][br]"
			elif die_roll in range(41,51):
				result += "[b]BACK-TO-THE-LANDER:[/b] A person or community separated from wider society adopted you. This may be a self-isolating enclave, a counterculture group, an indigenous community, etc. Gain: two basic skill packages, one military or professional skill package, five hobbies, a basic or survivor equipment package, +1 CTCT, +1 WILL, and Value: Community.[br][br]"
			elif die_roll in range(51,56):
				result += "[b]RAISED BY A HUMAN:[/b] A human or human family adopted and raised you in secret. This is a relatively healthy home; if you want a more troubled past, check with your group first. Gain: two basic skill packages, one wild skill package, five hobbies, one basic equipment package, +2 to Cognition, and +1 CTCT.[br][br]"
			elif die_roll in range(56,61):
				result += "[b]RAISED BY A MUTANT:[/b] An experienced mutant mentored you. Roll for the mutant’s source and background, then gain the same packages and bonuses.[br][br]"
			elif die_roll in range(61,81):
				result += "[b]FARM LIVING:[/b] A small farm family or community raised you. Gain: two basic skill packages, one professional skill package, four hobbies, one basic equipment package, +2 STR, +2 END.[br][br]"
			elif die_roll in range(81,97):
				result += "[b]URBAN IMMIGRANT:[/b] Though you mutated in the wild, you migrated to “civilization”.[br][br]"
			else:
				result += "[b]ADOPTED BY AN ORGANIZATION:[/b] Though you mutated in the wild, an institution claimed you early in life.[br][br]"
		MutationSources.INSTITUTION:
			if die_roll in range(1,11):
				result += "[b]RURAL ESCAPE:[/b] The organization released you, or you escaped soon after your mutation.[br][br]"
			elif die_roll in range(11,16):
				result += "[b]URBAN ESCAPE:[/b] The organization released you, or you escaped soon after your mutation.[br][br]"
			elif die_roll in range(16,31):
				result += "[b]LAB SUBJECT, SOLITARY:[/b] A lab raised you as an experiment, but you escaped, or the organization released you. There has not been immediate pursuit. Gain: two basic skill packages, one professional or science skill package, one hobby, one escapee equipment package, +2 Cognition, +2 Perception, and +A to dramatic rolls to escape from confinement.[br][br]"
			elif die_roll in range(31,36):
				result = "[b]RAISED BY A MUTANT:[/b] An older mutant raised you while in captivity. Roll for the mutant’s source and background, then gain the same packages and bonuses, replacing any equipment with an escapee equipment package.[br][br]"
			elif die_roll in range(36,46):
				result = "[b]RAISED BY A HUMAN:[/b] The institution had a member raise you like one of their own. This is a relatively healthy home; if you want a more troubled past, check with your group first. Gain: two basic skill packages, one wild skill package, five hobbies, one basic equipment package, +2 to Cognition, and +1 CTCT.[br][br]"
			elif die_roll in range(46,61):
				result = "[b]ASSISTED ESCAPEE:[/b] A member of the institution fled with you, raising you on the run. "
				var x = randi_range(1,100)
				if x in range(1,31):
					result += "You’ve successfully gone underground. "
				else:
					result += "you’re still hunted by the institution, possibly with the help of law enforcement or government organizations. "
				result += "Gain: one basic skill package, one covert skill package, one science skill package, three hobbies, one basic equipment package, +2 Perception, +1 CTCT, and +1 WILL.[br][br]"
			elif die_roll in range(61,71):
				result += "[b]PUBLIC MASCOT:[/b] The institution raised you as a public relations symbol. Your feelings depend on your experience, but it has likely been a difficult existence due to high expectations and a restricted life. Gain: one basic skill package, a basic or professional skill package, six hobbies, one basic equipment package, and +4 Affinity.[br][br]"
			elif die_roll in range(71,96):
				result += "[b]AGENT/EMPLOYEE:[/b] The institution raised you to aid them with your unique genetic abilities. While broadly treated as an employee, the institution won’t allow you to easily leave their service. Gain: one basic skill package, two covert, military, or professional skill packages, two hobbies, one basic or agent equipment package, +10 SHT, +2 Prowess, and +1 WILL. Your fighting style may be a secret fighting style.[br][br]"
			else:
				result += "[b]SPONSORED FREEDOM:[/b] The organization raised you publicly as an adopted ward with monetary support. Their reasons could be charitable, scientific, or self-serving. Gain: three skill packages from the following categories: basic, professional, or science, four hobbies, a basic equipment package, and +3 Cognition.[br][br]"
	
	return result


func determine_table_c_result(die_roll: int,table_c: TableCType) -> TableDType:
	match table_c:
		TableCType.CITY:
			if die_roll in range(1,51):
				return TableDType.URBAN
			elif die_roll in range(51,81):
				return TableDType.PET
			elif die_roll in range(81,86):
				return TableDType.WILD
			elif die_roll in range(86,99):
				return TableDType.ZOO
			else:
				return TableDType.GENEMOD
		TableCType.RURAL:
			if die_roll in range(1,11):
				return TableDType.URBAN
			elif die_roll in range(11,21):
				return TableDType.PET
			elif die_roll in range(21,40):
				return TableDType.FARM
			else:
				return TableDType.WILD
		TableCType.INSTITUTION:
			if die_roll in range(1,21):
				return TableDType.PET
			elif die_roll in range(21,31):
				return TableDType.WILD
			elif die_roll in range(31,41):
				return TableDType.ZOO
			elif die_roll in range(41,91):
				return TableDType.LAB
			else:
				return TableDType.GENEMOD
	
	return -1 as TableDType


func determine_table_d_result(die_roll:int, table_d:TableDType) -> Species:
	var species_resource_path: String
	
	match table_d:
		TableDType.ERROR:
			species_resource_path = "res://Resources/Species/Mutants in the Now/Alligator, American.tres"
		TableDType.URBAN:
			species_resource_path = NOW_URBAN_SPECIES_TABLE[die_roll]
		TableDType.PET:
			species_resource_path = NOW_PET_SPECIES_TABLE[die_roll]
		TableDType.FARM:
			species_resource_path = NOW_FARM_SPECIES_TABLE[die_roll]
		TableDType.WILD:
			species_resource_path = NOW_WILD_SPECIES_TABLE[die_roll]
		TableDType.ZOO:
			species_resource_path = NOW_ZOO_SPECIES_TABLE[die_roll]
		TableDType.LAB:
			species_resource_path = NOW_LAB_SPECIES_TABLE[die_roll]
		TableDType.GENEMOD:
			species_resource_path = NOW_GENEMOD_SPECIES_TABLE[die_roll]
	
	if species_resource_path == "res://Resources/Species/Mutants in the Now/Duck, Mallard (Now).tres" and %NextTraitsCheckbox.pressed:
		return load("res://Resources/Species/Mutants in the Now/Duck, Mallard (Next).tres")
	elif species_resource_path == "res://Resources/Species/Mutants in the Now/Penguin, Emperor (Now).tres" and %NextTraitsCheckbox.pressed:
		return load("res://Resources/Species/Mutants in the Now/Penguin, Emperor (Next).tres")
	else:
		return load(species_resource_path)


func update_table_d_result() -> void:
	var type_regex := RegEx.create_from_string("Type: ")
	var diet_regex := RegEx.create_from_string("Diet: ")
	
	%SpeciesLabel.text = "[p align=center][font_size=20][b]" + species.name + "[/b][/font_size][/p][p align=center][i]" + species.description + "[/i][/p][p][b]Size Rating:[/b] " + str(species.size_rating) + "[/p][p][b]GOO-P:[/b] "
	if species.base_goop >= 0:
		%SpeciesLabel.text += "+"
	%SpeciesLabel.text += str(species.base_goop) + "[/p][p][b]Enhnace:[/b] "
	
	for attribute in species.enhancable_attributes:
		%SpeciesLabel.text += attribute + ", "
	%SpeciesLabel.text = %SpeciesLabel.text.erase(%SpeciesLabel.text.length()-2)
	
	%SpeciesLabel.text += "[/p][p][b]Basic Traits:[/b] "
	
	for basic_trait in species.basic_traits:
		if basic_trait is String:
			if type_regex.search(basic_trait) != null:
				%SpeciesLabel.text += type_regex.sub(basic_trait,"") + ", "
			elif diet_regex.search(basic_trait) != null:
				%SpeciesLabel.text += diet_regex.sub(basic_trait,"") + ", "
			elif(
				basic_trait != "Movement: Quadrupedal" and 
				basic_trait != "Prehensility: Locomotors" and 
				basic_trait != "Speech: Nonvocal" and 
				basic_trait != "Mask: Bestial" and
				basic_trait != "Respiration: Air-Breathing" and 
				basic_trait != "Senses: Sight" and 
				basic_trait != "Senses: Hearing" and 
				basic_trait != "Senses: Scent"
			):
				%SpeciesLabel.text += basic_trait + ", "
		elif basic_trait is Trait:
			match basic_trait.type:
				Trait.TraitType.MAJOR:
					%SpeciesLabel.text += "Major: " + basic_trait.name + ", "
				Trait.TraitType.MINOR:
					%SpeciesLabel.text += "Minor: " + basic_trait.name + ", "
				Trait.TraitType.ZOOMORPHIC:
					%SpeciesLabel.text += "Zoomorphic: " + basic_trait.name + ", "
				Trait.TraitType.UNIQUE:
					%SpeciesLabel.text += "Unique: " + basic_trait.name + ", "
				Trait.TraitType.PSIONIC_POWER:
					%SpeciesLabel.text += "Psionic Power: " + basic_trait.name + ", "
	%SpeciesLabel.text = %SpeciesLabel.text.erase(%SpeciesLabel.text.length()-2)
	
	%SpeciesLabel.text += "[/p][p][b]Major Traits:[/b] "
	
	var major_traits_available := species.major_traits["Mutants in the Now"]
	if %NextTraitsCheckbox.pressed:
		major_traits_available.append(species.major_traits["Mutants in the Next"])
	
	for major_trait in major_traits_available.traits:
		var major_trait_string = major_trait.name
		var required_major_subtraits: Array[Trait]
		var optional_major_subtraits: Array[Trait]
		var total_trait_cost = major_trait.cost
		for major_subtrait in major_trait.subtraits:
			if major_subtrait in major_traits_available.subtraits.keys():
				if major_traits_available.subtraits[major_subtrait]:
					required_major_subtraits.append(major_subtrait)
				else:
					optional_major_subtraits.append(major_subtrait)
		if !required_major_subtraits.is_empty():
			major_trait_string += ": "
			for major_subtrait in required_major_subtraits:
				total_trait_cost += major_subtrait.cost
				major_trait_string += major_subtrait.name + " "
			major_trait_string = major_trait_string.erase(major_trait_string.length()-1,1)
		major_trait_string += " (" + str(maxi(total_trait_cost,2)) + " GOO-P"
		if !optional_major_subtraits.is_empty():
			for major_subtrait in optional_major_subtraits:
				major_trait_string += ", " + major_subtrait.name + " "
				if major_subtrait.cost >= 0:
					major_trait_string += "+"
				major_trait_string += str(major_subtrait.cost) + " GOO-P"
		major_trait_string += ")"
		%SpeciesLabel.text += major_trait_string + ", "
	%SpeciesLabel.text = %SpeciesLabel.text.erase(%SpeciesLabel.text.length()-2,2)
	
	%SpeciesLabel.text += "[/p][p][b]Minor Traits:[/b] "
	var minor_traits_available := species.minor_traits["Mutants in the Now"]
	if %NextTraitsCheckbox.pressed:
		minor_traits_available.append(species.minor_traits["Mutants in the Next"])
	for minor_trait in minor_traits_available.traits:
		var minor_trait_string := minor_trait.name
		var required_minor_subtraits: Array[Trait]
		var optional_minor_subtraits: Array[Trait]
		for minor_subtrait in minor_trait.subtraits:
			if minor_subtrait in minor_traits_available.subtraits.keys():
				if minor_traits_available.subtraits[minor_subtrait]:
					required_minor_subtraits.append(minor_subtrait)
				else:
					optional_minor_subtraits.append(minor_subtrait)
		if !required_minor_subtraits.is_empty():
			minor_trait_string += ": "
			for minor_subtrait in required_minor_subtraits:
				minor_trait_string += minor_subtrait.name + " "
			minor_trait_string = minor_trait_string.erase(minor_trait_string.length()-1,1)
		if !optional_minor_subtraits.is_empty():
			minor_trait_string += " ("
			for minor_subtrait in optional_minor_subtraits:
				minor_trait_string += minor_subtrait.name + ", "
			minor_trait_string = minor_trait_string.erase(minor_trait_string.length()-2,2)
			minor_trait_string += ")"
		minor_trait_string += ", "
		%SpeciesLabel.text += minor_trait_string
	
	%SpeciesLabel.text = %SpeciesLabel.text.erase(%SpeciesLabel.text.length()-2,2)
	%SpeciesLabel.text += "[/p][p][b]" + species.unique_trait.name + " ("
	if !species.unique_trait.requirements.is_empty():
		for requirement in species.unique_trait.requirements:
			%SpeciesLabel.text += requirement + " + "
	%SpeciesLabel.text += str(species.unique_trait.cost) + " GOO-P):[/b] " + species.unique_trait.description + "[/p]"


func _on_group_type_item_selected(index: int) -> void:
	match index:
		0:
			base_takebacks = 4
			base_group_takebacks = 0
		1,2:
			base_takebacks = 3
			base_group_takebacks = 3
	
	%Step2.visible = true
	%Step3.visible = true
	
	update_takebacks()


func _on_roll_attributes_button_pressed() -> void:
	cognition = roll_attribute()
	%CognitionRerollButton.disabled = false
	
	determination = roll_attribute()
	%DeterminationRerollButton.disabled = false
	
	affinity = roll_attribute()
	%AffinityRerollButton.disabled = false
	
	perception = roll_attribute()
	%PerceptionRerollButton.disabled = false
	
	strength = roll_attribute()
	%StrengthRerollButton.disabled = false
	
	prowess = roll_attribute()
	%ProwessRerollButton.disabled = false
	
	endurance = roll_attribute()
	%EnduranceRerollButton.disabled = false
	
	speed = roll_attribute()
	%SpeedRerollButton.disabled = false
	
	update_stats()
	
	%RollAttributesButton.visible = false
	%LockAttributesButton.visible = true


func _on_cognition_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		cognition = roll_attribute()
	else:
		%CognitionMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		cognition += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_cognition()
	update_takebacks()


func _on_determination_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		determination = roll_attribute()
	else:
		var die_roll = randi_range(1,6)
		%DeterminationMarkedButton.button_pressed = true
		determination += die_roll
		%AttributePicker.attributes_to_disable[1] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected attribute by " + str(die_roll) + " and increase Determination by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_determination()
	update_takebacks()


func _on_affinity_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		affinity = roll_attribute()
	else:
		var die_roll = randi_range(1,6)
		%AffinityMarkedButton.button_pressed = true
		affinity += die_roll
		%AttributePicker.attributes_to_disable[2] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_affinity()
	update_takebacks()


func _on_perception_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		perception = roll_attribute()
	else:
		%CognitionMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		perception += die_roll
		%AttributePicker.attributes_to_disable[3] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_perception()
	update_takebacks()


func _on_strength_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		strength = roll_attribute()
	else:
		%StrengthMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		strength += die_roll
		%AttributePicker.attributes_to_disable[4] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_strength()
	update_takebacks()


func _on_prowess_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		cognition = roll_attribute()
	else:
		%ProwessMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		prowess += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_prowess()
	update_takebacks()


func _on_endurance_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		endurance = roll_attribute()
	else:
		%EnduranceMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		endurance += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_endurance()
	update_takebacks()


func _on_speed_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		speed = roll_attribute()
	else:
		%SpeedMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		speed += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
	
	takebacks_used += 1
	
	update_speed()
	update_takebacks()


func _on_lock_attributes_button_pressed() -> void:
	%CognitionRerollButton.text = "Add d6"
	%DeterminationRerollButton.text = "Add d6"
	%AffinityRerollButton.text = "Add d6"
	%PerceptionRerollButton.text = "Add d6"
	%StrengthRerollButton.text = "Add d6"
	%ProwessRerollButton.text = "Add d6"
	%EnduranceRerollButton.text = "Add d6"
	%SpeedRerollButton.text = "Add d6"
	
	%Step4.visible = true
	%LockAttributesButton.visible = false


func _on_roll_source_of_mutation_button_pressed() -> void:
	source_of_mutation = determine_source_of_mutation(randi_range(1,100))
	
	update_source_of_mutation()
	
	%SourceOfMutationLockButton.disabled = false
	%SourceOfMutationRerollButton.disabled = false
	%SourceOfMutationSwapButton.disabled = false
	%RollSourceOfMutationButton.visible = false


func _on_source_of_mutation_reroll_button_pressed() -> void:
	source_of_mutation = determine_source_of_mutation(randi_range(1,100))
	
	update_source_of_mutation()
	
	if %GroupType.selected == 0:
		takebacks_used += 1
		update_takebacks()
	else:
		group_takebacks_used += 1
		update_takebacks()


func _on_source_of_mutation_swap_button_pressed() -> void:
	var new_result = (10 * %SourceOfMutationRoll.text.to_int() - 1) % 99 + 1
	
	source_of_mutation = determine_source_of_mutation(new_result)
	
	update_source_of_mutation()
	
	takebacks_used += 1
	update_takebacks()


func _on_source_of_mutation_lock_button_pressed() -> void:
	%SourceOfMutationRerollButton.disabled = true
	%SourceOfMutationSwapButton.disabled = true
	%SourceOfMutationLockButton.disabled = true
	
	%BackgroundTable.select(source_of_mutation)
	%TableC.select(source_of_mutation)
	
	%BackgroundContainer.visible = true


func _on_roll_background_button_pressed() -> void:
	if %RollBackgroundButton.text == "Roll Background":
		var die_roll = randi_range(1,100)
		%BackgroundTableResultDescriptionLabel.text += determine_background(die_roll,%BackgroundTable.selected)
		%BackgroundTableRoll.text = str(die_roll)
		%BackgroundTableRerollButton.disabled = false
		%BackgroundTableSwapButton.disabled = false
		%BackgroundTableLockButton.disabled = false
		%RollBackgroundButton.visible = false
	elif %RollBackgroundButton.text == "Roll Mentor Source of Mutation":
		var die_roll = randi_range(1,100)
		%BackgroundTableRoll.text = str(die_roll)
		mentor_source_of_mutation = determine_source_of_mutation(die_roll)
		match mentor_source_of_mutation:
			MutationSources.CITY:
				%BackgroundTableResultDescriptionLabel.text += "Your mentor was a City mutant.[br][br]"
			MutationSources.RURAL:
				%BackgroundTableResultDescriptionLabel.text += "Your mentor was a Rural mutant.[br][br]"
			MutationSources.INSTITUTION:
				%BackgroundTableResultDescriptionLabel.text += "Your mentor was an Institutional mutant.[br][br]"
		%BackgroundTableLockButton.disabled = false
		%BackgroundTableRerollButton.disabled = false
		%BackgroundTableSwapButton.disabled = false
	elif %RollBackgroundButton.text == "Roll Mentor Background":
		var die_roll = randi_range(1,100)
		%BackgroundTableResultDescriptionLabel.text += "Your mentor's background is:[br][br]" + determine_background(die_roll,mentor_source_of_mutation)
		%BackgroundTableRoll.text = str(die_roll)
		%BackgroundTableRerollButton.disabled = false
		%BackgroundTableSwapButton.disabled = false
		%BackgroundTableLockButton.disabled = false
		%RollBackgroundButton.visible = false


func _on_next_checkbox_toggled(toggled_on: bool) -> void:
	%NextSpeciesCheckbox.button_pressed = toggled_on
	%NextTraitsCheckbox.button_pressed = toggled_on
	
	%NextSpeciesCheckbox.disabled = toggled_on
	%NextTraitsCheckbox.disabled = toggled_on


func _on_background_table_lock_button_pressed() -> void:
	var city_to_rural_regex = RegEx.create_from_string("\\[b]FLED TO THE WILD:\\[\\/b] You escaped the city early in life, growing up in the wild\\.\\[br]\\[br]$")
	var city_to_institution_regex = RegEx.create_from_string("\\[b]ADOPTED BY AN INSTITUTION:\\[\\/b] A large institution caught you early in life, and you grew up there.\\[br]\\[br]$")
	var rural_to_city_regex = RegEx.create_from_string("\\[b]URBAN IMMIGRANT:\\[\\/b] Though you mutated in the wild, you migrated to “civilization”.\\[br]\\[br]$")
	var rural_to_institution_regex = RegEx.create_from_string("\\[b]ADOPTED BY AN ORGANIZATION:\\[\\/b] Though you mutated in the wild, an institution claimed you early in life.\\[br]\\[br]$")
	var institution_to_rural_regex = RegEx.create_from_string("\\[b]RURAL ESCAPE:\\[\\/b] The organization released you, or you escaped soon after your mutation.\\[br]\\[br]$")
	var institution_to_city_regex = RegEx.create_from_string("\\[b]URBAN ESCAPE:\\[\\/b] The organization released you, or you escaped soon after your mutation.\\[br]\\[br]$")
	var raised_by_a_mutant_regex = RegEx.create_from_string("\\[b]RAISED BY A MUTANT:\\[\\/b] An experienced mutant mentored you. Roll for the mutant’s source and background, then gain the same packages and bonuses.\\[br]\\[br]$")
	var raised_by_a_mutant_institution_regex = RegEx.create_from_string("\\[b]RAISED BY A MUTANT:\\[\\/b] An older mutant raised you while in captivity. Roll for the mutant’s source and background, then gain the same packages and bonuses, replacing any equipment with an escapee equipment package\\.\\[br]\\[br]$")
	var self_taught_survivor_city_regex = RegEx.create_from_string("\\[b]SELF-TAUGHT SURVIVOR:\\[\\/b] You scraped by alone. While you’ve had contact with humans, you had no guardian and survived via instincts and hard lessons. Gain: one basic or wild skill package, an additional wild skill package, four hobbies, a survivor equipment package (scavenger or urban), +2 Determination, +2 Will, +10 SHT, and +A on initiative rolls.\\[br]\\[br]$")
	var fringes_of_society_regex = RegEx.create_from_string("")
	
	if %RollBackgroundButton.text == "Roll Background" or %RollBackgroundButton.text == "Roll Mentor Background":
		if (
			city_to_rural_regex.search(%BackgroundTableResultDescriptionLabel.text) != null or 
			institution_to_rural_regex.search(%BackgroundTableResultDescriptionLabel.text) != null
		):
			%BackgroundTable.select(MutationSources.RURAL)
			%RollBackgroundButton.visible = true
		elif (
			city_to_institution_regex.search(%BackgroundTableResultDescriptionLabel.text) != null or
			rural_to_institution_regex.search(%BackgroundTableResultDescriptionLabel.text) != null
		):
			%BackgroundTable.select(MutationSources.INSTITUTION)
			%RollBackgroundButton.visible = true
		elif (
			institution_to_city_regex.search(%BackgroundTableResultDescriptionLabel.text) != null or 
			rural_to_city_regex.search(%BackgroundTableResultDescriptionLabel.text) != null
		):
			%BackgroundTable.select(MutationSources.CITY)
			%RollBackgroundButton.visible = true
		elif (
			raised_by_a_mutant_regex.search(%BackgroundTableResultDescriptionLabel.text) != null or
			raised_by_a_mutant_institution_regex.search(%BackgroundTableResultDescriptionLabel.text) != null
		):
			%RollBackgroundButton.text = "Roll Mentor Source of Mutation"
			%RollBackgroundButton.visible = true
			%BackgroundTableLockButton.disabled = true
			%BackgroundTableRerollButton.disabled = true
			%BackgroundTableSwapButton.disabled = true
		else:
			%BackgroundTableLockButton.disabled = true
			%BackgroundTableRerollButton.disabled = true
			%BackgroundTableSwapButton.disabled = true
			%SpeciesContainer.visible = true
	elif %RollBackgroundButton.text == "Roll Mentor Source of Mutation":
		%RollBackgroundButton.text = "Roll Mentor Background"
		%RollBackgroundButton.visible = true
		%BackgroundTableLockButton.disabled = true
		%BackgroundTableRerollButton.disabled = true
		%BackgroundTableSwapButton.disabled = true


func _on_background_table_reroll_button_pressed() -> void:
	if %RollBackgroundButton.text == "Roll Background" or %RollBackgroundButton.text == "Roll Mentor Background":
		var new_result = randi_range(1,100)
		var background_replacement_regex = RegEx.create_from_string("(?U)(\\[b].*\\[br]\\[br])")
		var backgrounds := background_replacement_regex.search_all(%BackgroundTableResultDescriptionLabel.text)
		
		if !backgrounds.is_empty():
			%BackgroundTableResultDescriptionLabel.text = background_replacement_regex.sub(%BackgroundTableResultDescriptionLabel.text,determine_background(new_result,%BackgroundTable.selected),false,backgrounds[-1].get_start())
		else:
			%BackgroundTableResultDescriptionLabel.text = determine_background(new_result,%BackgroundTable.selected)
		%BackgroundTableRoll.text = str(new_result)
	elif %RollBackgroundButton.text == "Roll Mentor Source of Mutation":
		var new_result = randi_range(1,100)
		var mentor_source_of_mutation_regex = RegEx.create_from_string("Your mentor was a (City|Rural|Institutional) mutant.")
		mentor_source_of_mutation = determine_source_of_mutation(new_result)
		var mentors := mentor_source_of_mutation_regex.search_all(%BackgroundTableResultDescriptionLabel.text,)
		
		match mentor_source_of_mutation:
			MutationSources.CITY: %BackgroundTableResultDescriptionLabel.text = mentor_source_of_mutation_regex.sub(%BackgroundTableResultDescriptionLabel.text,"Your mentor was a City mutant.",false,mentors[-1].get_start())
			MutationSources.RURAL: %BackgroundTableResultDescriptionLabel.text = mentor_source_of_mutation_regex.sub(%BackgroundTableResultDescriptionLabel.text,"Your mentor was a Rural mutant.",false,mentors[-1].get_start())
			MutationSources.INSTITUTION: %BackgroundTableResultDescriptionLabel.text = mentor_source_of_mutation_regex.sub(%BackgroundTableResultDescriptionLabel.text,"Your mentor was a Institutional mutant.",false,mentors[-1].get_start())
	takebacks_used += 1
	update_takebacks()


func _on_background_table_swap_button_pressed() -> void:
	if %RollBackgroundButton.text == "Roll Background" or %RollBackgroundButton.text == "Roll Mentor Background":
		var new_result = (10 * %BackgroundTableoll.text.to_int() - 1) % 99 + 1
		var background_replacement_regex = RegEx.create_from_string("(?U)(\\[b].*\\[br]\\[br])")
		var backgrounds := background_replacement_regex.search_all(%BackgroundTableResultDescriptionLabel.text)
		
		if !backgrounds.is_empty():
			%BackgroundTableResultDescriptionLabel.text = background_replacement_regex.sub(%BackgroundTableResultDescriptionLabel.text,determine_background(new_result,%BackgroundTable.selected),false,backgrounds[-1].get_start())
		else:
			%BackgroundTableResultDescriptionLabel.text = determine_background(new_result,%BackgroundTable.selected)
		%BackgroundTableRoll.text = str(new_result)
	elif %RollBackgroundButton.text == "Roll Mentor Source of Mutation":
		var new_result = (10 * %BackgroundTableRoll.text.to_int() - 1) % 99 + 1
		var mentor_source_of_mutation_regex = RegEx.create_from_string("Your mentor was a (City|Rural|Institutional) mutant.")
		mentor_source_of_mutation = determine_source_of_mutation(new_result)
		var mentors := mentor_source_of_mutation_regex.search_all(%BackgroundTableResultDescriptionLabel.text,)
		
		match mentor_source_of_mutation:
			MutationSources.CITY: %BackgroundTableResultDescriptionLabel.text = mentor_source_of_mutation_regex.sub(%BackgroundTableResultDescriptionLabel.text,"Your mentor was a City mutant.",false,mentors[-1].get_start())
			MutationSources.RURAL: %BackgroundTableResultDescriptionLabel.text = mentor_source_of_mutation_regex.sub(%BackgroundTableResultDescriptionLabel.text,"Your mentor was a Rural mutant.",false,mentors[-1].get_start())
			MutationSources.INSTITUTION: %BackgroundTableResultDescriptionLabel.text = mentor_source_of_mutation_regex.sub(%BackgroundTableResultDescriptionLabel.text,"Your mentor was a Institutional mutant.",false,mentors[-1].get_start())
	
	takebacks_used += 1
	update_takebacks()


func _on_roll_species_table_c_button_pressed() -> void:
	var die_roll = randi_range(1,100)
	var table_d = determine_table_c_result(die_roll,%TableC.selected)
	
	%TableCRoll.text = str(die_roll)
	
	%TableD.select(table_d)
	
	match table_d:
		TableDType.ERROR:
			%TableCResultLabel.text = "Something broke"
		TableDType.URBAN:
			%TableCResultLabel.text = "[b]URBAN SPECIES:[/b] Roll on table D-1"
		TableDType.PET:
			%TableCResultLabel.text = "[b]PET SPECIES:[/b] Roll on table D-2"
		TableDType.FARM:
			%TableCResultLabel.text = "[b]FARM SPECIES:[/b] Roll on table D-3"
		TableDType.WILD:
			%TableCResultLabel.text = "[b]WILD SPECIES:[/b] Roll on table D-4"
		TableDType.ZOO:
			%TableCResultLabel.text = "[b]ZOO SPECIES:[/b] Roll on table D-5"
		TableDType.LAB:
			%TableCResultLabel.text = "[b]LAB SPECIES:[/b] Roll on table D-6"
		TableDType.GENEMOD:
			%TableCResultLabel.text = "[b]GENEMOD SPECIES:[/b] Roll on table D-7"
	
	%RollSpeciesTableCButton.visible = false


func _on_table_c_reroll_button_pressed() -> void:
	var new_result = randi_range(1,100)
	var table_d = determine_table_c_result(new_result,%TableC.selected)
	
	%TableCRoll.text = str(new_result)
	
	%TableD.select(table_d)
	
	match table_d:
		TableDType.ERROR:
			%TableCResultLabel.text = "Something broke"
		TableDType.URBAN:
			%TableCResultLabel.text = "[b]URBAN SPECIES:[/b] Roll on table D-1"
		TableDType.PET:
			%TableCResultLabel.text = "[b]PET SPECIES:[/b] Roll on table D-2"
		TableDType.FARM:
			%TableCResultLabel.text = "[b]FARM SPECIES:[/b] Roll on table D-3"
		TableDType.WILD:
			%TableCResultLabel.text = "[b]WILD SPECIES:[/b] Roll on table D-4"
		TableDType.ZOO:
			%TableCResultLabel.text = "[b]ZOO SPECIES:[/b] Roll on table D-5"
		TableDType.LAB:
			%TableCResultLabel.text = "[b]LAB SPECIES:[/b] Roll on table D-6"
		TableDType.GENEMOD:
			%TableCResultLabel.text = "[b]GENEMOD SPECIES:[/b] Roll on table D-7"
	
	if %GroupType.selected == 0 or %GroupType.selected == 1:
		takebacks_used += 1
	else:
		group_takebacks_used += 1
	update_takebacks()


func _on_table_c_swap_button_pressed() -> void:
	var new_result = (10 * %TableCRoll.text.to_int() - 1) % 99 + 1
	var table_d = determine_table_c_result(new_result,%TableC.selected)
	
	%TableCRoll.text = str(new_result)
	
	%TableD.select(table_d)
	
	match table_d:
		TableDType.ERROR:
			%TableCResultLabel.text = "Something broke"
		TableDType.URBAN:
			%TableCResultLabel.text = "[b]URBAN SPECIES:[/b] Roll on table D-1"
		TableDType.PET:
			%TableCResultLabel.text = "[b]PET SPECIES:[/b] Roll on table D-2"
		TableDType.FARM:
			%TableCResultLabel.text = "[b]FARM SPECIES:[/b] Roll on table D-3"
		TableDType.WILD:
			%TableCResultLabel.text = "[b]WILD SPECIES:[/b] Roll on table D-4"
		TableDType.ZOO:
			%TableCResultLabel.text = "[b]ZOO SPECIES:[/b] Roll on table D-5"
		TableDType.LAB:
			%TableCResultLabel.text = "[b]LAB SPECIES:[/b] Roll on table D-6"
		TableDType.GENEMOD:
			%TableCResultLabel.text = "[b]GENEMOD SPECIES:[/b] Roll on table D-7"
	
	if %GroupType.selected == 0 or %GroupType.selected == 1:
		takebacks_used += 1
	else:
		group_takebacks_used += 1
	update_takebacks()


func _on_table_c_lock_button_pressed() -> void:
	%TableCRerollButton.disabled = true
	%TableCSwapButton.disabled = true
	%TableCLockButton.disabled = true
	%TableDContainer.visible = true


func _on_roll_species_table_d_button_pressed() -> void:
	var die_roll = randi_range(1,100)
	
	species = determine_table_d_result(die_roll,%TableD.selected)
	
	update_table_d_result()
	
	%TableDRoll.text = str(die_roll)
	%RollSpeciesTableDButton.visible = false
	%TableDRerollButton.disabled = false
	%TableDSwapButton.disabled = false
	%TableDLockButton.disabled = false


func _on_table_d_reroll_button_pressed() -> void:
	var new_result = randi_range(1,100)
	
	species = determine_table_d_result(new_result,%TableD.selected)
	
	update_table_d_result()
	
	%TableDRoll.text = str(new_result)


func _on_table_d_swap_button_pressed() -> void:
	var new_result = (10 * %TableDRoll.text.to_int() - 1) % 99 + 1
	
	species = determine_table_d_result(new_result,%TableD.selected)
	
	update_table_d_result()
	
	%TableDRoll.text = str(new_result)


func _on_table_d_lock_button_pressed() -> void:
	%TableDRerollButton.disabled = true
	%TableDSwapButton.disabled = true
	%TableDLockButton.disabled = true
	
	base_goop = %CognitionGOOPBonusLabel.text.to_int() 
	base_goop += %DeterminationGOOPBonusLabel.text.to_int() 
	base_goop += %AffinityGOOPBonusLabel.text.to_int() 
	base_goop += %PerceptionGOOPBonusLabel.text.to_int()
	base_goop += %StrengthGOOPBonusLabel.text.to_int()
	base_goop += %ProwessGOOPBonusLabel.text.to_int()
	base_goop += %EnduranceGOOPBonusLabel.text.to_int()
	
	var major_traits_available = species.major_traits["Mutants in the Now"]
	if %NextTraitsCheckbox.pressed:
		major_traits_available.append(species.major_traits["Mutants in the Next"])
	
	for major_trait in major_traits_available.traits:
		var trait_checkbox = load("res://Scenes/TraitCheckbox.tscn")
		trait_checkbox = trait_checkbox.instantiate()
		trait_checkbox.main_trait = major_trait
		for major_subtrait in major_traits_available.subtraits.keys():
			if major_subtrait in major_trait.subtraits:
				if major_traits_available.subtraits[major_subtrait]:
					trait_checkbox.required_subtraits.append(major_subtrait)
				else:
					trait_checkbox.optional_subtraits.append(major_subtrait)
		
		var trait_checkbox_lambda = func(toggled_on: bool,selected_trait: Trait,subtraits:Array[Trait]):
			var total_cost = 0
			
			print(toggled_on)
			print(selected_trait)
			print(subtraits)
			
			if toggled_on:
				if selected_trait.type != Trait.TraitType.MAJOR_SUBTRAIT and selected_trait.type != Trait.TraitType.MINOR_SUBTRAIT:
					if !selected_trait in character_traits:
						character_traits.append(selected_trait)
						total_cost += selected_trait.cost
					for subtrait in subtraits:
						if !subtrait in character_subtraits:
							character_subtraits.append(subtrait)
							total_cost += subtrait.cost
					if selected_trait.type == Trait.TraitType.MINOR:
						goop_used += total_cost
					else:
						goop_used += max(total_cost,2)
				else:
					goop_used += selected_trait.cost
					character_subtraits.append(selected_trait)
			else:
				if selected_trait.type != Trait.TraitType.MAJOR_SUBTRAIT and selected_trait.type != Trait.TraitType.MINOR_SUBTRAIT:
					if selected_trait in character_traits:
						character_traits.erase(selected_trait)
						total_cost += selected_trait.cost
					for subtrait in subtraits:
						if subtrait in character_subtraits:
							character_subtraits.erase(subtrait)
							total_cost += subtrait.cost
					if selected_trait.type == Trait.TraitType.MINOR:
						goop_used -= total_cost
					else:
						goop_used -= max(total_cost,2)
				else:
					goop_used -= selected_trait.cost
					character_subtraits.erase(selected_trait)
					#var parent_trait: Trait = null
					#for character_trait in character_traits:
						#if selected_trait in character_trait.subtraits:
							#parent_trait = character_trait
							#break
					#if parent_trait != null:
						#total_cost += parent_trait.cost
						#for subtrait in parent_trait.subtraits:
							#if subtrait in character_subtraits:
								#total_cost += subtrait.cost
						#goop_used -= total_cost
						#character_subtraits.erase(selected_trait)
		
		trait_checkbox.trait_pressed.connect(trait_checkbox_lambda)
		
		%MajorTraitsContainer.add_child(trait_checkbox)
	
	var minor_traits_available = species.minor_traits["Mutants in the Now"]
	if %NextCheckbox.pressed:
		minor_traits_available.append(species.minor_traits["Mutants in the Next"])
	
	for minor_trait in minor_traits_available.traits:
		var trait_checkbox = load("res://Scenes/TraitCheckbox.tscn")
		trait_checkbox = trait_checkbox.instantiate()
		trait_checkbox.main_trait = minor_trait
		for minor_subtrait in minor_traits_available.subtraits.keys():
			if minor_subtrait in minor_trait.subtraits:
				if minor_traits_available.subtraits[minor_subtrait]:
					trait_checkbox.required_subtraits.append(minor_subtrait)
				else:
					trait_checkbox.optional_subtraits.append(minor_subtrait)
		
		var trait_checkbox_lambda = func(toggled_on: bool,selected_trait: Trait,subtraits:Array[Trait]):
			var total_cost = 0
			
			print(toggled_on)
			print(selected_trait)
			print(subtraits)
			
			if toggled_on:
				if selected_trait.type != Trait.TraitType.MAJOR_SUBTRAIT and selected_trait.type != Trait.TraitType.MINOR_SUBTRAIT:
					if !selected_trait in character_traits:
						character_traits.append(selected_trait)
						total_cost += selected_trait.cost
					for subtrait in subtraits:
						if !subtrait in character_subtraits:
							character_subtraits.append(subtrait)
							total_cost += subtrait.cost
					if selected_trait.type == Trait.TraitType.MINOR:
						goop_used += total_cost
					else:
						goop_used += max(total_cost,2)
				else:
						goop_used += selected_trait.cost
						character_subtraits.append(selected_trait)
					
			else:
				if selected_trait.type != Trait.TraitType.MAJOR_SUBTRAIT and selected_trait.type != Trait.TraitType.MINOR_SUBTRAIT:
					if selected_trait in character_traits:
						character_traits.erase(selected_trait)
						total_cost += selected_trait.cost
					for subtrait in subtraits:
						if subtrait in character_subtraits:
							character_subtraits.erase(subtrait)
							total_cost += subtrait.cost
					if selected_trait.type == Trait.TraitType.MINOR:
						goop_used -= total_cost
					else:
						goop_used -= max(total_cost,2)
				else:
					var parent_trait: Trait = null
					for character_trait in character_traits:
						if selected_trait in character_trait.subtraits:
							parent_trait = character_trait
							break
					if parent_trait != null:
						total_cost += parent_trait.cost
						for subtrait in parent_trait.subtraits:
							if subtrait in character_subtraits:
								total_cost += subtrait.cost
						goop_used -= max(total_cost - selected_trait.cost,0)
						character_subtraits.erase(selected_trait)
		
		trait_checkbox.trait_pressed.connect(trait_checkbox_lambda)
		
		%MinorTraitsContainer.add_child(trait_checkbox)
	
	%Step5.visible = true
	%TakebacksContainer.visible = false
	%StatsContainer.visible = true
