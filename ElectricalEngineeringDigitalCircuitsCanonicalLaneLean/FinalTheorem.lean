import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

def ConstrainedDigitalCircuitClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_digital_circuit_endgame (A : AdmissibleClass) :
    ConstrainedDigitalCircuitClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse