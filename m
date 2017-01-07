Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPyk1-0005HL-2Z
 for ath10k@lists.infradead.org; Sat, 07 Jan 2017 21:41:34 +0000
Received: by mail-it0-x234.google.com with SMTP id x2so39723115itf.1
 for <ath10k@lists.infradead.org>; Sat, 07 Jan 2017 13:41:12 -0800 (PST)
MIME-Version: 1.0
From: Shaun Crampton <shaun@cantab.net>
Date: Sat, 7 Jan 2017 21:41:11 +0000
Message-ID: <CAB3ewxNa2V3sLqB4FwxjK9vASzKq3cQhCDqLefudNs=xtKiSwg@mail.gmail.com>
Subject: Regular firmware crashes with QCA6174
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

I'm getting regular QCA6174 firmware crashes on Ubuntu 16.10 with the
QCA6174 (new Dell XPS 13, which shipped with Ubuntu 16.04).  Crash
seems to be at random, roughly every 30 minutes.  After the crash,
wifi stops working until I turn it off and on again.

Any help or workaround appreciated.  I've copied the dmesg log in
below.  I have the latest firmware from linux-firmware in
/lib/firmware.

Please CC in me any responses.

Thanks,

-Shaun

[ 3683.563419] wlp58s0: AP 00:07:26:aa:e0:45 changed bandwidth, new
config is 2472 MHz, width 2 (2462/0 MHz)
[ 3708.293559] ath10k_pci 0000:3a:00.0: failed to stop wmi scan: -11
[ 3708.293565] ath10k_pci 0000:3a:00.0: failed to stop scan: -11
[ 3708.293568] ath10k_pci 0000:3a:00.0: failed to start hw scan: -110
[ 3712.407418] ath10k_pci 0000:3a:00.0: failed to start hw scan: -11
[ 3713.437730] ath10k_pci 0000:3a:00.0: firmware crashed! (uuid
f68629ee-b9ac-4afa-a8ab-78f9b8dbc58d)
[ 3713.437757] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
[ 3713.437764] ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1
tracing 1 dfs 0 testmode 0
[ 3713.439421] ath10k_pci 0000:3a:00.0: firmware ver
WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features
wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[ 3713.440186] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A
crc32 6fc88fe7
[ 3713.440195] ath10k_pci 0000:3a:00.0: htt-ver 3.26 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[ 3713.442262] ath10k_pci 0000:3a:00.0: firmware register dump:
[ 3713.442273] ath10k_pci 0000:3a:00.0: [00]: 0x05030000 0x000015B3
0x009860FA 0x00955B31
[ 3713.442280] ath10k_pci 0000:3a:00.0: [04]: 0x009860FA 0x00060730
0x00000004 0x0040E8A0
[ 3713.442287] ath10k_pci 0000:3a:00.0: [08]: 0x00498110 0x00955A00
0x0000000B 0x00400000
[ 3713.442293] ath10k_pci 0000:3a:00.0: [12]: 0x00000009 0x00000000
0x00952CD0 0x00952CE6
[ 3713.442299] ath10k_pci 0000:3a:00.0: [16]: 0x00952CC4 0x0091080D
0x00000000 0x0091080D
[ 3713.442305] ath10k_pci 0000:3a:00.0: [20]: 0x409860FA 0x0040E7E8
0x00000000 0x0041E0DC
[ 3713.442311] ath10k_pci 0000:3a:00.0: [24]: 0x800B5A1D 0x0040E848
0x000FFFFF 0xC09860FA
[ 3713.442317] ath10k_pci 0000:3a:00.0: [28]: 0x809B3230 0x0040E948
0x00000018 0x004313B8
[ 3713.442323] ath10k_pci 0000:3a:00.0: [32]: 0x809B2992 0x0040E998
0x0040E9BC 0x00429548
[ 3713.442329] ath10k_pci 0000:3a:00.0: [36]: 0x8091D252 0x0040E9B8
0x00000000 0x00000001
[ 3713.442335] ath10k_pci 0000:3a:00.0: [40]: 0x809FF05D 0x0040EA68
0x0043A380 0x00429C10
[ 3713.442341] ath10k_pci 0000:3a:00.0: [44]: 0x809FCFDB 0x0040EA88
0x0043A380 0x00000001
[ 3713.442351] ath10k_pci 0000:3a:00.0: [48]: 0x80911210 0x0040EAD8
0x00000010 0x004041D0
[ 3713.442357] ath10k_pci 0000:3a:00.0: [52]: 0x80911154 0x0040EB28
0x00400000 0x00000000
[ 3713.442363] ath10k_pci 0000:3a:00.0: [56]: 0x8091122D 0x0040EB48
0x00000000 0x00400600
[ 3713.442467] ath10k_pci 0000:3a:00.0: failed to start hw scan: -108
[ 3713.525461] ieee80211 phy0: Hardware restart was requested
[ 3715.944232] ath10k_pci 0000:3a:00.0: device successfully recovered
[ 3743.622083] wlp58s0: deauthenticated from 00:07:26:aa:e0:45
(Reason: 6=CLASS2_FRAME_FROM_NONAUTH_STA)
[ 3743.664676] wlp58s0: authenticate with 00:07:26:aa:e0:45
[ 3743.706559] wlp58s0: send auth to 00:07:26:aa:e0:45 (try 1/3)
[ 3743.708669] wlp58s0: authenticated
[ 3743.715614] wlp58s0: associate with 00:07:26:aa:e0:45 (try 1/3)
[ 3743.720081] wlp58s0: RX AssocResp from 00:07:26:aa:e0:45
(capab=0x431 status=0 aid=3)
[ 3743.723689] wlp58s0: associated
[ 3743.732696] ath: EEPROM regdomain: 0x833a
[ 3743.732699] ath: EEPROM indicates we should expect a country code
[ 3743.732702] ath: doing EEPROM country->regdmn map search
[ 3743.732705] ath: country maps to regdmn code: 0x37
[ 3743.732707] ath: Country alpha2 being used: GB
[ 3743.732709] ath: Regpair used: 0x37
[ 3743.732712] ath: regdomain 0x833a dynamically updated by country IE

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
