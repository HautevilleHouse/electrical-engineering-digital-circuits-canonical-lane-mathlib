import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure DigitalCircuitPackage where
  primaryInputs : Nat
  primaryOutputs : Nat
  gates : List (String × Nat × Nat)  -- (gateType, fanin, fanout)
  topologyAcyclic : Prop
  fanoutCapacitance : List Float

structure DigitalCircuitEvidence (P : DigitalCircuitPackage) where
  topologyAcyclicClosed : P.topologyAcyclic
  fanoutCapacitanceMeasured : P.fanoutCapacitance.length = P.gates.length

def DigitalCircuitClosed (P : DigitalCircuitPackage) : Prop :=
  P.topologyAcyclic ∧ (P.fanoutCapacitance.length = P.gates.length)

theorem digital_circuit_closed_from_evidence (P : DigitalCircuitPackage) (E : DigitalCircuitEvidence P) : DigitalCircuitClosed P := by
  exact And.intro E.topologyAcyclicClosed E.fanoutCapacitanceMeasured

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse
