Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivizx-0001RS-D1
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 14:34:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Use device_get_match_data() to simplify code
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200123232944.39247-1-swboyd@chromium.org>
References: <20200123232944.39247-1-swboyd@chromium.org>
Message-Id: <20200126143448.31621C433A2@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 14:34:48 +0000 (UTC)
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

> Use device_get_match_data() here to simplify the code a bit.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fa43e99dd4b7 ath10k: Use device_get_match_data() to simplify code

-- 
https://patchwork.kernel.org/patch/11349353/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
