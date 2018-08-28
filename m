Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fufO3-0000Ks-FJ
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 14:54:54 +0000
Date: Tue, 28 Aug 2018 22:53:27 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] ath10k: Enable pktlog for WCN3990 target
Message-ID: <201808282240.fECpwB7y%fengguang.wu@intel.com>
References: <20180828043642.14890-3-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180828043642.14890-3-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org

Hi Govind,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ath6kl/ath-next]
[also build test WARNING on v4.19-rc1 next-20180828]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Govind-Singh/ath10k-Enable-pktlog-for-WCN3990-chipset/20180828-154302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/ath/ath10k/htc.c:498:25: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath10k/htc.c:657:25: sparse: expression using sizeof(void)
>> drivers/net/wireless/ath/ath10k/htc.c:875:6: sparse: symbol 'ath10k_htc_pktlog_svc_supported' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
