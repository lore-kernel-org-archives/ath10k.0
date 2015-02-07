Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YK80s-0003Fc-5Z
 for ath10k@lists.infradead.org; Sat, 07 Feb 2015 16:13:43 +0000
Received: by mail-wi0-f171.google.com with SMTP id l15so8692937wiw.4
 for <ath10k@lists.infradead.org>; Sat, 07 Feb 2015 08:13:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALhHN=oQWaHNAG_RApYq3-a4fCDX2BLgA3Cvv9uQ+0eSsJ5YXA@mail.gmail.com>
References: <CAFZrTr7Cy5OA-mgNM=K4SGOy2BKmHjFVRG2_0azS0=hNKW6zew@mail.gmail.com>
 <CALhHN=q+pL+JEC-n1bsa=WeksBKqbU336TcA3HsTKXz=7XCihQ@mail.gmail.com>
 <CAFZrTr6VaTo0it0pjjTeUx0JebDt6ayywr=Z9gm02-7i+WkPDg@mail.gmail.com>
 <CAFZrTr5q9mOTP7wfgok8n9hnzF8ACt6AT7ELEdu813PWuBDvDg@mail.gmail.com>
 <CALhHN=pmaYN8dB437W0mmxkJK_iPBC9nGv+bEQh2dsWDsyMZvQ@mail.gmail.com>
 <CAFZrTr6cHUrnFtRAe0m4jUZF3be4no3H2kb0MPOpazid5_Epyg@mail.gmail.com>
 <CALhHN=oQWaHNAG_RApYq3-a4fCDX2BLgA3Cvv9uQ+0eSsJ5YXA@mail.gmail.com>
