Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22c.google.com ([2607:f8b0:4002:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOi6m-00080u-Ma
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 08:39:17 +0000
Received: by mail-yk0-x22c.google.com with SMTP id v14so22650598ykd.3
 for <ath10k@lists.infradead.org>; Thu, 28 Jan 2016 00:38:56 -0800 (PST)
MIME-Version: 1.0
From: Bartlomiej Grzeskowiak <bartlomiej.grzeskowiak@gmail.com>
Date: Thu, 28 Jan 2016 09:38:25 +0100
Message-ID: <CADaZW1FURsp=S5uctjm52gQEB=bsqv3Jo-9nAw8uvPO84LEfqw@mail.gmail.com>
Subject: Can not get 802.11ac with ath10k QCA6147 chip (802.11abgn works)
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

I use ath10k driver for our QCA6147 chip for a while now. However I
have realized that 802.11 mode reported in my system is abgn. iwconfig
and linkspeed in wpa_cli reports 6 Mbs speed.
# iwconfig wlan0
wlan0 IEEE 802.11abgn ESSID:"NETGEARac5G.lab"
Mode:Managed Frequency:5.18 GHz Access Point: E4:F4:C6:12:91:08
Bit Rate=6 Mb/s Tx-Power=30 dBm
Retry short limit:7 RTS thr:off Fragment thr:off

# wpa_cli signal_poll
RSSI=-36
LINKSPEED=6
NOISE=-98
FREQUENCY=5240
WIDTH=80 MHz
AVG_RSSI=-35

I use 802.11ac router NIGHTHAWK R7000, configured and tested on the
system with Netgear A6100 USB wlan stick. My system seems to be ok,
since Netgear A6100 usb stick working with RTL8811AU driver
(non-backport drivre) reports 802.11AC:
# iwconfig wlan0
IEEE 802.11AC  ESSID:"NETGEARac5G.lab"  Nickname:"<WIFI@REALTEK>"
Mode:Managed  Frequency:5.24 GHz  Access Point: E4:F4:C6:12:91:08
Bit Rate:434 Mb/s   Sensitivity:0/0

# wpa_cli signal_poll
Selected interface 'wlan0'
RSSI=-45
LINKSPEED=434
NOISE=9999
FREQUENCY=5240

I was searching through the maillist, but nothing found.
Following wpa_supplicant debug messages the 5GHz operates on 80MHz
channel bandwidth

Add interface wlan0 to a new radio phy0
nl80211: Regulatory information - country=00
nl80211: 2402-2472 @ 40 MHz 20 mBm
nl80211: 2457-2482 @ 40 MHz 20 mBm (no IR)
nl80211: 2474-2494 @ 20 MHz 20 mBm (no OFDM) (no IR)
nl80211: 5170-5250 @ 160 MHz 20 mBm (no IR)
nl80211: 5250-5330 @ 160 MHz 20 mBm (DFS) (no IR)
nl80211: 5490-5730 @ 160 MHz 20 mBm (DFS) (no IR)
nl80211: 5735-5835 @ 80 MHz 20 mBm (no IR)
nl80211: 57240-63720 @ 2160 MHz 0 mBm
nl80211: Added 802.11b mode based on 802.11g information

BR
Bartek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
