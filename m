Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22c.google.com ([2607:f8b0:400c:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKiv3-0000N3-0A
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 06:33:37 +0000
Received: by mail-ve0-f172.google.com with SMTP id jx11so5169079veb.3
 for <ath10k@lists.infradead.org>; Mon, 03 Mar 2014 22:33:15 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 4 Mar 2014 14:33:14 +0800
Message-ID: <CAEFj9874KjsRfC1rK5X1wWpQ-1hCt44tOLj5q+adWWLUbuyE0g@mail.gmail.com>
Subject: Only Lowest Legacy Rate 6Mbps used by Adhoc Mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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

Hi, all

I have observed that only minimum legacy rate 6Mbps used by two nodes
setting up in adhoc mode.

Currently, there is no implementation on
IEEE80211_RC_SUPP_RATES_CHANGED. So I just disassociate, delete,
create and associate node back in HT mode as printed below, but no
luck the TxRate is stuck at 6Mbps

[  339.550000] ath10k: mac vdev 0 peer create 04:f0:21:0c:a5:1c (new
sta) num_peers 2
[  339.550000] ath10k: wmi peer create vdev_id 0 peer_addr 04:f0:21:0c:a5:1c
[  339.550000] ath10k: mac sta 04:f0:21:0c:a5:1c associated
[  339.550000] ath10k: mac peer 04:f0:21:0c:a5:1c phymode 11a
[  339.550000] ath10k: wmi peer assoc vdev 0 addr 04:f0:21:0c:a5:1c
[  339.550000] ath10k: mac sta rc update for 04:f0:21:0c:a5:1c changed
00000004 bw 0 nss 1 smps 2
[  339.550000] ath10k: mac sta rc update for 04:f0:21:0c:a5:1c:
changing supported rates not implemented
[  339.550000] ath10k: wmi peer delete vdev_id 0 peer_addr 04:f0:21:0c:a5:1c
[  339.550000] ath10k: wmi peer create vdev_id 0 peer_addr 04:f0:21:0c:a5:1c
[  339.550000] ath10k: mac ht peer 04:f0:21:0c:a5:1c mcs cnt 24 nss 1
[  339.550000] ath10k: mac peer 04:f0:21:0c:a5:1c phymode 11na-ht20
[  339.550000] ath10k: wmi peer assoc vdev 0 addr 04:f0:21:0c:a5:1c
[  339.550000] ath10k: wmi vdev 0 peer 0x04:f0:21:0c:a5:1c set param 1 value 1
[  339.850000] ath10k: wmi event debug mesg len 84

Try to re-associate by simply tweaking the peer_new_assoc bit also the same.

Anyone has any ideas?

-----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
