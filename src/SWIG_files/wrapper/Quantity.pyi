from typing import NewType, Optional

from OCC.Core.Quantity import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TCollection import *

Quantity_AbsorbedDose = NewType('Quantity_AbsorbedDose', Standard_Real)
Quantity_Acceleration = NewType('Quantity_Acceleration', Standard_Real)
Quantity_AcousticIntensity = NewType('Quantity_AcousticIntensity', Standard_Real)
Quantity_Activity = NewType('Quantity_Activity', Standard_Real)
Quantity_Admittance = NewType('Quantity_Admittance', Standard_Real)
Quantity_AmountOfSubstance = NewType('Quantity_AmountOfSubstance', Standard_Real)
Quantity_AngularVelocity = NewType('Quantity_AngularVelocity', Standard_Real)
Quantity_Area = NewType('Quantity_Area', Standard_Real)
Quantity_Capacitance = NewType('Quantity_Capacitance', Standard_Real)
Quantity_Coefficient = NewType('Quantity_Coefficient', Standard_Real)
Quantity_CoefficientOfExpansion = NewType('Quantity_CoefficientOfExpansion', Standard_Real)
Quantity_Concentration = NewType('Quantity_Concentration', Standard_Real)
Quantity_Conductivity = NewType('Quantity_Conductivity', Standard_Real)
Quantity_Constant = NewType('Quantity_Constant', Standard_Real)
Quantity_Consumption = NewType('Quantity_Consumption', Standard_Real)
Quantity_Content = NewType('Quantity_Content', Standard_Real)
Quantity_Density = NewType('Quantity_Density', Standard_Real)
Quantity_DoseEquivalent = NewType('Quantity_DoseEquivalent', Standard_Real)
Quantity_ElectricCapacitance = NewType('Quantity_ElectricCapacitance', Standard_Real)
Quantity_ElectricCharge = NewType('Quantity_ElectricCharge', Standard_Real)
Quantity_ElectricCurrent = NewType('Quantity_ElectricCurrent', Standard_Real)
Quantity_ElectricFieldStrength = NewType('Quantity_ElectricFieldStrength', Standard_Real)
Quantity_ElectricPotential = NewType('Quantity_ElectricPotential', Standard_Real)
Quantity_Energy = NewType('Quantity_Energy', Standard_Real)
Quantity_Enthalpy = NewType('Quantity_Enthalpy', Standard_Real)
Quantity_Entropy = NewType('Quantity_Entropy', Standard_Real)
Quantity_Factor = NewType('Quantity_Factor', Standard_Real)
Quantity_Force = NewType('Quantity_Force', Standard_Real)
Quantity_Frequency = NewType('Quantity_Frequency', Standard_Real)
Quantity_Illuminance = NewType('Quantity_Illuminance', Standard_Real)
Quantity_Impedance = NewType('Quantity_Impedance', Standard_Real)
Quantity_Index = NewType('Quantity_Index', Standard_Real)
Quantity_Inductance = NewType('Quantity_Inductance', Standard_Real)
Quantity_KinematicViscosity = NewType('Quantity_KinematicViscosity', Standard_Real)
Quantity_KineticMoment = NewType('Quantity_KineticMoment', Standard_Real)
Quantity_Length = NewType('Quantity_Length', Standard_Real)
Quantity_Luminance = NewType('Quantity_Luminance', Standard_Real)
Quantity_LuminousEfficacity = NewType('Quantity_LuminousEfficacity', Standard_Real)
Quantity_LuminousExposition = NewType('Quantity_LuminousExposition', Standard_Real)
Quantity_LuminousFlux = NewType('Quantity_LuminousFlux', Standard_Real)
Quantity_LuminousIntensity = NewType('Quantity_LuminousIntensity', Standard_Real)
Quantity_MagneticFieldStrength = NewType('Quantity_MagneticFieldStrength', Standard_Real)
Quantity_MagneticFlux = NewType('Quantity_MagneticFlux', Standard_Real)
Quantity_MagneticFluxDensity = NewType('Quantity_MagneticFluxDensity', Standard_Real)
Quantity_Mass = NewType('Quantity_Mass', Standard_Real)
Quantity_MassFlow = NewType('Quantity_MassFlow', Standard_Real)
Quantity_MolarConcentration = NewType('Quantity_MolarConcentration', Standard_Real)
Quantity_MolarMass = NewType('Quantity_MolarMass', Standard_Real)
Quantity_MolarVolume = NewType('Quantity_MolarVolume', Standard_Real)
Quantity_Molarity = NewType('Quantity_Molarity', Standard_Real)
Quantity_MomentOfAForce = NewType('Quantity_MomentOfAForce', Standard_Real)
Quantity_MomentOfInertia = NewType('Quantity_MomentOfInertia', Standard_Real)
Quantity_Momentum = NewType('Quantity_Momentum', Standard_Real)
Quantity_Normality = NewType('Quantity_Normality', Standard_Real)
Quantity_Parameter = NewType('Quantity_Parameter', Standard_Real)
Quantity_PlaneAngle = NewType('Quantity_PlaneAngle', Standard_Real)
Quantity_Power = NewType('Quantity_Power', Standard_Real)
Quantity_Pressure = NewType('Quantity_Pressure', Standard_Real)
Quantity_Quotient = NewType('Quantity_Quotient', Standard_Real)
Quantity_Rate = NewType('Quantity_Rate', Standard_Real)
Quantity_Ratio = NewType('Quantity_Ratio', Standard_Real)
Quantity_Reluctance = NewType('Quantity_Reluctance', Standard_Real)
Quantity_Resistance = NewType('Quantity_Resistance', Standard_Real)
Quantity_Resistivity = NewType('Quantity_Resistivity', Standard_Real)
Quantity_Scalaire = NewType('Quantity_Scalaire', Standard_Real)
Quantity_SolidAngle = NewType('Quantity_SolidAngle', Standard_Real)
Quantity_SoundIntensity = NewType('Quantity_SoundIntensity', Standard_Real)
Quantity_SpecificHeatCapacity = NewType('Quantity_SpecificHeatCapacity', Standard_Real)
Quantity_Speed = NewType('Quantity_Speed', Standard_Real)
Quantity_SurfaceTension = NewType('Quantity_SurfaceTension', Standard_Real)
Quantity_Temperature = NewType('Quantity_Temperature', Standard_Real)
Quantity_ThermalConductivity = NewType('Quantity_ThermalConductivity', Standard_Real)
Quantity_Torque = NewType('Quantity_Torque', Standard_Real)
Quantity_Velocity = NewType('Quantity_Velocity', Standard_Real)
Quantity_Viscosity = NewType('Quantity_Viscosity', Standard_Real)
Quantity_Volume = NewType('Quantity_Volume', Standard_Real)
Quantity_VolumeFlow = NewType('Quantity_VolumeFlow', Standard_Real)
Quantity_Weight = NewType('Quantity_Weight', Standard_Real)
Quantity_Work = NewType('Quantity_Work', Standard_Real)

