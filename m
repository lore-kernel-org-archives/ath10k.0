Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3hBV-0002IJ-05
 for ath10k@lists.infradead.org; Sat, 22 Sep 2018 12:38:54 +0000
Date: Sat, 22 Sep 2018 15:38:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending 39/55] drivers/net/wireless/ath/ath10k/mac.c:169
 ath10k_mac_get_rate_hw_value() error: buffer overflow 'ath10k_rates' 12 <=
 143
Message-ID: <20180922123828.7ajnxyhvkyajntv7@mwanda>
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
To: kbuild@01.org, Sriram R <srirrama@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   2305dc3c6b1d66a7bef752439919d61478e02893
commit: 0c737c78082055ff589f6683e93b45f079c5d64e [39/55] ath10k: Add support for configuring management packet rate

New smatch warnings:
drivers/net/wireless/ath/ath10k/mac.c:169 ath10k_mac_get_rate_hw_value() error: buffer overflow 'ath10k_rates' 12 <= 143

Old smatch warnings:
drivers/net/wireless/ath/ath10k/mac.c:170 ath10k_mac_get_rate_hw_value() error: buffer overflow 'ath10k_rates' 12 <= 143

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=0c737c78082055ff589f6683e93b45f079c5d64e
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 0c737c78082055ff589f6683e93b45f079c5d64e
vim +/ath10k_rates +169 drivers/net/wireless/ath/ath10k/mac.c

01cebe1c Michal Kazior 2015-03-30  159  
0c737c78 Sriram R      2018-09-10  160  static int ath10k_mac_get_rate_hw_value(int bitrate)
0c737c78 Sriram R      2018-09-10  161  {
0c737c78 Sriram R      2018-09-10  162  	int i;
0c737c78 Sriram R      2018-09-10  163  	u8 hw_value_prefix = 0;
0c737c78 Sriram R      2018-09-10  164  
0c737c78 Sriram R      2018-09-10  165  	if (ath10k_mac_bitrate_is_cck(bitrate))
0c737c78 Sriram R      2018-09-10  166  		hw_value_prefix = WMI_RATE_PREAMBLE_CCK << 6;
0c737c78 Sriram R      2018-09-10  167  
0c737c78 Sriram R      2018-09-10  168  	for (i = 0; i < sizeof(ath10k_rates); i++) {
                                                                ^^^^^^^^^^^^^^^^^^^^
This should be ARRAY_SIZE(ath10k_rates) instead of sizeof().

0c737c78 Sriram R      2018-09-10 @169  		if (ath10k_rates[i].bitrate == bitrate)
0c737c78 Sriram R      2018-09-10  170  			return hw_value_prefix | ath10k_rates[i].hw_value;
0c737c78 Sriram R      2018-09-10  171  	}
0c737c78 Sriram R      2018-09-10  172  
0c737c78 Sriram R      2018-09-10  173  	return -EINVAL;
0c737c78 Sriram R      2018-09-10  174  }
0c737c78 Sriram R      2018-09-10  175  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
