import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.LogicGates

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure CombinationalCircuitPackage {B : BooleanAlgebraPackage} (L : LogicGatePackage B) where
  inputCount : Nat
  outputCount : Nat
  gateLevels : Nat
  netlist : Prop
  booleanFunction : B.carrier ^ inputCount → B.carrier ^ outputCount
  functionCorrect : ∀ inputs, netlist → booleanFunction inputs = computeNetlist inputs

structure CombinationalCircuitEvidence {B : BooleanAlgebraPackage} {L : LogicGatePackage B} (C : CombinationalCircuitPackage L) where
  netlistClosed : C.netlist
  functionCorrectClosed : ∀ inputs, C.netlist → C.booleanFunction inputs = C.computeNetlist inputs

def CombinationalCircuitClosed {B : BooleanAlgebraPackage} {L : LogicGatePackage B} (C : CombinationalCircuitPackage L) : Prop :=
  C.netlist ∧ (∀ inputs, C.netlist → C.booleanFunction inputs = C.computeNetlist inputs)

theorem combinational_circuit_closed_from_evidence {B : BooleanAlgebraPackage} {L : LogicGatePackage B} (C : CombinationalCircuitPackage L) (E : CombinationalCircuitEvidence C) :
    CombinationalCircuitClosed C := by
  exact And.intro E.netlistClosed E.functionCorrectClosed

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse