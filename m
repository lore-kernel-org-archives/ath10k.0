Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFwnF-0007D6-9D
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 08:16:46 +0000
Date: Mon, 15 Apr 2019 11:15:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:ath11k-bringup 92/93]
 drivers/net/wireless/ath/ath11k/dp_rx.c:991 ath11k_htt_pull_ppdu_stats()
 warn: add some parenthesis here?
Message-ID: <20190415081551.GM31633@kadam>
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
To: kbuild@01.org, Anilkumar Kolli <akolli@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
commit: b186001339ca6058afd49d7611647bd766dd555e [92/93] ath11k: add pktlog rxbuf support

New smatch warnings:
drivers/net/wireless/ath/ath11k/dp_rx.c:991 ath11k_htt_pull_ppdu_stats() warn: add some parenthesis here?

Old smatch warnings:
drivers/net/wireless/ath/ath11k/dp_rx.c:320 ath11k_dp_rx_tid_del_func() error: not allocating enough data 36 vs 4
drivers/net/wireless/ath/ath11k/dp_rx.c:951 ath11k_dp_htt_get_ppdu_desc() error: we previously assumed 'ppdu_info' could be null (see line 952)

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=b186001339ca6058afd49d7611647bd766dd555e
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout b186001339ca6058afd49d7611647bd766dd555e
vim +991 drivers/net/wireless/ath/ath11k/dp_rx.c

258bbf52 Kalle Valo      2019-02-05   976  static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
258bbf52 Kalle Valo      2019-02-05   977  					 struct sk_buff *skb) {
258bbf52 Kalle Valo      2019-02-05   978  	u8 *data = (u8 *)skb->data;
258bbf52 Kalle Valo      2019-02-05   979  	struct htt_ppdu_stats_info *ppdu_info;
258bbf52 Kalle Valo      2019-02-05   980  	struct ath11k *ar;
258bbf52 Kalle Valo      2019-02-05   981  	int ret;
258bbf52 Kalle Valo      2019-02-05   982  	u8 pdev_id;
258bbf52 Kalle Valo      2019-02-05   983  	u32 ppdu_id, len;
258bbf52 Kalle Valo      2019-02-05   984  
258bbf52 Kalle Valo      2019-02-05   985  	len = FIELD_GET(HTT_T2H_PPDU_STATS_PAYLOAD_SIZE_M, *(u32 *)data);
258bbf52 Kalle Valo      2019-02-05   986  	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_PDEV_ID_M, *(u32 *)data);
258bbf52 Kalle Valo      2019-02-05   987  	pdev_id = DP_HW2SW_MACID(pdev_id);
258bbf52 Kalle Valo      2019-02-05   988  	ppdu_id = *((u32 *)data + 1);
258bbf52 Kalle Valo      2019-02-05   989  	ar = ab->pdevs[pdev_id].ar;
258bbf52 Kalle Valo      2019-02-05   990  
b1860013 Anilkumar Kolli 2019-04-05  @991  	if (!ar->debug.pktlog_mode == ATH11K_PKTLOG_MODE_LITE) {
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This should be != instead of !foo == bar.

b1860013 Anilkumar Kolli 2019-04-05   992  		/* TODO update the pktlog tracing */
b1860013 Anilkumar Kolli 2019-04-05   993  	}
af4ab3f8 Anilkumar Kolli 2019-04-05   994  
258bbf52 Kalle Valo      2019-02-05   995  	/* TLV info starts after 16bytes of header */
258bbf52 Kalle Valo      2019-02-05   996  	data = (u8 *)data + 16;
258bbf52 Kalle Valo      2019-02-05   997  
258bbf52 Kalle Valo      2019-02-05   998  	ppdu_info = ath11k_dp_htt_get_ppdu_desc(ar, ppdu_id);
258bbf52 Kalle Valo      2019-02-05   999  	if (!ppdu_info)
258bbf52 Kalle Valo      2019-02-05  1000  		return 0;
258bbf52 Kalle Valo      2019-02-05  1001  
258bbf52 Kalle Valo      2019-02-05  1002  	ppdu_info->ppdu_id = ppdu_id;
258bbf52 Kalle Valo      2019-02-05  1003  	ret = ath11k_dp_htt_tlv_iter(ab, data, len,
258bbf52 Kalle Valo      2019-02-05  1004  				     ath11k_htt_tlv_ppdu_stats_parse,
258bbf52 Kalle Valo      2019-02-05  1005  				     (void *)ppdu_info);
258bbf52 Kalle Valo      2019-02-05  1006  	if (ret) {
258bbf52 Kalle Valo      2019-02-05  1007  		ath11k_warn(ab, "Failed to parse tlv %d\n", ret);
258bbf52 Kalle Valo      2019-02-05  1008  		return ret;
258bbf52 Kalle Valo      2019-02-05  1009  	}
258bbf52 Kalle Valo      2019-02-05  1010  
258bbf52 Kalle Valo      2019-02-05  1011  	return 0;
258bbf52 Kalle Valo      2019-02-05  1012  }

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
