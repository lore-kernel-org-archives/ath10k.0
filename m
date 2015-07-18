Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZGQh8-0004Rn-GH
 for ath10k@lists.infradead.org; Sat, 18 Jul 2015 11:54:34 +0000
Received: by laem6 with SMTP id m6so73701448lae.0
 for <ath10k@lists.infradead.org>; Sat, 18 Jul 2015 04:53:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkOeLarxTcOR=aeFoixP-41Jri72gM5MRqUQdNhbQoXOg@mail.gmail.com>
References: <CAFBinCCxWeAwpAU2Qjh3RbLX3YGxDUiVoiaTk-WEhySj6OvxFw@mail.gmail.com>
 <CA+BoTQ=HrQjvSwy0R5YDkkPLcQOi2zwiMAL0OEL2YswAASWnZQ@mail.gmail.com>
 <CAFBinCCymvnL5sTDJJQ6vEZZfchPPG=PeyrXzzt7cPqLJuUBMQ@mail.gmail.com>
 <55A44244.9000109@dd-wrt.com>
 <CA+BoTQn5rERqGT-vUKGV=Bs-rMYzx2132+BDGLTmQpWK=DJW7g@mail.gmail.com>
 <55A4E1FC.9000005@dd-wrt.com>
 <CA+BoTQkOeLarxTcOR=aeFoixP-41Jri72gM5MRqUQdNhbQoXOg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Jul 2015 13:53:35 +0200
Message-ID: <CAFBinCBN53s=wHf6428iaqj9sorQCz7XbGiT+UrhWtiYvUGH7g@mail.gmail.com>
Subject: Re: AP mode firmware crash on QCA9880-BR4A
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Hi Michal,

On Tue, Jul 14, 2015 at 12:50 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Do you guys know if 10.2-00082[1] crashes as well?
I just tested that firmware version and it crashes with the same symptoms.

And because you asked before: firmware-2.bin is the only firmware that
does not crash (and thus managed to get other devices to connect to
this AP).

> If someone is brave enough with spare time one could attempt to
> re-implement the old by-copy beaconing (which copies entire beacon
> frame into WMI command instead of passing just dma pointer; see [2]
> for reference) to see if it makes any difference. If that helps it
> would imply the crash is indeed related to dma beaconing. If it
> doesn't it would prove nothing though.
I have written this hack to make it use non-DMA beacon transfers: [0]
I am not sure whether it's correct or not, but it seems to suffer from
the same problem: [1]

You also requested a more detailed debug log - you can also find it here: [2].
(my hack is not applied here)
I chose debug mask 0xFFFFBFFF because I cannot read anything with
ATH10K_DBG_PCI_PS enabled.

As before: I have masked the MAC address, but apart from that the
logfile is unmodified.


Regards,
Martin


[0] https://paste.kde.org/px7uzinki
[1] https://paste.kde.org/poa7lwadh
[2] https://paste.kde.org/p1p9d3vle


