Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMBLF-0007RS-4w
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 09:15:46 +0000
Received: by mail-yk0-x232.google.com with SMTP id a85so41309032ykb.1
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 01:15:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=+R_URXt6-n=9+HPs7fBg5FszCLVDxosfsQ9DQ78QNUg@mail.gmail.com>
References: <CANCHnQoi_PiQC=Y2H_5eotKG1g9La1=Sxcob2C2cww-MfX8QYQ@mail.gmail.com>
 <CA+BoTQ=+R_URXt6-n=9+HPs7fBg5FszCLVDxosfsQ9DQ78QNUg@mail.gmail.com>
Date: Thu, 21 Jan 2016 10:15:23 +0100
Message-ID: <CANCHnQr1y0wVuzqpBnoUcCXD-WGnw_D0W5vE7ba39eALSas6Ew@mail.gmail.com>
Subject: Re: 5GHz AP on a QCA988x
From: Jeroen Roovers <jeroen.roovers@airfi.aero>
Content-Type: multipart/mixed; boundary=001a1143e91ce814130529d48a5e
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--001a1143e91ce814130529d48a5e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

country 00: DFS-UNSET
        (2402 - 2472 @ 40), (6, 20), (N/A)
        (2457 - 2482 @ 40), (6, 20), (N/A), PASSIVE-SCAN
        (2474 - 2494 @ 20), (6, 20), (N/A), NO-OFDM, PASSIVE-SCAN
        (5170 - 5250 @ 160), (6, 20), (N/A), PASSIVE-SCAN
        (5250 - 5330 @ 160), (6, 20), (0 ms), DFS, PASSIVE-SCAN
        (5490 - 5730 @ 160), (6, 20), (0 ms), DFS, PASSIVE-SCAN
        (5735 - 5835 @ 80), (6, 20), (N/A), PASSIVE-SCAN
        (57240 - 63720 @ 2160), (N/A, 0), (N/A)

[   13.587870] ath10k_pci 0000:02:00.0: pci irq msi interrupts 1
irq_mode 0 reset_mode 0
[   14.062943] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[   14.327191] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[   15.625794] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff sub 0000:0000) fw 10.2.4.70.17-2 fwapi 5 bdapi 1 htt-ver
2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1 features
no-p2p,raw-mode
[   15.625796] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 1
dfs 1 testmode 0
[   15.686817] ath: EEPROM regdomain: 0x6a
[   15.686818] ath: EEPROM indicates we should expect a direct regpair map
[   15.686820] ath: Country alpha2 being used: 00
[   15.686820] ath: Regpair used: 0x6a
[67009.248697] ath10k_pci 0000:02:00.0: pci irq msi interrupts 1
irq_mode 0 reset_mode 0
[67009.379191] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[67009.435156] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[67010.635063] ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff sub 0000:0000) fw 10.2.4.70.17-2 fwapi 5 bdapi 1 htt-ver
2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1 features
no-p2p,raw-mode
[67010.635101] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 1
dfs 1 testmode 0
[67010.695143] ath: EEPROM regdomain: 0x6a
[67010.695150] ath: EEPROM indicates we should expect a direct regpair map
[67010.695156] ath: Country alpha2 being used: 00
[67010.695159] ath: Regpair used: 0x6a

