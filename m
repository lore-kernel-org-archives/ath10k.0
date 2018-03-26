Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0Tlk-000403-B3
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 15:10:47 +0000
MIME-Version: 1.0
Subject: Re: ath: fix false radar detection in JP region
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1519385779-25816-1-git-send-email-srirrama@codeaurora.org>
References: <1519385779-25816-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20180326151033.B664360AE0@smtp.codeaurora.org>
Date: Mon, 26 Mar 2018 15:10:33 +0000 (UTC)
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
To: srirrama@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

srirrama@codeaurora.org wrote:

> This fixes false radar detection (of radar type 7)
> in Japan region by correcting the radar pulse type
> to Chirp as per specification.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ba21ac6cdaef ath: fix false radar detection in JP region

-- 
https://patchwork.kernel.org/patch/10237459/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
