import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.BooleanCircuit

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure DigitalCircuitAdmittedObject where
  circuit : BooleanCircuit
  specification : CircuitSpecification
  isCorrect : Prop
  conclusion : isCorrect

structure AdmissibleClass where
  object : DigitalCircuitAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DigitalCircuitWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse