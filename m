Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-db3on0054.outbound.protection.outlook.com ([157.55.234.54]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLA8p-00073h-JA
 for ath10k@lists.infradead.org; Mon, 18 Jan 2016 13:46:45 +0000
From: Tomi Saarnio <Tomi.Saarnio@ekahau.com>
Subject: Regulatory Domains and Japan Channel 14
Date: Mon, 18 Jan 2016 13:46:20 +0000
Message-ID: <e252a74fb07d43bfb91910e6a513fa29DB5PR02MB0631B2535A2228C868A8B7C1FEC00@DB5PR02MB0631.eurprd02.prod.outlook.com>
Content-Language: en-US
Content-ID: <0E8150007906554FBDB43E3E5CB948C9@eurprd02.prod.outlook.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


Dear All,

We are trying to perform scanning at the 2.4GHz band with the JP (Japan) re=
gulatory domain, but it seems that the ath10k refuses to scan the channel 1=
4 although the channel 14 is a valid channel in Japan (with certain rate an=
d transmit power limitations).

We have set up an AP for the channel 14 (The AP is for Japanese market) and=
 it is visible when capturing beacon frames with our existing network monit=
oring gear on channel 14.

We have tried with two different ath10k firmwares. The setup is running the=
 ath10k on a Gateworks Ventana board with Linux OpenWrt 4.1.6 provided by G=
ateworks.

Firmware 1:

[=A0=A0 11.222699] ath10k_pci 0000:03:00.0: enabling device (0140 -> 0142)
[=A0=A0 11.229671] ath10k_pci 0000:03:00.0: pci irq legacy interrupts 0 irq=
_mode 0 reset_mode 0
[=A0=A0 11.463218] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k=
/cal-pci-0000:03:00.0.bin failed with error -2
[=A0=A0 11.473612] ath10k_pci 0000:03:00.0: Falling back to user helper
[=A0=A0 11.488114] firmware ath10k!cal-pci-0000:03:00.0.bin: firmware_loadi=
ng_store: map pages failed
[=A0=A0 12.699649] ath10k_pci 0000:03:00.0: qca988x hw2.0 (0x4100016c, 0x04=
3202ff) fw 10.2.4.70-2 api 5 htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta =
128 features no-p2p
[=A0=A0 12.716354] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.716370] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.716385] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.716400] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.725776] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.725793] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.735298] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.735326] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.735355] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.735378] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.796065] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 0 dfs=
 1 testmode 1
[=A0=A0 12.915521] ath10k_pci 0000:06:00.0: enabling device (0140 -> 0142)
[=A0=A0 12.922648] ath10k_pci 0000:06:00.0: pci irq legacy interrupts 0 irq=
_mode 0 reset_mode 0
[=A0=A0 13.141720] ath10k_pci 0000:06:00.0: Direct firmware load for ath10k=
/cal-pci-0000:06:00.0.bin failed with error -2
[=A0=A0 13.152120] ath10k_pci 0000:06:00.0: Falling back to user helper
[=A0=A0 13.166544] firmware ath10k!cal-pci-0000:06:00.0.bin: firmware_loadi=
ng_store: map pages failed
[=A0=A0 14.333721] ath10k_pci 0000:06:00.0: qca988x hw2.0 (0x4100016c, 0x04=
3202ff) fw 10.2.4.70-2 api 5 htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta =
128 features no-p2p
[=A0=A0 14.348433] ath10k_pci 0000:06:00.0: debug 0 debugfs 1 tracing 0 dfs=
 1 testmode 1


Firmware 2:

[=A0=A0 11.322556] ath10k_pci 0000:03:00.0: enabling device (0140 -> 0142)
[=A0=A0 11.331562] ath10k_pci 0000:03:00.0: pci irq legacy interrupts 0 irq=
_mode 0 reset_mode 0
[=A0=A0 11.547193] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k=
/cal-pci-0000:03:00.0.bin failed with error -2
[=A0=A0 11.557589] ath10k_pci 0000:03:00.0: Falling back to user helper
[=A0=A0 11.571973] firmware ath10k!cal-pci-0000:03:00.0.bin: firmware_loadi=
ng_store: map pages failed
[=A0=A0 12.775156] ath10k_pci 0000:03:00.0: qca988x hw2.0 (0x4100016c, 0x04=
3202ff) fw 10.2.4.70.17-2 api 5 htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-s=
ta 128 features no-p2p
[=A0=A0 12.790225] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790244] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790259] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790275] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790289] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790304] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790319] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790334] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790353] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.790368] ath10k_pci 0000:03:00.0: no channel configured; ignoring=
 frame(s)!
