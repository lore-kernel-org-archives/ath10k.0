Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSkdK-0002TB-PZ
 for ath10k@lists.infradead.org; Tue, 12 Jun 2018 14:50:57 +0000
Date: Tue, 12 Jun 2018 22:50:37 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] ath10k: allow ATH10K_SNOC with COMPILE_TEST
Message-ID: <201806122228.8vAQXcD6%fengguang.wu@intel.com>
References: <20180612113907.15043-2-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180612113907.15043-2-niklas.cassel@linaro.org>
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kbuild-all@01.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

Hi Niklas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ath6kl/ath-next]
[also build test WARNING on next-20180612]
[cannot apply to v4.17]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Niklas-Cassel/ath10k-do-not-mix-spaces-and-tabs-in-Kconfig/20180612-194241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/snoc.c:823:5: sparse: symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath10k/snoc.c:871:6: sparse: symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
