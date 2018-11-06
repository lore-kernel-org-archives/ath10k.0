Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK44E-0002Hk-P8
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 16:19:06 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: ath10k_snoc_{read,write}32() should be static
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181102181000.96834-1-briannorris@chromium.org>
References: <20181102181000.96834-1-briannorris@chromium.org>
Message-Id: <20181106161851.742D860741@smtp.codeaurora.org>
Date: Tue,  6 Nov 2018 16:18:51 +0000 (UTC)
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> wrote:

> They're provided as callbacks in ath10k_hif_ops and should be accessed
> that way, if needed outside of snoc.c, and anyway, they're currently
> unused outside snoc.c.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

97b9608be34f ath10k: ath10k_snoc_{read,write}32() should be static

-- 
https://patchwork.kernel.org/patch/10665971/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