class Quantity_NameOfColor:
	Quantity_NOC_BLACK: int = ...
	Quantity_NOC_MATRABLUE: int = ...
	Quantity_NOC_MATRAGRAY: int = ...
	Quantity_NOC_ALICEBLUE: int = ...
	Quantity_NOC_ANTIQUEWHITE: int = ...
	Quantity_NOC_ANTIQUEWHITE1: int = ...
	Quantity_NOC_ANTIQUEWHITE2: int = ...
	Quantity_NOC_ANTIQUEWHITE3: int = ...
	Quantity_NOC_ANTIQUEWHITE4: int = ...
	Quantity_NOC_AQUAMARINE1: int = ...
	Quantity_NOC_AQUAMARINE2: int = ...
	Quantity_NOC_AQUAMARINE4: int = ...
	Quantity_NOC_AZURE: int = ...
	Quantity_NOC_AZURE2: int = ...
	Quantity_NOC_AZURE3: int = ...
	Quantity_NOC_AZURE4: int = ...
	Quantity_NOC_BEIGE: int = ...
	Quantity_NOC_BISQUE: int = ...
	Quantity_NOC_BISQUE2: int = ...
	Quantity_NOC_BISQUE3: int = ...
	Quantity_NOC_BISQUE4: int = ...
	Quantity_NOC_BLANCHEDALMOND: int = ...
	Quantity_NOC_BLUE1: int = ...
	Quantity_NOC_BLUE2: int = ...
	Quantity_NOC_BLUE3: int = ...
	Quantity_NOC_BLUE4: int = ...
	Quantity_NOC_BLUEVIOLET: int = ...
	Quantity_NOC_BROWN: int = ...
	Quantity_NOC_BROWN1: int = ...
	Quantity_NOC_BROWN2: int = ...
	Quantity_NOC_BROWN3: int = ...
	Quantity_NOC_BROWN4: int = ...
	Quantity_NOC_BURLYWOOD: int = ...
	Quantity_NOC_BURLYWOOD1: int = ...
	Quantity_NOC_BURLYWOOD2: int = ...
	Quantity_NOC_BURLYWOOD3: int = ...
	Quantity_NOC_BURLYWOOD4: int = ...
	Quantity_NOC_CADETBLUE: int = ...
	Quantity_NOC_CADETBLUE1: int = ...
	Quantity_NOC_CADETBLUE2: int = ...
	Quantity_NOC_CADETBLUE3: int = ...
	Quantity_NOC_CADETBLUE4: int = ...
	Quantity_NOC_CHARTREUSE: int = ...
	Quantity_NOC_CHARTREUSE1: int = ...
	Quantity_NOC_CHARTREUSE2: int = ...
	Quantity_NOC_CHARTREUSE3: int = ...
	Quantity_NOC_CHARTREUSE4: int = ...
	Quantity_NOC_CHOCOLATE: int = ...
	Quantity_NOC_CHOCOLATE1: int = ...
	Quantity_NOC_CHOCOLATE2: int = ...
	Quantity_NOC_CHOCOLATE3: int = ...
	Quantity_NOC_CHOCOLATE4: int = ...
	Quantity_NOC_CORAL: int = ...
	Quantity_NOC_CORAL1: int = ...
	Quantity_NOC_CORAL2: int = ...
	Quantity_NOC_CORAL3: int = ...
	Quantity_NOC_CORAL4: int = ...
	Quantity_NOC_CORNFLOWERBLUE: int = ...
	Quantity_NOC_CORNSILK1: int = ...
	Quantity_NOC_CORNSILK2: int = ...
	Quantity_NOC_CORNSILK3: int = ...
	Quantity_NOC_CORNSILK4: int = ...
	Quantity_NOC_CYAN1: int = ...
	Quantity_NOC_CYAN2: int = ...
	Quantity_NOC_CYAN3: int = ...
	Quantity_NOC_CYAN4: int = ...
	Quantity_NOC_DARKGOLDENROD: int = ...
	Quantity_NOC_DARKGOLDENROD1: int = ...
	Quantity_NOC_DARKGOLDENROD2: int = ...
	Quantity_NOC_DARKGOLDENROD3: int = ...
	Quantity_NOC_DARKGOLDENROD4: int = ...
	Quantity_NOC_DARKGREEN: int = ...
	Quantity_NOC_DARKKHAKI: int = ...
	Quantity_NOC_DARKOLIVEGREEN: int = ...
	Quantity_NOC_DARKOLIVEGREEN1: int = ...
	Quantity_NOC_DARKOLIVEGREEN2: int = ...
	Quantity_NOC_DARKOLIVEGREEN3: int = ...
	Quantity_NOC_DARKOLIVEGREEN4: int = ...
	Quantity_NOC_DARKORANGE: int = ...
	Quantity_NOC_DARKORANGE1: int = ...
	Quantity_NOC_DARKORANGE2: int = ...
	Quantity_NOC_DARKORANGE3: int = ...
	Quantity_NOC_DARKORANGE4: int = ...
	Quantity_NOC_DARKORCHID: int = ...
	Quantity_NOC_DARKORCHID1: int = ...
	Quantity_NOC_DARKORCHID2: int = ...
	Quantity_NOC_DARKORCHID3: int = ...
	Quantity_NOC_DARKORCHID4: int = ...
	Quantity_NOC_DARKSALMON: int = ...
	Quantity_NOC_DARKSEAGREEN: int = ...
	Quantity_NOC_DARKSEAGREEN1: int = ...
	Quantity_NOC_DARKSEAGREEN2: int = ...
	Quantity_NOC_DARKSEAGREEN3: int = ...
	Quantity_NOC_DARKSEAGREEN4: int = ...
	Quantity_NOC_DARKSLATEBLUE: int = ...
	Quantity_NOC_DARKSLATEGRAY1: int = ...
	Quantity_NOC_DARKSLATEGRAY2: int = ...
	Quantity_NOC_DARKSLATEGRAY3: int = ...
	Quantity_NOC_DARKSLATEGRAY4: int = ...
	Quantity_NOC_DARKSLATEGRAY: int = ...
	Quantity_NOC_DARKTURQUOISE: int = ...
	Quantity_NOC_DARKVIOLET: int = ...
	Quantity_NOC_DEEPPINK: int = ...
	Quantity_NOC_DEEPPINK2: int = ...
	Quantity_NOC_DEEPPINK3: int = ...
	Quantity_NOC_DEEPPINK4: int = ...
	Quantity_NOC_DEEPSKYBLUE1: int = ...
	Quantity_NOC_DEEPSKYBLUE2: int = ...
	Quantity_NOC_DEEPSKYBLUE3: int = ...
	Quantity_NOC_DEEPSKYBLUE4: int = ...
	Quantity_NOC_DODGERBLUE1: int = ...
	Quantity_NOC_DODGERBLUE2: int = ...
	Quantity_NOC_DODGERBLUE3: int = ...
	Quantity_NOC_DODGERBLUE4: int = ...
	Quantity_NOC_FIREBRICK: int = ...
	Quantity_NOC_FIREBRICK1: int = ...
	Quantity_NOC_FIREBRICK2: int = ...
	Quantity_NOC_FIREBRICK3: int = ...
	Quantity_NOC_FIREBRICK4: int = ...
	Quantity_NOC_FLORALWHITE: int = ...
	Quantity_NOC_FORESTGREEN: int = ...
	Quantity_NOC_GAINSBORO: int = ...
	Quantity_NOC_GHOSTWHITE: int = ...
	Quantity_NOC_GOLD: int = ...
	Quantity_NOC_GOLD1: int = ...
	Quantity_NOC_GOLD2: int = ...
	Quantity_NOC_GOLD3: int = ...
	Quantity_NOC_GOLD4: int = ...
	Quantity_NOC_GOLDENROD: int = ...
	Quantity_NOC_GOLDENROD1: int = ...
	Quantity_NOC_GOLDENROD2: int = ...
	Quantity_NOC_GOLDENROD3: int = ...
	Quantity_NOC_GOLDENROD4: int = ...
	Quantity_NOC_GRAY: int = ...
	Quantity_NOC_GRAY0: int = ...
	Quantity_NOC_GRAY1: int = ...
	Quantity_NOC_GRAY10: int = ...
	Quantity_NOC_GRAY11: int = ...
	Quantity_NOC_GRAY12: int = ...
	Quantity_NOC_GRAY13: int = ...
	Quantity_NOC_GRAY14: int = ...
	Quantity_NOC_GRAY15: int = ...
	Quantity_NOC_GRAY16: int = ...
	Quantity_NOC_GRAY17: int = ...
	Quantity_NOC_GRAY18: int = ...
	Quantity_NOC_GRAY19: int = ...
	Quantity_NOC_GRAY2: int = ...
	Quantity_NOC_GRAY20: int = ...
	Quantity_NOC_GRAY21: int = ...
	Quantity_NOC_GRAY22: int = ...
	Quantity_NOC_GRAY23: int = ...
	Quantity_NOC_GRAY24: int = ...
	Quantity_NOC_GRAY25: int = ...
	Quantity_NOC_GRAY26: int = ...
	Quantity_NOC_GRAY27: int = ...
	Quantity_NOC_GRAY28: int = ...
	Quantity_NOC_GRAY29: int = ...
	Quantity_NOC_GRAY3: int = ...
	Quantity_NOC_GRAY30: int = ...
	Quantity_NOC_GRAY31: int = ...
	Quantity_NOC_GRAY32: int = ...
	Quantity_NOC_GRAY33: int = ...
	Quantity_NOC_GRAY34: int = ...
	Quantity_NOC_GRAY35: int = ...
	Quantity_NOC_GRAY36: int = ...
	Quantity_NOC_GRAY37: int = ...
	Quantity_NOC_GRAY38: int = ...
	Quantity_NOC_GRAY39: int = ...
	Quantity_NOC_GRAY4: int = ...
	Quantity_NOC_GRAY40: int = ...
	Quantity_NOC_GRAY41: int = ...
	Quantity_NOC_GRAY42: int = ...
	Quantity_NOC_GRAY43: int = ...
	Quantity_NOC_GRAY44: int = ...
	Quantity_NOC_GRAY45: int = ...
	Quantity_NOC_GRAY46: int = ...
	Quantity_NOC_GRAY47: int = ...
	Quantity_NOC_GRAY48: int = ...
	Quantity_NOC_GRAY49: int = ...
	Quantity_NOC_GRAY5: int = ...
	Quantity_NOC_GRAY50: int = ...
	Quantity_NOC_GRAY51: int = ...
	Quantity_NOC_GRAY52: int = ...
	Quantity_NOC_GRAY53: int = ...
	Quantity_NOC_GRAY54: int = ...
	Quantity_NOC_GRAY55: int = ...
	Quantity_NOC_GRAY56: int = ...
	Quantity_NOC_GRAY57: int = ...
	Quantity_NOC_GRAY58: int = ...
	Quantity_NOC_GRAY59: int = ...
	Quantity_NOC_GRAY6: int = ...
	Quantity_NOC_GRAY60: int = ...
	Quantity_NOC_GRAY61: int = ...
	Quantity_NOC_GRAY62: int = ...
	Quantity_NOC_GRAY63: int = ...
	Quantity_NOC_GRAY64: int = ...
	Quantity_NOC_GRAY65: int = ...
	Quantity_NOC_GRAY66: int = ...
	Quantity_NOC_GRAY67: int = ...
	Quantity_NOC_GRAY68: int = ...
	Quantity_NOC_GRAY69: int = ...
	Quantity_NOC_GRAY7: int = ...
	Quantity_NOC_GRAY70: int = ...
	Quantity_NOC_GRAY71: int = ...
	Quantity_NOC_GRAY72: int = ...
	Quantity_NOC_GRAY73: int = ...
	Quantity_NOC_GRAY74: int = ...
	Quantity_NOC_GRAY75: int = ...
	Quantity_NOC_GRAY76: int = ...
	Quantity_NOC_GRAY77: int = ...
	Quantity_NOC_GRAY78: int = ...
	Quantity_NOC_GRAY79: int = ...
	Quantity_NOC_GRAY8: int = ...
	Quantity_NOC_GRAY80: int = ...
	Quantity_NOC_GRAY81: int = ...
	Quantity_NOC_GRAY82: int = ...
	Quantity_NOC_GRAY83: int = ...
	Quantity_NOC_GRAY85: int = ...
	Quantity_NOC_GRAY86: int = ...
	Quantity_NOC_GRAY87: int = ...
	Quantity_NOC_GRAY88: int = ...
	Quantity_NOC_GRAY89: int = ...
	Quantity_NOC_GRAY9: int = ...
	Quantity_NOC_GRAY90: int = ...
	Quantity_NOC_GRAY91: int = ...
	Quantity_NOC_GRAY92: int = ...
	Quantity_NOC_GRAY93: int = ...
	Quantity_NOC_GRAY94: int = ...
	Quantity_NOC_GRAY95: int = ...
	Quantity_NOC_GREEN: int = ...
	Quantity_NOC_GREEN1: int = ...
	Quantity_NOC_GREEN2: int = ...
	Quantity_NOC_GREEN3: int = ...
	Quantity_NOC_GREEN4: int = ...
	Quantity_NOC_GREENYELLOW: int = ...
	Quantity_NOC_GRAY97: int = ...
	Quantity_NOC_GRAY98: int = ...
	Quantity_NOC_GRAY99: int = ...
	Quantity_NOC_HONEYDEW: int = ...
	Quantity_NOC_HONEYDEW2: int = ...
	Quantity_NOC_HONEYDEW3: int = ...
	Quantity_NOC_HONEYDEW4: int = ...
	Quantity_NOC_HOTPINK: int = ...
	Quantity_NOC_HOTPINK1: int = ...
	Quantity_NOC_HOTPINK2: int = ...
	Quantity_NOC_HOTPINK3: int = ...
	Quantity_NOC_HOTPINK4: int = ...
	Quantity_NOC_INDIANRED: int = ...
	Quantity_NOC_INDIANRED1: int = ...
	Quantity_NOC_INDIANRED2: int = ...
	Quantity_NOC_INDIANRED3: int = ...
	Quantity_NOC_INDIANRED4: int = ...
	Quantity_NOC_IVORY: int = ...
	Quantity_NOC_IVORY2: int = ...
	Quantity_NOC_IVORY3: int = ...
	Quantity_NOC_IVORY4: int = ...
	Quantity_NOC_KHAKI: int = ...
	Quantity_NOC_KHAKI1: int = ...
	Quantity_NOC_KHAKI2: int = ...
	Quantity_NOC_KHAKI3: int = ...
	Quantity_NOC_KHAKI4: int = ...
	Quantity_NOC_LAVENDER: int = ...
	Quantity_NOC_LAVENDERBLUSH1: int = ...
	Quantity_NOC_LAVENDERBLUSH2: int = ...
	Quantity_NOC_LAVENDERBLUSH3: int = ...
	Quantity_NOC_LAVENDERBLUSH4: int = ...
	Quantity_NOC_LAWNGREEN: int = ...
	Quantity_NOC_LEMONCHIFFON1: int = ...
	Quantity_NOC_LEMONCHIFFON2: int = ...
	Quantity_NOC_LEMONCHIFFON3: int = ...
	Quantity_NOC_LEMONCHIFFON4: int = ...
	Quantity_NOC_LIGHTBLUE: int = ...
	Quantity_NOC_LIGHTBLUE1: int = ...
	Quantity_NOC_LIGHTBLUE2: int = ...
	Quantity_NOC_LIGHTBLUE3: int = ...
	Quantity_NOC_LIGHTBLUE4: int = ...
	Quantity_NOC_LIGHTCORAL: int = ...
	Quantity_NOC_LIGHTCYAN1: int = ...
	Quantity_NOC_LIGHTCYAN2: int = ...
	Quantity_NOC_LIGHTCYAN3: int = ...
	Quantity_NOC_LIGHTCYAN4: int = ...
	Quantity_NOC_LIGHTGOLDENROD: int = ...
	Quantity_NOC_LIGHTGOLDENROD1: int = ...
	Quantity_NOC_LIGHTGOLDENROD2: int = ...
	Quantity_NOC_LIGHTGOLDENROD3: int = ...
	Quantity_NOC_LIGHTGOLDENROD4: int = ...
	Quantity_NOC_LIGHTGOLDENRODYELLOW: int = ...
	Quantity_NOC_LIGHTGRAY: int = ...
	Quantity_NOC_LIGHTPINK: int = ...
	Quantity_NOC_LIGHTPINK1: int = ...
	Quantity_NOC_LIGHTPINK2: int = ...
	Quantity_NOC_LIGHTPINK3: int = ...
	Quantity_NOC_LIGHTPINK4: int = ...
	Quantity_NOC_LIGHTSALMON1: int = ...
	Quantity_NOC_LIGHTSALMON2: int = ...
	Quantity_NOC_LIGHTSALMON3: int = ...
	Quantity_NOC_LIGHTSALMON4: int = ...
	Quantity_NOC_LIGHTSEAGREEN: int = ...
	Quantity_NOC_LIGHTSKYBLUE: int = ...
	Quantity_NOC_LIGHTSKYBLUE1: int = ...
	Quantity_NOC_LIGHTSKYBLUE2: int = ...
	Quantity_NOC_LIGHTSKYBLUE3: int = ...
	Quantity_NOC_LIGHTSKYBLUE4: int = ...
	Quantity_NOC_LIGHTSLATEBLUE: int = ...
	Quantity_NOC_LIGHTSLATEGRAY: int = ...
	Quantity_NOC_LIGHTSTEELBLUE: int = ...
	Quantity_NOC_LIGHTSTEELBLUE1: int = ...
	Quantity_NOC_LIGHTSTEELBLUE2: int = ...
	Quantity_NOC_LIGHTSTEELBLUE3: int = ...
	Quantity_NOC_LIGHTSTEELBLUE4: int = ...
	Quantity_NOC_LIGHTYELLOW: int = ...
	Quantity_NOC_LIGHTYELLOW2: int = ...
	Quantity_NOC_LIGHTYELLOW3: int = ...
	Quantity_NOC_LIGHTYELLOW4: int = ...
	Quantity_NOC_LIMEGREEN: int = ...
	Quantity_NOC_LINEN: int = ...
	Quantity_NOC_MAGENTA1: int = ...
	Quantity_NOC_MAGENTA2: int = ...
	Quantity_NOC_MAGENTA3: int = ...
	Quantity_NOC_MAGENTA4: int = ...
	Quantity_NOC_MAROON: int = ...
	Quantity_NOC_MAROON1: int = ...
	Quantity_NOC_MAROON2: int = ...
	Quantity_NOC_MAROON3: int = ...
	Quantity_NOC_MAROON4: int = ...
	Quantity_NOC_MEDIUMAQUAMARINE: int = ...
	Quantity_NOC_MEDIUMORCHID: int = ...
	Quantity_NOC_MEDIUMORCHID1: int = ...
	Quantity_NOC_MEDIUMORCHID2: int = ...
	Quantity_NOC_MEDIUMORCHID3: int = ...
	Quantity_NOC_MEDIUMORCHID4: int = ...
	Quantity_NOC_MEDIUMPURPLE: int = ...
	Quantity_NOC_MEDIUMPURPLE1: int = ...
	Quantity_NOC_MEDIUMPURPLE2: int = ...
	Quantity_NOC_MEDIUMPURPLE3: int = ...
	Quantity_NOC_MEDIUMPURPLE4: int = ...
	Quantity_NOC_MEDIUMSEAGREEN: int = ...
	Quantity_NOC_MEDIUMSLATEBLUE: int = ...
	Quantity_NOC_MEDIUMSPRINGGREEN: int = ...
	Quantity_NOC_MEDIUMTURQUOISE: int = ...
	Quantity_NOC_MEDIUMVIOLETRED: int = ...
	Quantity_NOC_MIDNIGHTBLUE: int = ...
	Quantity_NOC_MINTCREAM: int = ...
	Quantity_NOC_MISTYROSE: int = ...
	Quantity_NOC_MISTYROSE2: int = ...
	Quantity_NOC_MISTYROSE3: int = ...
	Quantity_NOC_MISTYROSE4: int = ...
	Quantity_NOC_MOCCASIN: int = ...
	Quantity_NOC_NAVAJOWHITE1: int = ...
	Quantity_NOC_NAVAJOWHITE2: int = ...
	Quantity_NOC_NAVAJOWHITE3: int = ...
	Quantity_NOC_NAVAJOWHITE4: int = ...
	Quantity_NOC_NAVYBLUE: int = ...
	Quantity_NOC_OLDLACE: int = ...
	Quantity_NOC_OLIVEDRAB: int = ...
	Quantity_NOC_OLIVEDRAB1: int = ...
	Quantity_NOC_OLIVEDRAB2: int = ...
	Quantity_NOC_OLIVEDRAB3: int = ...
	Quantity_NOC_OLIVEDRAB4: int = ...
	Quantity_NOC_ORANGE: int = ...
	Quantity_NOC_ORANGE1: int = ...
	Quantity_NOC_ORANGE2: int = ...
	Quantity_NOC_ORANGE3: int = ...
	Quantity_NOC_ORANGE4: int = ...
	Quantity_NOC_ORANGERED: int = ...
	Quantity_NOC_ORANGERED1: int = ...
	Quantity_NOC_ORANGERED2: int = ...
	Quantity_NOC_ORANGERED3: int = ...
	Quantity_NOC_ORANGERED4: int = ...
	Quantity_NOC_ORCHID: int = ...
	Quantity_NOC_ORCHID1: int = ...
	Quantity_NOC_ORCHID2: int = ...
	Quantity_NOC_ORCHID3: int = ...
	Quantity_NOC_ORCHID4: int = ...
	Quantity_NOC_PALEGOLDENROD: int = ...
	Quantity_NOC_PALEGREEN: int = ...
	Quantity_NOC_PALEGREEN1: int = ...
	Quantity_NOC_PALEGREEN2: int = ...
	Quantity_NOC_PALEGREEN3: int = ...
	Quantity_NOC_PALEGREEN4: int = ...
	Quantity_NOC_PALETURQUOISE: int = ...
	Quantity_NOC_PALETURQUOISE1: int = ...
	Quantity_NOC_PALETURQUOISE2: int = ...
	Quantity_NOC_PALETURQUOISE3: int = ...
	Quantity_NOC_PALETURQUOISE4: int = ...
	Quantity_NOC_PALEVIOLETRED: int = ...
	Quantity_NOC_PALEVIOLETRED1: int = ...
	Quantity_NOC_PALEVIOLETRED2: int = ...
	Quantity_NOC_PALEVIOLETRED3: int = ...
	Quantity_NOC_PALEVIOLETRED4: int = ...
	Quantity_NOC_PAPAYAWHIP: int = ...
	Quantity_NOC_PEACHPUFF: int = ...
	Quantity_NOC_PEACHPUFF2: int = ...
	Quantity_NOC_PEACHPUFF3: int = ...
	Quantity_NOC_PEACHPUFF4: int = ...
	Quantity_NOC_PERU: int = ...
	Quantity_NOC_PINK: int = ...
	Quantity_NOC_PINK1: int = ...
	Quantity_NOC_PINK2: int = ...
	Quantity_NOC_PINK3: int = ...
	Quantity_NOC_PINK4: int = ...
	Quantity_NOC_PLUM: int = ...
	Quantity_NOC_PLUM1: int = ...
	Quantity_NOC_PLUM2: int = ...
	Quantity_NOC_PLUM3: int = ...
	Quantity_NOC_PLUM4: int = ...
	Quantity_NOC_POWDERBLUE: int = ...
	Quantity_NOC_PURPLE: int = ...
	Quantity_NOC_PURPLE1: int = ...
	Quantity_NOC_PURPLE2: int = ...
	Quantity_NOC_PURPLE3: int = ...
	Quantity_NOC_PURPLE4: int = ...
	Quantity_NOC_RED: int = ...
	Quantity_NOC_RED1: int = ...
	Quantity_NOC_RED2: int = ...
	Quantity_NOC_RED3: int = ...
	Quantity_NOC_RED4: int = ...
	Quantity_NOC_ROSYBROWN: int = ...
	Quantity_NOC_ROSYBROWN1: int = ...
	Quantity_NOC_ROSYBROWN2: int = ...
	Quantity_NOC_ROSYBROWN3: int = ...
	Quantity_NOC_ROSYBROWN4: int = ...
	Quantity_NOC_ROYALBLUE: int = ...
	Quantity_NOC_ROYALBLUE1: int = ...
	Quantity_NOC_ROYALBLUE2: int = ...
	Quantity_NOC_ROYALBLUE3: int = ...
	Quantity_NOC_ROYALBLUE4: int = ...
	Quantity_NOC_SADDLEBROWN: int = ...
	Quantity_NOC_SALMON: int = ...
	Quantity_NOC_SALMON1: int = ...
	Quantity_NOC_SALMON2: int = ...
	Quantity_NOC_SALMON3: int = ...
	Quantity_NOC_SALMON4: int = ...
	Quantity_NOC_SANDYBROWN: int = ...
	Quantity_NOC_SEAGREEN: int = ...
	Quantity_NOC_SEAGREEN1: int = ...
	Quantity_NOC_SEAGREEN2: int = ...
	Quantity_NOC_SEAGREEN3: int = ...
	Quantity_NOC_SEAGREEN4: int = ...
	Quantity_NOC_SEASHELL: int = ...
	Quantity_NOC_SEASHELL2: int = ...
	Quantity_NOC_SEASHELL3: int = ...
	Quantity_NOC_SEASHELL4: int = ...
	Quantity_NOC_BEET: int = ...
	Quantity_NOC_TEAL: int = ...
	Quantity_NOC_SIENNA: int = ...
	Quantity_NOC_SIENNA1: int = ...
	Quantity_NOC_SIENNA2: int = ...
	Quantity_NOC_SIENNA3: int = ...
	Quantity_NOC_SIENNA4: int = ...
	Quantity_NOC_SKYBLUE: int = ...
	Quantity_NOC_SKYBLUE1: int = ...
	Quantity_NOC_SKYBLUE2: int = ...
	Quantity_NOC_SKYBLUE3: int = ...
	Quantity_NOC_SKYBLUE4: int = ...
	Quantity_NOC_SLATEBLUE: int = ...
	Quantity_NOC_SLATEBLUE1: int = ...
	Quantity_NOC_SLATEBLUE2: int = ...
	Quantity_NOC_SLATEBLUE3: int = ...
	Quantity_NOC_SLATEBLUE4: int = ...
	Quantity_NOC_SLATEGRAY1: int = ...
	Quantity_NOC_SLATEGRAY2: int = ...
	Quantity_NOC_SLATEGRAY3: int = ...
	Quantity_NOC_SLATEGRAY4: int = ...
	Quantity_NOC_SLATEGRAY: int = ...
	Quantity_NOC_SNOW: int = ...
	Quantity_NOC_SNOW2: int = ...
	Quantity_NOC_SNOW3: int = ...
	Quantity_NOC_SNOW4: int = ...
	Quantity_NOC_SPRINGGREEN: int = ...
	Quantity_NOC_SPRINGGREEN2: int = ...
	Quantity_NOC_SPRINGGREEN3: int = ...
	Quantity_NOC_SPRINGGREEN4: int = ...
	Quantity_NOC_STEELBLUE: int = ...
	Quantity_NOC_STEELBLUE1: int = ...
	Quantity_NOC_STEELBLUE2: int = ...
	Quantity_NOC_STEELBLUE3: int = ...
	Quantity_NOC_STEELBLUE4: int = ...
	Quantity_NOC_TAN: int = ...
	Quantity_NOC_TAN1: int = ...
	Quantity_NOC_TAN2: int = ...
	Quantity_NOC_TAN3: int = ...
	Quantity_NOC_TAN4: int = ...
	Quantity_NOC_THISTLE: int = ...
	Quantity_NOC_THISTLE1: int = ...
	Quantity_NOC_THISTLE2: int = ...
	Quantity_NOC_THISTLE3: int = ...
	Quantity_NOC_THISTLE4: int = ...
	Quantity_NOC_TOMATO: int = ...
	Quantity_NOC_TOMATO1: int = ...
	Quantity_NOC_TOMATO2: int = ...
	Quantity_NOC_TOMATO3: int = ...
	Quantity_NOC_TOMATO4: int = ...
	Quantity_NOC_TURQUOISE: int = ...
	Quantity_NOC_TURQUOISE1: int = ...
	Quantity_NOC_TURQUOISE2: int = ...
	Quantity_NOC_TURQUOISE3: int = ...
	Quantity_NOC_TURQUOISE4: int = ...
	Quantity_NOC_VIOLET: int = ...
	Quantity_NOC_VIOLETRED: int = ...
	Quantity_NOC_VIOLETRED1: int = ...
	Quantity_NOC_VIOLETRED2: int = ...
	Quantity_NOC_VIOLETRED3: int = ...
	Quantity_NOC_VIOLETRED4: int = ...
	Quantity_NOC_WHEAT: int = ...
	Quantity_NOC_WHEAT1: int = ...
	Quantity_NOC_WHEAT2: int = ...
	Quantity_NOC_WHEAT3: int = ...
	Quantity_NOC_WHEAT4: int = ...
	Quantity_NOC_WHITESMOKE: int = ...
	Quantity_NOC_YELLOW: int = ...
	Quantity_NOC_YELLOW1: int = ...
	Quantity_NOC_YELLOW2: int = ...
	Quantity_NOC_YELLOW3: int = ...
	Quantity_NOC_YELLOW4: int = ...
	Quantity_NOC_YELLOWGREEN: int = ...
	Quantity_NOC_WHITE: int = ...

