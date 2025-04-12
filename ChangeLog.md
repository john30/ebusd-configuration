# 2025-02-16
https://ebus.github.io/ only:
* reworked+merged several PRs:
  * encon/0a + 3c + 7c from #406
  * vaillant/08.bai from #442, #436
  * vaillant/08.hmu from #479

# 2025-01-21
https://ebus.github.io/ only:
* reworked+merged several PRs:
  * vaillant/08.hmu from #160, #174, #316, #330, #407
  * vaillant/08.bai from #202, #416, #201, #367, #323
  * vaillant/08.v3x from #226
  * vaillant/76.vwz from #330
  * vaillant/76.vwzio from #407
  * vaillant/08.recov from #343, #364
  * vaillant/hcmode from #388 and #389
  * vaillant/_templates from #393
  * vaillant/e0.omu from #368
  * vaillant/15.ctls2 from #422
  * vaillant/15.ctlv2 from #423
  * vaillant/06.pms + 06.vms from #430 and #454
  * vaillant/mcmode from #328 
  * tem/15 from #129
* add vaillant/15.ctlv3 link according to #35, #418, #449
* fix some message IDs in vaillant/15.ctlv2 and ochsner
* fix wolf file names
* fix missing reference to product id in vaillant/08.bai condition

# 2024-12-08
https://ebus.github.io/ only:
* added vaillant/06.vmd
* added vaillant/08.bai 0010011701
* added ochsner/15.22102
* added some generic opdata from eBUS spec to src/opdata_inc and src/broadcast
* added wolf/broadcast, wolf/08.hc, and wolf/50.mc with symlinked kromschroeder dir

# 2024-07-13
* normalized, corrected, and converted to TypeSpec
* generated files rebuilt from TypeSpec definitions published on github CDN https://ebus.github.io/

# 2024-03-01
* remove previous merge of #316 again as several users reported having issues with their heating since that: live monitor and test menu to vaillant/08.hmu

# 2024-02-11
* added vailant/15.ctlv2
* added live monitor and test menu to vaillant/08.hmu

# 2024-01-20
* added vaillant/15.bass
* added vaillant/08.recov
* extended vaillant/15.700 with zone 3 timers

# 2023-09-23
* added energyintegral for vailant/08.hmu
* extended sfmode for vaillant/15.700+720+b7v+basv
* added further vaillant/08.bai 0010015600 variants: 0010021875+0010021887
* added vaillant/15.450+f45
* added special hardware variant of vaillant/15.350

# 2023-01-02
* added cooling, global off, and ventilation to vaillant/15.700
* added vaillant/15.160
* added another vaillant/08.bai 0010015600 variant: 0010021929 

# 2022-05-08
* added vaillant/15.e7c and 15.e7f_2
* fix wrong assignment of vaillant/08.bai 0010014917 in en folder
* added vaillant/08.bai derivates: 0010008045, 0010008863, 0010023648
* added another vaillant/08.bai 0010015600 variant: 0010019276

# 2021-12-12
* added another vaillant/08.bai 0010015600 variant: 0010021891
* made some counter values in vaillant/08.bai writable to installer

# 2021-02-20
* made vaillant/broadcast vdatetime writable to installer
* added value 4=hwc to vaillant pumpstate
* added hcname3 to vaillant/15.uih
* added vaillant/15.720 and 15.basv
* added vaillant/06.vms
* added mctype7 value 6=circulation to vaillant templates

# 2021-02-07
* added vaillant/08.bai 0010021961 with variants
* added vaillant/15.b7v
* added cooling temp, fuel sum, energy sum for vaillant/15.700
* added another vaillant/08.bai 0010015600 variant: 0010014917
* added another temp for vaillant/50.v61.mc

# 2019-10-06
* added vaillant/f35

# 2018-12-25
* added heating circuit 3 and zone 3 to vaillant/15.700 and corrected english names
