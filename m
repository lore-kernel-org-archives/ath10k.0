Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.spirent.com ([38.111.148.215] helo=webmail.spirent.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXH5O-0002v5-Q1
 for ath10k@lists.infradead.org; Mon, 07 Apr 2014 21:28:11 +0000
From: "Shu, Nick" <Nick.Shu@spirent.com>
Subject: wifi card disconnected right after assoicated with AP
Date: Mon, 7 Apr 2014 21:27:40 +0000
Message-ID: <153F35912E69C446A72CF7D6417EBADE7CF38D@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
Content-Language: en-US
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, All:
I'm trying to use a wifi card to associate to a access point, but got a strange thing here.
Right after associated with AP, it disconnected from AP, the pattern repeated for:
Scan
Authentication
Association
De-authenticated
Dis-associated
I captured the frames as below, saw a "wlan0 del station <AP's MAC>", why wlan0 do this local request?

0.096321: wlan0 (phy #0): scan started
2.802464: wlan0 (phy #0): scan finished: 2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260
 5280 5300 5320 5500 5520 5540 5560 5580 5660 5680 5700 5745 5765 5785 5805 5825, ""
0.008130: wlan0: new station c4:04:15:29:cd:2e
0.000462: wlan0 (phy #0): auth c4:04:15:29:cd:2e -> 00:03:07:12:34:56 status: 0: Successful [frame: b0 00 3c 00 00 03 07
 12 34 56 c4 04 15 29 cd 2e c4 04 15 29 cd 2e b0 11 00 00 02 00 00 00 dd 09 00 10 18 02 00 00 1c 00 00]
0.004211: wlan0 (phy #0): assoc c4:04:15:29:cd:2e -> 00:03:07:12:34:56 status: 0: Successful [frame: 30 00 3c 00 00 03 0
7 12 34 56 c4 04 15 29 cd 2e c4 04 15 29 cd 2e c0 11 11 10 00 00 01 c0 01 08 8c 12 98 24 b0 48 60 6c 35 01 00 41 01 00 4
6 05 72 00 01 00 00 2d 1a ef 09 17 ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3d 16 99 0f 15 0
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7f 08 04 00 08 00 00 00 00 40 dd 09 00 10 18 02 00 00 1c 00 00 d
d 18 00 50 f2 02 01 01 88 00 03 a4 00 00 27 a4 00 00 42 43 bc 00 62 32 66 00]
0.000099: wlan0 (phy #0): connected to c4:04:15:29:cd:2e
0.000858: wlan0: del station c4:04:15:29:cd:2e
0.000508: wlan0 (phy #0): disassoc 00:03:07:12:34:56 -> c4:04:15:29:cd:2e reason 3: Deauthenticated because sending stat
ion is leaving (or has left) the IBSS or ESS [frame: a0 00 00 00 c4 04 15 29 cd 2e 00 03 07 12 34 56 c4 04 15 29 cd 2e 0
0 00 03 00]
0.000044: wlan0 (phy #0): disconnected (local request)
0.003030: phy #0: regulatory domain change: set to world roaming by the wireless core upon initialization request

Thank you!

Nick Shu


E-mail confidentiality.
--------------------------------
This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.

Spirent Communications plc
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.

Or if within the US,

Spirent Communications,
26750 Agoura Road, Calabasas, CA, 91302, USA.
Tel No. 1-818-676- 2300

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