class Quantity_TypeOfColor:
	Quantity_TOC_RGB: int = ...
	Quantity_TOC_HLS: int = ...

class Quantity_PhysicalQuantity:
	Quantity_MASS: int = ...
	Quantity_PLANEANGLE: int = ...
	Quantity_SOLIDANGLE: int = ...
	Quantity_LENGTH: int = ...
	Quantity_AREA: int = ...
	Quantity_VOLUME: int = ...
	Quantity_SPEED: int = ...
	Quantity_VELOCITY: int = ...
	Quantity_ACCELERATION: int = ...
	Quantity_ANGULARVELOCITY: int = ...
	Quantity_FREQUENCY: int = ...
	Quantity_TEMPERATURE: int = ...
	Quantity_AMOUNTOFSUBSTANCE: int = ...
	Quantity_DENSITY: int = ...
	Quantity_MASSFLOW: int = ...
	Quantity_VOLUMEFLOW: int = ...
	Quantity_CONSUMPTION: int = ...
	Quantity_MOMENTUM: int = ...
	Quantity_KINETICMOMENT: int = ...
	Quantity_MOMENTOFINERTIA: int = ...
	Quantity_FORCE: int = ...
	Quantity_MOMENTOFAFORCE: int = ...
	Quantity_TORQUE: int = ...
	Quantity_WEIGHT: int = ...
	Quantity_PRESSURE: int = ...
	Quantity_VISCOSITY: int = ...
	Quantity_KINEMATICVISCOSITY: int = ...
	Quantity_ENERGY: int = ...
	Quantity_WORK: int = ...
	Quantity_POWER: int = ...
	Quantity_SURFACETENSION: int = ...
	Quantity_COEFFICIENTOFEXPANSION: int = ...
	Quantity_THERMALCONDUCTIVITY: int = ...
	Quantity_SPECIFICHEATCAPACITY: int = ...
	Quantity_ENTROPY: int = ...
	Quantity_ENTHALPY: int = ...
	Quantity_LUMINOUSINTENSITY: int = ...
	Quantity_LUMINOUSFLUX: int = ...
	Quantity_LUMINANCE: int = ...
	Quantity_ILLUMINANCE: int = ...
	Quantity_LUMINOUSEXPOSITION: int = ...
	Quantity_LUMINOUSEFFICACITY: int = ...
	Quantity_ELECTRICCHARGE: int = ...
	Quantity_ELECTRICCURRENT: int = ...
	Quantity_ELECTRICFIELDSTRENGTH: int = ...
	Quantity_ELECTRICPOTENTIAL: int = ...
	Quantity_ELECTRICCAPACITANCE: int = ...
	Quantity_MAGNETICFLUX: int = ...
	Quantity_MAGNETICFLUXDENSITY: int = ...
	Quantity_MAGNETICFIELDSTRENGTH: int = ...
	Quantity_RELUCTANCE: int = ...
	Quantity_RESISTANCE: int = ...
	Quantity_INDUCTANCE: int = ...
	Quantity_CAPACITANCE: int = ...
	Quantity_IMPEDANCE: int = ...
	Quantity_ADMITTANCE: int = ...
	Quantity_RESISTIVITY: int = ...
	Quantity_CONDUCTIVITY: int = ...
	Quantity_MOLARMASS: int = ...
	Quantity_MOLARVOLUME: int = ...
	Quantity_CONCENTRATION: int = ...
	Quantity_MOLARCONCENTRATION: int = ...
	Quantity_MOLARITY: int = ...
	Quantity_SOUNDINTENSITY: int = ...
	Quantity_ACOUSTICINTENSITY: int = ...
	Quantity_ACTIVITY: int = ...
	Quantity_ABSORBEDDOSE: int = ...
	Quantity_DOSEEQUIVALENT: int = ...

