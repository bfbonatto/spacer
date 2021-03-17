{-# OPTIONS -fno-warn-tabs #-}

module Lib where

type HostId = Either PlanetId StationId
newtype PlanetId = PlanetId Int
newtype StationId = StationId Int
newtype CommodityId = CommodityId Int
newtype SettlementId = SettlementId Int
data Quantity =
	  Tiny
	| Small
	| Medium
	| Large
	| Massive deriving (Ord, Eq)
data PopulationType =
	  Slaves
	| FieldWorkers
	| CityWorkers
	| MiddleClass
	| UpperClass
	| PoliticClass
	| Nobility
	| Royalty
	| Dictator
	| Scientists deriving Eq

data TechLevel =
	  Natural
	| Basic
	| Industrial
	| Advanced
	| Especialized deriving (Ord, Eq)

data Need =
	  Interested
	| VeryInterested 
	| Desperate deriving (Ord, Eq)


data Commodity = Commodity { _commodityId        :: CommodityId
						   , _commodityName      :: String
						   , _commodityTechLevel :: TechLevel
						   , _neededToMake       :: [CommodityId]
						   , _buildsInto         :: [CommodityId]
						   }

data Settlement = Settlement { _settlementId :: SettlementId
							 , _settlementTechLevel :: TechLevel
							 , _settlementName :: String
							 , _settlementHost :: HostId
							 , _settlementProduces :: [(CommodityId, Quantity)]
							 , _settlementPopulation :: [Population]
							 , _settlementNeeds :: [(CommodityId, Quantity)]
							 , _settlementInventory :: [CommodityId]
							 }


data Population = Population { _populationSize :: Quantity
							 , _populationType :: PopulationType
							 , _populationNeeds :: [(CommodityId, Need)]
							 , _populationMakes :: [CommodityId]
							 }


