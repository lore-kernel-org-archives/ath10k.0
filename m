Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kClbV-0008Oo-Mi
 for ath10k@lists.infradead.org; Mon, 31 Aug 2020 15:20:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath10k: wmi: Use struct_size() helper in
 ath10k_wmi_alloc_skb()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200616225132.GA19873@embeddedor>
References: <20200616225132.GA19873@embeddedor>
Message-Id: <20200831152011.857AAC43387@smtp.codeaurora.org>
Date: Mon, 31 Aug 2020 15:20:11 +0000 (UTC)
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
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes. Also, remove unnecessary
> variable _len_.
> 
> This code was detected with the help of Coccinelle and, audited and
> fixed manually.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e96eecdb290a ath10k: wmi: Use struct_size() helper in ath10k_wmi_alloc_skb()

-- 
https://patchwork.kernel.org/patch/11608745/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
