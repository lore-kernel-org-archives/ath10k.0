Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycLb-0005Xo-LP
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 13:00:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: correct the format of host memory chunks in wmi
 init command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190214031034.26969-1-yyuwang@codeaurora.org>
References: <20190214031034.26969-1-yyuwang@codeaurora.org>
Message-Id: <20190226130035.57DDC61BAC@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 13:00:35 +0000 (UTC)
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yu Wang <yyuwang@codeaurora.org> wrote:

> This is a theoretical fix, the issue is found in code review.
> When adding the host memory chunks into wmi-tlv init command,
> there is no separate tlv header for each host memory chunk
> in the struct array, which breaches the convention between
> host and firmware, will result in mismatch between the two.
> 
> To fix this issue, add separate tlv headers for the host
> memory chunks in wmi-tlv init command.
> 
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d961284df24b ath10k: correct the format of host memory chunks in wmi init command

-- 
https://patchwork.kernel.org/patch/10811667/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
