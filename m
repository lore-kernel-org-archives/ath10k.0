Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEjTe-0005cS-5B
 for ath10k@lists.infradead.org; Mon, 13 Jul 2015 19:33:30 +0000
Received: by laem6 with SMTP id m6so15177968lae.0
 for <ath10k@lists.infradead.org>; Mon, 13 Jul 2015 12:33:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=HrQjvSwy0R5YDkkPLcQOi2zwiMAL0OEL2YswAASWnZQ@mail.gmail.com>
References: <CAFBinCCxWeAwpAU2Qjh3RbLX3YGxDUiVoiaTk-WEhySj6OvxFw@mail.gmail.com>
 <CA+BoTQ=HrQjvSwy0R5YDkkPLcQOi2zwiMAL0OEL2YswAASWnZQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 13 Jul 2015 21:32:40 +0200
Message-ID: <CAFBinCCymvnL5sTDJJQ6vEZZfchPPG=PeyrXzzt7cPqLJuUBMQ@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Michal,

thanks for the quick reply :-)

On Mon, Jul 13, 2015 at 7:57 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> It is always good to see either debugs or traces to know what happened
> before a crash. Your build doesn't seem to contain either at the
> moment though.
This is what I enabled for the two new logs you can see below:
# cat /sys/module/ath10k_core/parameters/debug_mask
1074

> I see you're using a pretty recent openwrt snapshot.
Correct, it is a trunk build from yesterday afternoon.

> If I assume the caldata extracted from flash partition isn't
> complete then it could lead to firmware crash.
I can see that at least the country code ("GB") and mac address are
read correctly from dumped caldata.
That doesn't mean that it HAS to be correct, but it can't be total
garbage either.

>  cd /lib/firmware/ath10k/QCA988X/hw2.0/
>  mv caldata.bin board.bin
>  rmmod ath10k_pci
>  echo 1 > /sys/module/ath10k_core/parameters/skip_otp
>  modprobe ath10k_pci
>  wifi
The first log [0] you can see below has skip_otp at the default value
and it uses the caldata as supplied through the standard firmware
mechanism.
The second log [1] you can see below is with skip_otp set to 1 and
caldata moved to board.bin (mac address and country code were still
correct in that case).
Each log was produced with: wifi up && sleep 5s && wifi down && dmesg
(both have the mac address masked - everything else is untouched)

Please let me know if I need to change the debug mask or if you need
more information.

Regards,
Martin


[0] https://paste.kde.org/pj3ykduuq
[1] https://paste.kde.org/pyytzladl

