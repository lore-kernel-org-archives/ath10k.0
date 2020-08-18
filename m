Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7yFk-0007qB-JY
 for ath10k@lists.infradead.org; Tue, 18 Aug 2020 09:50:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix VHT NSS calculation when STBC is enabled
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597392971-3897-1-git-send-email-murugana@codeaurora.org>
References: <1597392971-3897-1-git-send-email-murugana@codeaurora.org>
Message-Id: <20200818094943.A74A4C43395@smtp.codeaurora.org>
Date: Tue, 18 Aug 2020 09:49:43 +0000 (UTC)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> wrote:

> When STBC is enabled, NSTS_SU value need to be accounted for VHT NSS
> calculation for SU case.
> 
> Without this fix, 1SS + STBC enabled case was reported wrongly as 2SS
> in radiotap header on monitor mode capture.
> 
> Tested-on: QCA9984 10.4-3.10-00047
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

99f41b8e43b8 ath10k: fix VHT NSS calculation when STBC is enabled

-- 
https://patchwork.kernel.org/patch/11713837/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
