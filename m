Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlTNs-0002x3-8c
 for ath10k@lists.infradead.org; Wed, 17 Jun 2020 08:25:27 +0000
MIME-Version: 1.0
Date: Wed, 17 Jun 2020 16:25:17 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [v2,08/13] ath10k: bring back the WMI path for mgmt frames
Message-ID: <88b587e85324b50a23a20676c7088d0c@codeaurora.org>
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
To: bartosz.markowski@tieto.com, ath10k@lists.infradead.org

> +
> +			skb_queue_tail(&ar->wmi_mgmt_tx_queue, skb);
> +			ieee80211_queue_work(ar->hw, &ar->wmi_mgmt_tx_work);
https://patchwork.kernel.org/patch/2947291/
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5e00d31a0fb74c36f3b174ff0d4914cf09016e6f)

Do you know why this patch used ieee80211_queue_work, not use "struct 
workqueue_struct *workqueue" of ath10k?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
