Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iviv8-0008Jl-SG
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 14:29:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add newlines to printk messages
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200123232456.36197-1-swboyd@chromium.org>
References: <20200123232456.36197-1-swboyd@chromium.org>
Message-Id: <20200126142949.885F1C43383@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 14:29:49 +0000 (UTC)
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
To: Stephen Boyd <swboyd@chromium.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Stephen Boyd <swboyd@chromium.org> wrote:

> Some printks in here don't have newlines at the end, meaning the log
> will be sort of hard to read. Add newlines.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

79a4b788451d ath10k: Add newlines to printk messages

-- 
https://patchwork.kernel.org/patch/11349347/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
