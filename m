Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnU32-0007Iv-R3
 for ath10k@lists.infradead.org; Thu, 31 Aug 2017 18:18:38 +0000
MIME-Version: 1.0
Subject: Re: [v3,1/2] ath10k: add the PCI PM core suspend/resume ops
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1503438455-6133-1-git-send-email-ryanhsu@qti.qualcomm.com>
References: <1503438455-6133-1-git-send-email-ryanhsu@qti.qualcomm.com>
Message-ID: <ebaaabc57ae441ee8707a9f7f5b0199e@euamsexm01a.eu.qualcomm.com>
Date: Thu, 31 Aug 2017 20:18:09 +0200
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

2 patches applied to ath-next branch of ath.git, thanks.

32faa3f0ee50 ath10k: add the PCI PM core suspend/resume ops
393b706cf20c ath10k: configure and enable the wakeup capability

-- 
https://patchwork.kernel.org/patch/9916215/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
