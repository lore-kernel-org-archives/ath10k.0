Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khGFf-0000yX-Fr
 for ath10k@lists.infradead.org; Mon, 23 Nov 2020 18:07:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add target IRAM recovery feature support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604657442-23674-1-git-send-email-vnaralas@codeaurora.org>
References: <1604657442-23674-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20201123180736.CB849C43462@smtp.codeaurora.org>
Date: Mon, 23 Nov 2020 18:07:36 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> This target IRAM recovery feature support is to copy target
> IRAM contents available at ATH10K_MEM_REGION_TYPE_REG to host
> memory for back up after firmware loaded. Target IRAM contents
> are copied to wmi memory chunks allocated for the
> WMI_IRAM_RECOVERY_HOST_MEM_REQ_ID and provide the wmi chunks
> address to the firmware through wmi init command.
> 
> If firmware detects andy IRAM corruption through periodic
> checksum validation, It will download the IRAM contents back
> from the provided wmi memory chunks address using hif_memcpy.
> 
> This IRAM recovery feature prevent target assert in case of
> unexpected target IRAM corruptions.
> 
> This patch also introduce a new feature flag 'iram-recovery' for
> backward compatibility.
> 
> Tested-on: QCA9888 10.4-3.9.0.2-00094
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9af7c32ceca8 ath10k: add target IRAM recovery feature support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604657442-23674-1-git-send-email-vnaralas@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
