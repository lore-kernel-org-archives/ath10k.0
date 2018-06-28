Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYTO3-0004E8-3n
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 09:38:48 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix tlv 5ghz channel missing issue
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1523345994-28800-2-git-send-email-zhichen@codeaurora.org>
References: <1523345994-28800-2-git-send-email-zhichen@codeaurora.org>
Message-Id: <20180628093836.B248660B10@smtp.codeaurora.org>
Date: Thu, 28 Jun 2018 09:38:36 +0000 (UTC)
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
To: zhichen@codeaurora.org
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

zhichen@codeaurora.org wrote:

> The 5ghz channel parameters of TLV target wasn't passed to host, it caused
> host can only use lower channels from 36 to 64.
> 
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

98dc04ba60b9 ath10k: fix tlv 5ghz channel missing issue

-- 
https://patchwork.kernel.org/patch/10332449/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
