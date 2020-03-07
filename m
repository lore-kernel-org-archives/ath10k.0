Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAiqD-0003g5-MD
 for ath10k@lists.infradead.org; Sat, 07 Mar 2020 23:26:47 +0000
Date: Sun, 8 Mar 2020 07:26:31 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:pending 21/34]
 drivers/net/wireless/ath/ath11k/dp_rx.c:65:30: sparse: sparse: incorrect
 type in return expression (different base types)
Message-ID: <202003080728.koIGEO5E%lkp@intel.com>
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: kbuild-all@lists.01.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   8098994ce0e3684547d874966af5d4c27c11f855
commit: 481e5890884c05226b129e9cae2dca58b22c1a4f [21/34] ath11k: handle RX fragments
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-174-g094d5a94-dirty
        git checkout 481e5890884c05226b129e9cae2dca58b22c1a4f
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/dp_rx.c:65:30: sparse: sparse: incorrect type in return expression (different base types) @@    expected unsigned short @@    got resunsigned short @@
   drivers/net/wireless/ath/ath11k/dp_rx.c:65:30: sparse:    expected unsigned short
   drivers/net/wireless/ath/ath11k/dp_rx.c:65:30: sparse:    got restricted __le16
   drivers/net/wireless/ath/ath11k/dp_rx.c:2784:6: sparse: sparse: symbol 'ath11k_dp_rx_frag_timer' was not declared. Should it be static?

vim +65 drivers/net/wireless/ath/ath11k/dp_rx.c

    59	
    60	static u16 ath11k_dp_rx_h_mpdu_start_frag_no(struct sk_buff *skb)
    61	{
    62		struct ieee80211_hdr *hdr;
    63	
    64		hdr = (struct ieee80211_hdr *)(skb->data + HAL_RX_DESC_SIZE);
  > 65		return hdr->seq_ctrl & cpu_to_le16(IEEE80211_SCTL_FRAG);
    66	}
    67	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
