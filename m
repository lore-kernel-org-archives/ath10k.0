Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGbaV-00047q-OQ
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 22:59:56 +0000
Received: by mail-qg0-f47.google.com with SMTP id z60so20845714qgd.6
 for <ath10k@lists.infradead.org>; Wed, 28 Jan 2015 14:59:33 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 28 Jan 2015 23:59:33 +0100
Message-ID: <CAFZrTr7Cy5OA-mgNM=K4SGOy2BKmHjFVRG2_0azS0=hNKW6zew@mail.gmail.com>
Subject: Failed to start radar detection: -22 (Invalid argument)
From: Jeremias Blendin <jeremias@blendin.org>
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

I am having issues to get a ath10k wifi card working and I did not
find any information on the -22 error code:

HT40: control channel: 52  secondary channel: 56
Completing interface initialization
Mode: IEEE 802.11a  Channel: 52  Frequency: 5260 MHz
DFS 4 channels required radar detection
DFS all channels available, (SKIP CAC): no
DFS 0 chans unavailable - choose other channel: no
wlan1: interface state HT_SCAN->DFS
DFS start CAC on 5260 MHz
wlan1: DFS-CAC-START freq=5260 chan=52 sec_chan=1, width=1, seg0=58,
seg1=0, cac_time=60s
nl80211: Start radar detection (CAC) 5260 MHz (ht_enabled=1,
vht_enabled=1, bandwidth=80 MHz, cf1=5290 MHz, cf2=0 MHz)
nl80211: Failed to start radar detection: -22 (Invalid argument)
DFS start_dfs_cac() failed, -1
Interface initialization failed
wlan1: interface state DFS->DISABLED
wlan1: AP-DISABLED
....

System information:
Linux kyushu 3.16.0-29-generic #39-Ubuntu SMP Mon Dec 15 22:27:29 UTC
2014 x86_64 x86_64 x86_64 GNU/Linux
Firmware:
[   15.060828] ath10k: pci irq MSI irq_mode 0 reset_mode 0
[   16.919940] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
10.1.467.2-1 api 2 htt 2.1
Country:
iw reg get
country DE: DFS-UNSET
(2400 - 2483 @ 40), (N/A, 20)
(5150 - 5250 @ 80), (N/A, 20), NO-OUTDOOR
(5250 - 5350 @ 80), (N/A, 20), NO-OUTDOOR, DFS
(5470 - 5725 @ 80), (N/A, 26), DFS
(57240 - 65880 @ 2160), (N/A, 40), NO-OUTDOOR

Any ideas what could be the issue?

Jeremias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
