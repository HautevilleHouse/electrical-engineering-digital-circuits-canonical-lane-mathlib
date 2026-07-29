import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.DigitalCircuitPackage

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure PowerEstimationPackage (P : DigitalCircuitPackage) where
  switchingActivity : List Float
  capacitanceLoad : List Float
  supplyVoltage : Float
  dynamicPower : Float
  leakagePower : Float
  totalPowerComputed : Prop

structure PowerEstimationEvidence {P : DigitalCircuitPackage} (Pow : PowerEstimationPackage P) where
  totalPowerComputedClosed : Pow.totalPowerComputed
  activitiesMatchGates : Pow.switchingActivity.length = P.gates.length

def PowerEstimationClosed {P : DigitalCircuitPackage} (Pow : PowerEstimationPackage P) : Prop :=
  Pow.totalPowerComputed ∧ (Pow.switchingActivity.length = P.gates.length)

theorem power_estimation_closed_from_evidence {P : DigitalCircuitPackage} (Pow : PowerEstimationPackage P) (E : PowerEstimationEvidence Pow) : PowerEstimationClosed Pow := by
  exact And.intro E.totalPowerComputedClosed E.activitiesMatchGates

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse
