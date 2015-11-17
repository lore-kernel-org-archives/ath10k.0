Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm20.bullet.mail.bf1.yahoo.com ([98.139.212.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZydMi-0006UC-BG
 for ath10k@lists.infradead.org; Tue, 17 Nov 2015 10:20:01 +0000
Date: Tue, 17 Nov 2015 10:19:33 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <971905455.6140297.1447755573636.JavaMail.yahoo@mail.yahoo.com>
Subject: TX-Power limits for ath10k based card on Linux 3.18.24 (long term
 support)?
MIME-Version: 1.0
References: <971905455.6140297.1447755573636.JavaMail.yahoo.ref@mail.yahoo.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello all,
I'm trying to use a COMPEX WLE600VX (see http://www.compex.com.sg:809/Datasheets/WLE600VX_Dsv1.0.2-141013-I.pdf) as an Access Point. According to the data sheet, the card should be able to transmit with about 20 dB (100mW). However, doing some measurements with a card on 2.4GHz channel 3 in 802.11g 54MBit coding I could only observe a TX power of about 7..9dB. During the measurement the card was under full load with iperf transmitting at 20..25 mbps. This is only a fraction of the stated TX power, so something strange must be going on. The measurements were done with a Marconi 6460 powermeter.


My hostapd.conf is very simple:
interface=ap
driver=nl80211
ssid2=<omitted>
channel=3
hw_mode=g
auth_algs=1
ignore_broadcast_ssid=0
eap_server=0
wpa=3
wpa_passphrase=<omitted>
wpa_key_mgmt=WPA-PSK WPA-PSK-SHA256 
wpa_pairwise=TKIP CCMP
ctrl_interface=/var/run/hostapd
macaddr_acl=0

The regdb (compiled directly into the kernel) shouldn't be a problem either:
global
country 00: DFS-UNSET
(2402 - 2472 @ 40), (N/A, 100), (N/A)
(2457 - 2482 @ 40), (N/A, 100), (N/A)
(2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, PASSIVE-SCAN
(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, PASSIVE-SCAN
(5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, PASSIVE-SCAN
(5735 - 5835 @ 80), (N/A, 20), (N/A), PASSIVE-SCAN
(57240 - 63720 @ 2160), (N/A, 0), (N/A)

Does anybody have an idea, why the TX power seems to be so very low?


 -- Regards       Joerg

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
