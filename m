Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF8I3-0002xT-Pa
 for ath10k@lists.infradead.org; Mon, 20 Jun 2016 23:07:36 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Bug with: ath10k: enable parsing per station rx duration for 10.4?
Message-ID: <5768770C.5050305@candelatech.com>
Date: Mon, 20 Jun 2016 16:06:52 -0700
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

I'm working on bringing up my hacked up version of 4.7 ath10k and 10.4 firmware, and I think
I may have found a regression.

My 10.4.3-ish firmware source has a bunch of:

if (stats_id == WMI_REQUEST_PEER_STAT)
logic in it.  In other words, it is not using that id as a bitfield.

Now, I can fix the firmware, but I am guessing that at least some stock
10.4 firmware has this same issue, and of course any older firmware
that does not have this change will still be broken.

So, do you want to back out this patch below, at least the part where it sends
in 0x9 as the stats_id?

Or, is all available upstream 10.4 firmware OK with this and I should just fix mine?

Or possibly, this is all my fault and I somehow screwed up when rebasing....

Thanks,
Ben


Author: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>  2016-03-16 05:43:34
Committer: Kalle Valo <kvalo@qca.qualcomm.com>  2016-04-04 07:02:47
Parent: 47771902a9beb23859805721f1d98d03dee5da7c (ath10k: introduce Extended Resource Config support for 10.4)
Child:  59465fe46ef1c2caf2c1beca828c4f29d28b98ca (ath10k: speedup htt rx descriptor processing for tx completion)
Branches: master, master.stgit, remotes/origin/master, remotes/origin/master.stgit
Follows: v4.5-rc5
Precedes: v4.7-rc1

     ath10k: enable parsing per station rx duration for 10.4

     Rx duration support for per station is part of extended peer
     stats, enable provision to parse the same and provide backward
     compatibility based on the 'stats_id' event

     Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
     Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

....

@@ -1615,7 +1615,8 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
  		ar->num_active_peers = TARGET_10_4_ACTIVE_PEERS;
  		ar->max_num_vdevs = TARGET_10_4_NUM_VDEVS;
  		ar->num_tids = TARGET_10_4_TGT_NUM_TIDS;
-		ar->fw_stats_req_mask = WMI_STAT_PEER;
+		ar->fw_stats_req_mask = WMI_10_4_STAT_PEER |
+					WMI_10_4_STAT_PEER_EXTD;
  		ar->max_spatial_stream = ar->hw_params.max_spatial_stream;

  		if (test_bit(ATH10K_FW_FEATURE_PEER_FLOW_CONTROL,


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
