Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Acp-0001cv-17
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 03:13:44 +0000
Date: Fri, 22 Mar 2019 08:05:33 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-bringup 46/60]
 drivers/net/wireless/ath/ath11k/dp_rx.c:2016:16: sparse: symbol
 'ath11k_dp_rx_alloc_mon_status_buf' was not declared. Should it be static?
Message-ID: <201903220804.WHevvYHk%lkp@intel.com>
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
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   3c46e2415dac1f744640d0e42594fb27de804df9
commit: ecee39218556f1d47d797521e11890556b15109d [46/60] ath11k: initialise monitor status ring
reproduce:
        # apt-get install sparse
        git checkout ecee39218556f1d47d797521e11890556b15109d
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/ath/ath11k/dp_tx.c:644:23: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:646:23: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:649:23: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:833:23: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:835:23: sparse: dubious: x & !y
>> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] pkt_type_en_flags0 @@    got ed int [unsigned] [usertype] pkt_type_en_flags0 @@
   drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    expected unsigned int [unsigned] [usertype] pkt_type_en_flags0
   drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    got restricted __le32 [usertype] <noident>
>> drivers/net/wireless/ath/ath11k/dp_tx.c:841:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] pkt_type_en_flags1 @@    got ed int [unsigned] [usertype] pkt_type_en_flags1 @@
   drivers/net/wireless/ath/ath11k/dp_tx.c:841:33:    expected unsigned int [unsigned] [usertype] pkt_type_en_flags1
   drivers/net/wireless/ath/ath11k/dp_tx.c:841:33:    got restricted __le32 [usertype] <noident>
>> drivers/net/wireless/ath/ath11k/dp_tx.c:842:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] pkt_type_en_flags2 @@    got ed int [unsigned] [usertype] pkt_type_en_flags2 @@
   drivers/net/wireless/ath/ath11k/dp_tx.c:842:33:    expected unsigned int [unsigned] [usertype] pkt_type_en_flags2
   drivers/net/wireless/ath/ath11k/dp_tx.c:842:33:    got restricted __le32 [usertype] <noident>
>> drivers/net/wireless/ath/ath11k/dp_tx.c:843:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] pkt_type_en_flags3 @@    got ed int [unsigned] [usertype] pkt_type_en_flags3 @@
   drivers/net/wireless/ath/ath11k/dp_tx.c:843:33:    expected unsigned int [unsigned] [usertype] pkt_type_en_flags3
   drivers/net/wireless/ath/ath11k/dp_tx.c:843:33:    got restricted __le32 [usertype] <noident>
>> drivers/net/wireless/ath/ath11k/dp_tx.c:844:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] rx_filter_tlv @@    got ed int [unsigned] [usertype] rx_filter_tlv @@
   drivers/net/wireless/ath/ath11k/dp_tx.c:844:28:    expected unsigned int [unsigned] [usertype] rx_filter_tlv
   drivers/net/wireless/ath/ath11k/dp_tx.c:844:28:    got restricted __le32 [usertype] <noident>
--
   drivers/net/wireless/ath/ath11k/dp_rx.c:30:23: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/dp_rx.c:30:23: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/dp_rx.c:42:23: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/dp_rx.c:42:23: sparse: expression using sizeof(void)
>> drivers/net/wireless/ath/ath11k/dp_rx.c:2016:16: sparse: symbol 'ath11k_dp_rx_alloc_mon_status_buf' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/dp_rx.c:2076:23: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/dp_rx.c:2076:23: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/dp_rx.c:2086:23: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/dp_rx.c:2086:23: sparse: expression using sizeof(void)

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