class Quantity_Color:
	@staticmethod
	def Argb2color(self, theARGB: int, theColor: Quantity_Color) -> None: ...
	def Blue(self) -> float: ...
	def ChangeContrast(self, ADelta: float) -> None: ...
	def ChangeIntensity(self, ADelta: float) -> None: ...
	@staticmethod
	def Color2argb(self, theColor: Quantity_Color, theARGB: int) -> None: ...
	@staticmethod
	def ColorFromHex(self, theHexColorString: str, theColor: Quantity_Color) -> False: ...
	@staticmethod
	def ColorFromName(self, theName: str, theColor: Quantity_NameOfColor) -> bool: ...
	@staticmethod
	def ColorFromName(self, theColorNameString: str, theColor: Quantity_Color) -> bool: ...
	def Delta(self, AColor: Quantity_Color, DC: float, DI: float) -> None: ...
	def Distance(self, AColor: Quantity_Color) -> float: ...
	@staticmethod
	def Epsilon(self) -> float: ...
	def Green(self) -> float: ...
	@staticmethod
	def HlsRgb(self, H: float, L: float, S: float, R: float, G: float, B: float) -> None: ...
	def Hue(self) -> float: ...
	def IsDifferent(self, Other: Quantity_Color) -> bool: ...
	def IsEqual(self, Other: Quantity_Color) -> bool: ...
	def Light(self) -> float: ...
	def Name(self) -> Quantity_NameOfColor: ...
	@staticmethod
	def Name(self, R: float, G: float, B: float) -> Quantity_NameOfColor: ...
	def __init__(self) -> None: ...
	def __init__(self, AName: Quantity_NameOfColor) -> None: ...
	def __init__(self, theR1: float, theR2: float, theR3: float, theType: Quantity_TypeOfColor) -> None: ...
	def Red(self) -> float: ...
	@staticmethod
	def RgbHls(self, R: float, G: float, B: float, H: float, L: float, S: float) -> None: ...
	def Saturation(self) -> float: ...
	@staticmethod
	def SetEpsilon(self, AnEpsilon: float) -> None: ...
	def SetValues(self, AName: Quantity_NameOfColor) -> None: ...
	def SetValues(self, theR1: float, theR2: float, theR3: float, theType: Quantity_TypeOfColor) -> None: ...
	def SquareDistance(self, AColor: Quantity_Color) -> float: ...
	@staticmethod
	def StringName(self, AColor: Quantity_NameOfColor) -> str: ...
	@staticmethod
	def Test(self) -> None: ...
	def Values(self, theR1: float, theR2: float, theR3: float, theType: Quantity_TypeOfColor) -> None: ...

