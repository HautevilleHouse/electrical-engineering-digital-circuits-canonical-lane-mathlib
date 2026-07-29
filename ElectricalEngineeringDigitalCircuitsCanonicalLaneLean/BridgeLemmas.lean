import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

def DigitalCircuitWitnessClosed (O : DigitalCircuitAdmittedObject) : Prop :=
  O.isCorrect

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DigitalCircuitWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse