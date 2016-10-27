Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp135.dfw.emailsrvr.com ([67.192.241.135])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzmqg-0005OE-FN
 for ath10k@lists.infradead.org; Thu, 27 Oct 2016 15:44:17 +0000
From: "Colin McKay" <cmckay@abineau.com>
References: <1477338959.93584918@apps.rackspace.com>
 <8642a7dd-3612-ce8b-8c08-f4bd8f746764@candelatech.com>
 <1477342762.945417468@apps.rackspace.com>
 <1d445cc5-1180-9d6f-9a52-d999096a8932@candelatech.com>
 <1477351326.570412506@apps.rackspace.com> <580EBC1F.7020305@candelatech.com>
 <1477364346.09835062@apps.rackspace.com>
 <1477365117.52679760@apps.rackspace.com> <580EDDB0.6010204@candelatech.com>
 <CADnKcViZG8AdShy0RSEVtbcZB9FhoTZRmg4UYdgfUKHiS=A3sw@mail.gmail.com>
In-Reply-To: <CADnKcViZG8AdShy0RSEVtbcZB9FhoTZRmg4UYdgfUKHiS=A3sw@mail.gmail.com>
Subject: RE: Direct firmware load failed with error 2
Date: Thu, 27 Oct 2016 15:43:45 -0700
Message-ID: <003201d230a3$94a80ed0$bdf82c70$@abineau.com>
MIME-Version: 1.0
Content-Language: en-us
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: 'Marek Puzyniak' <marek.puzyniak@tieto.com>, ath10k@lists.infradead.org

Thankyou both, Ben and Marek,

Based on your advice, we're moving to the Gateworks hardware, which I
believe is a much better fit for us.

Thanks again,
Colin

-----Original Message-----
From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Marek
Puzyniak
Sent: Tuesday, October 25, 2016 8:50 AM
To: cmckay@abineau.com; ath10k@lists.infradead.org
Subject: Re: Direct firmware load failed with error 2

Hi Colin,

As Ben wrote: you need backports.
You can look at gateworks github for examples how it can be done in yocto.
They have recipes for ath10k firmware and backports
(compat-wireless):

Ath10k firmware :
https://github.com/Gateworks/meta-gateworks/tree/fido/recipes-connectivity/a
th10k-firmware

and backports
https://github.com/Gateworks/meta-gateworks/tree/fido/recipes-kernel/compat-
wireless

Of course it is not as simple as just adding those recipes, but it is good
point to start.

If you need newer ath10k firmware then is is quite easy to update
ath10k-firmware recipe.
With compat-wireless it is not so easy but it is possible.


Marek