class Quantity_ColorHasher:
	@staticmethod
	def HashCode(self, theColor: Quantity_Color, theUpperBound: int) -> int: ...
	@staticmethod
	def IsEqual(self, theColor1: Quantity_Color, theColor2: Quantity_Color) -> bool: ...

class Quantity_ColorRGBA:
	def Alpha(self) -> Standard_ShortReal: ...
	def ChangeRGB(self) -> Quantity_Color: ...
	@staticmethod
	def ColorFromName(self, theColorNameString: str, theColor: Quantity_ColorRGBA) -> bool: ...
	def GetRGB(self) -> Quantity_Color: ...
	def IsDifferent(self, theOther: Quantity_ColorRGBA) -> False: ...
	def IsEqual(self, theOther: Quantity_ColorRGBA) -> False: ...
	def __init__(self) -> None: ...
	def __init__(self, theRgb: Quantity_Color) -> None: ...
	def SetAlpha(self, theAlpha: Standard_ShortReal) -> None: ...
	def SetRGB(self, theRgb: Quantity_Color) -> None: ...

class Quantity_ColorRGBAHasher:
	@staticmethod
	def HashCode(self, theColor: Quantity_ColorRGBA, theUpperBound: int) -> int: ...
	@staticmethod
	def IsEqual(self, theColor1: Quantity_ColorRGBA, theColor2: Quantity_ColorRGBA) -> bool: ...

