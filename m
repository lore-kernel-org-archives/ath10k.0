Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtnmf-0008E3-Eb
 for ath10k@lists.infradead.org; Wed, 13 Feb 2019 06:12:39 +0000
Date: Wed, 13 Feb 2019 09:12:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending 14/43] drivers/net/wireless/ath/wil6210/txrx.c:341
 wil_rx_add_radiotap_header() error: potentially dereferencing uninitialized
 'rtap'.
Message-ID: <20190213061220.GD5458@kadam>
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
To: kbuild@01.org, Maya Erez <merez@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   6600762d087f745bb0ee1cdf12a6611c2f852e79
commit: 88f31c736d0ac41bc93fadf853e71b16e8ffbc2f [14/43] wil6210: remove rtap_include_phy_info module param

smatch warnings:
drivers/net/wireless/ath/wil6210/txrx.c:341 wil_rx_add_radiotap_header() error: potentially dereferencing uninitialized 'rtap'.

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=88f31c736d0ac41bc93fadf853e71b16e8ffbc2f
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 88f31c736d0ac41bc93fadf853e71b16e8ffbc2f
vim +/rtap +341 drivers/net/wireless/ath/wil6210/txrx.c

2be7d22f Vladimir Kondratiev 2012-12-20  304  
2be7d22f Vladimir Kondratiev 2012-12-20  305  /**
2be7d22f Vladimir Kondratiev 2012-12-20  306   * Adds radiotap header
2be7d22f Vladimir Kondratiev 2012-12-20  307   *
2be7d22f Vladimir Kondratiev 2012-12-20  308   * Any error indicated as "Bad FCS"
2be7d22f Vladimir Kondratiev 2012-12-20  309   *
2be7d22f Vladimir Kondratiev 2012-12-20  310   * Vendor data for 04:ce:14-1 (Wilocity-1) consists of:
2be7d22f Vladimir Kondratiev 2012-12-20  311   *  - Rx descriptor: 32 bytes
2be7d22f Vladimir Kondratiev 2012-12-20  312   *  - Phy info
2be7d22f Vladimir Kondratiev 2012-12-20  313   */
2be7d22f Vladimir Kondratiev 2012-12-20  314  static void wil_rx_add_radiotap_header(struct wil6210_priv *wil,
33e61169 Vladimir Kondratiev 2013-04-18  315  				       struct sk_buff *skb)
2be7d22f Vladimir Kondratiev 2012-12-20  316  {
2be7d22f Vladimir Kondratiev 2012-12-20  317  	struct wil6210_rtap {
2be7d22f Vladimir Kondratiev 2012-12-20  318  		struct ieee80211_radiotap_header rthdr;
2be7d22f Vladimir Kondratiev 2012-12-20  319  		/* fields should be in the order of bits in rthdr.it_present */
2be7d22f Vladimir Kondratiev 2012-12-20  320  		/* flags */
2be7d22f Vladimir Kondratiev 2012-12-20  321  		u8 flags;
2be7d22f Vladimir Kondratiev 2012-12-20  322  		/* channel */
2be7d22f Vladimir Kondratiev 2012-12-20  323  		__le16 chnl_freq __aligned(2);
2be7d22f Vladimir Kondratiev 2012-12-20  324  		__le16 chnl_flags;
2be7d22f Vladimir Kondratiev 2012-12-20  325  		/* MCS */
2be7d22f Vladimir Kondratiev 2012-12-20  326  		u8 mcs_present;
2be7d22f Vladimir Kondratiev 2012-12-20  327  		u8 mcs_flags;
2be7d22f Vladimir Kondratiev 2012-12-20  328  		u8 mcs_index;
2be7d22f Vladimir Kondratiev 2012-12-20  329  	} __packed;
33e61169 Vladimir Kondratiev 2013-04-18  330  	struct vring_rx_desc *d = wil_skb_rxdesc(skb);
88f31c73 Maya Erez           2019-02-11  331  	struct wil6210_rtap *rtap;
                                                                     ^^^^

2be7d22f Vladimir Kondratiev 2012-12-20  332  	int rtap_len = sizeof(struct wil6210_rtap);
7d3e4dbe Lior David          2017-12-14  333  	struct ieee80211_channel *ch = wil->monitor_chandef.chan;
2be7d22f Vladimir Kondratiev 2012-12-20  334  
2be7d22f Vladimir Kondratiev 2012-12-20  335  	if (skb_headroom(skb) < rtap_len &&
2be7d22f Vladimir Kondratiev 2012-12-20  336  	    pskb_expand_head(skb, rtap_len, 0, GFP_ATOMIC)) {
9165dabb Masanari Iida       2016-09-17  337  		wil_err(wil, "Unable to expand headroom to %d\n", rtap_len);
2be7d22f Vladimir Kondratiev 2012-12-20  338  		return;
2be7d22f Vladimir Kondratiev 2012-12-20  339  	}
2be7d22f Vladimir Kondratiev 2012-12-20  340  
88f31c73 Maya Erez           2019-02-11 @341  	rtap->rthdr.it_version = PKTHDR_RADIOTAP_VERSION;
                                                ^^^^^^^^^^^^

Looks like maybe part of the commit is missing.

88f31c73 Maya Erez           2019-02-11  342  	rtap->rthdr.it_len = cpu_to_le16(rtap_len);
88f31c73 Maya Erez           2019-02-11  343  	rtap->rthdr.it_present = cpu_to_le32((1 << IEEE80211_RADIOTAP_FLAGS) |
2be7d22f Vladimir Kondratiev 2012-12-20  344  			(1 << IEEE80211_RADIOTAP_CHANNEL) |
2be7d22f Vladimir Kondratiev 2012-12-20  345  			(1 << IEEE80211_RADIOTAP_MCS));
2be7d22f Vladimir Kondratiev 2012-12-20  346  	if (d->dma.status & RX_DMA_STATUS_ERROR)
88f31c73 Maya Erez           2019-02-11  347  		rtap->flags |= IEEE80211_RADIOTAP_F_BADFCS;
88f31c73 Maya Erez           2019-02-11  348  
88f31c73 Maya Erez           2019-02-11  349  	rtap->chnl_freq = cpu_to_le16(ch ? ch->center_freq : 58320);
88f31c73 Maya Erez           2019-02-11  350  	rtap->chnl_flags = cpu_to_le16(0);
88f31c73 Maya Erez           2019-02-11  351  
88f31c73 Maya Erez           2019-02-11  352  	rtap->mcs_present = IEEE80211_RADIOTAP_MCS_HAVE_MCS;
88f31c73 Maya Erez           2019-02-11  353  	rtap->mcs_flags = 0;
88f31c73 Maya Erez           2019-02-11  354  	rtap->mcs_index = wil_rxdesc_mcs(d);
2be7d22f Vladimir Kondratiev 2012-12-20  355  }
2be7d22f Vladimir Kondratiev 2012-12-20  356  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
