Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgCp8-0004kI-T8
 for ath10k@lists.infradead.org; Sun, 27 Sep 2015 14:21:07 +0000
Date: Sun, 27 Sep 2015 22:19:34 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [ath6kl:pending 98/98]
 drivers/net/wireless/ath/ath10k/mac.c:2172:49: sparse: incompatible types in
 comparison expression (different type sizes)
Message-ID: <201509272230.sPTLcZRt%fengguang.wu@intel.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>
Cc: "Kalle Valo <kvalo@adurom.com> Kalle Valo" <kvalo@adurom.com>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://github.com/kvalo/ath pending
head:   250e3cead2b0712dde808aa962c089765cfb16e3
commit: 250e3cead2b0712dde808aa962c089765cfb16e3 [98/98] ath10k: Use station's current operating mode from assoc request
reproduce:
  # apt-get install sparse
  git checkout 250e3cead2b0712dde808aa962c089765cfb16e3
  make ARCH=x86_64 allmodconfig
  make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/mac.c:2172:49: sparse: incompatible types in comparison expression (different type sizes)
   In file included from include/asm-generic/bug.h:13:0,
                    from arch/x86/include/asm/bug.h:35,
                    from include/linux/bug.h:4,
                    from include/net/mac80211.h:17,
                    from drivers/net/wireless/ath/ath10k/mac.h:21,
                    from drivers/net/wireless/ath/ath10k/mac.c:18:
   drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_peer_assoc_h_ht':
   include/linux/kernel.h:722:17: warning: comparison of distinct pointer types lacks a cast
     (void) (&_min1 == &_min2);  \
                    ^
   drivers/net/wireless/ath/ath10k/mac.c:2172:35: note: in expansion of macro 'min'
      arg->peer_num_spatial_streams = min(sta->rx_nss, max_nss);
                                      ^

vim +2172 drivers/net/wireless/ath/ath10k/mac.c

  2156	
  2157		/*
  2158		 * This is a workaround for HT-enabled STAs which break the spec
  2159		 * and have no HT capabilities RX mask (no HT RX MCS map).
  2160		 *
  2161		 * As per spec, in section 20.3.5 Modulation and coding scheme (MCS),
  2162		 * MCS 0 through 7 are mandatory in 20MHz with 800 ns GI at all STAs.
  2163		 *
  2164		 * Firmware asserts if such situation occurs.
  2165		 */
  2166		if (n == 0) {
  2167			arg->peer_ht_rates.num_rates = 8;
  2168			for (i = 0; i < arg->peer_ht_rates.num_rates; i++)
  2169				arg->peer_ht_rates.rates[i] = i;
  2170		} else {
  2171			arg->peer_ht_rates.num_rates = n;
> 2172			arg->peer_num_spatial_streams = min(sta->rx_nss, max_nss);
  2173		}
  2174	
  2175		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac ht peer %pM mcs cnt %d nss %d\n",
  2176			   arg->addr,
  2177			   arg->peer_ht_rates.num_rates,
  2178			   arg->peer_num_spatial_streams);
  2179	}
  2180	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
