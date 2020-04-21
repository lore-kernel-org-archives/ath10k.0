Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQrdu-0002nA-R1
 for ath10k@lists.infradead.org; Tue, 21 Apr 2020 12:04:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] ath10k: rename ath10k_hif_swap_mailbox() to
 ath10k_hif_start_post()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1587037859-28873-2-git-send-email-kvalo@codeaurora.org>
References: <1587037859-28873-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200421120440.8F26BC433BA@smtp.codeaurora.org>
Date: Tue, 21 Apr 2020 12:04:40 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Convert ath10k_hif_swap_mailbox() to a more generic op so that bus drivers can
> do more than just swap the mailbox, for example set power save settings like in
> the following sdio patch.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

557e171434eb ath10k: rename ath10k_hif_swap_mailbox() to ath10k_hif_start_post()
22f28076b6c3 ath10k: improve power save performance for sdio
589217632103 ath10k: sdio: remove _hif_ prefix from functions not part of hif interface
96c64857983f ath10k: hif: make send_complete_check op optional

-- 
https://patchwork.kernel.org/patch/11492849/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
