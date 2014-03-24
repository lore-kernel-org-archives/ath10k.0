Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS9LM-0007iK-Mi
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 18:11:30 +0000
Message-ID: <53307524.8070501@candelatech.com>
Date: Mon, 24 Mar 2014 11:10:44 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Scanning all 5Ghz channels with AC NIC.
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
To: "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, ath10k <ath10k@lists.infradead.org>

I notice this issue while trying to scan specific channels with
an ath10k NIC.

If I configure supplicant to use a specific freq list, it will fail:

1395683887.458813: nl80211: Scan frequency 5170 MHz
1395683887.458823: nl80211: Scan frequency 5180 MHz
1395683887.458829: nl80211: Scan frequency 5190 MHz
1395683887.458834: nl80211: Scan frequency 5200 MHz
1395683887.458840: nl80211: Scan frequency 5210 MHz
1395683887.458845: nl80211: Scan frequency 5220 MHz
1395683887.458850: nl80211: Scan frequency 5230 MHz
1395683887.458855: nl80211: Scan frequency 5240 MHz
1395683887.458861: nl80211: Scan frequency 5260 MHz
1395683887.458866: nl80211: Scan frequency 5280 MHz
1395683887.458871: nl80211: Scan frequency 5300 MHz
1395683887.458876: nl80211: Scan frequency 5320 MHz
1395683887.458881: nl80211: Scan frequency 5500 MHz
1395683887.458886: nl80211: Scan frequency 5520 MHz
1395683887.458890: nl80211: Scan frequency 5540 MHz
1395683887.458895: nl80211: Scan frequency 5560 MHz
1395683887.458900: nl80211: Scan frequency 5580 MHz
1395683887.458905: nl80211: Scan frequency 5600 MHz
1395683887.458911: nl80211: Scan frequency 5580 MHz
1395683887.458916: nl80211: Scan frequency 5600 MHz
1395683887.458921: nl80211: Scan frequency 5620 MHz
1395683887.458926: nl80211: Scan frequency 5640 MHz
1395683887.458931: nl80211: Scan frequency 5660 MHz
1395683887.458936: nl80211: Scan frequency 5620 MHz
1395683887.458942: nl80211: Scan frequency 5640 MHz
1395683887.458947: nl80211: Scan frequency 5660 MHz
1395683887.458952: nl80211: Scan frequency 5680 MHz
1395683887.458957: nl80211: Scan frequency 5700 MHz
1395683887.458962: nl80211: Scan frequency 5745 MHz
1395683887.458987: nl80211: Scan frequency 5645 MHz
1395683887.458996: nl80211: Scan frequency 5785 MHz
1395683887.459001: nl80211: Scan frequency 5805 MHz
1395683887.459005: nl80211: Scan frequency 5825 MHz
1395683887.459040: nl80211: Scan trigger failed: ret=-22 (Invalid argument)


A standard scan seems to use only a subset of these channels.
But, wouldn't that make us miss scanning for some /a or /n APs
out there?

[root@ct521-FCFC ~]# iw event
wlan0 (phy #1): scan started
wlan0 (phy #1): scan finished: 2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5745 5765 5785 5805 5825, ""


Any idea if this is a bug in my config/assumptions, ath10k, or supplicant?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
