Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnOyN-0005Ih-O6
 for ath10k@lists.infradead.org; Thu, 31 Aug 2017 12:53:29 +0000
MIME-Version: 1.0
Subject: Re: [v3,1/2] ath10k: add the PCI PM core suspend/resume ops
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1503438455-6133-1-git-send-email-ryanhsu@qti.qualcomm.com>
References: <1503438455-6133-1-git-send-email-ryanhsu@qti.qualcomm.com>
Message-ID: <f4652c401e1f462d89b4611afe9bd623@euamsexm01a.eu.qualcomm.com>
Date: Thu, 31 Aug 2017 14:52:54 +0200
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
To: ryanhsu@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ryanhsu@qti.qualcomm.com wrote:

> The actual PCI suspend/resume in ath10k has been handled in wow.c,
> but in the case of the device doesn't support remote wakeup,
> the .hif_suspend() and .hif_resume() will never be handled.
> 
>   ath10k_wow_op_suspend()
>   {
> 	if (WARN_ON(!test_bit(ATH10K_FW_FEATURE_WOWLAN_SUPPORT,
> 		    ar->running_fw->fw_file.fw_features))) {
> 		ret = 1;
> 		goto exit;
> 	}
> 
> 	....
> 
> 	ret = ath10k_hif_suspend(ar);
>   }
> 
> So register the PCI PM core to support the suspend/resume if the device
> doesn't support remote wakeup.
> 
> Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

This had a warning:

drivers/net/wireless/ath/ath10k/pci.c:3651:1: warning: symbol 'ath10k_pci_pm_ops' was not declared. Should it be static?

I fixed it in the pending branch by making it static:

static SIMPLE_DEV_PM_OPS(ath10k_pci_pm_ops,
			 ath10k_pci_pm_suspend,
			 ath10k_pci_pm_resume);

Please review.

-- 
https://patchwork.kernel.org/patch/9916215/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