class Quantity_Date:
	def Add(self, aPeriod: Quantity_Period) -> Quantity_Date: ...
	def Day(self) -> int: ...
	def Difference(self, anOther: Quantity_Date) -> Quantity_Period: ...
	def Hour(self) -> int: ...
	def IsEarlier(self, anOther: Quantity_Date) -> bool: ...
	def IsEqual(self, anOther: Quantity_Date) -> bool: ...
	def IsLater(self, anOther: Quantity_Date) -> bool: ...
	@staticmethod
	def IsLeap(self, yy: int) -> bool: ...
	@staticmethod
	def IsValid(self, mm: int, dd: int, yy: int, hh: int, mn: int, ss: int, mis: Optional[int], mics: Optional[int]) -> bool: ...
	def MicroSecond(self) -> int: ...
	def MilliSecond(self) -> int: ...
	def Minute(self) -> int: ...
	def Month(self) -> int: ...
	def __init__(self) -> None: ...
	def __init__(self, mm: int, dd: int, yyyy: int, hh: int, mn: int, ss: int, mis: Optional[int], mics: Optional[int]) -> None: ...
	def Second(self) -> int: ...
	def SetValues(self, mm: int, dd: int, yy: int, hh: int, mn: int, ss: int, mis: Optional[int], mics: Optional[int]) -> None: ...
	def Subtract(self, aPeriod: Quantity_Period) -> Quantity_Date: ...
	def Values(self, mm: int, dd: int, yy: int, hh: int, mn: int, ss: int, mis: int, mics: int) -> None: ...
	def Year(self) -> int: ...

class Quantity_Period:
	def Add(self, anOther: Quantity_Period) -> Quantity_Period: ...
	def IsEqual(self, anOther: Quantity_Period) -> bool: ...
	def IsLonger(self, anOther: Quantity_Period) -> bool: ...
	def IsShorter(self, anOther: Quantity_Period) -> bool: ...
	@staticmethod
	def IsValid(self, dd: int, hh: int, mn: int, ss: int, mis: Optional[int], mics: Optional[int]) -> bool: ...
	@staticmethod
	def IsValid(self, ss: int, mics: Optional[int]) -> bool: ...
	def __init__(self, dd: int, hh: int, mn: int, ss: int, mis: Optional[int], mics: Optional[int]) -> None: ...
	def __init__(self, ss: int, mics: Optional[int]) -> None: ...
	def SetValues(self, dd: int, hh: int, mn: int, ss: int, mis: Optional[int], mics: Optional[int]) -> None: ...
	def SetValues(self, ss: int, mics: Optional[int]) -> None: ...
	def Subtract(self, anOther: Quantity_Period) -> Quantity_Period: ...
	def Values(self, dd: int, hh: int, mn: int, ss: int, mis: int, mics: int) -> None: ...
	def Values(self, ss: int, mics: int) -> None: ...
