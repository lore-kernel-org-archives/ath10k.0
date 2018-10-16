Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCVYs-000690-AW
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 20:03:27 +0000
Received: by mail-lj1-x22a.google.com with SMTP id z21-v6so22144538ljz.0
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 13:03:15 -0700 (PDT)
Date: Tue, 16 Oct 2018 22:03:11 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: ath10k: Kconfig build warnings
Message-ID: <20181016200311.GA15036@centauri.lan>
References: <d0a66e5c6c5cb385c07588859bac6a1d715bb435.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0a66e5c6c5cb385c07588859bac6a1d715bb435.camel@intel.com>
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
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Mon, Oct 15, 2018 at 03:07:18PM -0700, Jeff Kirsher wrote:
> Not sure if you aware, with David Miller's latest net-next tree, doing a
> 'make allmodconfig' produces the following Kconfig errors:
> 
> [15:06:06]$ make allmodconfig
> scripts/kconfig/conf  --allmodconfig Kconfig
> 
> WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
>   Depends on [n]: ARCH_QCOM && NET [=y]
>   Selected by [m]:
>   - ATH10K_SNOC [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH
> [=y] && ATH10K [=m] && (ARCH_QCOM || COMPILE_TEST [=y])
> #
> # configuration written to .config
> #

Hello Jeff,

I believe this will be fixed by:
ccfb464cd106 ("soc: qcom: Allow COMPILE_TEST of qcom SoC Kconfigs")

Which is currently in linux-next.


Kind regards,
Niklas

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