On 21 January 2016 at 09:52, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 21 January 2016 at 09:38, Jeroen Roovers <jeroen.roovers@airfi.aero> w=
rote:
>> 02:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac
>> Wireless Network Adapter
>>         Flags: bus master, fast devsel, latency 0, IRQ 28
>>         Memory at fe200000 (64-bit, non-prefetchable) [size=3D2M]
>>         Expansion ROM at fe400000 [disabled] [size=3D64K]
>>         Capabilities: [40] Power Management version 2
>>         Capabilities: [50] MSI: Enable+ Count=3D1/8 Maskable+ 64bit-
>>         Capabilities: [70] Express Endpoint, MSI 00
>>         Capabilities: [100] Advanced Error Reporting
>>         Capabilities: [140] Virtual Channel
>>         Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
>>         Kernel driver in use: ath10k_pci
>>         Kernel modules: ath10k_pci
>>
>> Vendor/device ID: 168c:003c
>>
>> I am trying to get a 5GHZ AP working on the above device, using a
>> Linux 4.4.0 kernel on a generic PC right now, in hopes of getting same
>> to work on an embedded (ARM, but it's not important) system in the
>> near future.
>>
>> Any attempt to get that up ends in a regulatory-based refusal to open
>> IR on any 5GHz band frequency, even when I add "regulatory onus" and a
>> new XZ region (hey, this is intended to work especially in
>> "international waters") in a db.txt I define myself which should grant
>> everything I ever wanted. Is there something the firmware is
>> overriding here?
>>
>> Firmware as of the latest would be:
>>
>> /lib/firmware/ath10k/QCA988X/hw2.0/firmware-5.bin_10.2.4.70.17-2
>>
>> I could attach logs but I thought I might be missing something very obvi=
ous.
>
> "iw list" and "iw reg get" is very good start. Kernel log will be
> useful as well to know device regulatory.
>
> Do you have other wifi cards on this system? I recall this could cause
> problems. Not sure if that's still the case but may be worth
> considering.
>
> In case you're not aware: channels rules are a result of intersected
> system level regulatory and device (taken from eeprom) regulatory.
> This can sometimes confuse because you think you're setting region XZ
> which allows use of channel 36 but it remains unavailable due to the
> device's regulatory.
>
>
> Micha=C5=82

--001a1143e91ce814130529d48a5e
Content-Type: text/plain; charset=US-ASCII; name="iw-list.txt"
Content-Disposition: attachment; filename="iw-list.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ijo1ihnb0

V2lwaHkgcGh5MAoJbWF4ICMgc2NhbiBTU0lEczogMTYKCW1heCBzY2FuIElFcyBsZW5ndGg6IDE5
NSBieXRlcwoJUmV0cnkgc2hvcnQgbGltaXQ6IDcKCVJldHJ5IGxvbmcgbGltaXQ6IDQKCUNvdmVy
YWdlIGNsYXNzOiAwICh1cCB0byAwbSkKCURldmljZSBzdXBwb3J0cyBSU04tSUJTUy4KCURldmlj
ZSBzdXBwb3J0cyBBUC1zaWRlIHUtQVBTRC4KCVN1cHBvcnRlZCBDaXBoZXJzOgoJCSogV0VQNDAg
KDAwLTBmLWFjOjEpCgkJKiBXRVAxMDQgKDAwLTBmLWFjOjUpCgkJKiBUS0lQICgwMC0wZi1hYzoy
KQoJCSogQ0NNUCAoMDAtMGYtYWM6NCkKCQkqIENNQUMgKDAwLTBmLWFjOjYpCglBdmFpbGFibGUg
QW50ZW5uYXM6IFRYIDB4NyBSWCAweDcKCUNvbmZpZ3VyZWQgQW50ZW5uYXM6IFRYIDB4NyBSWCAw
eDcKCVN1cHBvcnRlZCBpbnRlcmZhY2UgbW9kZXM6CgkJICogbWFuYWdlZAoJCSAqIEFQCgkJICog
QVAvVkxBTgoJCSAqIG1vbml0b3IKCQkgKiBtZXNoIHBvaW50CglCYW5kIDE6CgkJQ2FwYWJpbGl0
aWVzOiAweDE5ZTMKCQkJUlggTERQQwoJCQlIVDIwL0hUNDAKCQkJU3RhdGljIFNNIFBvd2VyIFNh
dmUKCQkJUlggSFQyMCBTR0kKCQkJUlggSFQ0MCBTR0kKCQkJVFggU1RCQwoJCQlSWCBTVEJDIDEt
c3RyZWFtCgkJCU1heCBBTVNEVSBsZW5ndGg6IDc5MzUgYnl0ZXMKCQkJRFNTUy9DQ0sgSFQ0MAoJ
CU1heGltdW0gUlggQU1QRFUgbGVuZ3RoIDY1NTM1IGJ5dGVzIChleHBvbmVudDogMHgwMDMpCgkJ
TWluaW11bSBSWCBBTVBEVSB0aW1lIHNwYWNpbmc6IDggdXNlYyAoMHgwNikKCQlIVCBUWC9SWCBN
Q1MgcmF0ZSBpbmRleGVzIHN1cHBvcnRlZDogMC0yMwoJCVZIVCBDYXBhYmlsaXRpZXMgKDB4MzM4
MDAxYjIpOgoJCQlNYXggTVBEVSBsZW5ndGg6IDExNDU0CgkJCVN1cHBvcnRlZCBDaGFubmVsIFdp
ZHRoOiBuZWl0aGVyIDE2MCBub3IgODArODAKCQkJUlggTERQQwoJCQlzaG9ydCBHSSAoODAgTUh6
KQoJCQlUWCBTVEJDCgkJCVJYIGFudGVubmEgcGF0dGVybiBjb25zaXN0ZW5jeQoJCQlUWCBhbnRl
bm5hIHBhdHRlcm4gY29uc2lzdGVuY3kKCQlWSFQgUlggTUNTIHNldDoKCQkJMSBzdHJlYW1zOiBN
Q1MgMC05CgkJCTIgc3RyZWFtczogTUNTIDAtOQoJCQkzIHN0cmVhbXM6IE1DUyAwLTkKCQkJNCBz
dHJlYW1zOiBub3Qgc3VwcG9ydGVkCgkJCTUgc3RyZWFtczogbm90IHN1cHBvcnRlZAoJCQk2IHN0
cmVhbXM6IG5vdCBzdXBwb3J0ZWQKCQkJNyBzdHJlYW1zOiBub3Qgc3VwcG9ydGVkCgkJCTggc3Ry
ZWFtczogbm90IHN1cHBvcnRlZAoJCVZIVCBSWCBoaWdoZXN0IHN1cHBvcnRlZDogMCBNYnBzCgkJ
VkhUIFRYIE1DUyBzZXQ6CgkJCTEgc3RyZWFtczogTUNTIDAtOQoJCQkyIHN0cmVhbXM6IE1DUyAw
LTkKCQkJMyBzdHJlYW1zOiBNQ1MgMC05CgkJCTQgc3RyZWFtczogbm90IHN1cHBvcnRlZAoJCQk1
IHN0cmVhbXM6IG5vdCBzdXBwb3J0ZWQKCQkJNiBzdHJlYW1zOiBub3Qgc3VwcG9ydGVkCgkJCTcg
c3RyZWFtczogbm90IHN1cHBvcnRlZAoJCQk4IHN0cmVhbXM6IG5vdCBzdXBwb3J0ZWQKCQlWSFQg
VFggaGlnaGVzdCBzdXBwb3J0ZWQ6IDAgTWJwcwoJCUJpdHJhdGVzIChub24tSFQpOgoJCQkqIDEu
MCBNYnBzCgkJCSogMi4wIE1icHMgKHNob3J0IHByZWFtYmxlIHN1cHBvcnRlZCkKCQkJKiA1LjUg
TWJwcyAoc2hvcnQgcHJlYW1ibGUgc3VwcG9ydGVkKQoJCQkqIDExLjAgTWJwcyAoc2hvcnQgcHJl
YW1ibGUgc3VwcG9ydGVkKQoJCQkqIDYuMCBNYnBzCgkJCSogOS4wIE1icHMKCQkJKiAxMi4wIE1i
cHMKCQkJKiAxOC4wIE1icHMKCQkJKiAyNC4wIE1icHMKCQkJKiAzNi4wIE1icHMKCQkJKiA0OC4w
IE1icHMKCQkJKiA1NC4wIE1icHMKCQlGcmVxdWVuY2llczoKCQkJKiAyNDEyIE1IeiBbMV0gKDIw
LjAgZEJtKQoJCQkqIDI0MTcgTUh6IFsyXSAoMjAuMCBkQm0pCgkJCSogMjQyMiBNSHogWzNdICgy
MC4wIGRCbSkKCQkJKiAyNDI3IE1IeiBbNF0gKDIwLjAgZEJtKQoJCQkqIDI0MzIgTUh6IFs1XSAo
MjAuMCBkQm0pCgkJCSogMjQzNyBNSHogWzZdICgyMC4wIGRCbSkKCQkJKiAyNDQyIE1IeiBbN10g
KDIwLjAgZEJtKQoJCQkqIDI0NDcgTUh6IFs4XSAoMjAuMCBkQm0pCgkJCSogMjQ1MiBNSHogWzld
ICgyMC4wIGRCbSkKCQkJKiAyNDU3IE1IeiBbMTBdICgyMC4wIGRCbSkKCQkJKiAyNDYyIE1IeiBb
MTFdICgyMC4wIGRCbSkKCQkJKiAyNDY3IE1IeiBbMTJdICgyMC4wIGRCbSkgKG5vIElSKQoJCQkq
IDI0NzIgTUh6IFsxM10gKDIwLjAgZEJtKSAobm8gSVIpCgkJCSogMjQ4NCBNSHogWzE0XSAoZGlz
YWJsZWQpCglCYW5kIDI6CgkJQ2FwYWJpbGl0aWVzOiAweDE5ZTMKCQkJUlggTERQQwoJCQlIVDIw
L0hUNDAKCQkJU3RhdGljIFNNIFBvd2VyIFNhdmUKCQkJUlggSFQyMCBTR0kKCQkJUlggSFQ0MCBT
R0kKCQkJVFggU1RCQwoJCQlSWCBTVEJDIDEtc3RyZWFtCgkJCU1heCBBTVNEVSBsZW5ndGg6IDc5
MzUgYnl0ZXMKCQkJRFNTUy9DQ0sgSFQ0MAoJCU1heGltdW0gUlggQU1QRFUgbGVuZ3RoIDY1NTM1
IGJ5dGVzIChleHBvbmVudDogMHgwMDMpCgkJTWluaW11bSBSWCBBTVBEVSB0aW1lIHNwYWNpbmc6
IDggdXNlYyAoMHgwNikKCQlIVCBUWC9SWCBNQ1MgcmF0ZSBpbmRleGVzIHN1cHBvcnRlZDogMC0y
MwoJCVZIVCBDYXBhYmlsaXRpZXMgKDB4MzM4MDAxYjIpOgoJCQlNYXggTVBEVSBsZW5ndGg6IDEx
NDU0CgkJCVN1cHBvcnRlZCBDaGFubmVsIFdpZHRoOiBuZWl0aGVyIDE2MCBub3IgODArODAKCQkJ
UlggTERQQwoJCQlzaG9ydCBHSSAoODAgTUh6KQoJCQlUWCBTVEJDCgkJCVJYIGFudGVubmEgcGF0
dGVybiBjb25zaXN0ZW5jeQoJCQlUWCBhbnRlbm5hIHBhdHRlcm4gY29uc2lzdGVuY3kKCQlWSFQg
UlggTUNTIHNldDoKCQkJMSBzdHJlYW1zOiBNQ1MgMC05CgkJCTIgc3RyZWFtczogTUNTIDAtOQoJ
CQkzIHN0cmVhbXM6IE1DUyAwLTkKCQkJNCBzdHJlYW1zOiBub3Qgc3VwcG9ydGVkCgkJCTUgc3Ry
ZWFtczogbm90IHN1cHBvcnRlZAoJCQk2IHN0cmVhbXM6IG5vdCBzdXBwb3J0ZWQKCQkJNyBzdHJl
YW1zOiBub3Qgc3VwcG9ydGVkCgkJCTggc3RyZWFtczogbm90IHN1cHBvcnRlZAoJCVZIVCBSWCBo
aWdoZXN0IHN1cHBvcnRlZDogMCBNYnBzCgkJVkhUIFRYIE1DUyBzZXQ6CgkJCTEgc3RyZWFtczog
TUNTIDAtOQoJCQkyIHN0cmVhbXM6IE1DUyAwLTkKCQkJMyBzdHJlYW1zOiBNQ1MgMC05CgkJCTQg
c3RyZWFtczogbm90IHN1cHBvcnRlZAoJCQk1IHN0cmVhbXM6IG5vdCBzdXBwb3J0ZWQKCQkJNiBz
dHJlYW1zOiBub3Qgc3VwcG9ydGVkCgkJCTcgc3RyZWFtczogbm90IHN1cHBvcnRlZAoJCQk4IHN0
cmVhbXM6IG5vdCBzdXBwb3J0ZWQKCQlWSFQgVFggaGlnaGVzdCBzdXBwb3J0ZWQ6IDAgTWJwcwoJ
CUJpdHJhdGVzIChub24tSFQpOgoJCQkqIDYuMCBNYnBzCgkJCSogOS4wIE1icHMKCQkJKiAxMi4w
IE1icHMKCQkJKiAxOC4wIE1icHMKCQkJKiAyNC4wIE1icHMKCQkJKiAzNi4wIE1icHMKCQkJKiA0
OC4wIE1icHMKCQkJKiA1NC4wIE1icHMKCQlGcmVxdWVuY2llczoKCQkJKiA1MTgwIE1IeiBbMzZd
ICgyMC4wIGRCbSkgKG5vIElSKQoJCQkqIDUyMDAgTUh6IFs0MF0gKDIwLjAgZEJtKSAobm8gSVIp
CgkJCSogNTIyMCBNSHogWzQ0XSAoMjAuMCBkQm0pIChubyBJUikKCQkJKiA1MjQwIE1IeiBbNDhd
ICgyMC4wIGRCbSkgKG5vIElSKQoJCQkqIDUyNjAgTUh6IFs1Ml0gKDIwLjAgZEJtKSAobm8gSVIs
IHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJ
ICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTI4MCBNSHogWzU2XSAoMjAuMCBkQm0pIChu
byBJUiwgcmFkYXIgZGV0ZWN0aW9uKQoJCQkgIERGUyBzdGF0ZTogdXNhYmxlIChmb3IgNTUgc2Vj
KQoJCQkgIERGUyBDQUMgdGltZTogNjAwMDAgbXMKCQkJKiA1MzAwIE1IeiBbNjBdICgyMC4wIGRC
bSkgKG5vIElSLCByYWRhciBkZXRlY3Rpb24pCgkJCSAgREZTIHN0YXRlOiB1c2FibGUgKGZvciA1
NSBzZWMpCgkJCSAgREZTIENBQyB0aW1lOiA2MDAwMCBtcwoJCQkqIDUzMjAgTUh6IFs2NF0gKDIw
LjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJsZSAo
Zm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTUwMCBNSHogWzEw
MF0gKDIwLjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVz
YWJsZSAoZm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTUyMCBN
SHogWzEwNF0gKDIwLjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3Rh
dGU6IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSog
NTU0MCBNSHogWzEwOF0gKDIwLjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBE
RlMgc3RhdGU6IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1z
CgkJCSogNTU2MCBNSHogWzExMl0gKDIwLjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikK
CQkJICBERlMgc3RhdGU6IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYw
MDAwIG1zCgkJCSogNTU4MCBNSHogWzExNl0gKDIwLjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVj
dGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRp
bWU6IDYwMDAwIG1zCgkJCSogNTYwMCBNSHogWzEyMF0gKDIwLjAgZEJtKSAobm8gSVIsIHJhZGFy
IGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJICBERlMg
Q0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTYyMCBNSHogWzEyNF0gKDIwLjAgZEJtKSAobm8gSVIs
IHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJ
ICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTY0MCBNSHogWzEyOF0gKDIwLjAgZEJtKSAo
bm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJsZSAoZm9yIDU1IHNl
YykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTY2MCBNSHogWzEzMl0gKDIwLjAg
ZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJsZSAoZm9y
IDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTY4MCBNSHogWzEzNl0g
KDIwLjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6IHVzYWJs
ZSAoZm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTcwMCBNSHog
WzE0MF0gKDIwLjAgZEJtKSAobm8gSVIsIHJhZGFyIGRldGVjdGlvbikKCQkJICBERlMgc3RhdGU6
IHVzYWJsZSAoZm9yIDU1IHNlYykKCQkJICBERlMgQ0FDIHRpbWU6IDYwMDAwIG1zCgkJCSogNTcy
MCBNSHogWzE0NF0gKDIwLjAgZEJtKSAobm8gSVIpCgkJCSogNTc0NSBNSHogWzE0OV0gKDIwLjAg
ZEJtKSAobm8gSVIpCgkJCSogNTc2NSBNSHogWzE1M10gKDIwLjAgZEJtKSAobm8gSVIpCgkJCSog
NTc4NSBNSHogWzE1N10gKDIwLjAgZEJtKSAobm8gSVIpCgkJCSogNTgwNSBNSHogWzE2MV0gKDIw
LjAgZEJtKSAobm8gSVIpCgkJCSogNTgyNSBNSHogWzE2NV0gKDIwLjAgZEJtKSAobm8gSVIpCglT
dXBwb3J0ZWQgY29tbWFuZHM6CgkJICogbmV3X2ludGVyZmFjZQoJCSAqIHNldF9pbnRlcmZhY2UK
CQkgKiBuZXdfa2V5CgkJICogc3RhcnRfYXAKCQkgKiBuZXdfc3RhdGlvbgoJCSAqIG5ld19tcGF0
aAoJCSAqIHNldF9tZXNoX2NvbmZpZwoJCSAqIHNldF9ic3MKCQkgKiBhdXRoZW50aWNhdGUKCQkg
KiBhc3NvY2lhdGUKCQkgKiBkZWF1dGhlbnRpY2F0ZQoJCSAqIGRpc2Fzc29jaWF0ZQoJCSAqIGpv
aW5faWJzcwoJCSAqIGpvaW5fbWVzaAoJCSAqIHJlbWFpbl9vbl9jaGFubmVsCgkJICogc2V0X3R4
X2JpdHJhdGVfbWFzawoJCSAqIGZyYW1lCgkJICogZnJhbWVfd2FpdF9jYW5jZWwKCQkgKiBzZXRf
d2lwaHlfbmV0bnMKCQkgKiBzZXRfY2hhbm5lbAoJCSAqIHNldF93ZHNfcGVlcgoJCSAqIHByb2Jl
X2NsaWVudAoJCSAqIHNldF9ub2Fja19tYXAKCQkgKiByZWdpc3Rlcl9iZWFjb25zCgkJICogc3Rh
cnRfcDJwX2RldmljZQoJCSAqIHNldF9tY2FzdF9yYXRlCgkJICogY2hhbm5lbF9zd2l0Y2gKCQkg
KiBVbmtub3duIGNvbW1hbmQgKDEwNCkKCQkgKiBjb25uZWN0CgkJICogZGlzY29ubmVjdAoJU3Vw
cG9ydGVkIFRYIGZyYW1lIHR5cGVzOgoJCSAqIElCU1M6IDB4MDAgMHgxMCAweDIwIDB4MzAgMHg0
MCAweDUwIDB4NjAgMHg3MCAweDgwIDB4OTAgMHhhMCAweGIwIDB4YzAgMHhkMCAweGUwIDB4ZjAK
CQkgKiBtYW5hZ2VkOiAweDAwIDB4MTAgMHgyMCAweDMwIDB4NDAgMHg1MCAweDYwIDB4NzAgMHg4
MCAweDkwIDB4YTAgMHhiMCAweGMwIDB4ZDAgMHhlMCAweGYwCgkJICogQVA6IDB4MDAgMHgxMCAw
eDIwIDB4MzAgMHg0MCAweDUwIDB4NjAgMHg3MCAweDgwIDB4OTAgMHhhMCAweGIwIDB4YzAgMHhk
MCAweGUwIDB4ZjAKCQkgKiBBUC9WTEFOOiAweDAwIDB4MTAgMHgyMCAweDMwIDB4NDAgMHg1MCAw
eDYwIDB4NzAgMHg4MCAweDkwIDB4YTAgMHhiMCAweGMwIDB4ZDAgMHhlMCAweGYwCgkJICogbWVz
aCBwb2ludDogMHgwMCAweDEwIDB4MjAgMHgzMCAweDQwIDB4NTAgMHg2MCAweDcwIDB4ODAgMHg5
MCAweGEwIDB4YjAgMHhjMCAweGQwIDB4ZTAgMHhmMAoJCSAqIFAyUC1jbGllbnQ6IDB4MDAgMHgx
MCAweDIwIDB4MzAgMHg0MCAweDUwIDB4NjAgMHg3MCAweDgwIDB4OTAgMHhhMCAweGIwIDB4YzAg
MHhkMCAweGUwIDB4ZjAKCQkgKiBQMlAtR086IDB4MDAgMHgxMCAweDIwIDB4MzAgMHg0MCAweDUw
IDB4NjAgMHg3MCAweDgwIDB4OTAgMHhhMCAweGIwIDB4YzAgMHhkMCAweGUwIDB4ZjAKCQkgKiBQ
MlAtZGV2aWNlOiAweDAwIDB4MTAgMHgyMCAweDMwIDB4NDAgMHg1MCAweDYwIDB4NzAgMHg4MCAw
eDkwIDB4YTAgMHhiMCAweGMwIDB4ZDAgMHhlMCAweGYwCglTdXBwb3J0ZWQgUlggZnJhbWUgdHlw
ZXM6CgkJICogSUJTUzogMHg0MCAweGIwIDB4YzAgMHhkMAoJCSAqIG1hbmFnZWQ6IDB4NDAgMHhk
MAoJCSAqIEFQOiAweDAwIDB4MjAgMHg0MCAweGEwIDB4YjAgMHhjMCAweGQwCgkJICogQVAvVkxB
TjogMHgwMCAweDIwIDB4NDAgMHhhMCAweGIwIDB4YzAgMHhkMAoJCSAqIG1lc2ggcG9pbnQ6IDB4
YjAgMHhjMCAweGQwCgkJICogUDJQLWNsaWVudDogMHg0MCAweGQwCgkJICogUDJQLUdPOiAweDAw
IDB4MjAgMHg0MCAweGEwIDB4YjAgMHhjMCAweGQwCgkJICogUDJQLWRldmljZTogMHg0MCAweGQw
Cglzb2Z0d2FyZSBpbnRlcmZhY2UgbW9kZXMgKGNhbiBhbHdheXMgYmUgYWRkZWQpOgoJCSAqIEFQ
L1ZMQU4KCQkgKiBtb25pdG9yCgl2YWxpZCBpbnRlcmZhY2UgY29tYmluYXRpb25zOgoJCSAqICN7
IEFQLCBtZXNoIHBvaW50IH0gPD0gOCwKCQkgICB0b3RhbCA8PSA4LCAjY2hhbm5lbHMgPD0gMSwg
U1RBL0FQIEJJIG11c3QgbWF0Y2gsIHJhZGFyIGRldGVjdCB3aWR0aHM6IHsgMjAgTUh6IChubyBI
VCksIDIwIE1IeiwgNDAgTUh6LCA4MCBNSHogfQoKCUhUIENhcGFiaWxpdHkgb3ZlcnJpZGVzOgoJ
CSAqIE1DUzogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKCQkgKiBtYXhpbXVtIEEtTVNE
VSBsZW5ndGgKCQkgKiBzdXBwb3J0ZWQgY2hhbm5lbCB3aWR0aAoJCSAqIHNob3J0IEdJIGZvciA0
MCBNSHoKCQkgKiBtYXggQS1NUERVIGxlbmd0aCBleHBvbmVudAoJCSAqIG1pbiBNUERVIHN0YXJ0
IHNwYWNpbmcKCURldmljZSBzdXBwb3J0cyBUWCBzdGF0dXMgc29ja2V0IG9wdGlvbi4KCURldmlj
ZSBzdXBwb3J0cyBIVC1JQlNTLgoJRGV2aWNlIHN1cHBvcnRzIFNBRSB3aXRoIEFVVEhFTlRJQ0FU
RSBjb21tYW5kCglEZXZpY2Ugc3VwcG9ydHMgc2NhbiBmbHVzaC4KCURldmljZSBzdXBwb3J0cyBw
ZXItdmlmIFRYIHBvd2VyIHNldHRpbmcKCURyaXZlciBzdXBwb3J0cyBhIHVzZXJzcGFjZSBNUE0K
CURyaXZlci9kZXZpY2UgYmFuZHdpZHRoIGNoYW5nZXMgZHVyaW5nIEJTUyBsaWZldGltZSAoQVAv
R08gbW9kZSkKCURldmljZSBzdXBwb3J0cyBzdGF0aWMgU01QUwo=
--001a1143e91ce814130529d48a5e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--001a1143e91ce814130529d48a5e--
