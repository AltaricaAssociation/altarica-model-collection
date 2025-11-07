<?xml version="1.0"?>
<!DOCTYPE altarica>
<altarica>
  <define-block name="System">
    <define-variable name="ElectricSource.outflow" type="Boolean">
      <attribute name="reset">
        <Boolean value="false"/>
      </attribute>
    </define-variable>
    <define-variable name="ElectricSource.working" type="Boolean">
      <attribute name="init">
        <Boolean value="true"/>
      </attribute>
    </define-variable>
    <define-variable name="MainTrain.Main.inflow" type="Boolean">
      <attribute name="reset">
        <Boolean value="false"/>
      </attribute>
    </define-variable>
    <define-variable name="MainTrain.Main.outflow" type="Boolean">
      <attribute name="reset">
        <Boolean value="false"/>
      </attribute>
    </define-variable>
    <define-variable name="MainTrain.Main.working" type="Boolean">
      <attribute name="init">
        <Boolean value="true"/>
      </attribute>
    </define-variable>
    <define-variable name="SpareTrain.Spare.inflow" type="Boolean">
      <attribute name="reset">
        <Boolean value="false"/>
      </attribute>
    </define-variable>
    <define-variable name="SpareTrain.Spare.outflow" type="Boolean">
      <attribute name="reset">
        <Boolean value="false"/>
      </attribute>
    </define-variable>
    <define-variable name="SpareTrain.Spare.working" type="Boolean">
      <attribute name="init">
        <Boolean value="true"/>
      </attribute>
    </define-variable>
    <define-variable name="outflow" type="Boolean">
      <attribute name="reset">
        <Boolean value="false"/>
      </attribute>
    </define-variable>
    <define-event name="ElectricSource.failure">
      <attribute name="delay">
        <constant>
          <Real value="1.0"/>
        </constant>
      </attribute>
    </define-event>
    <define-event name="MainTrain.Main.failure">
      <attribute name="delay">
        <constant>
          <Real value="1.0"/>
        </constant>
      </attribute>
    </define-event>
    <define-event name="SpareTrain.Spare.failure">
      <attribute name="delay">
        <constant>
          <Real value="1.0"/>
        </constant>
      </attribute>
    </define-event>
    <assertion>
      <assignment>
        <variable name="MainTrain.Main.outflow"/>
        <and>
          <variable name="MainTrain.Main.inflow"/>
          <variable name="MainTrain.Main.working"/>
        </and>
      </assignment>
      <assignment>
        <variable name="MainTrain.Main.inflow"/>
        <variable name="ElectricSource.outflow"/>
      </assignment>
      <assignment>
        <variable name="ElectricSource.outflow"/>
        <variable name="MainTrain.Main.inflow"/>
      </assignment>
      <assignment>
        <variable name="SpareTrain.Spare.outflow"/>
        <and>
          <variable name="SpareTrain.Spare.inflow"/>
          <variable name="SpareTrain.Spare.working"/>
        </and>
      </assignment>
      <assignment>
        <variable name="SpareTrain.Spare.inflow"/>
        <variable name="ElectricSource.outflow"/>
      </assignment>
      <assignment>
        <variable name="ElectricSource.outflow"/>
        <variable name="SpareTrain.Spare.inflow"/>
      </assignment>
      <assignment>
        <variable name="ElectricSource.outflow"/>
        <variable name="ElectricSource.working"/>
      </assignment>
      <assignment>
        <variable name="outflow"/>
        <or>
          <variable name="MainTrain.Main.outflow"/>
          <variable name="SpareTrain.Spare.outflow"/>
        </or>
      </assignment>
    </assertion>
    <transition>
      <event name="MainTrain.Main.failure"/>
      <variable name="MainTrain.Main.working"/>
      <assignment>
        <variable name="MainTrain.Main.working"/>
        <Boolean value="false"/>
      </assignment>
    </transition>
    <transition>
      <event name="SpareTrain.Spare.failure"/>
      <variable name="SpareTrain.Spare.working"/>
      <assignment>
        <variable name="SpareTrain.Spare.working"/>
        <Boolean value="false"/>
      </assignment>
    </transition>
    <transition>
      <event name="ElectricSource.failure"/>
      <variable name="ElectricSource.working"/>
      <assignment>
        <variable name="ElectricSource.working"/>
        <Boolean value="false"/>
      </assignment>
    </transition>
  </define-block>
</altarica>
