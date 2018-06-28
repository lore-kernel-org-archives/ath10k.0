Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYTeC-00048q-4n
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 09:55:29 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix bug in masking of TID value
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180615120153.4677-1-erik.stromdahl@gmail.com>
References: <20180615120153.4677-1-erik.stromdahl@gmail.com>
Message-Id: <20180628095517.D403960B10@smtp.codeaurora.org>
Date: Thu, 28 Jun 2018 09:55:17 +0000 (UTC)
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> Although the TID mask is 0xf, the modulus operation does still not
> produce identical results as the bitwise and operator. If the TID is 15, the
> modulus operation will "convert" it to 0, whereas the bitwise and will keep it
> as 15.
> 
> This was found during code review.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d1a566bec588 ath10k: fix bug in masking of TID value

-- 
https://patchwork.kernel.org/patch/10466271/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
