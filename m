Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePFtp-0003Ix-LH
 for ath10k@lists.infradead.org; Wed, 13 Dec 2017 22:53:15 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id BBBE440A7E2
 for <ath10k@lists.infradead.org>; Wed, 13 Dec 2017 14:52:45 -0800 (PST)
From: Ben Greear <greearb@candelatech.com>
Subject: Potential issue in ath10k_htt_tx
Message-ID: <80d21f29-2edb-65f0-aae5-0240d2d473dd@candelatech.com>
Date: Wed, 13 Dec 2017 14:52:45 -0800
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
To: ath10k <ath10k@lists.infradead.org>

While adding some support for radiotap tx-ratecode and no-ack features,
I noticed that info->control.rates[0] is over-written in the code below:

	/* NOTE:  This writes over info->control.rates[0], at least. */
	skb_cb->paddr = dma_map_single(dev, msdu->data, msdu->len,
				       DMA_TO_DEVICE);
	res = dma_mapping_error(dev, skb_cb->paddr);
	if (res) {
		res = -EIO;
		goto err_free_msdu_id;
	}


That made me think that the roc_freq code should be moved to the top of
this method in case it too might be corrupted (now or in the future):

	if (unlikely(info->flags & IEEE80211_TX_CTL_TX_OFFCHAN))
		freq = ar->scan.roc_freq;

My code in this method has changed a lot due to the radiotap support,
so I do not have a clean patch to offer.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