[=A0=A0 12.864307] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 0 dfs=
 1 testmode 1
[=A0=A0 12.979191] ath10k_pci 0000:06:00.0: enabling device (0140 -> 0142)
[=A0=A0 12.986343] ath10k_pci 0000:06:00.0: pci irq legacy interrupts 0 irq=
_mode 0 reset_mode 0
[=A0=A0 13.205675] ath10k_pci 0000:06:00.0: Direct firmware load for ath10k=
/cal-pci-0000:06:00.0.bin failed with error -2
[=A0=A0 13.216077] ath10k_pci 0000:06:00.0: Falling back to user helper
[=A0=A0 13.230590] firmware ath10k!cal-pci-0000:06:00.0.bin: firmware_loadi=
ng_store: map pages failed
[=A0=A0 14.403062] ath10k_pci 0000:06:00.0: qca988x hw2.0 (0x4100016c, 0x04=
3202ff) fw 10.2.4.70.17-2 api 5 htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-s=
ta 128 features no-p2p
[=A0=A0 14.418343] ath10k_pci 0000:06:00.0: debug 0 debugfs 1 tracing 0 dfs=
 1 testmode

Set the regulatory domain to JP:

# iw reg set JP

[=A0 123.871988] cfg80211: Regulatory domain changed to country: JP
[=A0 123.877850] cfg80211:=A0 DFS Master region: JProot@OpenWrt:/# =

[=A0 123.882030] cfg80211:=A0=A0 (start_freq - end_freq @ bandwidth), (max_=
antenna_gain, max_eirp), (dfs_cac_time)
[=A0 123.893148] cfg80211:=A0=A0 (2402000 KHz - 2482000 KHz @ 40000 KHz), (=
N/A, 2000 mBm), (N/A)
[=A0 123.901187] cfg80211:=A0=A0 (2474000 KHz - 2494000 KHz @ 20000 KHz), (=
N/A, 2000 mBm), (N/A)
[=A0 123.909220] cfg80211:=A0=A0 (4910000 KHz - 4990000 KHz @ 40000 KHz), (=
N/A, 2300 mBm), (N/A)
[=A0 123.917231] cfg80211:=A0=A0 (5030000 KHz - 5090000 KHz @ 40000 KHz), (=
N/A, 2300 mBm), (N/A)
[=A0 123.925261] cfg80211:=A0=A0 (5170000 KHz - 5250000 KHz @ 80000 KHz, 16=
0000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[=A0 123.934766] cfg80211:=A0=A0 (5250000 KHz - 5330000 KHz @ 80000 KHz, 16=
0000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[=A0 123.944273] cfg80211:=A0=A0 (5490000 KHz - 5710000 KHz @ 160000 KHz), =
(N/A, 2300 mBm), (0 s)
[=A0 123.952387] cfg80211:=A0=A0 (59000000 KHz - 66000000 KHz @ 2160000 KHz=
), (N/A, 1000 mBm), (N/A)

Verify the regulatory domain:

# iw reg get

global
country JP: DFS-JP
=A0=A0 =A0(2402 - 2482 @ 40), (N/A, 20), (N/A)
=A0=A0 =A0(2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM
=A0=A0 =A0(4910 - 4990 @ 40), (N/A, 23), (N/A)
=A0=A0 =A0(5030 - 5090 @ 40), (N/A, 23), (N/A)
=A0=A0 =A0(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
=A0=A0 =A0(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
=A0=A0 =A0(5490 - 5710 @ 160), (N/A, 23), (0 ms), DFS
=A0=A0 =A0(59000 - 66000 @ 2160), (N/A, 10), (N/A)

Perform passive scanning:

# ifconfig wlan0 up

# iw dev wlan0 scan passive | grep freq | sort

The scanning produces a list of frequencies where the APs were heard but no=
 channel 14 frequency 2484.

Questions: =


- Will the Japan channel 14 be supported by ath10k for the scanning in near=
 future?
- What is the current status=A0of the regulatory domains in general in the =
ath10k driver/firmware?

Best regards,
Tomi Saarnio

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
