Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atn08-0007Zx-It
 for ath10k@lists.infradead.org; Sat, 23 Apr 2016 02:08:54 +0000
Received: by mail-ob0-x22c.google.com with SMTP id n10so50594934obb.2
 for <ath10k@lists.infradead.org>; Fri, 22 Apr 2016 19:08:31 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 23 Apr 2016 04:08:30 +0200
Message-ID: <CAFq9a5xSQ5TPjQASaUCN_-niGU-hRBye_N4mjK3Td3u24Ea-7w@mail.gmail.com>
Subject: qca6174 hw3.2 / Killer 1535 interface not coming up, reporting
 "failed to enable dynamic BW: -11"
From: Leonhardt Wille <info@leonhardt-wille.de>
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

I'm trying to get my new wifi card working for three days. Have been
following all sorts of hints from all over the net and only got a
partial success by dissecting the qca61x4_2_2.bin file from my
notebook vendor's driver bundle and installing it to the QCA6174/hw3.0
firmware directory.
I say partial because the interface came right up after calling insmod
and I could connect to my AP, but after a reboot it didn't work any
more, but instead logs periodic warnings (see dmesg output below).
`iwconfig` is unusually slow and `ifconfig wlp62s0 up` gives a
`SIOCSIFFLAGS: Resource temporarily unavailable` after ~11 seconds.

Despite the invalid magics, this firmware is not crashing as the
others (official linux-firmware, ath10k-firmware).

Does anyone on this list have a working configuration for the 1535
(qca6173 hw3.2), or at least a clue what might be wrong?
The firmware-5.bin obtained from the Windows driver bundle starts with `SGMT`.


I'm happy about finding this mailing list, thanks for all the effort!

Leonhardt



# uname -a

```
Linux n8schnecke 4.4.0-21-generic #37-Ubuntu SMP Mon Apr 18 18:33:37
UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```

# lspci | grep QCA
```
3e:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 32)
```

# dmesg

```
[ 3941.549532] ath10k_pci 0000:3e:00.0: pci irq msi-x interrupts 8
irq_mode 0 reset_mode 0
[ 3941.784491] ath10k_pci 0000:3e:00.0: invalid firmware magic
[ 3941.846693] ath10k_pci 0000:3e:00.0: found invalid board magic
[ 3943.964198] ath10k_pci 0000:3e:00.0: qca6174 hw3.2 (0x05030000,
0x00340aff sub 1a56:1535) fw WLAN.RM.2.0-00180-QCARMSWPZ-1 fwapi 4
bdapi 1 htt-ver 3.26 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0
hwcrypto 1 features wowlan,ignore-otp,no-4addr-pad
[ 3943.964201] ath10k_pci 0000:3e:00.0: debug 0 debugfs 1 tracing 1
dfs 0 testmode 0
[ 3946.966754] ath10k_pci 0000:3e:00.0: could not suspend target (-11)
[ 3947.043554] ath: EEPROM regdomain: 0x6c
[ 3947.043556] ath: EEPROM indicates we should expect a direct regpair map
[ 3947.043557] ath: Country alpha2 being used: 00
[ 3947.043558] ath: Regpair used: 0x6c
[ 3947.045301] ath10k_pci 0000:3e:00.0 wlp62s0: renamed from wlan0
[ 3947.067781] IPv6: ADDRCONF(NETDEV_UP): wlp62s0: link is not ready
[ 3952.306968] ath10k_pci 0000:3e:00.0: failed to enable dynamic BW: -11
...
[ 4106.595895] ath10k_pci 0000:3e:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4109.595922] ath10k_pci 0000:3e:00.0: failed to set arp ac override
parameter: -11
...
```

# iwconfig wlp62s0

```
wlp62s0   IEEE 802.11abgn  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=0 dBm
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:on
```

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
