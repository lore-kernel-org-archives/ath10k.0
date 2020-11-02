Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUV1-0001TF-1J
 for ath10k@lists.infradead.org; Mon, 02 Nov 2020 07:43:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 2/2] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
References: <20201031003845.41137-1-john.stultz@linaro.org>
 <20201031003845.41137-2-john.stultz@linaro.org>
Date: Mon, 02 Nov 2020 09:42:55 +0200
In-Reply-To: <20201031003845.41137-2-john.stultz@linaro.org> (John Stultz's
 message of "Sat, 31 Oct 2020 00:38:45 +0000")
Message-ID: <87imaouruo.fsf@codeaurora.org>
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
To: John Stultz <john.stultz@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Joerg Roedel <joro@8bytes.org>, lkml <linux-kernel@vger.kernel.org>, Lina Iyer <ilina@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, Todd Kjos <tkjos@google.com>

+ ath10k list

John Stultz <john.stultz@linaro.org> writes:

> Allow the qcom_scm driver to be loadable as a permenent module.
>
> This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> ensure that drivers that call into the qcom_scm driver are
> also built as modules. While not ideal in some cases its the
> only safe way I can find to avoid build errors without having
> those drivers select QCOM_SCM and have to force it on (as
> QCOM_SCM=n can be valid for those drivers).
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v3:
> * Fix __arm_smccc_smc build issue reported by
>   kernel test robot <lkp@intel.com>
> v4:
> * Add "depends on QCOM_SCM || !QCOM_SCM" bit to ath10k
>   config that requires it.
> v5:
> * Fix QCOM_QCM typo in Kconfig, it should be QCOM_SCM
> ---
>  drivers/firmware/Kconfig                | 4 ++--
>  drivers/firmware/Makefile               | 3 ++-
>  drivers/firmware/qcom_scm.c             | 4 ++++
>  drivers/iommu/Kconfig                   | 2 ++
>  drivers/net/wireless/ath/ath10k/Kconfig | 1 +
>  5 files changed, 11 insertions(+), 3 deletions(-)

For ath10k part:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
