<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<UiMod name="zzzGetOuttaMyFace" version="1" date="18/04/2021" >
	<Author name="Browntown" email="--" />
	<VersionSettings gameVersion="1.8.4" windowsVersion="1.0" savedVariablesVersion="1.0" />
	<Description text="Hides Petbar when they're dead, not summoned, not alive - whatever. Also hides SoR, tactics and Menu Bar while in combat" />

	<WARInfo>
	    <Categories>
	    </Categories>
	</WARInfo>

	<Dependencies>
		<Dependency name="RoR_SoR" optional="true" forceEnable="false" />  
	</Dependencies>

	<Files>
		<File name="zzzGetOuttaMyFace.lua"/>		
	</Files>

	<OnInitialize>
		<CallFunction name="zzzGetOuttaMyFace.OnInit"/>
	</OnInitialize>

	<OnUpdate>
	</OnUpdate>

	<OnShutdown>
	</OnShutdown>
</UiMod>
</ModuleFile>
