Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAr4r-000345-SX
 for ath10k@lists.infradead.org; Tue, 24 Apr 2018 06:05:24 +0000
MIME-Version: 1.0
Subject: Re: [v2,1/4] ath10k: Add hw params for shadow register support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1523966821-21903-2-git-send-email-pillair@codeaurora.org>
References: <1523966821-21903-2-git-send-email-pillair@codeaurora.org>
Message-Id: <20180424060511.4B88D6070B@smtp.codeaurora.org>
Date: Tue, 24 Apr 2018 06:05:11 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> wcn3990 supports shadow register for ce write.
> 
> Add a hw param for shadow register support.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

b2e40d7ab8e2 ath10k: add hw params for shadow register support
b7ba83f7c414 ath10k: add support for shadow register for WNC3990
4945af5b264f ath10k: enable SRRI/DRRI support on ddr for WCN3990
d5cded16fdc0 ath10k: enable sta idle power save

-- 
https://patchwork.kernel.org/patch/10344857/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
