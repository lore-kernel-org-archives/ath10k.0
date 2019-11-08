Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSzrN-0003jF-Kn
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 08:43:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix get invalid tx rate for Mesh metric
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572329537-27728-1-git-send-email-miaoqing@codeaurora.org>
References: <1572329537-27728-1-git-send-email-miaoqing@codeaurora.org>
Message-Id: <20191108084313.420DE6087D@smtp.codeaurora.org>
Date: Fri,  8 Nov 2019 08:43:13 +0000 (UTC)
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
To: Miaoqing Pan <miaoqing@codeaurora.org>
Cc: Hou Bao Hou <houbao@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Miaoqing Pan <miaoqing@codeaurora.org> wrote:

> ath10k does not provide transmit rate info per MSDU
> in tx completion, mark that as -1 so mac80211
> will ignore the rates. This fixes mac80211 update Mesh
> link metric with invalid transmit rate info.
> 
> Tested HW: QCA9984
> Tested FW: 10.4-3.9.0.2-00035
> 
> Signed-off-by: Hou Bao Hou <houbao@codeaurora.org>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

05a11003a565 ath10k: fix get invalid tx rate for Mesh metric

-- 
https://patchwork.kernel.org/patch/11217003/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