Log #0 (no changes to caldata/board.bin, only debug enabled):
[  441.764000] ath10k_pci 0000:02:00.0: boot hif power up
[  441.764000] ath10k_pci 0000:02:00.0: boot 988x chip reset
[  441.764000] ath10k_pci 0000:02:00.0: boot warm reset
[  441.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  441.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  441.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  441.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  441.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  441.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  441.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  441.796000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  441.796000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  441.804000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  441.816000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  441.816000] ath10k_pci 0000:02:00.0: boot target initialised
[  441.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  441.832000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  441.832000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  441.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  441.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  441.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  441.832000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  441.832000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  441.832000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  441.840000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  441.852000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  441.852000] ath10k_pci 0000:02:00.0: boot target initialised
[  441.852000] ath10k_pci 0000:02:00.0: boot warm reset complete
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  441.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  441.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  441.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  441.852000] ath10k_pci 0000:02:00.0: boot chip reset complete (warm)
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  441.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  441.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  441.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  441.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  441.864000] ath10k_pci 0000:02:00.0: bmi start
[  441.864000] ath10k_pci 0000:02:00.0: bmi write address 0x400800 length 4
[  441.868000] ath10k_pci 0000:02:00.0: bmi read address 0x400810 length 4
[  441.868000] ath10k_pci 0000:02:00.0: bmi write address 0x400810 length 4
[  441.868000] ath10k_pci 0000:02:00.0: bmi write address 0x400844 length 4
[  441.868000] ath10k_pci 0000:02:00.0: bmi write address 0x400904 length 4
[  441.868000] ath10k_pci 0000:02:00.0: bmi read address 0x4008ac length 4
[  441.868000] ath10k_pci 0000:02:00.0: boot push board extended data addr 0x0
[  441.868000] ath10k_pci 0000:02:00.0: bmi read address 0x400854 length 4
[  441.868000] ath10k_pci 0000:02:00.0: bmi write address 0x401cc0 length 2116
[  441.872000] ath10k_pci 0000:02:00.0: bmi write address 0x400858 length 4
[  441.872000] ath10k_pci 0000:02:00.0: boot cal file downloaded
[  441.872000] ath10k_pci 0000:02:00.0: boot using calibration mode file
[  441.872000] ath10k_pci 0000:02:00.0: boot uploading firmware image
c03afc64 len 237784 mode normal
[  441.872000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc03afc64 length 237784
[  441.872000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
[  441.872000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0xc03afc64
length 237784
[  442.896000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
[  442.896000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
[  442.896000] ath10k_pci 0000:02:00.0: bmi done
[  442.896000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
[  442.896000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
[  442.896000] ath10k_pci 0000:02:00.0: boot hif start
[  442.900000] ath10k_pci 0000:02:00.0: boot htc service 'Control' ul
pipe 0 dl pipe 1 eid 0 ready
[  442.900000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
[  442.900000] ath10k_pci 0000:02:00.0: boot htc service 'Control' eid
0 TX flow control disabled
[  442.900000] ath10k_pci 0000:02:00.0: boot htc service HTT Data does
not allocate target credits
[  442.900000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data' ul
pipe 4 dl pipe 1 eid 1 ready
[  442.900000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
[  442.900000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
[  442.900000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul pipe
3 dl pipe 2 eid 2 ready
[  442.900000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
[  442.900000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00 00
07 00 00 00 07 00 00 00 09 00 00 00  ................
[  442.900000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00 00
0a 00 00 00 03 00 00 00 00 00 00 00  ................
[  442.900000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[  442.900000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[  442.900000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units 0
num_unit_info 2 unit size 440 actual units 145
[  442.900000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
[  442.900000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
[  442.900000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x5c80000
[  442.900000] ath10k_pci 0000:02:00.0: wmi init 10.2
[  442.920000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
[  442.924000] ath10k_pci 0000:02:00.0: htt target version 2.1
[  442.924000] ath10k_pci 0000:02:00.0: wmi disable pktlog
[  442.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
[  442.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
[  442.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
[  442.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
[  442.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq 5180
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq 5200
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq 5220
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq 5240
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq 5260
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq 5280
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq 5300
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq 5320
maxpower 40 regpower 40 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq 5500
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq 5520
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq 5540
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq 5560
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq 5580
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq 5600
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq 5620
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq 5640
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq 5660
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq 5680
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq 5700
maxpower 54 regpower 54 antenna 0 mode 0
[  442.932000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37 rd2g
37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
[  442.940000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
[  442.940000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
[  442.940000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type 1
subtype 0 macaddr c8:pr:iv:at:e0:c1
[  442.940000] ath10k_pci 0000:02:00.0: vdev param 0 not supported by firmware
[  442.940000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
[  442.940000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 38 value 3747
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 39 value 3895
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 40 value 3900
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 1 value -1
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 2 value -1
[  442.940000] ath10k_pci 0000:02:00.0: mac txpower 0
[  442.940000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 0
[  442.940000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 0
[  442.940000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  442.940000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
[  442.940000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 1
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 1
[  442.940000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 1n
[  442.940000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 1
[  442.940000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  442.940000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  442.940000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  442.940000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  442.940000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  442.944000] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[  442.948000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  442.956000] device wlan0 entered promiscuous mode
[  442.960000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  442.960000] ath10k_pci 0000:02:00.0: wmi 10x start scan
[  442.960000] ath10k_pci 0000:02:00.0: scan event started type 1
reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state starting
(1)
[  442.960000] ath10k_pci 0000:02:00.0: scan event bss channel type 4
reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[  442.964000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
[  442.964000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5180
cmd_flags 0 noise_floor 0 rx_clear_count 1535798 cycle_count 4656037
[  443.112000] ath10k_pci 0000:02:00.0: scan event bss channel type 4
reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
[  443.112000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5180
cmd_flags 1 noise_floor -102 rx_clear_count 1535798 cycle_count
17506798
[  443.116000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
[  443.116000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5200
cmd_flags 0 noise_floor 0 rx_clear_count 1536013 cycle_count 17859909
[  443.260000] ath10k_pci 0000:02:00.0: scan event bss channel type 4
reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
[  443.260000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5200
cmd_flags 1 noise_floor -101 rx_clear_count 1543161 cycle_count
30710758
[  443.260000] ath10k_pci 0000:02:00.0: scan event completed type 2
reason 0 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
[  443.772000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85d316b0
[  443.772000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  443.772000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85d316b0 vdev_id 0
[  443.772000] ath10k_pci 0000:02:00.0: mac vdev 0 start center_freq
5180 phymode 11ac-vht80
[  443.772000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0 flags:
0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
[  443.780000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
[  443.780000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
[  443.780000] ath10k_pci 0000:02:00.0: mac txpower 20
[  443.780000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[  443.780000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[  443.780000] ath10k_pci 0000:02:00.0: mac chanctx change freq 5180
width 3 ptr 85d316b0 changed 2
[  443.780000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
[  443.780000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
[  443.780000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode to staggered
[  443.780000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
[  443.780000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
[  443.780000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
[  443.780000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0 assoc
id 0 bssid c8:pr:iv:at:e0:c1
[  443.780000] ath10k_pci 0000:02:00.0: mac vdev 0 up
[  443.780000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
[  443.780000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
[  443.780000] ath10k_pci 0000:02:00.0: mac txpower 20
[  443.780000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[  443.780000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[  443.780000] br-lan: port 2(wlan0) entered forwarding state
[  443.784000] br-lan: port 2(wlan0) entered forwarding state
[  443.792000] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[  443.800000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
[  443.800000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
[  443.800000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
[  443.800000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 2
[  443.800000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 2
[  443.800000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 2n
[  443.800000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 2
[  443.800000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 4 len 16
[  443.800000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 31 value 1
[  443.804000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  443.804000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  443.804000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  443.804000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  443.804000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  443.880000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  443.900000] ath10k_pci 0000:02:00.0: wmi event debug mesg len 232
[  444.204000] ath10k_pci 0000:02:00.0: firmware crashed! (uuid
d6027db2-e965-469f-962c-9b70627c413d)
[  444.212000] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal file max_sta 128
[  444.224000] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 0
dfs 1 testmode 1
[  444.244000] ath10k_warn: 2 callbacks suppressed
[  444.244000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100804: -16
[  444.252000] ath10k_pci 0000:02:00.0: failed to get memcpy hi
address for firmware address 4: -16
[  444.260000] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[  444.268000] ath10k_pci 0000:02:00.0: boot hif stop
[  444.268000] ath10k_pci 0000:02:00.0: boot warm reset
[  444.300000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.300000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.300000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.300000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.300000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.300000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.300000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.300000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.300000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.308000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.320000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.320000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.336000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.336000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.336000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.336000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.336000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.336000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.336000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.336000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.336000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.344000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.356000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.356000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.356000] ath10k_pci 0000:02:00.0: boot warm reset complete
[  444.356000] ieee80211 phy0: Hardware restart was requested
[  444.360000] ath10k_pci 0000:02:00.0: wmi disable pktlog
[  444.360000] ath10k_pci 0000:02:00.0: boot hif stop
[  444.360000] ath10k_pci 0000:02:00.0: boot warm reset
[  444.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.392000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.392000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.392000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.392000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.392000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.400000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.412000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.412000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.428000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.428000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.436000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.448000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.448000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.448000] ath10k_pci 0000:02:00.0: boot warm reset complete
[  444.448000] ath10k_pci 0000:02:00.0: boot hif power down
[  444.448000] ath10k_pci 0000:02:00.0: boot hif power up
[  444.448000] ath10k_pci 0000:02:00.0: boot 988x chip reset
[  444.448000] ath10k_pci 0000:02:00.0: boot warm reset
[  444.480000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.480000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.480000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.480000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.480000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.480000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.480000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.480000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.480000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.488000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.500000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.500000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.516000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.516000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.516000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.516000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.516000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.516000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.516000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.516000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.516000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.524000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.536000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.536000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.536000] ath10k_pci 0000:02:00.0: boot warm reset complete
[  444.536000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.536000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.536000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.536000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.536000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.536000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.536000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.548000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100800: -16
[  444.552000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
[  444.560000] ath10k_pci 0000:02:00.0: boot warm reset
[  444.592000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.592000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.592000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.592000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.592000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.592000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.592000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.592000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.592000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.600000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.612000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.612000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.628000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.628000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.628000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.628000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.628000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.636000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.648000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.648000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.648000] ath10k_pci 0000:02:00.0: boot warm reset complete
[  444.648000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.648000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.648000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.648000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.648000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.648000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.648000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.660000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100800: -16
[  444.664000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
[  444.672000] ath10k_pci 0000:02:00.0: boot warm reset
[  444.704000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.704000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.704000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.704000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.704000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.704000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.704000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.704000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.704000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.712000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.724000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.724000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.740000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.740000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.748000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.760000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.760000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.760000] ath10k_pci 0000:02:00.0: boot warm reset complete
[  444.760000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.760000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.760000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.760000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.760000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.760000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.760000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.772000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100800: -16
[  444.776000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
[  444.784000] ath10k_pci 0000:02:00.0: boot cold reset
[  444.832000] ath10k_pci 0000:02:00.0: boot cold reset complete
[  444.832000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[  444.832000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.840000] ath10k_pci 0000:02:00.0: boot target indicator 0
[  444.852000] ath10k_pci 0000:02:00.0: boot target indicator 2
[  444.852000] ath10k_pci 0000:02:00.0: boot target initialised
[  444.852000] ath10k_pci 0000:02:00.0: boot qca988x chip reset complete (cold)
[  444.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a69f0000
[  444.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a687c000
[  444.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a69f1000
[  444.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f2000
[  444.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[  444.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f3000
[  444.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a69f4000
[  444.860000] ath10k_pci 0000:02:00.0: bmi start
[  444.860000] ath10k_pci 0000:02:00.0: bmi write address 0x400800 length 4
[  444.864000] ath10k_pci 0000:02:00.0: bmi read address 0x400810 length 4
[  444.864000] ath10k_pci 0000:02:00.0: bmi write address 0x400810 length 4
[  444.864000] ath10k_pci 0000:02:00.0: bmi write address 0x400844 length 4
[  444.864000] ath10k_pci 0000:02:00.0: bmi write address 0x400904 length 4
[  444.864000] ath10k_pci 0000:02:00.0: bmi read address 0x4008ac length 4
[  444.864000] ath10k_pci 0000:02:00.0: boot push board extended data addr 0x0
[  444.864000] ath10k_pci 0000:02:00.0: bmi read address 0x400854 length 4
[  444.864000] ath10k_pci 0000:02:00.0: bmi write address 0x401cc0 length 2116
[  444.868000] ath10k_pci 0000:02:00.0: bmi write address 0x400858 length 4
[  444.868000] ath10k_pci 0000:02:00.0: boot cal file downloaded
[  444.868000] ath10k_pci 0000:02:00.0: boot using calibration mode file
[  444.868000] ath10k_pci 0000:02:00.0: boot uploading firmware image
c03afc64 len 237784 mode normal
[  444.868000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc03afc64 length 237784
[  444.868000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
[  444.868000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0xc03afc64
length 237784
[  445.788000] br-lan: port 2(wlan0) entered forwarding state
[  445.876000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
[  445.880000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
[  445.880000] ath10k_pci 0000:02:00.0: bmi done
[  445.880000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
[  445.880000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
[  445.880000] ath10k_pci 0000:02:00.0: boot hif start
[  445.880000] ath10k_pci 0000:02:00.0: boot htc service 'Control' ul
pipe 0 dl pipe 1 eid 0 ready
[  445.880000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
[  445.880000] ath10k_pci 0000:02:00.0: boot htc service 'Control' eid
0 TX flow control disabled
[  445.880000] ath10k_pci 0000:02:00.0: boot htc service HTT Data does
not allocate target credits
[  445.880000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data' ul
pipe 4 dl pipe 1 eid 1 ready
[  445.880000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
[  445.880000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
[  445.880000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul pipe
3 dl pipe 2 eid 2 ready
[  445.884000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
[  445.884000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00 00
07 00 00 00 07 00 00 00 09 00 00 00  ................
[  445.884000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00 00
0a 00 00 00 03 00 00 00 00 00 00 00  ................
[  445.884000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[  445.884000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[  445.884000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units 0
num_unit_info 2 unit size 440 actual units 145
[  445.884000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
[  445.884000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
[  445.884000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x6300000
[  445.884000] ath10k_pci 0000:02:00.0: wmi init 10.2
[  445.904000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
[  445.908000] ath10k_pci 0000:02:00.0: htt target version 2.1
[  445.908000] ath10k_pci 0000:02:00.0: wmi disable pktlog
[  445.908000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
[  445.908000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
[  445.908000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
[  445.908000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
[  445.908000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq 5180
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq 5200
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq 5220
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq 5240
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq 5260
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq 5280
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq 5300
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq 5320
maxpower 40 regpower 40 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq 5500
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq 5520
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq 5540
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq 5560
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq 5580
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq 5600
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq 5620
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq 5640
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq 5660
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq 5680
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq 5700
maxpower 54 regpower 54 antenna 0 mode 0
[  445.916000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37 rd2g
37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
[  445.924000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
[  445.924000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
[  445.924000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type 1
subtype 0 macaddr c8:pr:iv:at:e0:c1
[  445.924000] ath10k_pci 0000:02:00.0: vdev param 0 not supported by firmware
[  445.924000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
[  445.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
[  445.924000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 38 value 3747
[  445.924000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 39 value 3895
[  445.924000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 40 value 3900
[  445.924000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 1 value -1
[  445.924000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 2 value -1
[  445.924000] ath10k_pci 0000:02:00.0: mac txpower 20
[  445.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[  445.924000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[  445.924000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85d316b0
[  445.924000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  445.924000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85d316b0 vdev_id 0
[  445.924000] ath10k_pci 0000:02:00.0: mac vdev 0 start center_freq
5180 phymode 11ac-vht80
[  445.924000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0 flags:
0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
[  445.932000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
[  445.932000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  445.932000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  445.932000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  445.932000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[  445.932000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  445.932000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
[  445.932000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
[  445.932000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode to staggered
[  445.932000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
[  445.932000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
[  445.932000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0 assoc
id 0 bssid c8:pr:iv:at:e0:c1
[  445.932000] ath10k_pci 0000:02:00.0: mac vdev 0 up
[  445.932000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
[  445.932000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
[  445.932000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 2
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 2
[  445.932000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 2n
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 2
[  445.932000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
[  445.932000] ath10k_pci 0000:02:00.0: mac txpower 20
[  445.932000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[  445.932000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 4 len 16
[  445.932000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 31 value 1
[  445.932000] ath10k_pci 0000:02:00.0: device successfully recovered

Log #1 (caldata moved, skip_otp and debug are enabled):
[ 1265.708000] ath10k_pci 0000:02:00.0: boot hif power up
[ 1265.708000] ath10k_pci 0000:02:00.0: boot 988x chip reset
[ 1265.708000] ath10k_pci 0000:02:00.0: boot warm reset
[ 1265.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1265.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1265.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1265.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1265.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1265.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1265.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1265.740000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1265.740000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1265.748000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1265.760000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1265.760000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1265.776000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1265.776000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1265.776000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1265.776000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1265.776000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1265.776000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1265.776000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1265.776000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1265.776000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1265.784000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1265.796000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1265.796000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1265.796000] ath10k_pci 0000:02:00.0: boot warm reset complete
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot chip reset complete (warm)
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1265.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1265.808000] ath10k_pci 0000:02:00.0: bmi start
[ 1265.808000] ath10k_pci 0000:02:00.0: bmi write address 0x400800 length 4
[ 1265.812000] ath10k_pci 0000:02:00.0: bmi read address 0x400810 length 4
[ 1265.812000] ath10k_pci 0000:02:00.0: bmi write address 0x400810 length 4
[ 1265.812000] ath10k_pci 0000:02:00.0: bmi write address 0x400844 length 4
[ 1265.812000] ath10k_pci 0000:02:00.0: bmi write address 0x400904 length 4
[ 1265.812000] ath10k_pci 0000:02:00.0: boot did not find a
calibration file, try DT next: -11
[ 1265.812000] ath10k_pci 0000:02:00.0: boot did not find DT entry,
try OTP next: -2
[ 1265.812000] ath10k_pci 0000:02:00.0: bmi read address 0x4008ac length 4
[ 1265.812000] ath10k_pci 0000:02:00.0: boot push board extended data addr 0x0
[ 1265.812000] ath10k_pci 0000:02:00.0: bmi read address 0x400854 length 4
[ 1265.812000] ath10k_pci 0000:02:00.0: bmi write address 0x401cc0 length 2116
[ 1265.816000] ath10k_pci 0000:02:00.0: bmi write address 0x400858 length 4
[ 1265.816000] ath10k_pci 0000:02:00.0: boot upload otp to 0x1234 len 7205
[ 1265.816000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc0bc9034 length 7205
[ 1265.816000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
[ 1265.816000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0xc0bc9034
length 7204
[ 1265.840000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0x860d9cc0 length 4
[ 1265.840000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
[ 1265.840000] ath10k_pci 0000:02:00.0: bmi execute address 0x1234 param 0x0
[ 1265.960000] ath10k_pci 0000:02:00.0: bmi execute result 0x2
[ 1265.960000] ath10k_pci 0000:02:00.0: boot otp execute result 2
[ 1265.960000] ath10k_pci 0000:02:00.0: boot using calibration mode otp
[ 1265.960000] ath10k_pci 0000:02:00.0: boot uploading firmware image
c0bcac64 len 237784 mode normal
[ 1265.960000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc0bcac64 length 237784
[ 1265.960000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
[ 1265.960000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0xc0bcac64
length 237784
[ 1266.980000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
[ 1266.984000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
[ 1266.984000] ath10k_pci 0000:02:00.0: bmi done
[ 1266.984000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
[ 1266.984000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
[ 1266.984000] ath10k_pci 0000:02:00.0: boot hif start
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc service 'Control' ul
pipe 0 dl pipe 1 eid 0 ready
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc service 'Control' eid
0 TX flow control disabled
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc service HTT Data does
not allocate target credits
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data' ul
pipe 4 dl pipe 1 eid 1 ready
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul pipe
3 dl pipe 2 eid 2 ready
[ 1266.984000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00 00
07 00 00 00 07 00 00 00 09 00 00 00  ................
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00 00
0a 00 00 00 03 00 00 00 00 00 00 00  ................
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units 0
num_unit_info 2 unit size 440 actual units 145
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
[ 1266.988000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x5cf0000
[ 1266.988000] ath10k_pci 0000:02:00.0: wmi init 10.2
[ 1267.008000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
[ 1267.012000] ath10k_pci 0000:02:00.0: htt target version 2.1
[ 1267.012000] ath10k_pci 0000:02:00.0: wmi disable pktlog
[ 1267.012000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
[ 1267.012000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
[ 1267.012000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
[ 1267.012000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
[ 1267.012000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq 5180
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq 5200
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq 5220
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq 5240
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq 5260
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq 5280
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq 5300
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq 5320
maxpower 40 regpower 40 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq 5500
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq 5520
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq 5540
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq 5560
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq 5580
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq 5600
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq 5620
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq 5640
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq 5660
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq 5680
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq 5700
maxpower 54 regpower 54 antenna 0 mode 0
[ 1267.020000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37 rd2g
37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
[ 1267.028000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
[ 1267.028000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
[ 1267.028000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type 1
subtype 0 macaddr c8:pr:iv:at:e0:c1
[ 1267.028000] ath10k_pci 0000:02:00.0: vdev param 0 not supported by firmware
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 38 value 3747
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 39 value 3895
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 40 value 3900
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 1 value -1
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 2 value -1
[ 1267.028000] ath10k_pci 0000:02:00.0: mac txpower 0
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 0
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 0
[ 1267.028000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1267.028000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
[ 1267.028000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 1
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 1
[ 1267.028000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 1n
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 1
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.028000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.028000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1267.032000] IPv6: ADDRCONF(NETDEV_UP): wlan3: link is not ready
[ 1267.036000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1267.044000] device wlan3 entered promiscuous mode
[ 1267.048000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1267.052000] ath10k_pci 0000:02:00.0: wmi 10x start scan
[ 1267.052000] ath10k_pci 0000:02:00.0: scan event started type 1
reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state starting
(1)
[ 1267.052000] ath10k_pci 0000:02:00.0: scan event bss channel type 4
reason 3 freq 0 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
[ 1267.056000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
[ 1267.056000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5180
cmd_flags 0 noise_floor 0 rx_clear_count 1529522 cycle_count 4629099
[ 1267.200000] ath10k_pci 0000:02:00.0: scan event bss channel type 4
reason 3 freq 5180 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
[ 1267.200000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5180
cmd_flags 1 noise_floor -102 rx_clear_count 1529522 cycle_count
17479596
[ 1267.204000] ath10k_pci 0000:02:00.0: scan event foreign channel
type 8 reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state
running (2)
[ 1267.204000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5200
cmd_flags 0 noise_floor 0 rx_clear_count 1529952 cycle_count 17832531
[ 1267.352000] ath10k_pci 0000:02:00.0: scan event bss channel type 4
reason 3 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
[ 1267.352000] ath10k_pci 0000:02:00.0: chan info err_code 0 freq 5200
cmd_flags 1 noise_floor -102 rx_clear_count 1535112 cycle_count
30684260
[ 1267.352000] ath10k_pci 0000:02:00.0: scan event completed type 2
reason 0 freq 5200 req_id 40961 scan_id 40960 vdev_id 0 state running
(2)
[ 1267.860000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85d316b0
[ 1267.860000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1267.860000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85d316b0 vdev_id 0
[ 1267.860000] ath10k_pci 0000:02:00.0: mac vdev 0 start center_freq
5180 phymode 11ac-vht80
[ 1267.860000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0 flags:
0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
[ 1267.868000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
[ 1267.868000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
[ 1267.868000] ath10k_pci 0000:02:00.0: mac txpower 20
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[ 1267.868000] ath10k_pci 0000:02:00.0: mac chanctx change freq 5180
width 3 ptr 85d316b0 changed 2
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
[ 1267.868000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
[ 1267.868000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode to staggered
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
[ 1267.868000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0 assoc
id 0 bssid c8:pr:iv:at:e0:c1
[ 1267.868000] ath10k_pci 0000:02:00.0: mac vdev 0 up
[ 1267.868000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
[ 1267.868000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
[ 1267.868000] ath10k_pci 0000:02:00.0: mac txpower 20
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[ 1267.868000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[ 1267.868000] br-lan: port 2(wlan3) entered forwarding state
[ 1267.872000] br-lan: port 2(wlan3) entered forwarding state
[ 1267.880000] IPv6: ADDRCONF(NETDEV_CHANGE): wlan3: link becomes ready
[ 1267.888000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
[ 1267.888000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
[ 1267.888000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
[ 1267.888000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 2
[ 1267.888000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 2
[ 1267.888000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 2n
[ 1267.888000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 2
[ 1267.888000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 4 len 16
[ 1267.888000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 31 value 1
[ 1267.892000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1267.892000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.892000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.892000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.892000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1267.968000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1267.984000] ath10k_pci 0000:02:00.0: wmi event debug mesg len 232
[ 1268.292000] ath10k_pci 0000:02:00.0: firmware crashed! (uuid
2b2c06d2-74c0-4c87-932c-7852173faa09)
[ 1268.300000] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2.4.70-2 api 5 htt 2.1 wmi 5 cal otp max_sta 128
[ 1268.312000] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 0
dfs 1 testmode 1
[ 1268.332000] ath10k_warn: 6 callbacks suppressed
[ 1268.332000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100804: -16
[ 1268.340000] ath10k_pci 0000:02:00.0: failed to get memcpy hi
address for firmware address 4: -16
[ 1268.352000] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[ 1268.360000] ath10k_pci 0000:02:00.0: boot hif stop
[ 1268.360000] ath10k_pci 0000:02:00.0: boot warm reset
[ 1268.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.392000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.392000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.392000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.392000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.392000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.392000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.400000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.412000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.412000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.428000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.428000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.428000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.428000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.436000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.448000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.448000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.448000] ath10k_pci 0000:02:00.0: boot warm reset complete
[ 1268.448000] ieee80211 phy3: Hardware restart was requested
[ 1268.452000] ath10k_pci 0000:02:00.0: wmi disable pktlog
[ 1268.452000] ath10k_pci 0000:02:00.0: boot hif stop
[ 1268.452000] ath10k_pci 0000:02:00.0: boot warm reset
[ 1268.484000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.484000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.484000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.484000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.484000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.484000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.484000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.484000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.484000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.492000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.504000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.504000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.520000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.520000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.520000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.520000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.520000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.520000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.520000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.520000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.520000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.528000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.540000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.540000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.540000] ath10k_pci 0000:02:00.0: boot warm reset complete
[ 1268.540000] ath10k_pci 0000:02:00.0: boot hif power down
[ 1268.540000] ath10k_pci 0000:02:00.0: boot hif power up
[ 1268.540000] ath10k_pci 0000:02:00.0: boot 988x chip reset
[ 1268.540000] ath10k_pci 0000:02:00.0: boot warm reset
[ 1268.572000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.572000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.572000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.572000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.572000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.572000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.572000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.572000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.572000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.580000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.592000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.592000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.608000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.608000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.608000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.608000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.608000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.608000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.608000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.608000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.608000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.616000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.628000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.628000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.628000] ath10k_pci 0000:02:00.0: boot warm reset complete
[ 1268.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.628000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.628000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.628000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.628000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.640000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100800: -16
[ 1268.644000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
[ 1268.652000] ath10k_pci 0000:02:00.0: boot warm reset
[ 1268.684000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.684000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.684000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.684000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.684000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.684000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.684000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.684000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.684000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.692000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.704000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.704000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.720000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.720000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.720000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.720000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.720000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.720000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.720000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.720000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.720000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.728000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.740000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.740000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.740000] ath10k_pci 0000:02:00.0: boot warm reset complete
[ 1268.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.740000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.740000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.752000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100800: -16
[ 1268.756000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
[ 1268.764000] ath10k_pci 0000:02:00.0: boot warm reset
[ 1268.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.796000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.796000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.796000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.796000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.804000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.816000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.816000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.832000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.832000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.832000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.832000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.832000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.832000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.840000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.852000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.852000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.852000] ath10k_pci 0000:02:00.0: boot warm reset complete
[ 1268.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.852000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.852000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.864000] ath10k_pci 0000:02:00.0: failed to read diag value at
0x1c100800: -16
[ 1268.868000] ath10k_pci 0000:02:00.0: failed to poke copy engine: -16
[ 1268.876000] ath10k_pci 0000:02:00.0: boot cold reset
[ 1268.924000] ath10k_pci 0000:02:00.0: boot cold reset complete
[ 1268.924000] ath10k_pci 0000:02:00.0: boot waiting target to initialise
[ 1268.924000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.932000] ath10k_pci 0000:02:00.0: boot target indicator 0
[ 1268.944000] ath10k_pci 0000:02:00.0: boot target indicator 2
[ 1268.944000] ath10k_pci 0000:02:00.0: boot target initialised
[ 1268.944000] ath10k_pci 0000:02:00.0: boot qca988x chip reset complete (cold)
[ 1268.944000] ath10k_pci 0000:02:00.0: boot init ce src ring id 0
entries 16 base_addr a5ca0000
[ 1268.944000] ath10k_pci 0000:02:00.0: boot ce dest ring id 1 entries
512 base_addr a6918000
[ 1268.944000] ath10k_pci 0000:02:00.0: boot ce dest ring id 2 entries
128 base_addr a7864000
[ 1268.944000] ath10k_pci 0000:02:00.0: boot init ce src ring id 3
entries 32 base_addr a69f7000
[ 1268.944000] ath10k_pci 0000:02:00.0: boot init ce src ring id 4
entries 4096 base_addr a6810000
[ 1268.944000] ath10k_pci 0000:02:00.0: boot init ce src ring id 7
entries 2 base_addr a69f4000
[ 1268.944000] ath10k_pci 0000:02:00.0: boot ce dest ring id 7 entries
2 base_addr a6828000
[ 1268.952000] ath10k_pci 0000:02:00.0: bmi start
[ 1268.952000] ath10k_pci 0000:02:00.0: bmi write address 0x400800 length 4
[ 1268.956000] ath10k_pci 0000:02:00.0: bmi read address 0x400810 length 4
[ 1268.956000] ath10k_pci 0000:02:00.0: bmi write address 0x400810 length 4
[ 1268.956000] ath10k_pci 0000:02:00.0: bmi write address 0x400844 length 4
[ 1268.956000] ath10k_pci 0000:02:00.0: bmi write address 0x400904 length 4
[ 1268.956000] ath10k_pci 0000:02:00.0: boot did not find a
calibration file, try DT next: -11
[ 1268.956000] ath10k_pci 0000:02:00.0: boot did not find DT entry,
try OTP next: -2
[ 1268.956000] ath10k_pci 0000:02:00.0: bmi read address 0x4008ac length 4
[ 1268.956000] ath10k_pci 0000:02:00.0: boot push board extended data addr 0x0
[ 1268.956000] ath10k_pci 0000:02:00.0: bmi read address 0x400854 length 4
[ 1268.956000] ath10k_pci 0000:02:00.0: bmi write address 0x401cc0 length 2116
[ 1268.960000] ath10k_pci 0000:02:00.0: bmi write address 0x400858 length 4
[ 1268.960000] ath10k_pci 0000:02:00.0: boot upload otp to 0x1234 len 7205
[ 1268.960000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc0bc9034 length 7205
[ 1268.960000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
[ 1268.960000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0xc0bc9034
length 7204
[ 1268.984000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0x86937d70 length 4
[ 1268.984000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
[ 1268.984000] ath10k_pci 0000:02:00.0: bmi execute address 0x1234 param 0x0
[ 1269.044000] ath10k_pci 0000:02:00.0: bmi execute result 0x2
[ 1269.044000] ath10k_pci 0000:02:00.0: boot otp execute result 2
[ 1269.044000] ath10k_pci 0000:02:00.0: boot using calibration mode otp
[ 1269.044000] ath10k_pci 0000:02:00.0: boot uploading firmware image
c0bcac64 len 237784 mode normal
[ 1269.044000] ath10k_pci 0000:02:00.0: bmi fast download address
0x1234 buffer 0xc0bcac64 length 237784
[ 1269.044000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x1234
[ 1269.044000] ath10k_pci 0000:02:00.0: bmi lz data buffer 0xc0bcac64
length 237784
[ 1269.876000] br-lan: port 2(wlan3) entered forwarding state
[ 1270.052000] ath10k_pci 0000:02:00.0: bmi lz stream start address 0x0
[ 1270.052000] ath10k_pci 0000:02:00.0: bmi write address 0x400814 length 4
[ 1270.052000] ath10k_pci 0000:02:00.0: bmi done
[ 1270.052000] ath10k_pci 0000:02:00.0: htt tx max num pending tx 1424
[ 1270.052000] ath10k_pci 0000:02:00.0: htt rx ring size 2048 fill_level 1023
[ 1270.052000] ath10k_pci 0000:02:00.0: boot hif start
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc service 'Control' ul
pipe 0 dl pipe 1 eid 0 ready
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc ep 0 ul polled 0 dl polled 0
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc service 'Control' eid
0 TX flow control disabled
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc service HTT Data does
not allocate target credits
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data' ul
pipe 4 dl pipe 1 eid 1 ready
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc ep 1 ul polled 1 dl polled 0
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc service 'HTT Data'
eid 1 TX flow control disabled
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc service 'WMI' ul pipe
3 dl pipe 2 eid 2 ready
[ 1270.056000] ath10k_pci 0000:02:00.0: boot htc ep 2 ul polled 0 dl polled 0
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi svc: 00000000: 0e 00 00 00
07 00 00 00 07 00 00 00 09 00 00 00  ................
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi svc: 00000010: 0f 00 00 00
0a 00 00 00 03 00 00 00 00 00 00 00  ................
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi svc: 00000020: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi svc: 00000030: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi mem_req_id 1 num_units 0
num_unit_info 2 unit size 440 actual units 145
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x41000046 sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd
0x0000833a num_mem_reqs 0x00000001
[ 1270.056000] ath10k_pci 0000:02:00.0: firmware 10.2.4.70-2 booted
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi chunk 0 len 63800
requested, addr 0x5c60000
[ 1270.056000] ath10k_pci 0000:02:00.0: wmi init 10.2
[ 1270.076000] ath10k_pci 0000:02:00.0: wmi event ready sw_version
1090519110 abi_version 1 mac_addr c8:pr:iv:at:e0:c1 status 0
[ 1270.080000] ath10k_pci 0000:02:00.0: htt target version 2.1
[ 1270.080000] ath10k_pci 0000:02:00.0: wmi disable pktlog
[ 1270.080000] ath10k_pci 0000:02:00.0: wmi pdev set param 30 value 1
[ 1270.080000] ath10k_pci 0000:02:00.0: wmi pdev set param 10 value 1
[ 1270.080000] ath10k_pci 0000:02:00.0: wmi pdev set param 41 value 0
[ 1270.080000] ath10k_pci 0000:02:00.0: wmi pdev set param 31 value 0
[ 1270.080000] ath10k_pci 0000:02:00.0: wmi pdev set param 33 value 1
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [0/19] freq 5180
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [1/19] freq 5200
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [2/19] freq 5220
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [3/19] freq 5240
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [4/19] freq 5260
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [5/19] freq 5280
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [6/19] freq 5300
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [7/19] freq 5320
maxpower 40 regpower 40 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [8/19] freq 5500
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [9/19] freq 5520
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [10/19] freq 5540
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [11/19] freq 5560
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [12/19] freq 5580
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [13/19] freq 5600
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [14/19] freq 5620
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [15/19] freq 5640
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [16/19] freq 5660
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [17/19] freq 5680
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: mac channel [18/19] freq 5700
maxpower 54 regpower 54 antenna 0 mode 0
[ 1270.088000] ath10k_pci 0000:02:00.0: wmi pdev regdomain rd 37 rd2g
37 rd5g 37 ctl2g 30 ctl5g 30 dfs_region 2
[ 1270.096000] ath10k_pci 0000:02:00.0: mac create vdev 0 map ffff
[ 1270.096000] ath10k_pci 0000:02:00.0: mac vdev create 0 (add
interface) type 1 subtype 0 bcnmode single-buf
[ 1270.096000] ath10k_pci 0000:02:00.0: WMI vdev create: id 0 type 1
subtype 0 macaddr c8:pr:iv:at:e0:c1
[ 1270.096000] ath10k_pci 0000:02:00.0: vdev param 0 not supported by firmware
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi peer create vdev_id 0
peer_addr c8:pr:iv:at:e0:c1
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi pdev set param 13 value 320
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 38 value 3747
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 39 value 3895
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 40 value 3900
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 1 value -1
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 2 value -1
[ 1270.096000] ath10k_pci 0000:02:00.0: mac txpower 20
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[ 1270.096000] ath10k_pci 0000:02:00.0: mac chanctx add freq 5180
width 3 ptr 85d316b0
[ 1270.096000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1270.096000] ath10k_pci 0000:02:00.0: mac chanctx assign ptr
85d316b0 vdev_id 0
[ 1270.096000] ath10k_pci 0000:02:00.0: mac vdev 0 start center_freq
5180 phymode 11ac-vht80
[ 1270.096000] ath10k_pci 0000:02:00.0: wmi vdev start id 0x0 flags:
0x0, freq 5180, mode 10, ch_flags: 0xA000000, max_power: 40
[ 1270.104000] ath10k_pci 0000:02:00.0: WMI_VDEV_START_RESP_EVENTID
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi pdev set wmm params
[ 1270.104000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1270.104000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 3 value 100
[ 1270.104000] ath10k_pci 0000:02:00.0: mac vdev 0 beacon_interval 100
[ 1270.104000] ath10k_pci 0000:02:00.0: vdev 0 set beacon tx mode to staggered
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi pdev set param 7 value 0
[ 1270.104000] ath10k_pci 0000:02:00.0: mac vdev 0 dtim_period 2
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 13 value 2
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi mgmt vdev up id 0x0 assoc
id 0 bssid c8:pr:iv:at:e0:c1
[ 1270.104000] ath10k_pci 0000:02:00.0: mac vdev 0 up
[ 1270.104000] ath10k_pci 0000:02:00.0: mac vdev 0 cts_prot 0
[ 1270.104000] ath10k_pci 0000:02:00.0: WMI_TBTTOFFSET_UPDATE_EVENTID
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 43 value 17
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 24 value 0
[ 1270.104000] ath10k_pci 0000:02:00.0: mac vdev 0 slot_time 2
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 7 value 2
[ 1270.104000] ath10k_pci 0000:02:00.0: mac vdev 0 preamble 2n
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 8 value 2
[ 1270.104000] ath10k_pci 0000:02:00.0: mac vdev_id 0 txpower 20
[ 1270.104000] ath10k_pci 0000:02:00.0: mac txpower 20
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi pdev set param 3 value 40
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi pdev set param 4 value 40
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev install key idx 1
cipher 4 len 16
[ 1270.104000] ath10k_pci 0000:02:00.0: wmi vdev id 0x0 set param 31 value 1
[ 1270.104000] ath10k_pci 0000:02:00.0: device successfully recovered
[ 1270.112000] ath10k_pci 0000:02:00.0: mac monitor recalc started? 0
needed? 0 allowed? 1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