Date: Sat, 7 Feb 2015 17:13:19 +0100
Message-ID: <CALhHN=rHm7ZOCZWoh=113xt+ewYGr11FVE7cYbeAer9GrTUknA@mail.gmail.com>
Subject: Re: Failed to start radar detection: -22 (Invalid argument)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Jeremias Blendin <jeremias@blendin.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 7 February 2015 at 16:46, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
> On 7 February 2015 at 15:09, Jeremias Blendin <jeremias@blendin.org> wrote:
>> Hi,
>>
>> I switched to Arch LInux and added this to the configuration of my
>> custom kernel:
>>
>> # cat config.x86_64
>> ...
>> CONFIG_CFG80211_CERTIFICATION_ONUS=y
>> CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS=y
>> CONFIG_ATH_REG_DYNAMIC_USER_CERT_TESTING=y
>>
>> However, I still have the same issue:
>> [    6.506356] cfg80211: Calling CRDA to update world regulatory domain
>> [    6.506399] cfg80211: World regulatory domain updated:
>> [    6.506403] cfg80211:  DFS Master region: unset
>> [    6.506405] cfg80211:   (start_freq - end_freq @ bandwidth),
>> (max_antenna_gain, max_eirp), (dfs_cac_time)
>> [    6.506408] cfg80211:   (2402000 KHz - 2472000 KHz @ 0 KHz), (N/A,
>> 2000 mBm), (N/A)
>> [    6.506411] cfg80211:   (2457000 KHz - 2482000 KHz @ 0 KHz), (N/A,
>> 2000 mBm), (N/A)
>> [    6.506414] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [    6.506417] cfg80211:   (5170000 KHz - 5250000 KHz @ 160000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [    6.506420] cfg80211:   (5250000 KHz - 5330000 KHz @ 160000 KHz),
>> (N/A, 2000 mBm), (0 s)
>> [    6.506423] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz),
>> (N/A, 2000 mBm), (0 s)
>> [    6.506425] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [    6.506428] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000
>> KHz), (N/A, 0 mBm), (N/A)
>> [    6.506502] cfg80211: Calling CRDA for country: DE
>> [    6.552678] cfg80211: Regulatory domain changed to country: DE
>> [    6.552684] cfg80211:  DFS Master region: ETSI
>> [    6.552686] cfg80211:   (start_freq - end_freq @ bandwidth),
>> (max_antenna_gain, max_eirp), (dfs_cac_time)
>> [    6.552690] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [    6.552693] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [    6.552696] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz),
>> (N/A, 2000 mBm), (0 s)
>> [    6.552699] cfg80211:   (5470000 KHz - 5725000 KHz @ 80000 KHz),
>> (N/A, 2698 mBm), (0 s)
>> [    6.552702] cfg80211:   (57240000 KHz - 65880000 KHz @ 2160000
>> KHz), (N/A, 4000 mBm), (N/A)
>> [    6.655192] ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c,
>> 0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1
>> [    6.655199] ath10k_pci 0000:04:00.0: debug 0 debugfs 1 tracing 0
>> dfs 0 testmode 0
>> ...
>> [    7.173654] ath: EEPROM regdomain: 0x0
>> [    7.173659] ath: EEPROM indicates default country code should be used
>> [    7.173661] ath: doing EEPROM country->regdmn map search
>> [    7.173663] ath: country maps to regdmn code: 0x3a
>> [    7.173665] ath: Country alpha2 being used: US
>> [    7.173667] ath: Regpair used: 0x3a
>> [    7.221483] cfg80211: Calling CRDA for country: US
>> [    7.224123] cfg80211: Current regulatory domain intersected:
>> [    7.224130] cfg80211:  DFS Master region: unset
>> [    7.224132] cfg80211:   (start_freq - end_freq @ bandwidth),
>> (max_antenna_gain, max_eirp), (dfs_cac_time)
>> [    7.224136] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz),
>> (N/A, 2000 mBm), (N/A)
>> [    7.224139] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz),
>> (N/A, 1700 mBm), (N/A)
>> [    7.224142] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz),
>> (N/A, 2000 mBm), (0 s)
>> [    7.224145] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000
>> KHz), (N/A, 4000 mBm), (N/A)
>>
>> # iw reg set DE
>> # iw reg get
>> country 98: DFS-UNSET
>> (2402 - 2472 @ 40), (N/A, 20), (N/A)
>> (5170 - 5250 @ 80), (N/A, 17), (N/A), NO-OUTDOOR
>> (5250 - 5330 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
>> (57240 - 63720 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR
>>
> Apply this one:
> [PATCH] cfg80211: reg: setup correct alpha2 after intersection
>
> regulatory code .... and ...
>

And from discussion about this:

Orginal scenario I descibe:
- insmod cfg80211.ko
- iw reg set FR (1)
- modprobe ath10k_pci (US hint)
- intersection and country set as "98"
- no way to setup new country using iw reg set   (here hostapd startup
will failed)

But I can imagine also that we have two cards, both using cfg80211.ko
So, first card driver loaded set regulatory eg. FR
Next we load ath10k --> intersection "98"
Next run hostapd - and fail because no way to change regulatory and
get correct DFS region

BTW:
There is no problem (no intersection) when move "iw reg set" after
modprobe ath10k - seems strange logic issue here ...

So, you can try to set reg after modprobe (in such case you will not
need a patch).

BR
Janusz


>
>> # uname -a
>> Linux kyushu 3.18.5-1-custom #3 SMP PREEMPT Sat Feb 7 14:30:30 CET
>> 2015 x86_64 GNU/Linux
>>
>> # lspci
>> 00:00.0 Host bridge: Intel Corporation Atom processor C2000 SoC
>> Transaction Router (rev 02)
>> 00:01.0 PCI bridge: Intel Corporation Atom processor C2000 PCIe Root
>> Port 1 (rev 02)
>> 00:02.0 PCI bridge: Intel Corporation Atom processor C2000 PCIe Root
>> Port 2 (rev 02)
>> 00:03.0 PCI bridge: Intel Corporation Atom processor C2000 PCIe Root
>> Port 3 (rev 02)
>> 00:0b.0 Co-processor: Intel Corporation Atom processor C2000 nCPM (rev 02)
>> 00:0e.0 Host bridge: Intel Corporation Atom processor C2000 RAS (rev 02)
>> 00:0f.0 IOMMU: Intel Corporation Atom processor C2000 RCEC (rev 02)
>> 00:13.0 System peripheral: Intel Corporation Atom processor C2000
>> SMBus 2.0 (rev 02)
>> 00:14.0 Ethernet controller: Intel Corporation Ethernet Connection I354 (rev 03)
>> 00:14.1 Ethernet controller: Intel Corporation Ethernet Connection I354 (rev 03)
>> 00:14.2 Ethernet controller: Intel Corporation Ethernet Connection I354 (rev 03)
>> 00:14.3 Ethernet controller: Intel Corporation Ethernet Connection I354 (rev 03)
>> 00:16.0 USB controller: Intel Corporation Atom processor C2000 USB
>> Enhanced Host Controller (rev 02)
>> 00:17.0 SATA controller: Intel Corporation Atom processor C2000 AHCI
>> SATA2 Controller (rev 02)
>> 00:18.0 SATA controller: Intel Corporation Atom processor C2000 AHCI
>> SATA3 Controller (rev 02)
>> 00:1f.0 ISA bridge: Intel Corporation Atom processor C2000 PCU (rev 02)
>> 00:1f.3 SMBus: Intel Corporation Atom processor C2000 PCU SMBus (rev 02)
>> 01:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 03)
>> 02:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED
>> Graphics Family (rev 30)
>> 03:00.0 USB controller: Renesas Technology Corp. uPD720201 USB 3.0
>> Host Controller (rev 03)
>> 04:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless
>> Network Adapter
>>
>> 2015-01-30 18:53 GMT+01:00 Janusz Dziedzic <janusz.dziedzic@tieto.com>:
>>> On 29 January 2015 at 20:57, Jeremias Blendin <jeremias@blendin.org> wrote:
>>>> Sorry, forgot to add the list
>>>>
>>>> ---------- Forwarded message ----------
>>>> From: Jeremias Blendin <jeremias@blendin.org>
>>>> Date: 2015-01-29 20:29 GMT+01:00
>>>> Subject: Re: Failed to start radar detection: -22 (Invalid argument)
>>>> To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>>>>
>>>>
>>>> Hi,
>>>>
>>>> thanks for the reply. I already use the latest regulatory db. If I set
>>>> the country to DE or EU, I do not get DFS-ETSI. Also it seems that the
>>>> driver stays with US when I use the modprobe config for cfg80211:
>>>> [ 2230.123217] cfg80211: Calling CRDA for country: EU
>>>> [ 2230.424986] ath10k_pci 0000:04:00.0: irq 87 for MSI/MSI-X
>>>> [ 2230.475776] ath10k: pci irq MSI irq_mode 0 reset_mode 0
>>>> [ 2231.454959] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
>>>> 10.1.467.2-1 api 2 htt 2.1
>>>> [ 2231.998004] ath: EEPROM regdomain: 0x0
>>>> [ 2231.998009] ath: EEPROM indicates default country code should be used
>>>> [ 2231.998012] ath: doing EEPROM country->regdmn map search
>>>> [ 2231.998014] ath: country maps to regdmn code: 0x3a
>>>> [ 2231.998016] ath: Country alpha2 being used: US
>>>> [ 2231.998018] ath: Regpair used: 0x3a
>>>> [ 2232.022444] systemd-udevd[4364]: renamed network interface wlan0 to wlan1
>>>> [ 2233.275022] cfg80211: Calling CRDA for country: US
>>>> [ 2233.278712] cfg80211: Regulatory domain changed to country: US
>>>> [ 2233.278718] cfg80211:  DFS Master region: unset
>>>> [ 2233.278720] cfg80211:   (start_freq - end_freq @ bandwidth),
>>>> (max_antenna_gain, max_eirp), (dfs_cac_time)
>>>> [ 2233.278724] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz),
>>>> (N/A, 3000 mBm), (N/A)
>>>> [ 2233.278728] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz,
>>>> 160000 KHz AUTO), (N/A, 1700 mBm), (N/A)
>>>> [ 2233.278731] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz,
>>>> 160000 KHz AUTO), (N/A, 2300 mBm), (0 s)
>>>> [ 2233.278734] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz),
>>>> (N/A, 3000 mBm), (N/A)
>>>> [ 2233.278737] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000
>>>> KHz), (N/A, 4000 mBm), (N/A)
>>>>
>>>> When I use iw reg set DE this happens:
>>>>
>>>> # iw reg get
>>>> country DE: DFS-UNSET
>>>> (2400 - 2483 @ 40), (N/A, 20)
>>>> (5150 - 5250 @ 80), (N/A, 20), NO-OUTDOOR
>>>> (5250 - 5350 @ 80), (N/A, 20), NO-OUTDOOR, DFS
>>>> (5470 - 5725 @ 160), (N/A, 26), DFS
>>>> (57000 - 66000 @ 2160), (N/A, 40)
>>>>
>>>> Could it be that I need to change the EEPROM?
>>>>
>>> Try this options:
>>> CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS=y
>>> CONFIG_ATH_REG_DYNAMIC_USER_CERT_TESTING=y
>>>
>>> After that iw reg set should work as expected.
>>> One other thing could be two cards and "strange" cfg80211
>>> intersection. In such case try to blacklist one card and try only with
>>> ath10k loaded.
>>>
>>> BR
>>> Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
