Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vps.baanhofman.nl ([92.222.219.102])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y38yP-0001p2-Rr
 for ath10k@lists.infradead.org; Mon, 22 Dec 2014 19:49:01 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by vps.baanhofman.nl (Postfix) with ESMTP id 3BC0A1040C1A
 for <ath10k@lists.infradead.org>; Mon, 22 Dec 2014 20:48:34 +0100 (CET)
Received: from vps.baanhofman.nl ([127.0.0.1])
 by localhost (vps.baanhofman.nl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27I5489JbRjA for <ath10k@lists.infradead.org>;
 Mon, 22 Dec 2014 20:48:06 +0100 (CET)
Received: from [IPv6:2001:470:7b66::ff:fe00:2] (unknown
 [IPv6:2001:470:7b66::ff:fe00:2])
 by vps.baanhofman.nl (Postfix) with ESMTPSA id 5A35C1040BBC
 for <ath10k@lists.infradead.org>; Mon, 22 Dec 2014 20:48:06 +0100 (CET)
Message-ID: <54987576.1010901@baanhofman.nl>
Date: Mon, 22 Dec 2014 20:48:06 +0100
From: Wilco Baan Hofman <wilco@baanhofman.nl>
MIME-Version: 1.0
Subject: num_rf_chains problem
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
To: ath10k@lists.infradead.org

Hi,

I'm currently setting up openwrt with the latest git ath10k on the
Engenius ESR1750.

A couple of things are off:
- My chip shipped with regdomain code 0x00
- OTP calibration is missing?
- DFS pattern detector is not working, possibly because of OTP missing
- num_rf_chains is reported as 2, which is wrong, it should be 3.

I 'fixed' the driver with regdomain code 0x00 to map to my own country
code, which is okay, that is completely legal here in Europe (and I have
an amateur radio license anyway), but I gather that the eeprom is blank
or something?

The chip on board should be an QCA9880-BR4A, this is with skip_otp=1 and
debug_mask=16383:

[  719.000000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
irq_mode 0 reset_mode 0
[  719.120000] ath10k_pci 0000:00:00.0: Direct firmware load failed with
error -2
[  719.130000] ath10k_pci 0000:00:00.0: Falling back to user helper
[  720.250000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1 wmi 65.109.0.0 cal otp
max_sta 128
[  720.270000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0 dfs
1 testmode 1
[  720.380000] ath10k_pci 0000:00:00.0: failed to initialise DFS pattern
detector
[  720.380000] ath: EEPROM regdomain: 0x0
[  720.380000] ath: EEPROM indicates default country code should be used
[  720.380000] ath: doing EEPROM country->regdmn map search
[  720.380000] ath: country maps to regdmn code: 0x37
[  720.380000] ath: Country alpha2 being used: NL
[  720.380000] ath: Regpair used: 0x37
[  891.950000] ath10k_pci 0000:00:00.0: pci probe
[  891.950000] ath10k_pci 0000:00:00.0: boot pci_mem 0xb0000000
[  891.960000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
irq_mode 0 reset_mode 0
[  891.970000] ath10k_pci 0000:00:00.0: boot hif power up
[  891.970000] ath10k_pci 0000:00:00.0: boot chip reset
[  891.970000] ath10k_pci 0000:00:00.0: boot warm reset
[  892.010000] ath10k_pci 0000:00:00.0: boot init ce src ring id 0
entries 16 base_addr a711c000
[  892.010000] ath10k_pci 0000:00:00.0: boot ce dest ring id 1 entries
512 base_addr a70bc000
[  892.010000] ath10k_pci 0000:00:00.0: boot ce dest ring id 2 entries
32 base_addr a73f0000
[  892.010000] ath10k_pci 0000:00:00.0: boot init ce src ring id 3
entries 32 base_addr a73f1000
[  892.010000] ath10k_pci 0000:00:00.0: boot init ce src ring id 4
entries 4096 base_addr a6e60000
[  892.010000] ath10k_pci 0000:00:00.0: boot init ce src ring id 7
entries 2 base_addr a73f2000
[  892.010000] ath10k_pci 0000:00:00.0: boot ce dest ring id 7 entries 2
base_addr a7392000
[  892.010000] ath10k_pci 0000:00:00.0: boot waiting target to initialise
[  892.010000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  892.020000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  892.030000] ath10k_pci 0000:00:00.0: boot target indicator 2
[  892.030000] ath10k_pci 0000:00:00.0: boot target initialised
[  892.050000] ath10k_pci 0000:00:00.0: boot init ce src ring id 0
entries 16 base_addr a711c000
[  892.050000] ath10k_pci 0000:00:00.0: boot ce dest ring id 1 entries
512 base_addr a70bc000
[  892.050000] ath10k_pci 0000:00:00.0: boot ce dest ring id 2 entries
32 base_addr a73f0000
[  892.050000] ath10k_pci 0000:00:00.0: boot init ce src ring id 3
entries 32 base_addr a73f1000
[  892.050000] ath10k_pci 0000:00:00.0: boot init ce src ring id 4
entries 4096 base_addr a6e60000
[  892.050000] ath10k_pci 0000:00:00.0: boot init ce src ring id 7
entries 2 base_addr a73f2000
[  892.050000] ath10k_pci 0000:00:00.0: boot ce dest ring id 7 entries 2
base_addr a7392000
[  892.050000] ath10k_pci 0000:00:00.0: boot waiting target to initialise
[  892.050000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  892.060000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  892.070000] ath10k_pci 0000:00:00.0: boot target indicator 2
[  892.070000] ath10k_pci 0000:00:00.0: boot target initialised
[  892.070000] ath10k_pci 0000:00:00.0: boot warm reset complete
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 0
entries 16 base_addr a711c000
[  892.070000] ath10k_pci 0000:00:00.0: boot ce dest ring id 1 entries
512 base_addr a70bc000
[  892.070000] ath10k_pci 0000:00:00.0: boot ce dest ring id 2 entries
32 base_addr a73f0000
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 3
entries 32 base_addr a73f1000
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 4
entries 4096 base_addr a6e60000
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 7
entries 2 base_addr a73f2000
[  892.070000] ath10k_pci 0000:00:00.0: boot ce dest ring id 7 entries 2
base_addr a7392000
[  892.070000] ath10k_pci 0000:00:00.0: boot chip reset complete (warm)
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 0
entries 16 base_addr a711c000
[  892.070000] ath10k_pci 0000:00:00.0: boot ce dest ring id 1 entries
512 base_addr a70bc000
[  892.070000] ath10k_pci 0000:00:00.0: boot ce dest ring id 2 entries
32 base_addr a73f0000
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 3
entries 32 base_addr a73f1000
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 4
entries 4096 base_addr a6e60000
[  892.070000] ath10k_pci 0000:00:00.0: boot init ce src ring id 7
entries 2 base_addr a73f2000
[  892.070000] ath10k_pci 0000:00:00.0: boot ce dest ring id 7 entries 2
base_addr a7392000
[  892.080000] ath10k_pci 0000:00:00.0: bmi get target info
[  892.080000] ath10k_pci 0000:00:00.0: Hardware name qca988x hw2.0
version 0x4100016c
[  892.080000] ath10k_pci 0000:00:00.0: Direct firmware load failed with
error -2
[  892.090000] ath10k_pci 0000:00:00.0: Falling back to user helper
[  892.140000] ath10k_pci 0000:00:00.0: trying fw api 3
[  892.140000] ath10k_pci 0000:00:00.0: found fw version 10.2-00082-4-2
[  892.140000] ath10k_pci 0000:00:00.0: found fw timestamp 1406283454
[  892.140000] ath10k_pci 0000:00:00.0: found otp image ie (7205 B)
[  892.140000] ath10k_pci 0000:00:00.0: found fw image ie (228890 B)
[  892.140000] ath10k_pci 0000:00:00.0: found firmware features ie (1 B)
[  892.140000] ath10k_pci 0000:00:00.0: Enabling feature bit: 1
[  892.140000] ath10k_pci 0000:00:00.0: Enabling feature bit: 2
[  892.140000] ath10k_pci 0000:00:00.0: Enabling feature bit: 3
[  892.140000] ath10k_pci 0000:00:00.0: Enabling feature bit: 4
[  892.140000] ath10k_pci 0000:00:00.0: features
[  892.140000] ath10k_pci 0000:00:00.0: 00000000: 00 00 00
1e                                      ....
[  892.140000] ath10k_pci 0000:00:00.0: using fw api 3
[  892.140000] ath10k_pci 0000:00:00.0: bmi start
[  892.140000] ath10k_pci 0000:00:00.0: bmi write address 0x400800 length 4
[  892.140000] ath10k_pci 0000:00:00.0: bmi read address 0x400810 length 4
[  892.140000] ath10k_pci 0000:00:00.0: bmi write address 0x400810 length 4
[  892.140000] ath10k_pci 0000:00:00.0: bmi write address 0x400844 length 4
[  892.140000] ath10k_pci 0000:00:00.0: bmi write address 0x400904 length 4
[  892.150000] ath10k_pci 0000:00:00.0: boot did not find a calibration
file, try DT next: -2
[  892.150000] ath10k_pci 0000:00:00.0: boot did not find DT entry, try
OTP next: -2
[  892.150000] ath10k_pci 0000:00:00.0: bmi read address 0x4008ac length 4
[  892.150000] ath10k_pci 0000:00:00.0: boot push board extended data
addr 0x0
[  892.150000] ath10k_pci 0000:00:00.0: bmi read address 0x400854 length 4
[  892.150000] ath10k_pci 0000:00:00.0: bmi write address 0x401cc0
length 2116
[  892.150000] ath10k_pci 0000:00:00.0: bmi write address 0x400858 length 4
[  892.150000] ath10k_pci 0000:00:00.0: boot upload otp to 0x1234 len 7205
[  892.150000] ath10k_pci 0000:00:00.0: bmi fast download address 0x1234
buffer 0xc06f6038 length 7205
[  892.150000] ath10k_pci 0000:00:00.0: bmi lz stream start address 0x1234
[  892.150000] ath10k_pci 0000:00:00.0: bmi lz data buffer 0xc06f6038
length 7204
[  892.180000] ath10k_pci 0000:00:00.0: bmi lz data buffer 0x87b79dc0
length 4
[  892.180000] ath10k_pci 0000:00:00.0: bmi lz stream start address 0x0
[  892.180000] ath10k_pci 0000:00:00.0: bmi execute address 0x1234 param 0x0
[  892.290000] ath10k_pci 0000:00:00.0: bmi execute result 0x2
[  892.290000] ath10k_pci 0000:00:00.0: boot otp execute result 2
[  892.290000] ath10k_pci 0000:00:00.0: boot using calibration mode otp
[  892.290000] ath10k_pci 0000:00:00.0: boot uploading firmware image
c06f7c68 len 228890 mode normal
[  892.290000] ath10k_pci 0000:00:00.0: bmi fast download address 0x1234
buffer 0xc06f7c68 length 228890
[  892.290000] ath10k_pci 0000:00:00.0: bmi lz stream start address 0x1234
[  892.290000] ath10k_pci 0000:00:00.0: bmi lz data buffer 0xc06f7c68
length 228888
[  893.280000] ath10k_pci 0000:00:00.0: bmi lz data buffer 0x87b79dc0
length 4
[  893.280000] ath10k_pci 0000:00:00.0: bmi lz stream start address 0x0
[  893.280000] ath10k_pci 0000:00:00.0: bmi write address 0x400814 length 4
[  893.280000] ath10k_pci 0000:00:00.0: pci hif set callbacks
[  893.280000] ath10k_pci 0000:00:00.0: pci hif get default pipe
[  893.280000] ath10k_pci 0000:00:00.0: pci hif map service
[  893.280000] ath10k_pci 0000:00:00.0: bmi done
[  893.280000] ath10k_pci 0000:00:00.0: htt tx max num pending tx 1424
[  893.280000] ath10k_pci 0000:00:00.0: htt rx ring size 1024 fill_level
1000
[  893.280000] ath10k_pci 0000:00:00.0: boot hif start
[  893.280000] ath10k_pci 0000:00:00.0: pci rx ce pipe 1 len 20
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 00 00 0c 00 00
00 00 00 01 00 02 00 00 07 16 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000010: 01 00 00
00                                      ....
[  893.280000] ath10k_pci 0000:00:00.0: Target ready! transmit
resources: 2 size:1792
[  893.280000] ath10k_pci 0000:00:00.0: pci hif map service
[  893.280000] ath10k_pci 0000:00:00.0: boot htc service 'Control' ul
pipe 0 dl pipe 1 eid 0 ready
[  893.280000] ath10k_pci 0000:00:00.0: boot htc ep 0 ul polled 0 dl
polled 0
[  893.280000] ath10k_pci 0000:00:00.0: boot htc service 'Control' eid 0
TX flow control disabled
[  893.280000] ath10k_pci 0000:00:00.0: boot htc service HTT Data does
not allocate target credits
[  893.280000] ath10k_pci 0000:00:00.0: ath10k_htc_build_tx_ctrl_skb:
skb 86ea5600
[  893.280000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ec954c
len 16 n_items 1
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 00 00 08
00 00 00 00 00 02 00 00 03 08 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 0 skb 86ea5600
[  893.280000] ath10k_pci 0000:00:00.0: pci rx ce pipe 1 len 20
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 00 00 0c 00 00
01 00 00 03 00 00 03 00 01 d0 07  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000010: 00 00 00
00                                      ....
[  893.280000] ath10k_pci 0000:00:00.0: HTC Service HTT Data connect
response: status: 0x0, assigned ep: 0x1
[  893.280000] ath10k_pci 0000:00:00.0: pci hif map service
[  893.280000] ath10k_pci 0000:00:00.0: boot htc service 'HTT Data' ul
pipe 4 dl pipe 1 eid 1 ready
[  893.280000] ath10k_pci 0000:00:00.0: boot htc ep 1 ul polled 1 dl
polled 0
[  893.280000] ath10k_pci 0000:00:00.0: boot htc service 'HTT Data' eid
1 TX flow control disabled
[  893.280000] ath10k_pci 0000:00:00.0: ath10k_htc_build_tx_ctrl_skb:
skb 86ea56c0
[  893.280000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ec9a6c
len 16 n_items 1
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 00 00 08
00 32 01 ff 7e 02 00 00 01 00 02 00 00  ....2..~........
[  893.280000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 0 skb 86ea56c0
[  893.280000] ath10k_pci 0000:00:00.0: pci rx ce pipe 1 len 20
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 00 00 0c 00 00
02 00 00 03 00 00 01 00 02 b4 06  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000010: 00 00 00
00                                      ....
[  893.280000] ath10k_pci 0000:00:00.0: HTC Service WMI connect
response: status: 0x0, assigned ep: 0x2
[  893.280000] ath10k_pci 0000:00:00.0: pci hif map service
[  893.280000] ath10k_pci 0000:00:00.0: boot htc service 'WMI' ul pipe 3
dl pipe 2 eid 2 ready
[  893.280000] ath10k_pci 0000:00:00.0: boot htc ep 2 ul polled 0 dl
polled 0
[  893.280000] ath10k_pci 0000:00:00.0: ath10k_htc_build_tx_ctrl_skb:
skb 86ea5780
[  893.280000] ath10k_pci 0000:00:00.0: HTC is using TX credit flow control
[  893.280000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ec9f8c
len 20 n_items 1
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 00 00 0c
00 ff 02 00 00 05 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000010: 00 00 00
00                                      ....
[  893.280000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 0 skb 86ea5780
[  893.280000] ath10k_pci 0000:00:00.0: pci rx ce pipe 2 len 180
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 02 00 ac 00 00
03 00 00 00 80 00 00 6d 00 00 41  ............m..A
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000010: 01 00 00 00 03
00 00 00 00 00 00 00 0e 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000020: 07 00 00 00 0f
00 00 00 09 00 00 00 0f 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000030: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000040: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000050: 00 00 00 00 00
00 00 00 00 00 00 00 02 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000060: 5b 08 00 00 b2
01 80 33 fa ff 00 00 3f 00 00 00  [......3....?...
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000070: 3f 00 00 00 00
00 00 00 7f 00 00 00 07 00 00 00  ?...............
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000080: c0 0b 00 00 0d
f8 1f 00 08 09 00 00 ac 0a 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 00000090: 2e 13 00 00 d4
17 00 00 00 00 00 00 04 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 000000a0: 01 00 00 00 01
00 00 00 bc 01 00 00 02 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci rx: 000000b0: 00 00 00
00                                      ....
[  893.280000] ath10k_pci 0000:00:00.0: htc rx completion ep 2 skb 86ea3d80
[  893.280000] ath10k_pci 0000:00:00.0: wmi svc: 00000000: 0e 00 00 00
07 00 00 00 0f 00 00 00 09 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: wmi svc: 00000010: 0f 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: wmi svc: 00000020: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: wmi svc: 00000030: 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: wmi mem_req_id 1 num_units 0
num_unit_info 2 unit size 444 actual units 145
[  893.280000] ath10k_pci 0000:00:00.0: wmi event service ready
min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b
vht_cap 0x338001b2 sw_ver0 0x4100006d sw_ver1 0x00000000 fw_build
0x00000000 phy_capab 0x00000003 num_rf_chains 0x00000002 eeprom_rd
0x00000000 num_mem_reqs 0x00000001
[  893.280000] ath10k_pci 0000:00:00.0: firmware 10.2-00082-4-2 booted
[  893.280000] ath10k_pci 0000:00:00.0: wmi chunk 0 len 64380 requested,
addr 0x6ed0000
[  893.280000] ath10k_pci 0000:00:00.0: wmi init 10.2
[  893.280000] ath10k_pci 0000:00:00.0: htc ep 2 consumed 1 credits
(total 1)
[  893.280000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ecaaa0
len 176 n_items 1
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 02 00 a8
00 00 00 00 00 00 a0 00 00 10 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000010: 90 00 00
00 02 00 00 00 00 01 00 00 10 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000020: 07 00 00
00 07 00 00 00 64 00 00 00 64 00 00 00  ........d...d...
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000030: 64 00 00
00 28 00 00 00 01 00 00 00 04 00 00 00  d...(...........
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000040: 02 00 00
00 02 00 00 00 08 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000050: 00 00 00
00 00 00 00 00 00 04 00 00 20 00 00 00  ............ ...
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000060: 00 00 00
00 00 00 00 00 01 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000070: 90 05 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000080: 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 00000090: 00 00 00
00 01 00 00 00 01 00 00 00 00 00 ed 06  ................
[  893.280000] ath10k_pci 0000:00:00.0: pci tx data: 000000a0: 7c fb 00
00 00 00 00 00 00 00 00 00 00 00 00 00  |...............
[  893.280000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 2 skb 86ea5840
[  893.290000] ath10k_pci 0000:00:00.0: pci rx ce pipe 2 len 140
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 02 00 84 00 00
04 00 00 10 90 00 00 50 20 31 34  ............P 14
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000010: 35 20 56 20 31
36 20 54 20 34 34 33 0a 00 00 00  5 V 16 T 443....
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000020: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000030: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000040: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000050: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000060: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000070: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000080: 00 00 00 00 00
00 00 00 00 00 00 00              ............
[  893.290000] ath10k_pci 0000:00:00.0: htc rx completion ep 2 skb 86ea3e40
[  893.290000] ath10k_pci 0000:00:00.0: wmi print 'P 145 V 16 T 443'
[  893.290000] ath10k_pci 0000:00:00.0: pci rx ce pipe 2 len 140
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 02 00 84 00 00
05 00 00 10 90 00 00 5f 77 6c 61  ............_wla
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000010: 6e 5f 72 74 74
5f 65 6e 61 62 6c 65 00 00 00 00  n_rtt_enable....
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000020: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000030: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000040: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000050: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000060: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000070: 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00  ................
[  893.290000] ath10k_pci 0000:00:00.0: pci rx: 00000080: 00 00 00 00 00
00 00 00 00 00 00 00              ............
[  893.290000] ath10k_pci 0000:00:00.0: htc rx completion ep 2 skb 86ea3f00
[  893.290000] ath10k_pci 0000:00:00.0: wmi print '_wlan_rtt_enable'
[  893.300000] ath10k_pci 0000:00:00.0: pci rx ce pipe 2 len 32
[  893.300000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 02 00 18 00 00
06 00 00 01 80 00 00 6d 00 00 41  ............m..A
[  893.300000] ath10k_pci 0000:00:00.0: pci rx: 00000010: 01 00 00 00 00
03 07 12 34 56 00 00 00 00 00 00  ........4V......
[  893.300000] ath10k_pci 0000:00:00.0: htc rx completion ep 2 skb 86ea4000
[  893.300000] ath10k_pci 0000:00:00.0: wmi event ready sw_version
1090519149 abi_version 1 mac_addr 00:03:07:12:34:56 status 0
[  893.300000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ecc760
len 12 n_items 1
[  893.300000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 01 00 04
00 86 00 cd e0 00 00 09 60              ...........`
[  893.300000] ath10k_pci 0000:00:00.0: pci rx ce pipe 1 len 12
[  893.300000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 01 00 04 00 00
07 00 00 00 01 02 00              ............
[  893.300000] ath10k_pci 0000:00:00.0: pci hif send complete check
[  893.300000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 1 skb 86ea5a80
[  893.300000] ath10k_pci 0000:00:00.0: htc rx completion ep 1 skb 86463a80
[  893.300000] ath10k_pci 0000:00:00.0: htt rx, msg_type: 0x0
[  893.300000] ath10k_pci 0000:00:00.0: htt target version 2.1
[  893.300000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06eccb80
len 48 n_items 1
[  893.300000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 01 00 28
00 00 01 00 00 02 01 00 00 00 40 55 06  ..(..........@U.
[  893.300000] ath10k_pci 0000:00:00.0: pci tx data: 00000010: 00 f0 dc
06 00 04 80 07 ff ff e8 03 2e 00 3e 00  ..............>.
[  893.300000] ath10k_pci 0000:00:00.0: pci tx data: 00000020: 0f 00 19
00 03 00 0e 00 06 00 09 00 01 00 02 00  ................
[  893.300000] ath10k_pci 0000:00:00.0: wmi disable pktlog
[  893.300000] ath10k_pci 0000:00:00.0: htc ep 2 consumed 1 credits
(total 0)
[  893.300000] ath10k_pci 0000:00:00.0: HTC: endpoint 2 needs credit update
[  893.300000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ecccc0
len 12 n_items 1
[  893.300000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 02 01 04
00 00 01 00 00 08 90 00 00              ............
[  893.300000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 2 skb 86ea5c00
[  893.300000] ath10k_pci 0000:00:00.0: pci rx ce pipe 1 len 16
[  893.300000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 00 02 08 00 08
08 00 00 01 04 00 01 02 02 b4 06  ................
[  893.300000] ath10k_pci 0000:00:00.0: htc ep 2 got 2 credits (total 2)
[  893.300000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1 wmi 65.109.0.0 cal otp
max_sta 128
[  893.310000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0 dfs
1 testmode 1
[  893.320000] ath10k_pci 0000:00:00.0: htc ep 2 consumed 1 credits
(total 1)
[  893.320000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ecd0e0
len 16 n_items 1
[  893.320000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 02 00 08
00 00 02 00 00 4b 90 00 00 01 00 00 00  ........K.......
[  893.320000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 2 skb 86ea5cc0
[  893.320000] ath10k_pci 0000:00:00.0: pci rx ce pipe 1 len 12
[  893.320000] ath10k_pci 0000:00:00.0: pci rx: 00000000: 00 00 04 00 00
09 00 00 06 00 00 01              ............
[  893.320000] ath10k_pci 0000:00:00.0: boot suspend complete
[  893.320000] ath10k_pci 0000:00:00.0: wmi disable pktlog
[  893.320000] ath10k_pci 0000:00:00.0: htc ep 2 consumed 1 credits
(total 0)
[  893.320000] ath10k_pci 0000:00:00.0: HTC: endpoint 2 needs credit update
[  893.320000] ath10k_pci 0000:00:00.0: pci tx item 0 paddr 0x06ecd500
len 12 n_items 1
[  893.320000] ath10k_pci 0000:00:00.0: pci tx data: 00000000: 02 01 04
00 00 03 00 00 08 90 00 00              ............
[  893.320000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 2 skb 86ea5d80
[  893.320000] ath10k_pci 0000:00:00.0: boot hif stop
[  893.320000] ath10k_pci 0000:00:00.0: boot warm reset
[  893.360000] ath10k_pci 0000:00:00.0: boot init ce src ring id 0
entries 16 base_addr a711c000
[  893.360000] ath10k_pci 0000:00:00.0: boot ce dest ring id 1 entries
512 base_addr a70bc000
[  893.360000] ath10k_pci 0000:00:00.0: boot ce dest ring id 2 entries
32 base_addr a73f0000
[  893.360000] ath10k_pci 0000:00:00.0: boot init ce src ring id 3
entries 32 base_addr a73f1000
[  893.360000] ath10k_pci 0000:00:00.0: boot init ce src ring id 4
entries 4096 base_addr a6e60000
[  893.360000] ath10k_pci 0000:00:00.0: boot init ce src ring id 7
entries 2 base_addr a73f2000
[  893.360000] ath10k_pci 0000:00:00.0: boot ce dest ring id 7 entries 2
base_addr a7392000
[  893.360000] ath10k_pci 0000:00:00.0: boot waiting target to initialise
[  893.360000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  893.370000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  893.380000] ath10k_pci 0000:00:00.0: boot target indicator 2
[  893.380000] ath10k_pci 0000:00:00.0: boot target initialised
[  893.400000] ath10k_pci 0000:00:00.0: boot init ce src ring id 0
entries 16 base_addr a711c000
[  893.400000] ath10k_pci 0000:00:00.0: boot ce dest ring id 1 entries
512 base_addr a70bc000
[  893.400000] ath10k_pci 0000:00:00.0: boot ce dest ring id 2 entries
32 base_addr a73f0000
[  893.400000] ath10k_pci 0000:00:00.0: boot init ce src ring id 3
entries 32 base_addr a73f1000
[  893.400000] ath10k_pci 0000:00:00.0: boot init ce src ring id 4
entries 4096 base_addr a6e60000
[  893.400000] ath10k_pci 0000:00:00.0: boot init ce src ring id 7
entries 2 base_addr a73f2000
[  893.400000] ath10k_pci 0000:00:00.0: boot ce dest ring id 7 entries 2
base_addr a7392000
[  893.400000] ath10k_pci 0000:00:00.0: boot waiting target to initialise
[  893.400000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  893.410000] ath10k_pci 0000:00:00.0: boot target indicator 0
[  893.420000] ath10k_pci 0000:00:00.0: boot target indicator 2
[  893.420000] ath10k_pci 0000:00:00.0: boot target initialised
[  893.420000] ath10k_pci 0000:00:00.0: boot warm reset complete
[  893.420000] ath10k_pci 0000:00:00.0: ath10k_htc_notify_tx_completion:
ep 1 skb 86ea5b40
[  893.420000] ath10k_pci 0000:00:00.0: boot hif power down
[  893.420000] ath10k_pci 0000:00:00.0: failed to initialise DFS pattern
detector
[  893.420000] ath: EEPROM regdomain: 0x0
[  893.420000] ath: EEPROM indicates default country code should be used
[  893.420000] ath: doing EEPROM country->regdmn map search
[  893.420000] ath: country maps to regdmn code: 0x37
[  893.430000] ath: Country alpha2 being used: NL
[  893.430000] ath: Regpair used: 0x37


The resulting setup:
Wiphy phy3
    max # scan SSIDs: 16
    max scan IEs length: 195 bytes
    Retry short limit: 7
    Retry long limit: 4
    Coverage class: 0 (up to 0m)
    Device supports AP-side u-APSD.
    Available Antennas: TX 0x3 RX 0x3          (WRONG, should be 0x7,
like on phy0)
    Configured Antennas: TX 0x3 RX 0x3         (WRONG, should be 0x7,
like on phy0)
    Supported interface modes:
         * managed
         * AP
         * AP/VLAN
         * monitor
    Band 1:
        Capabilities: 0x19e3
            RX LDPC
            HT20/HT40
            Static SM Power Save
            RX HT20 SGI
            RX HT40 SGI
            TX STBC
            RX STBC 1-stream
            Max AMSDU length: 7935 bytes
            DSSS/CCK HT40
        Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
        Minimum RX AMPDU time spacing: 8 usec (0x06)
        HT TX/RX MCS rate indexes supported: 0-15
        Frequencies:
            * 2412 MHz [1] (20.0 dBm)
            * 2417 MHz [2] (20.0 dBm)
            * 2422 MHz [3] (20.0 dBm)
            * 2427 MHz [4] (20.0 dBm)
            * 2432 MHz [5] (20.0 dBm)
            * 2437 MHz [6] (20.0 dBm)
            * 2442 MHz [7] (20.0 dBm)
            * 2447 MHz [8] (20.0 dBm)
            * 2452 MHz [9] (20.0 dBm)
            * 2457 MHz [10] (20.0 dBm)
            * 2462 MHz [11] (20.0 dBm)
            * 2467 MHz [12] (20.0 dBm)
            * 2472 MHz [13] (20.0 dBm)
            * 2484 MHz [14] (disabled)
    Band 2:
        Capabilities: 0x19e3
            RX LDPC
            HT20/HT40
            Static SM Power Save
            RX HT20 SGI
            RX HT40 SGI
            TX STBC
            RX STBC 1-stream
            Max AMSDU length: 7935 bytes
            DSSS/CCK HT40
        Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
        Minimum RX AMPDU time spacing: 8 usec (0x06)
        HT TX/RX MCS rate indexes supported: 0-15
        VHT Capabilities (0x338001b2):
            Max MPDU length: 11454
            Supported Channel Width: neither 160 nor 80+80
            RX LDPC
            short GI (80 MHz)
            TX STBC
            RX antenna pattern consistency
            TX antenna pattern consistency
        VHT RX MCS set:
            1 streams: MCS 0-9
            2 streams: MCS 0-9
            3 streams: not supported
            4 streams: not supported
            5 streams: not supported
            6 streams: not supported
            7 streams: not supported
            8 streams: not supported
        VHT RX highest supported: 0 Mbps
        VHT TX MCS set:
            1 streams: MCS 0-9
            2 streams: MCS 0-9
            3 streams: not supported
            4 streams: not supported
            5 streams: not supported
            6 streams: not supported
            7 streams: not supported
            8 streams: not supported
        VHT TX highest supported: 0 Mbps
        Frequencies:
            * 5180 MHz [36] (20.0 dBm)
            * 5200 MHz [40] (20.0 dBm)
            * 5220 MHz [44] (20.0 dBm)
            * 5240 MHz [48] (20.0 dBm)
            * 5260 MHz [52] (20.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5280 MHz [56] (20.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5300 MHz [60] (20.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5320 MHz [64] (20.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5500 MHz [100] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5520 MHz [104] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5540 MHz [108] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5560 MHz [112] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5580 MHz [116] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5600 MHz [120] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5620 MHz [124] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5640 MHz [128] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5660 MHz [132] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5680 MHz [136] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5700 MHz [140] (27.0 dBm) (no IR, radar detection)
              DFS state: usable (for 1583 sec)
              DFS CAC time: 60000 ms
            * 5745 MHz [149] (disabled)
            * 5765 MHz [153] (disabled)
            * 5785 MHz [157] (disabled)
            * 5805 MHz [161] (disabled)
            * 5825 MHz [165] (disabled)
    valid interface combinations:
         * #{ AP } <= 8,
           total <= 8, #channels <= 1, STA/AP BI must match, radar
detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz }

    HT Capability overrides:
         * MCS: ff ff ff ff ff ff ff ff ff ff
         * maximum A-MSDU length
         * supported channel width
         * short GI for 40 MHz
         * max A-MPDU length exponent
         * min MPDU start spacing
Wiphy phy1
    max # scan SSIDs: 4
    max scan IEs length: 2257 bytes
    Retry short limit: 7
    Retry long limit: 4
    Coverage class: 0 (up to 0m)
    Device supports AP-side u-APSD.
    Device supports T-DLS.
    Available Antennas: TX 0x7 RX 0x7
    Configured Antennas: TX 0x7 RX 0x7
    Supported interface modes:
         * IBSS
         * managed
         * AP
         * AP/VLAN
         * WDS
         * monitor
         * mesh point
         * P2P-client
         * P2P-GO
    Band 1:
        Capabilities: 0x11ef
            RX LDPC
            HT20/HT40
            SM Power Save disabled
            RX HT20 SGI
            RX HT40 SGI
            TX STBC
            RX STBC 1-stream
            Max AMSDU length: 3839 bytes
            DSSS/CCK HT40
        Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
        Minimum RX AMPDU time spacing: 8 usec (0x06)
        HT TX/RX MCS rate indexes supported: 0-23
        Frequencies:
            * 2412 MHz [1] (20.0 dBm)
            * 2417 MHz [2] (20.0 dBm)
            * 2422 MHz [3] (20.0 dBm)
            * 2427 MHz [4] (20.0 dBm)
            * 2432 MHz [5] (20.0 dBm)
            * 2437 MHz [6] (20.0 dBm)
            * 2442 MHz [7] (20.0 dBm)
            * 2447 MHz [8] (20.0 dBm)
            * 2452 MHz [9] (20.0 dBm)
            * 2457 MHz [10] (20.0 dBm)
            * 2462 MHz [11] (20.0 dBm)
            * 2467 MHz [12] (20.0 dBm)
            * 2472 MHz [13] (20.0 dBm)
            * 2484 MHz [14] (disabled)
    valid interface combinations:
         * #{ managed } <= 2048, #{ AP, mesh point } <= 8, #{
P2P-client, P2P-GO } <= 1, #{ IBSS } <= 1,
           total <= 2048, #channels <= 1, STA/AP BI must match
         * #{ WDS } <= 2048,
           total <= 2048, #channels <= 1, STA/AP BI must match
         * #{ IBSS, AP, mesh point } <= 1,
           total <= 1, #channels <= 1, STA/AP BI must match, radar
detect widths: { 20 MHz (no HT), 20 MHz }

    HT Capability overrides:
         * MCS: ff ff ff ff ff ff ff ff ff ff
         * maximum A-MSDU length
         * supported channel width
         * short GI for 40 MHz
         * max A-MPDU length exponent
         * min MPDU start spacing




Any suggestions on how to approach this?

-- Wilco Baan Hofman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
