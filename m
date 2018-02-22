Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eokNF-0008Og-VV
 for ath10k@lists.infradead.org; Thu, 22 Feb 2018 06:28:59 +0000
Date: Thu, 22 Feb 2018 14:28:29 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] ath10k: debugfs support to get final TPC stats for 10.4
 variants
Message-ID: <201802221335.IYmLJSh2%fengguang.wu@intel.com>
References: <1519220139-10423-1-git-send-email-mkenna@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1519220139-10423-1-git-send-email-mkenna@codeaurora.org>
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
To: mkenna@codeaurora.org
Cc: linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org

Hi Maharaja,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ath6kl/ath-next]
[also build test WARNING on v4.16-rc2 next-20180221]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/mkenna-codeaurora-org/ath10k-debugfs-support-to-get-final-TPC-stats-for-10-4-variants/20180222-110854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/wmi.c:4322:6: sparse: symbol 'ath10k_wmi_tpc_config_get_rate_code' was not declared. Should it be
>> drivers/net/wireless/ath/ath10k/wmi.c:4660:6: sparse: symbol 'ath10k_wmi_event_tpc_final_table' was not declared. Should it be
   drivers/net/wireless/ath/ath10k/wmi.c:738:10: sparse: Initializer entry defined twice
   drivers/net/wireless/ath/ath10k/wmi.c:744:10: also defined here

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
