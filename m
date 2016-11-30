Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCBcC-0001WW-8E
 for ath10k@lists.infradead.org; Wed, 30 Nov 2016 20:36:29 +0000
Received: from smtp26.msg.oleane.net ([172.17.20.148]) 
 by smtp-out06.msg.oleane.net with ESMTP id uAUIP1sE026407
 for <ath10k@lists.infradead.org>; Wed, 30 Nov 2016 19:25:02 +0100
Received: from RD9 ([195.6.104.67]) (authenticated)
 by smtp26.msg.oleane.net (MSA) with ESMTP id uAUI3lua006186
 for <ath10k@lists.infradead.org>; Wed, 30 Nov 2016 19:03:47 +0100
From: "Jean-Pierre Tosoni" <jp.tosoni@acksys.fr>
Subject: Client station sends probes on DFS channels
Date: Wed, 30 Nov 2016 19:03:47 +0100
Message-ID: <006401d24b34$191d7830$4b586890$@acksys.fr>
MIME-Version: 1.0
Content-Language: fr
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

Hello list,

There is a case where I can see probes on a DFS channel, from a
non-associated station using ath10k. (note that the problem does
not arise when using ath9k).

*The setup*

I am using Openwrt, wpa_supplicant and compat-wireless 2016-10-08,
Card firmware is	ath10k_pci: qca988x hw2.0 (0x4100016c, 0x043202ff)
		fw 10.2.4.70-2 api 5 htt-ver 2.1 wmi-op 5 htt-op 2
		cal otp max-sta 128 features no-p2p
	ath10k_pci: debug 0 debugfs 1 tracing 0 dfs 1 testmode 1

I am using channel 116, regdom US or FR, where I see no traffic at all
using wireshark+Airpcap.
I set wpa_supplicant to scan this channel only for a specific SSID "ssid1".

At initial startup of the client device, no probes are going out, which is
OK.

Then, on another device, I start a hostapd set to channel 116, with a
different SSID "otherssid" so that the supplicant will not associate.

Shortly (1-2s) after the beacons appear in the air, the client begins to
Send probe request in the air, which is unexpected, but acceptable since
the client can infer absence of radars from the presence of beacons.

*The problem*

If I power down the AP, the client continues to send probes for around
10 minutes, which is unacceptable since it cannot handle radar detection,
as it is a slave device in the meaning of ETSI/EN 301-893[1].


Some tests I made:
- I tried to investigate the "beacon hint" mechanism but it appears that it
  is not used on DFS channels.

- I tried to force the IEEE80211_NO_IR flag when IEEE80211_CHAN_DFS is set.

- When I reload the reg. domain using "iw reg set", the probes cease, but
will
  reappear if I cycle my AP again On then Off.

- When I let the client associate, then disassociate and stop the AP, the
same
  problem arises. It disappears if I add a call to ath10k_regd_update() in
mac.c
  after a disconnection (This is not a fix, since in my case the client
never
  associates).

- Since at startup, the client does not send probes, I infer that the
problem
  is *not* caused by a hidden AP that the card could see but not airpcap.

- I tried with channels 52 and 100, with regdom FR or US: same problem.

Any ideas?


[1]
http://www.etsi.org/deliver/etsi_en/301800_301899/301893/01.08.01_60/en_3018
93v010801p.pdf 

J.P. Tosoni - ACKSYS




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
