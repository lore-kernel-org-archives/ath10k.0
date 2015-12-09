Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6cJw-00026b-J4
 for ath10k@lists.infradead.org; Wed, 09 Dec 2015 10:50:05 +0000
Date: Wed, 9 Dec 2015 13:49:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: ath10k: replace vdev_id and tid in skb cb
Message-ID: <20151209104935.GL3173@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
To: michal.kazior@tieto.com
Cc: ath10k@lists.infradead.org

Hello Michal Kazior,

This is a semi-automatic email about new static checker warnings.

The patch 609db229b42f: "ath10k: replace vdev_id and tid in skb cb" 
from Nov 18, 2015, leads to the following Smatch complaint:

drivers/net/wireless/ath/ath10k/htt_tx.c:450 ath10k_htt_tx_get_vdev_id()
	 warn: variable dereferenced before check 'cb->vif' (see line 446)

drivers/net/wireless/ath/ath10k/htt_tx.c
   445		struct ath10k_skb_cb *cb = ATH10K_SKB_CB(skb);
   446		struct ath10k_vif *arvif = (void *)cb->vif->drv_priv;
                                                   ^^^^^^^^^
Dereference.

   447	
   448		if (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)
   449			return ar->scan.vdev_id;
   450		else if (cb->vif)
                         ^^^^^^^
Checked too late.

   451			return arvif->vdev_id;
   452		else if (ar->monitor_started)

See also:
drivers/net/wireless/ath/ath10k/wmi.c:1830 ath10k_wmi_op_gen_mgmt_tx() warn: variable dereferenced before check 'cb->vif' (see line 1818)

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