debug log with my "non DMA beacon transfer" hack:
<7>[  158.220000] ath10k_pci 0000:02:00.0: boot hif power up
<7>[  158.220000] ath10k_pci 0000:02:00.0: boot 988x chip reset
<7>[  158.220000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  158.252000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  158.260000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  158.272000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  158.272000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  158.324000] ath10k_pci 0000:02:00.0: bmi read address 0x400810 length 4
<7>[  158.324000] ath10k_pci 0000:02:00.0: bmi write address 0x400810 length 4
<7>[  158.324000] ath10k_pci 0000:02:00.0: bmi write address 0x400844 length 4
<7>[  158.324000] ath10k_pci 0000:02:00.0: bmi write address 0x400904 length 4
<7>[  158.324000] ath10k_pci 0000:02:00.0: bmi read address 0x4008ac length 4
<7>[  158.324000] ath10k_pci 0000:02:00.0: boot push board extended
data addr 0x0
<7>[  158.324000] ath10k_pci 0000:02:00.0: bmi read address 0x400854 length 4
<7>[  158.324000] ath10k_pci 0000:02:00.0: bmi write address 0x401cc0
length 2116
<7>[  158.328000] ath10k_pci 0000:02:00.0: bmi write address 0x400858 length 4
<7>[  158.328000] ath10k_pci 0000:02:00.0: boot cal file downloaded
<7>[  158.328000] ath10k_pci 0000:02:00.0: boot using calibration mode file
<7>[  158.328000] ath10k_pci 0000:02:00.0: boot uploading firmware
image c03afc64 len 237784 mode normal
<7>[  158.328000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc03afc64 length 237784
<7>[  158.328000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
<7>[  158.328000] ath10k_pci 0000:02:00.0: bmi lz data buffer
0xc03afc64 length 237784
<7>[  159.348000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
<7>[  159.352000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
<7>[  159.352000] ath10k_pci 0000:02:00.0: bmi done
<7>[  159.352000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
<7>[  159.352000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
<7>[  159.352000] ath10k_pci 0000:02:00.0: boot hif start
<7>[  159.352000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
ul pipe 0 dl pipe 1 eid 0 ready
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
eid 0 TX flow control disabled
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc service HTT Data
does not allocate target credits
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
ul pipe 4 dl pipe 1 eid 1 ready
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul
pipe 3 dl pipe 2 eid 2 ready
<7>[  159.356000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00
00 07 00 00 00 07 00 00 00 09 00 00 00  ................
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00
00 0a 00 00 00 03 00 00 00 00 00 00 00  ................
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units
0 num_unit_info 2 unit size 440 actual units 145
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
<7>[  159.356000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x6270000
<7>[  159.356000] ath10k_pci 0000:02:00.0: wmi init 10.2
<7>[  159.376000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
<7>[  159.380000] ath10k_pci 0000:02:00.0: htt target version 2.1
<7>[  159.380000] ath10k_pci 0000:02:00.0: wmi disable pktlog
<7>[  159.380000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
<7>[  159.380000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
<7>[  159.380000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
<7>[  159.380000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
<7>[  159.380000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq
5180 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq
5200 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq
5220 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq
5240 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq
5260 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq
5280 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq
5300 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq
5320 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq
5500 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq
5520 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq
5540 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq
5560 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq
5580 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq
5600 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq
5620 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq
5640 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq
5660 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq
5680 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq
5700 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  159.388000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37
rd2g 37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
<7>[  159.392000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
<7>[  159.396000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
<7>[  159.396000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type
1 subtype 0 macaddr c8:pr:iv:at:e0:c1
<7>[  159.396000] ath10k_pci 0000:02:00.0: vdev param 0 not supported
by firmware
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
38 value 3747
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
39 value 3895
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
40 value 3900
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 1 value -1
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 2 value -1
<7>[  159.396000] ath10k_pci 0000:02:00.0: mac txpower 0
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 0
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 0
<7>[  159.396000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  159.396000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
<7>[  159.396000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 1
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 1
<7>[  159.396000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 1n
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 1
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  159.396000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  159.396000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<6>[  159.396000] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
<7>[  159.404000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<6>[  159.408000] device wlan0 entered promiscuous mode
<7>[  159.412000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  159.416000] ath10k_pci 0000:02:00.0: wmi 10x start scan
<7>[  159.416000] ath10k_pci 0000:02:00.0: scan event started type 1
reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state starting
(1)
<7>[  159.416000] ath10k_pci 0000:02:00.0: scan event bss channel type
4 reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
<7>[  159.420000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[  159.420000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5180 cmd_flags 0 noise_floor 0 rx_clear_count 1547947 cycle_count
4641948
<7>[  159.568000] ath10k_pci 0000:02:00.0: scan event bss channel type
4 reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[  159.568000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5180 cmd_flags 1 noise_floor -103 rx_clear_count 1570011 cycle_count
17492709
<7>[  159.572000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[  159.572000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5200 cmd_flags 0 noise_floor 0 rx_clear_count 1570656 cycle_count
17845908
<7>[  159.716000] ath10k_pci 0000:02:00.0: scan event bss channel type
4 reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[  159.716000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5200 cmd_flags 1 noise_floor -103 rx_clear_count 1572146 cycle_count
30697549
<7>[  159.716000] ath10k_pci 0000:02:00.0: scan event completed type 2
reason 0 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
<7>[  160.228000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85cac130
<7>[  160.228000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  160.228000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85cac130 vdev_id 0
<7>[  160.228000] ath10k_pci 0000:02:00.0: mac vdev 0 start
center_freq 5180 phymode 11ac-vht80
<7>[  160.228000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0
flags: 0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
<7>[  160.236000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac chanctx change freq
5180 width 3 ptr 85cac130 changed 2
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
<7>[  160.236000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode
to staggered
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0
assoc id 0 bssid c8:pr:iv:at:e0:c1
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac vdev 0 up
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
<7>[  160.236000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
<7>[  160.236000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[  160.236000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<6>[  160.236000] br-lan: port 2(wlan0) entered forwarding state
<6>[  160.240000] br-lan: port 2(wlan0) entered forwarding state
<6>[  160.244000] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
<7>[  160.332000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  160.356000] ath10k_pci 0000:02:00.0: wmi event debug mesg len 232
<7>[  161.784000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<6>[  162.244000] br-lan: port 2(wlan0) entered forwarding state
<3>[  169.976000] ath10k_pci 0000:02:00.0: firmware crashed! (uuid
729b2c24-3e8d-4a7c-9013-79562a0ad00d)
<6>[  169.984000] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal file max_sta 128
<6>[  169.996000] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 0
dfs 1 testmode 1
<4>[  170.016000] ath10k_pci 0000:02:00.0: failed to read diag value
at 0x1c100804: -16
<4>[  170.024000] ath10k_pci 0000:02:00.0: failed to get memcpy hi
address for firmware address 4: -16
<3>[  170.032000] ath10k_pci 0000:02:00.0: failed to read firmware
dump area: -16
<7>[  170.040000] ath10k_pci 0000:02:00.0: boot hif stop
<7>[  170.040000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  170.108000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.116000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.128000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  170.128000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  170.128000] ath10k_pci 0000:02:00.0: boot warm reset complete
<6>[  170.128000] ieee80211 phy0: Hardware restart was requested
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  170.200000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.208000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.220000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  170.220000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  170.220000] ath10k_pci 0000:02:00.0: boot warm reset complete
<7>[  170.220000] ath10k_pci 0000:02:00.0: boot hif power down
<7>[  170.220000] ath10k_pci 0000:02:00.0: boot hif power up
<7>[  170.220000] ath10k_pci 0000:02:00.0: boot 988x chip reset
<7>[  170.220000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  170.288000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.296000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot warm reset complete
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.308000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<4>[  170.320000] ath10k_pci 0000:02:00.0: failed to read diag value
at 0x1c100800: -16
<4>[  170.324000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
<7>[  170.332000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  170.400000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.408000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot warm reset complete
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.420000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<4>[  170.432000] ath10k_pci 0000:02:00.0: failed to read diag value
at 0x1c100800: -16
<4>[  170.436000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
<7>[  170.444000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  170.512000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.520000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot warm reset complete
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  170.532000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<4>[  170.544000] ath10k_pci 0000:02:00.0: failed to read diag value
at 0x1c100800: -16
<4>[  170.548000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
<7>[  170.556000] ath10k_pci 0000:02:00.0: boot cold reset
<7>[  170.636000] ath10k_pci 0000:02:00.0: bmi read address 0x400810 length 4
<7>[  170.636000] ath10k_pci 0000:02:00.0: bmi write address 0x400810 length 4
<7>[  170.636000] ath10k_pci 0000:02:00.0: bmi write address 0x400844 length 4
<7>[  170.636000] ath10k_pci 0000:02:00.0: bmi write address 0x400904 length 4
<7>[  170.636000] ath10k_pci 0000:02:00.0: bmi read address 0x4008ac length 4
<7>[  170.636000] ath10k_pci 0000:02:00.0: boot push board extended
data addr 0x0
<7>[  170.636000] ath10k_pci 0000:02:00.0: bmi read address 0x400854 length 4
<7>[  170.636000] ath10k_pci 0000:02:00.0: bmi write address 0x401cc0
length 2116
<7>[  170.640000] ath10k_pci 0000:02:00.0: bmi write address 0x400858 length 4
<7>[  170.640000] ath10k_pci 0000:02:00.0: boot cal file downloaded
<7>[  170.640000] ath10k_pci 0000:02:00.0: boot using calibration mode file
<7>[  170.640000] ath10k_pci 0000:02:00.0: boot uploading firmware
image c03afc64 len 237784 mode normal
<7>[  170.640000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc03afc64 length 237784
<7>[  170.640000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
<7>[  170.640000] ath10k_pci 0000:02:00.0: bmi lz data buffer
0xc03afc64 length 237784
<7>[  171.644000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
<7>[  171.644000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
<7>[  171.644000] ath10k_pci 0000:02:00.0: bmi done
<7>[  171.644000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
<7>[  171.644000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
<7>[  171.644000] ath10k_pci 0000:02:00.0: boot hif start
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
ul pipe 0 dl pipe 1 eid 0 ready
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
eid 0 TX flow control disabled
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc service HTT Data
does not allocate target credits
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
ul pipe 4 dl pipe 1 eid 1 ready
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul
pipe 3 dl pipe 2 eid 2 ready
<7>[  171.648000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00
00 07 00 00 00 07 00 00 00 09 00 00 00  ................
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00
00 0a 00 00 00 03 00 00 00 00 00 00 00  ................
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units
0 num_unit_info 2 unit size 440 actual units 145
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
<7>[  171.648000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x5de0000
<7>[  171.648000] ath10k_pci 0000:02:00.0: wmi init 10.2
<7>[  171.668000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
<7>[  171.672000] ath10k_pci 0000:02:00.0: htt target version 2.1
<7>[  171.672000] ath10k_pci 0000:02:00.0: wmi disable pktlog
<7>[  171.672000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
<7>[  171.672000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
<7>[  171.672000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
<7>[  171.672000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
<7>[  171.672000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq
5180 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq
5200 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq
5220 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq
5240 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq
5260 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq
5280 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq
5300 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq
5320 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq
5500 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq
5520 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq
5540 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq
5560 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq
5580 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq
5600 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq
5620 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq
5640 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq
5660 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq
5680 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq
5700 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  171.680000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37
rd2g 37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
<7>[  171.688000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
<7>[  171.688000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
<7>[  171.688000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type
1 subtype 0 macaddr c8:pr:iv:at:e0:c1
<7>[  171.688000] ath10k_pci 0000:02:00.0: vdev param 0 not supported
by firmware
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
38 value 3747
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
39 value 3895
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
40 value 3900
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 1 value -1
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 2 value -1
<7>[  171.688000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<7>[  171.688000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85cac130
<7>[  171.688000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  171.688000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85cac130 vdev_id 0
<7>[  171.688000] ath10k_pci 0000:02:00.0: mac vdev 0 start
center_freq 5180 phymode 11ac-vht80
<7>[  171.688000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0
flags: 0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
<7>[  171.696000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
<7>[  171.696000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode
to staggered
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0
assoc id 0 bssid c8:pr:iv:at:e0:c1
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac vdev 0 up
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
<7>[  171.696000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 2
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 2
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 2n
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 2
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
<7>[  171.696000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 4 len 16
<7>[  171.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 31 value 1
<6>[  171.696000] ath10k_pci 0000:02:00.0: device successfully recovered
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.116000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.124000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.136000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.136000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.152000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.160000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.172000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.172000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.172000] ath10k_pci 0000:02:00.0: boot warm reset complete
<6>[  172.172000] ieee80211 phy0: Hardware restart was requested
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.208000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.216000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.228000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.228000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.244000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.252000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.264000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.264000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.264000] ath10k_pci 0000:02:00.0: boot warm reset complete
<7>[  172.264000] ath10k_pci 0000:02:00.0: boot hif power down
<7>[  172.264000] ath10k_pci 0000:02:00.0: boot hif power up
<7>[  172.264000] ath10k_pci 0000:02:00.0: boot 988x chip reset
<7>[  172.264000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.296000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.304000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.316000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.316000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.396000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.404000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.416000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.416000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.496000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.504000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.516000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.516000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.612000] ath10k_pci 0000:02:00.0: boot cold reset complete
<7>[  172.612000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[  172.612000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.620000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot qca988x chip reset
complete (cold)
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6818000
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6834000
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6819000
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a681a000
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6990000
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a681b000
<7>[  172.632000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a681c000
<7>[  172.640000] ath10k_pci 0000:02:00.0: bmi start
<7>[  172.640000] ath10k_pci 0000:02:00.0: bmi write address 0x400800 length 4
<7>[  173.652000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
<7>[  173.652000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
<7>[  173.652000] ath10k_pci 0000:02:00.0: bmi done
<7>[  173.652000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
<7>[  173.652000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
<7>[  173.652000] ath10k_pci 0000:02:00.0: boot hif start
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
ul pipe 0 dl pipe 1 eid 0 ready
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
eid 0 TX flow control disabled
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc service HTT Data
does not allocate target credits
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
ul pipe 4 dl pipe 1 eid 1 ready
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul
pipe 3 dl pipe 2 eid 2 ready
<7>[  173.656000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00
00 07 00 00 00 07 00 00 00 09 00 00 00  ................
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00
00 0a 00 00 00 03 00 00 00 00 00 00 00  ................
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units
0 num_unit_info 2 unit size 440 actual units 145
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
<7>[  173.656000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x5de0000
<7>[  173.656000] ath10k_pci 0000:02:00.0: wmi init 10.2
<7>[  173.676000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
<7>[  173.680000] ath10k_pci 0000:02:00.0: htt target version 2.1
<7>[  173.680000] ath10k_pci 0000:02:00.0: wmi disable pktlog
<7>[  173.680000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
<7>[  173.680000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
<7>[  173.680000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
<7>[  173.680000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
<7>[  173.680000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq
5180 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq
5200 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq
5220 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq
5240 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq
5260 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq
5280 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq
5300 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq
5320 maxpower 40 regpower 40 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq
5500 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq
5520 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq
5540 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq
5560 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq
5580 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq
5600 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq
5620 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq
5640 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq
5660 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq
5680 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq
5700 maxpower 54 regpower 54 antenna 0 mode 0
<7>[  173.688000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37
rd2g 37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
<7>[  173.696000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
<7>[  173.696000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
<7>[  173.696000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type
1 subtype 0 macaddr c8:pr:iv:at:e0:c1
<7>[  173.696000] ath10k_pci 0000:02:00.0: vdev param 0 not supported
by firmware
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
38 value 3747
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
39 value 3895
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
40 value 3900
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 1 value -1
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 2 value -1
<7>[  173.696000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<7>[  173.696000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85cac130
<7>[  173.696000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  173.696000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85cac130 vdev_id 0
<7>[  173.696000] ath10k_pci 0000:02:00.0: mac vdev 0 start
center_freq 5180 phymode 11ac-vht80
<7>[  173.696000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0
flags: 0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
<7>[  173.704000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
<7>[  173.704000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode
to staggered
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0
assoc id 0 bssid c8:pr:iv:at:e0:c1
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac vdev 0 up
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
<7>[  173.704000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 2
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 2
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 2n
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 2
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
<7>[  173.704000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 4 len 16
<7>[  173.704000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 31 value 1
<6>[  173.704000] ath10k_pci 0000:02:00.0: device successfully recovered
<7>[  174.656000] ath10k_pci 0000:02:00.0: wmi event debug mesg len 232


debug log (0xFFFFBFFF) without my hack applied:
<7>[   88.140000] ath10k_pci 0000:02:00.0: boot hif power up
<7>[   88.140000] ath10k_pci 0000:02:00.0: boot 988x chip reset
<7>[   88.140000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6828000
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6822000
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6829000
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a682a000
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6a00000
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a682b000
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a682c000
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[   88.208000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   88.216000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot warm reset complete
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6828000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6822000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6829000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a682a000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6a00000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a682b000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a682c000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot chip reset complete (warm)
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6828000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6822000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6829000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a682a000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6a00000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a682b000
<7>[   88.228000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a682c000
<7>[   88.240000] ath10k_pci 0000:02:00.0: bmi start
<7>[   88.240000] ath10k_pci 0000:02:00.0: bmi write address 0x400800 length 4
<7>[   89.268000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
<7>[   89.272000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
<7>[   89.272000] ath10k_pci 0000:02:00.0: pci hif set callbacks
<7>[   89.272000] ath10k_pci 0000:02:00.0: pci hif get default pipe
<7>[   89.272000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   89.272000] ath10k_pci 0000:02:00.0: bmi done
<7>[   89.272000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
<7>[   89.272000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
<7>[   89.272000] ath10k_pci 0000:02:00.0: boot hif start
<7>[   89.272000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   89.272000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 00 0c
00 00 00 00 00 01 00 02 00 00 07 16 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 01 00 00
00                                      ....
<7>[   89.276000] ath10k_pci 0000:02:00.0: Target ready! transmit
resources: 2 size:1792
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
ul pipe 0 dl pipe 1 eid 0 ready
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
eid 0 TX flow control disabled
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc service HTT Data
does not allocate target credits
<7>[   89.276000] ath10k_pci 0000:02:00.0:
ath10k_htc_build_tx_ctrl_skb: skb 86ef39e0
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x062719ac len 16 n_items 1
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 00
01 08 00 00 03 00 00 02 00 00 03 08 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 0 skb 86ef39e0
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 00 0c
00 00 01 00 00 03 00 00 03 00 01 d0 07  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00                                      ....
<7>[   89.276000] ath10k_pci 0000:02:00.0: HTC Service HTT Data
connect response: status: 0x0, assigned ep: 0x1
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
ul pipe 4 dl pipe 1 eid 1 ready
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
<7>[   89.276000] ath10k_pci 0000:02:00.0:
ath10k_htc_build_tx_ctrl_skb: skb 86ef39e0
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x062724cc len 16 n_items 1
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 00
01 08 00 00 04 ff ff 02 00 00 01 00 02 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 0 skb 86ef39e0
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 00 0c
00 00 02 00 00 03 00 00 01 00 02 b4 06  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00                                      ....
<7>[   89.276000] ath10k_pci 0000:02:00.0: HTC Service WMI connect
response: status: 0x0, assigned ep: 0x2
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul
pipe 3 dl pipe 2 eid 2 ready
<7>[   89.276000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
<7>[   89.276000] ath10k_pci 0000:02:00.0:
ath10k_htc_build_tx_ctrl_skb: skb 86ef39e0
<7>[   89.276000] ath10k_pci 0000:02:00.0: HTC is using TX credit flow control
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06272fec len 20 n_items 1
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 00
01 0c 00 00 05 00 00 05 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   89.276000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 0 skb 86ef39e0
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 180
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 ac
00 00 03 00 00 00 80 00 00 46 00 00 41  ............F..A
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 01 00 00
00 01 00 00 00 00 00 00 00 0e 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 07 00 00
00 07 00 00 00 09 00 00 00 0f 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 0a 00 00
00 03 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000050: 00 00 00
00 00 00 00 00 00 00 00 00 03 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000060: 5b 08 00
00 b2 01 80 33 ea ff 00 00 3f 00 00 00  [......3....?...
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000070: 3f 00 00
00 3a 83 00 00 1f 00 00 00 07 00 00 00  ?...:...........
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000080: c0 0b 00
00 01 90 1f 00 08 09 00 00 ac 0a 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 00000090: 2e 13 00
00 d4 17 00 00 00 00 00 00 04 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 000000a0: 01 00 00
00 01 00 00 00 b8 01 00 00 02 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci rx: 000000b0: 00 00 00
00                                      ....
<7>[   89.276000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dcc20
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00
00 07 00 00 00 07 00 00 00 09 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00
00 0a 00 00 00 03 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units
0 num_unit_info 2 unit size 440 actual units 145
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
<7>[   89.276000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x6280000
<7>[   89.276000] ath10k_pci 0000:02:00.0: wmi init 10.2
<7>[   89.276000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06273b00 len 176 n_items 1
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 a8 00 00 04 00 00 00 a0 00 00 10 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 90
00 00 00 02 00 00 00 00 01 00 00 80 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 07
00 00 00 07 00 00 00 64 00 00 00 64 00 00 00  ........d...d...
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 64
00 00 00 28 00 00 00 01 00 00 00 04 00 00 00  d...(...........
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 02
00 00 00 02 00 00 00 08 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 00 00 00 00 00 04 00 00 20 00 00 00  ............ ...
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 01
00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 90
05 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000080: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 00000090: 01
00 00 00 01 00 00 00 01 00 00 00 00 00 28 06  ..............(.
<7>[   89.276000] ath10k_pci 0000:02:00.0: pci tx data: 000000a0: 38
f9 00 00 00 00 00 00 00 00 00 00 00 00 00 00  8...............
<7>[   89.276000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef39e0
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 140
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 84
00 00 04 00 00 10 90 00 00 50 20 31 34  ............P 14
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 35 20 56
20 31 36 20 54 20 34 34 33 0a 00 00 00  5 V 16 T 443....
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000050: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000060: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000070: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000080: 00 00 00
00 00 00 00 00 00 00 00 00              ............
<7>[   89.288000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dcb60
<7>[   89.288000] ath10k_pci 0000:02:00.0: wmi print 'P 145 V 16 T 443'
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 140
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 84
00 00 05 00 00 10 90 00 00 5f 77 6c 61  ............_wla
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 6e 5f 72
74 74 5f 65 6e 61 62 6c 65 00 00 00 00  n_rtt_enable....
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000050: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000060: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000070: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.288000] ath10k_pci 0000:02:00.0: pci rx: 00000080: 00 00 00
00 00 00 00 00 00 00 00 00              ............
<7>[   89.288000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dcaa0
<7>[   89.288000] ath10k_pci 0000:02:00.0: wmi print '_wlan_rtt_enable'
<7>[   89.296000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.296000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 07 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.296000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.296000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 32
<7>[   89.296000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 18
00 00 06 00 00 01 80 00 00 46 00 00 41  ............F..A
<7>[   89.296000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 01 00 00
00 c8 pr iv at e0 c1 00 00 00 00 00 00  .......U........
<7>[   89.296000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc9e0
<7>[   89.296000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cfbca0 len 12 n_items 1
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 01
01 04 00 00 02 00 00 00 00 00 00              ............
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 12
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 04
00 00 08 00 00 00 01 02 00              ............
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   89.300000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 1 skb 85cac020
<7>[   89.300000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 8677e260
<7>[   89.300000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x0
<7>[   89.300000] ath10k_pci 0000:02:00.0: htt target version 2.1
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cfce20 len 48 n_items 1
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 01
01 28 00 00 03 00 00 02 01 00 00 00 e0 0d 06  ..(.............
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
60 0f 06 00 08 80 07 ff ff ff 03 2f 00 3f 00  .`........../.?.
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 0f
00 19 00 03 00 0e 00 06 00 09 00 01 00 02 00  ................
<7>[   89.300000] ath10k_pci 0000:02:00.0: wmi disable pktlog
<7>[   89.300000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cfd6c0 len 12 n_items 1
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 04 00 86 05 da 40 08 90 00 00              .......@....
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 09 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.300000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.300000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef3020
<7>[   89.300000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
<7>[   89.300000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cfe0e0 len 20 n_items 1
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 06 00 00 06 90 00 00 1e 00 00 00  ................
<7>[   89.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00                                      ....
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0a 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.304000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.304000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef3020
<7>[   89.304000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
<7>[   89.304000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cfe200 len 20 n_items 1
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 07 00 00 06 90 00 00 0a 00 00 00  ................
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00                                      ....
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0b 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.304000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.304000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 85cade60
<7>[   89.304000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
<7>[   89.304000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cfec20 len 20 n_items 1
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 08 00 00 06 90 00 00 29 00 00 00  ............)...
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   89.304000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef3020
<7>[   89.304000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
<7>[   89.304000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 0)
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cff640 len 20 n_items 1
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 09 00 00 06 90 00 00 1f 00 00 00  ................
<7>[   89.304000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   89.304000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 85cade60
<7>[   89.304000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
<7>[   89.308000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.308000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0c 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.308000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 1)
<7>[   89.308000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.308000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0d 00 00 01 04 00 00 02 01 00 00  ................
<7>[   89.308000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.308000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05cff760 len 20 n_items 1
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 0a 00 00 06 90 00 00 21 00 00 00  ............!...
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00                                      ....
<7>[   89.312000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef3020
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq
5180 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq
5200 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq
5220 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq
5240 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq
5260 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq
5280 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq
5300 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq
5320 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq
5500 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq
5520 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq
5540 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq
5560 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq
5580 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq
5600 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq
5620 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq
5640 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq
5660 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq
5680 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq
5700 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   89.312000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 0)
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d02fc0 len 472 n_items 1
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 d0 01 00 0b 00 00 02 90 00 00 13 00 00 00  ................
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 3c
14 00 00 3c 14 00 00 00 00 00 00 40 19 00 00  <...<.......@...
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
28 28 00 00 00 00 00 50 14 00 00 50 14 00 00  .((.....P...P...
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 40 19 00 00 00 28 28 00 00 00 00 00  ....@....((.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 64
14 00 00 64 14 00 00 00 00 00 00 40 19 00 00  d...d.......@...
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
28 28 00 00 00 00 00 78 14 00 00 78 14 00 00  .((.....x...x...
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 00
00 00 00 40 19 00 00 00 28 28 00 00 00 00 00  ....@....((.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 8c
14 00 00 8c 14 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000080: 00
28 28 00 00 00 00 00 a0 14 00 00 a0 14 00 00  .((.............
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000090: 00
00 00 00 c0 1c 00 00 00 28 28 00 00 00 00 00  .........((.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000000a0: b4
14 00 00 b4 14 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000000b0: 00
28 28 00 00 00 00 00 c8 14 00 00 c8 14 00 00  .((.............
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000000c0: 00
00 00 00 80 1c 00 00 00 28 28 00 00 00 00 00  .........((.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000000d0: 7c
15 00 00 7c 15 00 00 00 00 00 00 c0 1c 00 00  |...|...........
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000000e0: 00
36 36 00 00 00 00 00 90 15 00 00 90 15 00 00  .66.............
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000000f0: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000100: a4
15 00 00 a4 15 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000110: 00
36 36 00 00 00 00 00 b8 15 00 00 b8 15 00 00  .66.............
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000120: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000130: cc
15 00 00 cc 15 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000140: 00
36 36 00 00 00 00 00 e0 15 00 00 e0 15 00 00  .66.............
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000150: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000160: f4
15 00 00 f4 15 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000170: 00
36 36 00 00 00 00 00 08 16 00 00 08 16 00 00  .66.............
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000180: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 00000190: 1c
16 00 00 1c 16 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000001a0: 00
36 36 00 00 00 00 00 30 16 00 00 30 16 00 00  .66.....0...0...
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000001b0: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000001c0: 44
16 00 00 44 16 00 00 00 00 00 00 80 1c 00 00  D...D...........
<7>[   89.312000] ath10k_pci 0000:02:00.0: pci tx data: 000001d0: 00
36 36 00 00 00 00 00                          .66.....
<7>[   89.312000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37
rd2g 37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
<7>[   89.312000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef3020
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0e 00 00 01 04 00 00 02 01 00 00  ................
<7>[   89.316000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 1)
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0f 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.316000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.316000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d032a0 len 36 n_items 1
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 1c 00 00 0c 00 00 04 90 00 00 37 00 00 00  ............7...
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 37
00 00 00 37 00 00 00 30 00 00 00 30 00 00 00  7...7...0...0...
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 02
00 00 00                                      ....
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.316000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 10 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.316000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.316000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef4c20
<7>[   89.316000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
<7>[   89.316000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
<7>[   89.316000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type
1 subtype 0 macaddr c8:pr:iv:at:e0:c1
<7>[   89.316000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06f19240 len 32 n_items 1
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 18 00 00 0d 00 00 10 90 00 00 00 00 00 00  ................
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00 00 00 00 00 c8 pr iv at e0 c1 00 00  ...........U....
<7>[   89.320000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef4c20
<7>[   89.320000] ath10k_pci 0000:02:00.0: vdev param 0 not supported
by firmware
<7>[   89.320000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 0)
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06f19360 len 24 n_items 1
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 ff 0e ff ff 1c 90 00 00 00 00 00 00  ................
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: c8
pr iv at e0 c1 00 00                          ...U....
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 0c
00 00 11 00 00 03 00 9a 00 c8 91 f9 55  ...............U
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 8c c1 00
00                                      ....
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   89.320000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 1 skb 86ef30e0
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 86ef2e60
<7>[   89.320000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x3
<7>[   89.320000] ath10k_pci 0000:02:00.0: htt peer map vdev 0 peer
c8:pr:iv:at:e0:c1 id 154
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 0c
00 00 12 00 00 03 00 8a 00 c8 91 f9 55  ...............U
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 8c c1 00
00                                      ....
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 860589e0
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06109240 len 24 n_items 1
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 08 17 00 00 19 90 00 00 00 00 00 00  ................
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 2b
00 00 00 11 00 00 00                          +.......
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 1d 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.320000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef4c20
<7>[   89.320000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06109360 len 24 n_items 1
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 18 00 00 19 90 00 00 00 00 00 00  ................
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 18
00 00 00 00 00 00 00                          ........
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 1e 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.320000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef30e0
<7>[   89.320000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 1
<7>[   89.320000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 1
<7>[   89.320000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610a680 len 24 n_items 1
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 19 00 00 19 90 00 00 00 00 00 00  ................
<7>[   89.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 07
00 00 00 01 00 00 00                          ........
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 1f 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   89.324000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.324000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef30e0
<7>[   89.324000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 1n
<7>[   89.324000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 1
<7>[   89.324000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610b0a0 len 24 n_items 1
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 65 1a 31 0a 19 90 00 00 00 00 00 00  ....e.1.........
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 08
00 00 00 01 00 00 00                          ........
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 20 00 00 01 04 00 01 02 01 b4 06  ..... ..........
<7>[   89.324000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.324000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef30e0
<7>[   89.324000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   89.324000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610bac0 len 108 n_items 1
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 6b 1b 20 31 09 90 00 00 00 00 00 00  ..d.k. 1........
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 23 00 00 01 04 00 01 02 01 b4 06  .....#..........
<7>[   89.324000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 1)
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610d140 len 108 n_items 1
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 08 1e 00 00 09 90 00 00 0f 00 00 00  ..d.............
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: ff
03 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 0f 00 00 00 ff 03 00 00 07 00 00 00  ................
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 02 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 02 00 00 00  ................
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   89.324000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef4c20
<7>[   89.324000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.324000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 24 00 00 01 04 00 01 02 01 b4 06  .....$..........
<7>[   89.324000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<6>[   89.324000] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
<7>[   89.336000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<6>[   89.344000] device wlan0 entered promiscuous mode
<7>[   89.348000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   89.348000] ath10k_pci 0000:02:00.0: wmi 10x start scan
<7>[   89.348000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d087a0 len 164 n_items 1
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 9c 00 00 1f 00 00 00 90 00 00 00 a0 00 00  ................
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
a0 00 00 00 00 00 00 01 00 00 00 1f 00 00 00  ................
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 32
00 00 00 96 00 00 00 32 00 00 00 f4 01 00 00  2.......2.......
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 20 4e 00 00  ............ N..
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 05
00 00 00 1d 00 00 00 01 00 00 00 02 00 00 00  ................
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 3c
14 00 00 50 14 00 00 03 00 00 00 01 00 00 00  <...P...........
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: ff
ff ff ff ff ff 00 00 04 00 00 00 34 00 00 00  ............4...
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 01
08 0c 12 18 24 30 48 60 6c 2d 1a e3 19 1b ff  .....$0H`l-.....
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000080: ff
ff 00 00 00 00 00 00 00 00 00 01 00 00 00 00  ................
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 00000090: 00
00 00 00 00 00 bf 0c b2 01 80 33 ea ff 00 00  ...........3....
<7>[   89.348000] ath10k_pci 0000:02:00.0: pci tx data: 000000a0: ea
ff 00 00                                      ....
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 36
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 1c
00 00 25 00 00 00 90 00 00 01 00 00 00  .....%..........
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 03 00 00
00 00 00 00 00 01 a0 00 00 00 a0 00 00  ................
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   89.352000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc920
<7>[   89.352000] ath10k_pci 0000:02:00.0: scan event started type 1
reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state starting
(1)
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 36
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 1c
00 00 26 00 00 00 90 00 00 04 00 00 00  .....&..........
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 03 00 00
00 00 00 00 00 01 a0 00 00 00 a0 00 00  ................
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   89.352000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc860
<7>[   89.352000] ath10k_pci 0000:02:00.0: scan event bss channel type
4 reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
<7>[   89.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 85cad9e0
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 27 00 00 01 04 00 01 02 01 b4 06  .....'..........
<7>[   89.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 28
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 14
00 00 28 00 00 0f 00 00 00 3c 14 00 00  .....(......<...
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 3c 14 00
00 00 00 00 00 00 00 00 00              <...........
<7>[   89.352000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   89.352000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 8656f7a0
<7>[   89.352000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0xF
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 36
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 1c
00 00 29 00 00 00 90 00 00 08 00 00 00  .....)..........
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 03 00 00
00 3c 14 00 00 01 a0 00 00 00 a0 00 00  ....<...........
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   89.356000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc7a0
<7>[   89.356000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 40
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 20
00 00 2a 00 00 0c 90 00 00 00 00 00 00  .. ..*..........
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 3c 14 00
00 00 00 00 00 00 00 00 00 76 62 17 00  <...........vb..
<7>[   89.356000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 8b c1 56
00 d8 00 00 00                          ..V.....
<7>[   89.356000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc6e0
<7>[   89.356000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5180 cmd_flags 0 noise_floor 0 rx_clear_count 1532534 cycle_count
5685643
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 36
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 1c
00 00 2b 00 00 00 90 00 00 04 00 00 00  .....+..........
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 03 00 00
00 3c 14 00 00 01 a0 00 00 00 a0 00 00  ....<...........
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   89.500000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc620
<7>[   89.500000] ath10k_pci 0000:02:00.0: scan event bss channel type
4 reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 40
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 20
00 00 2c 00 00 0c 90 00 00 00 00 00 00  .. ..,..........
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 3c 14 00
00 01 00 00 00 9a ff ff ff 76 62 17 00  <...........vb..
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000020: d4 d9 1a
01 d8 00 00 00                          ........
<7>[   89.500000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc560
<7>[   89.500000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5180 cmd_flags 1 noise_floor -102 rx_clear_count 1532534 cycle_count
18536916
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 28
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 14
00 00 2d 00 00 0f 00 00 00 50 14 00 00  .....-......P...
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 50 14 00
00 00 00 00 00 00 00 00 00              P...........
<7>[   89.500000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   89.500000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 8656f6e0
<7>[   89.500000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0xF
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 36
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 1c
00 00 2e 00 00 00 90 00 00 08 00 00 00  ................
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 03 00 00
00 50 14 00 00 01 a0 00 00 00 a0 00 00  ....P...........
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   89.504000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc4a0
<7>[   89.504000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 40
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 20
00 00 2f 00 00 0c 90 00 00 00 00 00 00  .. ../..........
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 50 14 00
00 00 00 00 00 00 00 00 00 4d 63 17 00  P...........Mc..
<7>[   89.504000] ath10k_pci 0000:02:00.0: pci rx: 00000020: d3 3c 20
01 b0 01 00 00                          .< .....
<7>[   89.504000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc3e0
<7>[   89.504000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5200 cmd_flags 0 noise_floor 0 rx_clear_count 1532749 cycle_count
18889939
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 36
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 1c
00 00 30 00 00 00 90 00 00 04 00 00 00  .....0..........
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 03 00 00
00 50 14 00 00 01 a0 00 00 00 a0 00 00  ....P...........
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   89.652000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc320
<7>[   89.652000] ath10k_pci 0000:02:00.0: scan event bss channel type
4 reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 40
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 20
00 00 31 00 00 0c 90 00 00 00 00 00 00  .. ..1..........
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 50 14 00
00 01 00 00 00 9a ff ff ff 57 68 17 00  P...........Wh..
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 7c 54 e4
01 c0 06 00 00                          |T......
<7>[   89.652000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc260
<7>[   89.652000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq
5200 cmd_flags 1 noise_floor -102 rx_clear_count 1534039 cycle_count
31741052
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 36
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 1c
00 00 32 00 00 00 90 00 00 02 00 00 00  .....2..........
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00 50 14 00 00 01 a0 00 00 00 a0 00 00  ....P...........
<7>[   89.652000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   89.652000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc1a0
<7>[   89.652000] ath10k_pci 0000:02:00.0: scan event completed type 2
reason 0 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
<7>[   90.160000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85caf930
<7>[   90.160000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   90.160000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85caf930 vdev_id 0
<7>[   90.160000] ath10k_pci 0000:02:00.0: mac vdev 0 start
center_freq 5180 phymode 11ac-vht80
<7>[   90.160000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0
flags: 0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
<7>[   90.160000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06229800 len 140 n_items 1
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 84 00 00 20 00 00 12 90 00 00 3c 14 00 00  ..... ......<...
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 5a
14 00 00 00 00 00 00 0a 00 00 00 00 28 28 00  Z............((.
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.160000] ath10k_pci 0000:02:00.0: pci tx data: 00000080: 00
00 00 00 00 00 00 00 00 00 00 00              ............
<7>[   90.164000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.164000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 33 00 00 01 04 00 01 02 01 b4 06  .....3..........
<7>[   90.164000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.164000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef26e0
<7>[   90.164000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 28
<7>[   90.164000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 14
00 00 34 00 00 0f 00 00 00 3c 14 00 00  .....4......<...
<7>[   90.164000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 5a 14 00
00 00 00 00 00 0a 00 00 00              Z...........
<7>[   90.164000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   90.164000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 8656f560
<7>[   90.164000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0xF
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 28
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 14
00 00 35 00 00 04 90 00 00 00 00 00 00  .....5..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00 00 00 00 00 00 00 00 00              ............
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dc0e0
<7>[   90.172000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
<7>[   90.172000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
<7>[   90.172000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[   90.172000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0622cac0 len 20 n_items 1
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 21 00 00 06 90 00 00 03 00 00 00  .....!..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 28
00 00 00                                      (...
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 36 00 00 01 04 00 01 02 01 b4 06  .....6..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.172000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef24a0
<7>[   90.172000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0622cbe0 len 20 n_items 1
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 22 00 00 06 90 00 00 04 00 00 00  ....."..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 28
00 00 00                                      (...
<7>[   90.172000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef2ce0
<7>[   90.172000] ath10k_pci 0000:02:00.0: mac chanctx change freq
5180 width 3 ptr 85caf930 changed 2
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 37 00 00 01 04 00 01 02 01 b4 06  .....7..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.172000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0622d600 len 24 n_items 1
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 23 00 00 19 90 00 00 00 00 00 00  .....#..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 03
00 00 00 64 00 00 00                          ....d...
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 38 00 00 01 04 00 01 02 01 b4 06  .....8..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.172000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef2ce0
<7>[   90.172000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
<7>[   90.172000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode
to staggered
<7>[   90.172000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
<7>[   90.172000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0622e920 len 20 n_items 1
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 24 00 00 06 90 00 00 07 00 00 00  .....$..........
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   90.172000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 ff 2e ff ff 19 90 00 00 00 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 1f
00 00 00 01 00 00 00                          ........
<7>[   90.204000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef2620
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 06 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.204000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   90.204000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06119920 len 108 n_items 1
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 00 2f 00 00 09 90 00 00 0f 00 00 00  ..d../..........
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: ff
03 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 0f 00 00 00 ff 03 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 02 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   90.204000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780dda0
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 07 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.204000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0611a3a0 len 108 n_items 1
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 ff 30 ff ff 09 90 00 00 0f 00 00 00  ..d..0..........
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: ff
03 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 0f 00 00 00 ff 03 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 01 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   90.204000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 85cadc20
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 08 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.204000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0611ae20 len 108 n_items 1
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 ff 31 ff ff 09 90 00 00 0f 00 00 00  ..d..1..........
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 3f
00 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ?...............
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 0f 00 00 00 ff 03 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 01 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   90.204000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780dda0
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 09 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.204000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   90.204000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0611b8a0 len 108 n_items 1
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 ff 32 ff ff 09 90 00 00 0f 00 00 00  ..d..2..........
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 3f
00 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ?...............
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 0f 00 00 00 ff 03 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 01 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   90.204000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   90.208000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.208000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0a 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   90.208000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.208000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 85cadc20
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 244
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 ec
00 00 0b 00 00 02 80 00 00 00 00 00 00  ................
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 39 64 01
00 2f 4c fc 17 03 00 00 00 1e 00 00 00  9d../L..........
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 60 04 00
00 60 04 00 00 00 00 00 00 39 64 01 00  `...`.......9d..
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 2f 4c fc
17 12 00 00 00 1e 00 00 00 60 04 00 00  /L..........`...
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 60 04 00
00 00 00 00 00 39 64 01 00 2f 4c fc 17  `.......9d../L..
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000050: 45 00 00
00 1e 00 00 00 60 04 00 00 60 04 00 00  E.......`...`...
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000060: 00 00 00
00 39 64 01 00 2f 4c fc 17 67 00 00 00  ....9d../L..g...
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000070: 1e 00 00
00 60 04 00 00 60 04 00 00 00 00 00 00  ....`...`.......
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000080: 3e 64 01
00 10 0c fc 0b 8a 29 10 01 03 00 00 00  >d.......)......
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 00000090: 3e 64 01
00 13 0c fc 03 45 64 01 00 23 4c fc 0f  >d......Ed..#L..
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 000000a0: 01 00 00
00 01 00 00 00 01 00 00 00 52 64 01 00  ............Rd..
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 000000b0: 23 4c fc
0f 01 00 00 00 01 00 00 00 01 00 00 00  #L..............
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 000000c0: 52 64 01
00 0c 64 fc 07 01 00 00 00 59 64 01 00  Rd...d......Yd..
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 000000d0: 23 4c fc
0f 01 00 00 00 01 00 00 00 01 00 00 00  #L..............
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 000000e0: df 67 01
00 1e 4c fc 03 df 67 01 00 1d 4c fc 07  .g...L...g...L..
<7>[   90.276000] ath10k_pci 0000:02:00.0: pci rx: 000000f0: 01 00 00
00                                      ....
<7>[   90.276000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860ddf20
<7>[   90.276000] ath10k_pci 0000:02:00.0: wmi event debug mesg len 232
<7>[   90.292000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 48
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 28
00 00 0c 00 00 09 90 00 00 01 00 00 00  ..(.............
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.400000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860dde60
<7>[   90.400000] ath10k_pci 0000:02:00.0: mgmt swba vdev_map 0x1
<7>[   90.400000] ath10k_pci 0000:02:00.0: mgmt event bcn_info 0
tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap
0x00000000000000000000000000000000
<7>[   90.400000] ath10k_pci 0000:02:00.0: dtim 1/2 mcast 0 pvmlen 1
<7>[   90.400000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d61940 len 40 n_items 1
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 20 00 00 33 00 00 57 90 00 00 00 00 00 00  .. ..3..W.......
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: c3
00 00 00 00 e0 ca 05 00 00 00 00 80 00 00 00  ................
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 00 00 00 00                          ........
<7>[   90.400000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef39e0
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   90.400000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0d 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   90.400000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 48
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 28
00 00 0e 00 00 09 90 00 00 01 00 00 00  ..(.............
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   90.504000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860ddda0
<7>[   90.504000] ath10k_pci 0000:02:00.0: mgmt swba vdev_map 0x1
<7>[   90.504000] ath10k_pci 0000:02:00.0: mgmt event bcn_info 0
tim_len 0 mcast 0 changed 0 num_ps_pending 0 bitmap
0x00000000000000000000000000000000
<7>[   90.504000] ath10k_pci 0000:02:00.0: dtim 0/2 mcast 0 pvmlen 1
<7>[   90.504000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d63e20 len 40 n_items 1
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 20 00 00 34 00 00 57 90 00 00 00 00 00 00  .. ..4..W.......
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: c3
00 00 00 00 e0 ca 05 00 00 00 00 80 00 00 00  ................
<7>[   90.504000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 01
00 00 00 00 00 00 00                          ........
<3>[   90.580000] ath10k_pci 0000:02:00.0: firmware crashed! (uuid
de6277f0-b8e9-488c-a1a7-9f4e41f54752)
<6>[   90.588000] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal file max_sta 128
<6>[   90.600000] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 0
dfs 1 testmode 1
<4>[   90.620000] ath10k_pci 0000:02:00.0: failed to read diag value
at 0x1c100804: -16
<4>[   90.624000] ath10k_pci 0000:02:00.0: failed to get memcpy hi
address for firmware address 4: -16
<3>[   90.632000] ath10k_pci 0000:02:00.0: failed to read firmware
dump area: -16
<7>[   90.640000] ath10k_pci 0000:02:00.0: boot hif stop
<7>[   90.640000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6828000
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6822000
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6829000
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a682a000
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6a00000
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a682b000
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a682c000
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[   90.708000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.716000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.728000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.736000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.748000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.756000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.768000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.776000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.788000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.796000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.808000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.816000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.828000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.836000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.848000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.856000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.868000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.876000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.888000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.896000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.908000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.920000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.928000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.940000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.948000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.960000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.968000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.980000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   90.988000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.000000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.008000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.020000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.028000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.040000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.048000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.060000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.068000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.080000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.088000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.100000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.108000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.120000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.128000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.140000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.148000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.160000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.168000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.180000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   91.192000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   94.284000] ath10k_pci 0000:02:00.0: bmi read address 0x400810 length 4
<7>[   94.284000] ath10k_pci 0000:02:00.0: bmi write address 0x400810 length 4
<7>[   94.284000] ath10k_pci 0000:02:00.0: bmi write address 0x400844 length 4
<7>[   94.284000] ath10k_pci 0000:02:00.0: bmi write address 0x400904 length 4
<7>[   94.284000] ath10k_pci 0000:02:00.0: bmi read address 0x4008ac length 4
<7>[   94.284000] ath10k_pci 0000:02:00.0: boot push board extended
data addr 0x0
<7>[   94.284000] ath10k_pci 0000:02:00.0: bmi read address 0x400854 length 4
<7>[   94.284000] ath10k_pci 0000:02:00.0: bmi write address 0x401cc0
length 2116
<7>[   94.288000] ath10k_pci 0000:02:00.0: bmi write address 0x400858 length 4
<7>[   94.288000] ath10k_pci 0000:02:00.0: boot cal file downloaded
<7>[   94.288000] ath10k_pci 0000:02:00.0: boot using calibration mode file
<7>[   94.288000] ath10k_pci 0000:02:00.0: boot uploading firmware
image c03afc64 len 237784 mode normal
<7>[   94.288000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc03afc64 length 237784
<7>[   94.288000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
<7>[   94.288000] ath10k_pci 0000:02:00.0: bmi lz data buffer
0xc03afc64 length 237784
<7>[   95.292000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
<7>[   95.292000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
<7>[   95.292000] ath10k_pci 0000:02:00.0: pci hif set callbacks
<7>[   95.292000] ath10k_pci 0000:02:00.0: pci hif get default pipe
<7>[   95.292000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   95.292000] ath10k_pci 0000:02:00.0: bmi done
<7>[   95.292000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
<7>[   95.292000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
<7>[   95.292000] ath10k_pci 0000:02:00.0: boot hif start
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 00 0c
00 00 00 00 00 01 00 02 00 00 07 16 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 01 00 00
00                                      ....
<7>[   95.296000] ath10k_pci 0000:02:00.0: Target ready! transmit
resources: 2 size:1792
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
ul pipe 0 dl pipe 1 eid 0 ready
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc service 'Control'
eid 0 TX flow control disabled
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc service HTT Data
does not allocate target credits
<7>[   95.296000] ath10k_pci 0000:02:00.0:
ath10k_htc_build_tx_ctrl_skb: skb 86ef4e60
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05c07cac len 16 n_items 1
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 00
01 08 00 00 06 02 00 02 00 00 03 08 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 0 skb 86ef4e60
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 00 0c
00 00 01 00 00 03 00 00 03 00 01 d0 07  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00                                      ....
<7>[   95.296000] ath10k_pci 0000:02:00.0: HTC Service HTT Data
connect response: status: 0x0, assigned ep: 0x1
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
ul pipe 4 dl pipe 1 eid 1 ready
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
<7>[   95.296000] ath10k_pci 0000:02:00.0:
ath10k_htc_build_tx_ctrl_skb: skb 86ef4e60
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05c0894c len 16 n_items 1
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 00
01 08 00 ff 07 ff ff 02 00 00 01 00 02 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 0 skb 86ef4e60
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 00 0c
00 00 02 00 00 03 00 00 01 00 02 b4 06  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00                                      ....
<7>[   95.296000] ath10k_pci 0000:02:00.0: HTC Service WMI connect
response: status: 0x0, assigned ep: 0x2
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci hif map service
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul
pipe 3 dl pipe 2 eid 2 ready
<7>[   95.296000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
<7>[   95.296000] ath10k_pci 0000:02:00.0:
ath10k_htc_build_tx_ctrl_skb: skb 86ef4e60
<7>[   95.296000] ath10k_pci 0000:02:00.0: HTC is using TX credit flow control
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05c0946c len 20 n_items 1
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 00
01 0c 00 00 08 00 00 05 00 00 00 00 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   95.296000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 0 skb 86ef4e60
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 180
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 ac
00 00 03 00 00 00 80 00 00 46 00 00 41  ............F..A
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 01 00 00
00 01 00 00 00 0a 00 00 00 0e 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 07 00 00
00 07 00 00 00 09 00 00 00 0f 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 0a 00 00
00 03 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000050: 00 00 00
00 00 00 00 00 00 00 00 00 03 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000060: 5b 08 00
00 b2 01 80 33 ea ff 00 00 3f 00 00 00  [......3....?...
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000070: 3f 00 00
00 3a 83 00 00 1f 00 00 00 07 00 00 00  ?...:...........
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000080: c0 0b 00
00 01 90 1f 00 08 09 00 00 ac 0a 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 00000090: 2e 13 00
00 d4 17 00 00 00 00 00 00 04 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 000000a0: 01 00 00
00 01 00 00 00 b8 01 00 00 02 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci rx: 000000b0: 00 00 00
00                                      ....
<7>[   95.296000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860f4920
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00
00 07 00 00 00 07 00 00 00 09 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00
00 0a 00 00 00 03 00 00 00 00 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units
0 num_unit_info 2 unit size 440 actual units 145
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
<7>[   95.296000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x5c10000
<7>[   95.296000] ath10k_pci 0000:02:00.0: wmi init 10.2
<7>[   95.296000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05c09f80 len 176 n_items 1
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 a8 00 ff 36 ff ff 00 a0 00 00 10 00 00 00  .....6..........
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 90
00 00 00 02 00 00 00 00 01 00 00 80 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 07
00 00 00 07 00 00 00 64 00 00 00 64 00 00 00  ........d...d...
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 64
00 00 00 28 00 00 00 01 00 00 00 04 00 00 00  d...(...........
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 02
00 00 00 02 00 00 00 08 00 00 00 00 00 00 00  ................
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 00 00 00 00 00 04 00 00 20 00 00 00  ............ ...
<7>[   95.296000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 01
00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  ................
<7>[   95.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 90
05 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000080: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.300000] ath10k_pci 0000:02:00.0: pci tx data: 00000090: 01
00 00 00 01 00 00 00 01 00 00 00 00 00 c1 05  ................
<7>[   95.300000] ath10k_pci 0000:02:00.0: pci tx data: 000000a0: 38
f9 00 00 00 00 00 00 00 00 00 00 00 00 00 00  8...............
<7>[   95.300000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef4e60
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 140
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 84
00 00 04 00 00 10 90 00 00 50 20 31 34  ............P 14
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 35 20 56
20 31 36 20 54 20 34 34 33 0a 00 00 00  5 V 16 T 443....
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000050: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000060: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000070: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000080: 00 00 00
00 00 00 00 00 00 00 00 00              ............
<7>[   95.308000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860f4860
<7>[   95.308000] ath10k_pci 0000:02:00.0: wmi print 'P 145 V 16 T 443'
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 140
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 84
00 00 05 00 00 10 90 00 00 5f 77 6c 61  ............_wla
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 6e 5f 72
74 74 5f 65 6e 61 62 6c 65 00 00 00 00  n_rtt_enable....
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000050: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000060: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000070: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.308000] ath10k_pci 0000:02:00.0: pci rx: 00000080: 00 00 00
00 00 00 00 00 00 00 00 00              ............
<7>[   95.308000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860f47a0
<7>[   95.308000] ath10k_pci 0000:02:00.0: wmi print '_wlan_rtt_enable'
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 07 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 32
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 18
00 00 06 00 00 01 80 00 00 46 00 00 41  ............F..A
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 01 00 00
00 c8 pr iv at e0 c1 00 00 00 00 00 00  .......U........
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860f46e0
<7>[   95.320000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637a2c0 len 12 n_items 1
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 01
01 04 00 ff 04 ff ff 00 ff ff ff              ............
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 12
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 04
00 00 08 00 00 00 01 02 00              ............
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.320000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 1 skb 86348ce0
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85cac3e0
<7>[   95.320000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x0
<7>[   95.320000] ath10k_pci 0000:02:00.0: htt target version 2.1
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637ace0 len 48 n_items 1
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 01
01 28 00 00 05 a4 00 02 01 43 5e 00 e0 0d 06  ..(.......C^....
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
a0 0e 06 00 08 80 07 ff ff ff 03 2f 00 3f 00  ............/.?.
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 0f
00 19 00 03 00 0e 00 06 00 09 00 01 00 02 00  ................
<7>[   95.320000] ath10k_pci 0000:02:00.0: wmi disable pktlog
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637ae20 len 12 n_items 1
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 04 00 ff 37 ff ff 08 90 00 00              .....7......
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 09 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.320000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348c20
<7>[   95.320000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637af40 len 20 n_items 1
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 65 38 57 72 06 90 00 00 1e 00 00 00  ....e8Wr........
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00                                      ....
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0a 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.320000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348c20
<7>[   95.320000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
<7>[   95.320000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637b960 len 20 n_items 1
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 ff 39 ff ff 06 90 00 00 0a 00 00 00  .....9..........
<7>[   95.320000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00                                      ....
<7>[   95.324000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0b 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.324000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.324000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348b60
<7>[   95.324000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637c380 len 20 n_items 1
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 b2 3a 80 33 06 90 00 00 29 00 00 00  .....:.3....)...
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   95.324000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348c20
<7>[   95.324000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
<7>[   95.324000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 0)
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637cda0 len 20 n_items 1
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 ff 3b ff ff 06 90 00 00 1f 00 00 00  .....;..........
<7>[   95.324000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   95.324000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348b60
<7>[   95.324000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
<7>[   95.328000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.328000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0c 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.328000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 1)
<7>[   95.328000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.328000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0d 00 00 01 04 00 00 02 01 00 00  ................
<7>[   95.328000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.328000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.328000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0637cec0 len 20 n_items 1
<7>[   95.328000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 ff 3c ff ff 06 90 00 00 21 00 00 00  .....<......!...
<7>[   95.328000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00                                      ....
<7>[   95.328000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348c20
<7>[   95.328000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq
5180 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.328000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq
5200 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.328000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq
5220 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq
5240 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq
5260 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq
5280 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq
5300 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq
5320 maxpower 40 regpower 40 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq
5500 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq
5520 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq
5540 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq
5560 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq
5580 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq
5600 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq
5620 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq
5640 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq
5660 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq
5680 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq
5700 maxpower 54 regpower 54 antenna 0 mode 0
<7>[   95.332000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 0)
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06108940 len 472 n_items 1
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 d0 01 08 3d 00 00 02 90 00 00 13 00 00 00  .....=..........
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 3c
14 00 00 3c 14 00 00 00 00 00 00 40 19 00 00  <...<.......@...
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
28 28 00 00 00 00 00 50 14 00 00 50 14 00 00  .((.....P...P...
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 40 19 00 00 00 28 28 00 00 00 00 00  ....@....((.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 64
14 00 00 64 14 00 00 00 00 00 00 40 19 00 00  d...d.......@...
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
28 28 00 00 00 00 00 78 14 00 00 78 14 00 00  .((.....x...x...
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 00
00 00 00 40 19 00 00 00 28 28 00 00 00 00 00  ....@....((.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 8c
14 00 00 8c 14 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000080: 00
28 28 00 00 00 00 00 a0 14 00 00 a0 14 00 00  .((.............
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000090: 00
00 00 00 c0 1c 00 00 00 28 28 00 00 00 00 00  .........((.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000000a0: b4
14 00 00 b4 14 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000000b0: 00
28 28 00 00 00 00 00 c8 14 00 00 c8 14 00 00  .((.............
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000000c0: 00
00 00 00 80 1c 00 00 00 28 28 00 00 00 00 00  .........((.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000000d0: 7c
15 00 00 7c 15 00 00 00 00 00 00 c0 1c 00 00  |...|...........
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000000e0: 00
36 36 00 00 00 00 00 90 15 00 00 90 15 00 00  .66.............
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000000f0: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000100: a4
15 00 00 a4 15 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000110: 00
36 36 00 00 00 00 00 b8 15 00 00 b8 15 00 00  .66.............
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000120: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000130: cc
15 00 00 cc 15 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000140: 00
36 36 00 00 00 00 00 e0 15 00 00 e0 15 00 00  .66.............
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000150: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000160: f4
15 00 00 f4 15 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000170: 00
36 36 00 00 00 00 00 08 16 00 00 08 16 00 00  .66.............
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000180: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 00000190: 1c
16 00 00 1c 16 00 00 00 00 00 00 c0 1c 00 00  ................
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000001a0: 00
36 36 00 00 00 00 00 30 16 00 00 30 16 00 00  .66.....0...0...
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000001b0: 00
00 00 00 c0 1c 00 00 00 36 36 00 00 00 00 00  .........66.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000001c0: 44
16 00 00 44 16 00 00 00 00 00 00 80 1c 00 00  D...D...........
<7>[   95.332000] ath10k_pci 0000:02:00.0: pci tx data: 000001d0: 00
36 36 00 00 00 00 00                          .66.....
<7>[   95.332000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37
rd2g 37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
<7>[   95.332000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348c20
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0e 00 00 01 04 00 00 02 01 00 00  ................
<7>[   95.336000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 1)
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 0f 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.336000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.336000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06108c20 len 36 n_items 1
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 1c 00 74 3e 30 20 04 90 00 00 37 00 00 00  ....t>0 ....7...
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 37
00 00 00 37 00 00 00 30 00 00 00 30 00 00 00  7...7...0...0...
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 02
00 00 00                                      ....
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 10 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.336000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.336000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780df20
<7>[   95.336000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
<7>[   95.336000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
<7>[   95.336000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type
1 subtype 0 macaddr c8:pr:iv:at:e0:c1
<7>[   95.336000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610d4a0 len 32 n_items 1
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 18 00 80 3f 10 00 10 90 00 00 00 00 00 00  .....?..........
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 01
00 00 00 00 00 00 00 c8 pr iv at e0 c1 00 00  ...........U....
<7>[   95.336000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780df20
<7>[   95.336000] ath10k_pci 0000:02:00.0: vdev param 0 not supported
by firmware
<7>[   95.336000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
<7>[   95.336000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 0)
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610d5c0 len 24 n_items 1
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 80 40 10 00 1c 90 00 00 00 00 00 00  .....@..........
<7>[   95.336000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: c8
pr iv at e0 c1 00 00                          ...U....
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 0c
00 00 11 00 00 03 00 9a 00 c8 91 f9 55  ...............U
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 8c c1 00
00                                      ....
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.340000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 1 skb 86348ce0
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85cacaa0
<7>[   95.340000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x3
<7>[   95.340000] ath10k_pci 0000:02:00.0: htt peer map vdev 0 peer
c8:pr:iv:at:e0:c1 id 154
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 0c
00 00 12 00 00 03 00 8a 00 c8 91 f9 55  ...............U
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 8c c1 00
00                                      ....
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85cacb60
<7>[   95.340000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x3
<7>[   95.340000] ath10k_pci 0000:02:00.0: htt peer map vdev 0 peer
c8:pr:iv:at:e0:c1 id 138
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 13 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 1)
<7>[   95.340000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780df20
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 14 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.340000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610fae0 len 20 n_items 1
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 07 41 59 40 06 90 00 00 0d 00 00 00  .....AY@........
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 40
01 00 00                                      @...
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 15 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.340000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780df20
<7>[   95.340000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
38 value 3747
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0610fc00 len 24 n_items 1
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 42 00 38 19 90 00 00 00 00 00 00  .....B.8........
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 26
00 00 00 a3 0e 00 00                          &.......
<7>[   95.340000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348ce0
<7>[   95.340000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
39 value 3895
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 16 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d08940 len 24 n_items 1
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 43 00 00 19 90 00 00 00 00 00 00  .....C..........
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 27
00 00 00 37 0f 00 00                          '...7...
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 17 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.340000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780df20
<7>[   95.340000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param
40 value 3900
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d09360 len 24 n_items 1
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 44 00 00 19 90 00 00 00 00 00 00  .....D..........
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 28
00 00 00 3c 0f 00 00                          (...<...
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.340000] ath10k_pci 0000:02:00.0: mac vdev 0 start
center_freq 5180 phymode 11ac-vht80
<7>[   95.340000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0
flags: 0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
<7>[   95.340000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d0cf00 len 140 n_items 1
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 84 00 00 49 00 00 12 90 00 00 3c 14 00 00  .....I......<...
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 5a
14 00 00 00 00 00 00 0a 00 00 00 00 28 28 00  Z............((.
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.340000] ath10k_pci 0000:02:00.0: pci tx data: 00000080: 00
00 00 00 00 00 00 00 00 00 00 00              ............
<7>[   95.340000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 8780df20
<7>[   95.344000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.344000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 1d 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.344000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.344000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 28
<7>[   95.344000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 14
00 00 1e 00 00 0f 00 00 00 3c 14 00 00  ............<...
<7>[   95.344000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 5a 14 00
00 00 00 00 00 0a 00 00 00              Z...........
<7>[   95.344000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.344000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85cab4a0
<7>[   95.344000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0xF
<7>[   95.348000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 28
<7>[   95.348000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 14
00 00 1f 00 00 04 90 00 00 00 00 00 00  ................
<7>[   95.348000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00 00 00 00 00 00 00 00 00              ............
<7>[   95.348000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860f4620
<7>[   95.348000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca1800 len 108 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 00 4a 00 00 09 90 00 00 00 00 00 00  ..d..J..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 20 00 00 01 04 00 01 02 01 b4 06  ..... ..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca2280 len 108 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 00 4b 00 00 09 90 00 00 00 00 00 00  ..d..K..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 01 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 21 00 00 01 04 00 01 02 01 b4 06  .....!..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca2400 len 108 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 00 4c 00 00 09 90 00 00 0f 00 00 00  ..d..L..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 3f
00 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ?...............
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 01 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348ce0
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 22 00 00 01 04 00 01 02 01 b4 06  ....."..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca2e80 len 108 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 64 00 00 4d 00 00 09 90 00 00 0f 00 00 00  ..d..M..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 3f
00 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ?...............
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 0f 00 00 00 ff 03 00 00 07 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 0f
00 00 00 01 00 00 00 c0 0b 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 03 00 00 00 07 00 00 00 01 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: e0
05 00 00 00 00 00 00 00 00 00 00              ............
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 23 00 00 01 04 00 01 02 01 b4 06  .....#..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca4200 len 24 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 4e 00 00 19 90 00 00 00 00 00 00  .....N..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 03
00 00 00 64 00 00 00                          ....d...
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 24 00 00 01 04 00 01 02 01 b4 06  .....$..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.352000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
<7>[   95.352000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode
to staggered
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca4c20 len 20 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 00 4f 00 00 06 90 00 00 07 00 00 00  .....O..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00                                      ....
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 25 00 00 01 04 00 01 02 01 b4 06  .....%..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.352000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca5640 len 24 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 50 00 00 19 90 00 00 00 00 00 00  .....P..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 0d
00 00 00 02 00 00 00                          ........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 26 00 00 01 04 00 01 02 01 b4 06  .....&..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0
assoc id 0 bssid c8:pr:iv:at:e0:c1
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca5760 len 28 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 14 00 00 51 00 00 14 90 00 00 00 00 00 00  .....Q..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00 c8 pr iv at e0 c1 00 00              .......U....
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348ce0
<7>[   95.352000] ath10k_pci 0000:02:00.0: mac vdev 0 up
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 80
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 48
00 00 27 00 00 0a 90 00 00 01 00 00 00  ..H..'..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000030: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000040: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860f4560
<7>[   95.352000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 28 00 00 01 04 00 01 02 01 b4 06  .....(..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca7380 len 24 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 52 00 00 19 90 00 00 00 00 00 00  .....R..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 2b
00 00 00 11 00 00 00                          +.......
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 29 00 00 01 04 00 01 02 01 b4 06  .....)..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348ce0
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05ca74a0 len 24 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 53 00 00 19 90 00 00 00 00 00 00  .....S..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 18
00 00 00 00 00 00 00                          ........
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 2a 00 00 01 04 00 01 02 01 b4 06  .....*..........
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.352000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.352000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 2
<7>[   95.352000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 2
<7>[   95.352000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06380940 len 24 n_items 1
<7>[   95.352000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 ff 54 ff ff 19 90 00 00 00 00 00 00  .....T..........
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 07
00 00 00 02 00 00 00                          ........
<7>[   95.356000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 2n
<7>[   95.356000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 2
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 2b 00 00 01 04 00 01 02 01 b4 06  .....+..........
<7>[   95.356000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.356000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.356000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06380a60 len 24 n_items 1
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 ff 55 ff ff 19 90 00 00 00 00 00 00  .....U..........
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 08
00 00 00 02 00 00 00                          ........
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 2c 00 00 01 04 00 01 02 01 b4 06  .....,..........
<7>[   95.356000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.356000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348ce0
<7>[   95.356000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
<7>[   95.356000] ath10k_pci 0000:02:00.0: mac txpower 20
<7>[   95.356000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
<7>[   95.356000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06381d80 len 20 n_items 1
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 ff 56 ff ff 06 90 00 00 03 00 00 00  .....V..........
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 28
00 00 00                                      (...
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 2d 00 00 01 04 00 01 02 01 b4 06  .....-..........
<7>[   95.356000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.356000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86348ce0
<7>[   95.356000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
<7>[   95.356000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06381ea0 len 20 n_items 1
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 0c 00 ff 57 ff ff 06 90 00 00 04 00 00 00  .....W..........
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 28
00 00 00                                      (...
<7>[   95.356000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86805320
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.356000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 2e 00 00 01 04 00 01 02 01 b4 06  ................
<7>[   95.356000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.364000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 4 len 16
<7>[   95.364000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d50f00 len 120 n_items 1
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 70 00 00 58 00 00 1a 90 00 00 00 00 00 00  ..p..X..........
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: c8
pr iv at e0 c1 00 00 01 00 00 00 01 00 00 00  ...U............
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 04
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 00 00 00 00 00 00 00 00 10 00 00 00  ................
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 00
00 00 00 00 00 00 00 ff be 68 a1 33 51 af 0c  ..........h.3Q..
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 23
6c 60 d3 69 8e 7a ee                          #l`.i.z.
<7>[   95.364000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef20e0
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 0c
00 00 2f 00 00 03 00 aa 00 c8 91 f9 55  ...../.........U
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 8c c1 00
00                                      ....
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.364000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85caa020
<7>[   95.364000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x3
<7>[   95.364000] ath10k_pci 0000:02:00.0: htt peer map vdev 0 peer
c8:pr:iv:at:e0:c1 id 170
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 36
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 1c
00 00 30 00 00 0b 06 aa 00 00 00 00 00  .....0..........
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 00 00 00
00                                      ....
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.364000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85caa0e0
<7>[   95.364000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0xB
<7>[   95.364000] ath10k_pci 0000:02:00.0: sec ind peer_id 170 unicast 0 type 6
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 31 00 00 01 04 00 01 02 01 b4 06  .....1..........
<7>[   95.364000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.364000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 31 value 1
<7>[   95.364000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d52b80 len 24 n_items 1
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 00 59 00 00 19 90 00 00 00 00 00 00  .....Y..........
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 1f
00 00 00 01 00 00 00                          ........
<7>[   95.364000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86ef20e0
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.364000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 32 00 00 01 04 00 01 02 01 b4 06  .....2..........
<7>[   95.364000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<6>[   95.364000] ath10k_pci 0000:02:00.0: device successfully recovered
<7>[   95.368000] ath10k_pci 0000:02:00.0: htt tx alloc msdu_id 0
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05d536c0 len 60 n_items 1
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 01
01 34 00 00 06 00 00 07 d5 36 c8 a0 35 d5 05  ..4.......6..5..
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: 00
00 00 00 1a 00 00 00 00 00 00 00 c0 00 00 00  ................
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: ff
ff ff ff ff ff c8 pr iv at e0 c1 c8 91 f9 55  .........U.....U
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 8c
c1 10 10 03 00 00 00 85 d5 36 f8              ..........6.
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 20
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 0c
00 00 33 00 00 13 00 00 00 00 00 00 00  .....3..........
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci rx: 00000010: 00 00 00
00                                      ....
<7>[   95.368000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.368000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 1 skb 86ef3560
<7>[   95.368000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85caa320
<7>[   95.368000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x13
<7>[   95.368000] ath10k_pci 0000:02:00.0: htt tx completion msdu_id 0
discard 0 no_ack 0 success 1
<7>[   95.368000] ath10k_pci 0000:02:00.0: htt tx free msdu_id 0
<6>[   95.376000] device wlan0 left promiscuous mode
<6>[   95.376000] br-lan: port 2(wlan0) entered disabled state
<7>[   95.384000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   95.392000] ath10k_pci 0000:02:00.0: wmi mgmt vdev down id 0x0
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06118f00 len 16 n_items 1
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 08 00 ff 5a ff ff 16 90 00 00 00 00 00 00  .....Z..........
<7>[   95.392000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 863489e0
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 34 00 00 01 04 00 01 02 01 b4 06  .....4..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.392000] ath10k_pci 0000:02:00.0: mac chanctx unassign ptr
85caf930 vdev_id 0
<7>[   95.392000] ath10k_pci 0000:02:00.0: wmi vdev stop id 0x0
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x06119920 len 16 n_items 1
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 08 00 00 5b 00 00 15 90 00 00 00 00 00 00  .....[..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 2 len 16
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 02 00 08
00 00 35 00 00 07 90 00 00 00 00 00 00  .....5..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc rx completion ep 2 skb 860f44a0
<7>[   95.392000] ath10k_pci 0000:02:00.0: WMI_VDEV_STOPPED_EVENTID
<7>[   95.392000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 863489e0
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 36 00 00 01 04 00 01 02 01 b4 06  .....6..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.392000] ath10k_pci 0000:02:00.0: mac chanctx remove freq
5180 width 3 ptr 85caf930
<7>[   95.392000] ath10k_pci 0000:02:00.0: mac monitor recalc started?
0 needed? 0 allowed? 1
<7>[   95.392000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 0 len 16
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0611ac40 len 120 n_items 1
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 70 00 00 5c 00 00 1a 90 00 00 00 00 00 00  ..p..\..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: c8
pr iv at e0 c1 00 00 01 00 00 00 01 00 00 00  ...U............
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000020: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000030: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000040: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000050: 00
00 00 00 00 00 00 00 00 00 00 00 10 00 00 00  ................
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000060: 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000070: 00
00 00 00 00 00 00 00                          ........
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 36
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 1c
00 00 37 00 00 0b 00 aa 00 04 00 00 00  .....7..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000010: ff ff ff
ff 38 00 00 00 00 00 00 00 20 52 41 00  ....8....... RA.
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000020: 1c 00 00
01                                      ....
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85caa560
<7>[   95.392000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0xB
<7>[   95.392000] ath10k_pci 0000:02:00.0: sec ind peer_id 170 unicast 0 type 0
<7>[   95.392000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86058260
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 38 00 00 01 04 00 01 02 01 b4 06  .....8..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.392000] ath10k_pci 0000:02:00.0: wmi peer delete vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0611bfc0 len 24 n_items 1
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 10 00 ff 5d ff ff 1d 90 00 00 00 00 00 00  .....]..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000010: c8
pr iv at e0 c1 00 00                          ...U....
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 39 00 00 01 04 00 01 02 01 b4 06  .....9..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.392000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86058260
<7>[   95.392000] ath10k_pci 0000:02:00.0: mac vdev 0 delete (remove interface)
<7>[   95.392000] ath10k_pci 0000:02:00.0: WMI vdev delete id 0
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0611c9e0 len 16 n_items 1
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 08 00 b2 5e 80 33 11 90 00 00 00 00 00 00  .....^.3........
<7>[   95.392000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86058260
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 12
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 04
00 00 3a 00 00 04 00 9a 00              .....:......
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85caa7a0
<7>[   95.392000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x4
<7>[   95.392000] ath10k_pci 0000:02:00.0: htt peer unmap vdev 0 peer
c8:pr:iv:at:e0:c1 id 154
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 12
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 04
00 00 3b 00 00 04 00 8a 00              .....;......
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85caa860
<7>[   95.392000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x4
<7>[   95.392000] ath10k_pci 0000:02:00.0: htt peer unmap vdev 0 peer
c8:pr:iv:at:e0:c1 id 138
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 12
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 01 00 04
00 00 3c 00 00 04 00 aa 00              .....<......
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci hif send complete check
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc rx completion ep 1 skb 85caa920
<7>[   95.392000] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x4
<7>[   95.392000] ath10k_pci 0000:02:00.0: htt peer unmap vdev 0 peer
c8:pr:iv:at:e0:c1 id 170
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 3d 00 00 01 04 00 01 02 01 b4 06  .....=..........
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.392000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.392000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x0611ef00 len 16 n_items 1
<7>[   95.396000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 08 00 ff 5f ff ff 4b 90 00 00 01 00 00 00  ....._..K.......
<7>[   95.396000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86058260
<7>[   95.396000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 16
<7>[   95.396000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 02 08
00 08 3e 00 00 01 04 00 01 02 01 b4 06  .....>..........
<7>[   95.396000] ath10k_pci 0000:02:00.0: htc ep 2 got 1 credits (total 2)
<7>[   95.396000] ath10k_pci 0000:02:00.0: pci rx ce pipe 1 len 12
<7>[   95.396000] ath10k_pci 0000:02:00.0: pci rx: 00000000: 00 00 04
00 00 3f 00 00 06 00 00 01              .....?......
<7>[   95.396000] ath10k_pci 0000:02:00.0: boot suspend complete
<7>[   95.396000] ath10k_pci 0000:02:00.0: wmi disable pktlog
<7>[   95.396000] ath10k_pci 0000:02:00.0: htc ep 2 consumed 1 credits (total 1)
<7>[   95.396000] ath10k_pci 0000:02:00.0: pci tx item 0 paddr
0x05c40940 len 12 n_items 1
<7>[   95.396000] ath10k_pci 0000:02:00.0: pci tx data: 00000000: 02
01 04 00 08 60 00 00 08 90 00 00              .....`......
<7>[   95.396000] ath10k_pci 0000:02:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb 86058260
<7>[   95.396000] ath10k_pci 0000:02:00.0: boot hif stop
<7>[   95.396000] ath10k_pci 0000:02:00.0: boot warm reset
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6828000
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6822000
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6829000
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a682a000
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6a00000
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a682b000
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a682c000
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[   95.428000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   95.436000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   95.448000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[   95.448000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a6828000
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1
entries 512 base_addr a6822000
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2
entries 128 base_addr a6829000
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a682a000
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6a00000
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a682b000
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7
entries 2 base_addr a682c000
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
<7>[   95.464000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   95.472000] ath10k_pci 0000:02:00.0: boot target indicator 0
<7>[   95.484000] ath10k_pci 0000:02:00.0: boot target indicator 2
<7>[   95.484000] ath10k_pci 0000:02:00.0: boot target initialised
<7>[   95.484000] ath10k_pci 0000:02:00.0: boot warm reset complete
<7>[   95.484000] ath10k_pci 0000:02:00.0: boot hif power down

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
