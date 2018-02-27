Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqiNJ-0005Kc-K8
 for ath10k@lists.infradead.org; Tue, 27 Feb 2018 16:45:11 +0000
MIME-Version: 1.0
Subject: Re: ath10k: update the IRAM banks number for QCA9377
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1518135631-29796-1-git-send-email-ryanhsu@codeaurora.org>
References: <1518135631-29796-1-git-send-email-ryanhsu@codeaurora.org>
Message-Id: <20180227164459.414F2607EF@smtp.codeaurora.org>
Date: Tue, 27 Feb 2018 16:44:59 +0000 (UTC)
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
To: ryanhsu@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ryanhsu@codeaurora.org wrote:

> Preparation for a new QCA9377 firmware release. The new firmware release
> requires more IRAM banks, hence update that on ath10k.
> 
> The IRAM banks promotion won't break any backwards compatibility, as those IRAM
> banks were not getting used in previous firmware releases.
> 
> Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fc8b92635f79 ath10k: update the IRAM bank number for QCA9377

-- 
https://patchwork.kernel.org/patch/10208159/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
