Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAybx-0004rP-OF
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 14:40:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 26/28]
 drivers/net/wireless/ath/ath10k/qmi.c:734:9: error: too few arguments to
 function 'ath10k_core_fetch_board_file'
References: <201810112011.CVcr259b%fengguang.wu@intel.com>
Date: Fri, 12 Oct 2018 17:40:00 +0300
In-Reply-To: <201810112011.CVcr259b%fengguang.wu@intel.com> (kbuild test
 robot's message of "Thu, 11 Oct 2018 20:41:15 +0800")
Message-ID: <87h8hr44an.fsf@kamboji.qca.qualcomm.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   54a7bb96eb4b7f8171448dfaa5173c88cd3c29e1
> commit: 5639a5d3cc242473d600a400dc41edcbb0b19092 [26/28] ath10k: Add QMI message handshake for wcn3990 client
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout 5639a5d3cc242473d600a400dc41edcbb0b19092
>         # save the attached .config to linux build tree
>         make ARCH=i386 
>
> All error/warnings (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/qmi.c: In function 'ath10k_qmi_fetch_board_file':
>>> drivers/net/wireless/ath/ath10k/qmi.c:734:9: error: too few
>>> arguments to function 'ath10k_core_fetch_board_file'
>      return ath10k_core_fetch_board_file(qmi->ar);
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from drivers/net/wireless/ath/ath10k/trace.h:21:0,
>                     from drivers/net/wireless/ath/ath10k/debug.h:23,
>                     from drivers/net/wireless/ath/ath10k/qmi.c:31:
>    drivers/net/wireless/ath/ath10k/core.h:1224:5: note: declared here
>     int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/net/wireless/ath/ath10k/qmi.c:735:1: warning: control
>>> reaches end of non-void function [-Wreturn-type]
>     }
>     ^
> --
>    drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_fw_indication':
>>> drivers/net/wireless/ath/ath10k/snoc.c:1191:3: error: 'bus_params' undeclared (first use in this function); did you mean 'key_params'?
>       bus_params.dev_type = ATH10K_DEV_TYPE_LL;
>       ^~~~~~~~~~
>       key_params
>    drivers/net/wireless/ath/ath10k/snoc.c:1191:3: note: each undeclared identifier is reported only once for each function it appears in
>>> drivers/net/wireless/ath/ath10k/snoc.c:1192:24: error: 'drv_data' undeclared (first use in this function); did you mean 'irq_data'?
>       bus_params.chip_id = drv_data->hw_rev;
>                            ^~~~~~~~
>                            irq_data
>    drivers/net/wireless/ath/ath10k/snoc.c:1186:22: warning: unused variable 'ar_snoc' [-Wunused-variable]
>      struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>                          ^~~~~~~
>    drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_probe':
>    drivers/net/wireless/ath/ath10k/snoc.c:1536:27: warning: unused variable 'bus_params' [-Wunused-variable]
>      struct ath10k_bus_params bus_params;

These are because I did mistakes when fixing conflicts in the pending
branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
