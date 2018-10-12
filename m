Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAyQU-00009F-Uo
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 14:28:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:master-pending 3/3]
 drivers/net/wireless/ath/ath10k/qmi.c:734:44: error: not enough arguments for
 function ath10k_core_fetch_board_file
References: <201810112257.Hgqd4vtm%fengguang.wu@intel.com>
Date: Fri, 12 Oct 2018 17:28:12 +0300
In-Reply-To: <201810112257.Hgqd4vtm%fengguang.wu@intel.com> (kbuild test
 robot's message of "Thu, 11 Oct 2018 22:31:59 +0800")
Message-ID: <87tvlr44ub.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, ath10k@lists.infradead.org

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
> head:   0867465f6a7f45f857c8289a61a7f847829d3654
> commit: 0867465f6a7f45f857c8289a61a7f847829d3654 [3/3] Merge branch 'pending' into master-pending
> config: x86_64-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout 0867465f6a7f45f857c8289a61a7f847829d3654
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
>
> All error/warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath10k/qmi.c:734:44: error: not enough arguments for function ath10k_core_fetch_board_file
>    drivers/net/wireless/ath/ath10k/qmi.c: In function 'ath10k_qmi_fetch_board_file':
>    drivers/net/wireless/ath/ath10k/qmi.c:734:9: error: too few arguments to function 'ath10k_core_fetch_board_file'
>      return ath10k_core_fetch_board_file(qmi->ar);
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from drivers/net/wireless/ath/ath10k/trace.h:21:0,
>                     from drivers/net/wireless/ath/ath10k/debug.h:23,
>                     from drivers/net/wireless/ath/ath10k/qmi.c:31:
>    drivers/net/wireless/ath/ath10k/core.h:1224:5: note: declared here
>     int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath10k/qmi.c:735:1: warning: control reaches end of non-void function [-Wreturn-type]
>     }
>     ^
> --
>>> drivers/net/wireless/ath/ath10k/snoc.c:1191:17: error: undefined identifier 'bus_params'
>    drivers/net/wireless/ath/ath10k/snoc.c:1192:17: error: undefined identifier 'bus_params'
>>> drivers/net/wireless/ath/ath10k/snoc.c:1192:38: error: undefined identifier 'drv_data'
>    drivers/net/wireless/ath/ath10k/snoc.c:1193:49: error: undefined identifier 'bus_params'
>>> drivers/net/wireless/ath/ath10k/snoc.c:1192:46: warning: unknown expression (8 46)
>    drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_fw_indication':
>    drivers/net/wireless/ath/ath10k/snoc.c:1191:3: error: 'bus_params' undeclared (first use in this function); did you mean 'key_params'?
>       bus_params.dev_type = ATH10K_DEV_TYPE_LL;
>       ^~~~~~~~~~
>       key_params
>    drivers/net/wireless/ath/ath10k/snoc.c:1191:3: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/net/wireless/ath/ath10k/snoc.c:1192:24: error: 'drv_data' undeclared (first use in this function); did you mean 'irq_data'?
>       bus_params.chip_id = drv_data->hw_rev;
>                            ^~~~~~~~
>                            irq_data
>    drivers/net/wireless/ath/ath10k/snoc.c:1186:22: warning: unused variable 'ar_snoc' [-Wunused-variable]
>      struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>                          ^~~~~~~
>    drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_probe':
>    drivers/net/wireless/ath/ath10k/snoc.c:1536:27: warning: unused variable 'bus_params' [-Wunused-variable]
>      struct ath10k_bus_params bus_params;
>                               ^~~~~~~~~~

These errors are my mistakes. I introduced these when solving some
conflicts and not having COMPILE_TEST enabled so I didn't compile check
snoc.c. These should be fixed now in the pending branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
