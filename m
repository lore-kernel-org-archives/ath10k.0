Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXoGD-00064v-VY
 for ath10k@lists.infradead.org; Mon, 03 Jun 2019 14:48:31 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: avoid leaving .bss_info_changed prematurely
References: <20190311083107.311-1-sven@narfation.org>
Date: Mon, 03 Jun 2019 17:48:24 +0300
In-Reply-To: <20190311083107.311-1-sven@narfation.org> (Sven Eckelmann's
 message of "Mon, 11 Mar 2019 09:31:07 +0100")
Message-ID: <878suiwwqv.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>, ath10k@lists.infradead.org, Sriram R <srirrama@codeaurora.org>

Sven Eckelmann <sven@narfation.org> writes:

> From: Sven Eckelmann <seckelmann@datto.com>
>
> ath10k_bss_info_changed() handles various events from the upper layers. It
> parses the changed bitfield and then configures the driver/firmware
> accordingly. Each detected event is handled in a separate scope which is
> independent of each other - but in the same function.
>
> The commit f279294e9ee2 ("ath10k: add support for configuring management
> packet rate") changed this behavior by returning from this function
> prematurely when some precondition was not fulfilled. All new event
> handlers added after the BSS_CHANGED_BASIC_RATES event handler would then
> also be skipped.
>
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> ---
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: Sriram R <srirrama@codeaurora.org>
>
> Only compile tested

Unfortunately doesn't apply anymore, please rebase.

Applying: ath10k: avoid leaving .bss_info_changed prematurely
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath10k/mac.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath10k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/mac.c
Recorded preimage for 'drivers/net/wireless/ath/ath10k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0001 ath10k: avoid leaving .bss_info_changed prematurely

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