On 25 October 2016 at 06:21, Ben Greear <greearb@candelatech.com> wrote:
> Your kernel is so old that it will likely be a pain to get things working.
>
> You can do backports, and I have manually done some backporting for 
> users with similarly old kernels (using my 3.17 tree is a upstream 
> kernel), but it is not something I do for fun.
>
> If for some reason stock firmware-2.bin works and mine does not, then 
> let me know and maybe I can help.
>
> Thanks,
> Ben
>
>
> On 10/24/2016 08:11 PM, cmckay@abineau.com wrote:
>>
>> Hi Ben,
>>
>> Forgot to mention. Our hardware is not supported by OpenWRT, so going 
>> to LEDE at this point may be too tough. I'm an RF guy, so this is a steep
hill.
>>
>> Colin
>>
>> -----Original Message-----
>> From: cmckay@abineau.com
>> Sent: Monday, October 24, 2016 10:59pm
>> To: "Ben Greear" <greearb@candelatech.com>
>> Cc: ath10k@lists.infradead.org
>> Subject: Re: Direct firmware load failed with error 2
>>
>> Hi Ben
>>
>> root@apalis-imx6:~# lspci -v
>> 00:00.0 PCI bridge: Synopsys, Inc. Device abcd (rev 01) (prog-if 00 
>> [Normal decode])
>>          Flags: bus master, fast devsel, latency 0, IRQ 388
>>          Memory at 01200000 (32-bit, non-prefetchable) [size=1M]
>>          Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
>>          Memory behind bridge: 01000000-011fffff
>>          Prefetchable memory behind bridge: 01300000-013fffff
>>          [virtual] Expansion ROM at 01400000 [disabled] [size=64K]
>>          Capabilities: [40] Power Management version 3
>>          Capabilities: [50] MSI: Enable+ Count=1/1 Maskable+ 64bit+
>>          Capabilities: [70] Express Root Port (Slot-), MSI 00
>>          Capabilities: [100] Advanced Error Reporting
>>          Capabilities: [140] Virtual Channel
>>          Kernel driver in use: pcieport
>>
>> 01:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac 
>> Wireless Network Adapter
>>          Flags: fast devsel, IRQ 155
>>          Memory at 01000000 (64-bit, non-prefetchable) [size=2M]
>>          [virtual] Expansion ROM at 01300000 [disabled] [size=64K]
>>          Capabilities: [40] Power Management version 3
>>          Capabilities: [50] MSI: Enable- Count=8/8 Maskable+ 64bit-
>>          Capabilities: [70] Express Endpoint, MSI 00
>>          Capabilities: [100] Advanced Error Reporting
>>          Capabilities: [140] Virtual Channel
>>          Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
>>          Kernel modules: ath10k_pci
>> ----------
>>
>> Angstrom v2015.12 - Kernel 3.14.52-v2.6b2+g7c83cef
>>
>> Apalis_iMX6_LinuxImageV2.6_20160929
>>
>> This is Toradex's standard build for their Apalis iMX6 on a Ixora
carrier.
>> I think they are due for a new major release very soon. I can check 
>> if you think it's worth it.
>>
>> The current firmware is yours (firmware-2-ct-full-community.bin), 
>> fresh off your site today. I downloaded board.bin today too.
>> ---------------
>> root@apalis-imx6:~# lsmod
>> Module                  Size  Used by
>> usb_f_rndis            11441  2
>> u_ether                 9135  1 usb_f_rndis
>> usb_f_acm               4105  2
>> u_serial                8487  1 usb_f_acm
>> ov5640_camera_mipi_int    21588  0
>> mxc_v4l2_capture       24990  1 ov5640_camera_mipi_int
>> ipu_bg_overlay_sdc      4113  1 mxc_v4l2_capture
>> ipu_still               1631  1 mxc_v4l2_capture
>> ipu_prp_enc             4653  1 mxc_v4l2_capture
>> max9526_tvin            5800  0
>> ipu_csi_enc             2917  1 mxc_v4l2_capture
>> ipu_fg_overlay_sdc      4978  1 mxc_v4l2_capture
>> adv7280_tvin            6563  0
>> v4l2_int_device         1759  4
>> adv7280_tvin,ov5640_camera_mipi_int,mxc_v4l2_capture,max9526_tvin
>> ath10k_pci             27397  0
>> ath10k_core           101131  1 ath10k_pci
>> ath                    17381  1 ath10k_core
>> mac80211              254675  1 ath10k_core
>> cfg80211              166770  3 ath,mac80211,ath10k_core
>> libcomposite           28353  12 usb_f_acm,usb_f_rndis
>> configfs               20737  4 usb_f_acm,usb_f_rndis,libcomposite
>> galcore               207484  2
>>
>> ------------
>> root@apalis-imx6:~# ip link
>> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
>> mode DEFAULT group default
>>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>> 2: can0: <NOARP,ECHO> mtu 16 qdisc noop state DOWN mode DEFAULT group 
>> default qlen 10
>>      link/can
>> 3: can1: <NOARP,ECHO> mtu 16 qdisc noop state DOWN mode DEFAULT group 
>> default qlen 10
>>      link/can
>> 4: eth0: <BROADCAST,MULTICAST,DYNAMIC,UP,LOWER_UP> mtu 1500 qdisc 
>> pfifo_fast state UP mode DEFAULT group defaul0
>>      link/ether 00:14:2d:4a:30:f9 brd ff:ff:ff:ff:ff:ff
>> 5: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN mode DEFAULT 
>> group default
>>      link/sit 0.0.0.0 brd 0.0.0.0
>> 6: usb0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc 
>> pfifo_fast state DOWN mode DEFAULT group default ql0
>>      link/ether 00:14:2d:ff:ff:ff brd ff:ff:ff:ff:ff:ff
>>
>> Thanks again,
>> Colin
>>
>>
>> -----Original Message-----
>> From: "Ben Greear" <greearb@candelatech.com>
>> Sent: Monday, October 24, 2016 9:57pm
>> To: cmckay@abineau.com
>> Cc: ath10k@lists.infradead.org
>> Subject: Re: Direct firmware load failed with error 2
>>
>> Please let us know 'lspci' or equiv, exactly what firmware you are 
>> loading, kernel driver version, etc.
>>
>> Maybe try LEDE if you can, it's likely more up to date.
>>
>> Thanks,
>> Ben
>>
>> On 10/24/2016 04:22 PM, cmckay@abineau.com wrote:
>>>
>>> Great, thanks Ben,
>>>
>>> That cleared up the firmware load error but I now have:
>>>
>>> [    6.997553] ath10k_pci 0000:01:00.0: BAR 0: assigned [mem
>>> 0x01000000-0x011ff]
>>> [    7.075559] ath10k: pci irq MSI
>>> [    9.753487] ath10k: ctl_resp never came in (-110)
>>> [    9.758281] ath10k: failed to connect to HTC: -110
>>> [    9.803633] ath10k: could not init core (-110)
>>> [    9.843495] ath10k: could not probe fw (-110)
>>> [    9.843499] ath10k: failed to register driver core: -110
>>> [    9.843681] ath10k_pci: probe of 0000:01:00.0 failed with error -110
>>>
>>> Any ideas? Let me know if I should post this new.
>>>
>>> Thanks a bunch
>>> Colin
>>>
>>>
>>> -----Original Message-----
>>> From: "Ben Greear" <greearb@candelatech.com>
>>> Sent: Monday, October 24, 2016 5:05pm
>>> To: cmckay@abineau.com
>>> Cc: ath10k@lists.infradead.org
>>> Subject: Re: Direct firmware load failed with error 2
>>>
>>> You need board.bin too.  Something like this if you want to use my 
>>> firmware, or firmware-5.bin for upstream 10.2 firmware:
>>>
>>> [root@ben-ota-1 lanforge]# ls -l /lib/firmware/ath10k/QCA988X/hw2.0/
>>> total 1084
>>> -rw-r--r--. 1 root root   2116 Sep 27 14:43 board.bin
>>> -rw-r--r--. 1 root root 201324 Oct 13 18:48 firmware-2.bin
>>>
>>> Thanks,
>>> Ben
>>>
>>>
>>> On 10/24/2016 01:59 PM, cmckay@abineau.com wrote:
>>>>
>>>> Thanks Ben,
>>>>
>>>> Got the location from the website:
>>>> root@apalis-imx6:/lib/firmware/ath10k/QCA988X/hw2.0# ls
>>>> firmware-2.bin         firmware-5.bin
>>>>
>>>> I'll figure out how to do some printk's (I'm a newbie).
>>>>
>>>> Thanks,
>>>> Colin
>>>>
>>>>
>>>> -----Original Message-----
>>>> From: "Ben Greear" <greearb@candelatech.com>
>>>> Sent: Monday, October 24, 2016 4:11pm
>>>> To: cmckay@abineau.com, ath10k@lists.infradead.org
>>>> Subject: Re: Direct firmware load failed with error 2
>>>>
>>>> Maybe add some printks in your driver to see exactly what it is 
>>>> trying to load?
>>>>
>>>> Maybe firmware is in wrong location?
>>>>
>>>> errno 2 == ENOENT, which probably means something like 'could not 
>>>> find file'.
>>>>
>>>> Thanks,
>>>> Ben
>>>>
>>>>
>>>> On 10/24/2016 12:55 PM, cmckay@abineau.com wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> I'm attempting to add a Silex PCEAC or Compex WLE900VX (both 
>>>>> QCA9880) mini PCIe card to a Toradex Apalis iMX6 SOM on their 
>>>>> Ixora card. I added a BSP layer to Toradex's standard build, 
>>>>> simply adding the ath10k and noting more.
>>>>> I keep running into the following error:
>>>>>
>>>>> [ 7.063663] ath10k_pci 0000:01:00.0: BAR 0: assigned [mem 
>>>>> 0x01000000-0x011ff] [ 7.172118] ath10k: pci irq MSI [ 7.198024] 
>>>>> ath10k_pci 0000:01:00.0: Direct firmware load failed with error 2 
>>>>> [ 7.209646] ath10k_pci 0000:01:00.0: Falling back to user helper [ 
>>>>> 8.626488] ath10k: could not fetch board data (-2) [ 8.648471] 
>>>>> ath10k_pci 0000:01:00.0: Direct firmware load failed with error 2 
>>>>> [ 8.693701] ath10k_pci 0000:01:00.0: Falling back to user helper [ 
>>>>> 8.712302] ath10k: could not fetch board data (-2) [ 8.722757] 
>>>>> ath10k: could not fetch firmware files (-2) [ 8.781868] ath10k: 
>>>>> could not probe fw (-2) [ 8.781874] ath10k: failed to register 
>>>>> driver core: -2 [ 8.782041] ath10k_pci: probe of 0000:01:00.0 
>>>>> failed with error -2
>>>>>
>>>>> I've tried the firmware-2, firmware-5 and Candella firmware. I 
>>>>> can't find any information on what this error means or how to debug
this issue.
>>>>> And the vendors are struggling to get me a solution.
>>>>> Any help would be greatly appreciated.
>>>>>
>>>>> Colin McKay
>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> ath10k mailing list
>>>>> ath10k@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>
>>>>
>>>>
>>>
>>>
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
