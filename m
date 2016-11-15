Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6fHy-0000qL-Fm
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 15:04:47 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix failure to send NULL func frame for 10.4
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1476257342-3241-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1476257342-3241-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <755fcf2ee5da4f8f9f0e618e1bece8c1@euamsexm01a.eu.qualcomm.com>
Date: Tue, 15 Nov 2016 16:04:08 +0100
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> This partially reverts 'commit 2cdce425aa33
> ("ath10k: Fix broken NULL func data frame status for 10.4")'
> Unfortunately this breaks sending NULL func and the existing
> issue of obtaining proper tx status for NULL function will be
> fixed. Also update the comments for feature flag added to be
> useless and not working
> 
> Fixes: 2cdce425aa33 "ath10k: Fix broken NULL func data frame status for
> 10.4"
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

fcf7cf1551ca ath10k: fix failure to send NULL func frame for 10.4

-- 
https://patchwork.kernel.org/patch/9372171/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
