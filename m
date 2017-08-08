Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1df2MU-0007FK-PW
 for ath10k@lists.infradead.org; Tue, 08 Aug 2017 11:07:48 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: fix memory leak in rx ring buffer allocation
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1501670017-12862-1-git-send-email-pillair@codeaurora.org>
References: <1501670017-12862-1-git-send-email-pillair@codeaurora.org>
Message-ID: <20c41b712302461f8667c8bf5fc7cebe@euamsexm01a.eu.qualcomm.com>
Date: Tue, 8 Aug 2017 13:07:13 +0200
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rakesh Pillai <pillair@qti.qualcomm.com>

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The rx ring buffers are added to a hash table if
> firmware support full rx reorder. If the full rx
> reorder support flag is not set before allocating
> the rx ring buffers, none of the buffers are added
> to the hash table.
> 
> There is a race condition between rx ring refill and
> rx buffer replenish from napi poll. The interrupts are
> enabled in hif start, before the rx ring is refilled during init.
> We replenish buffers from napi poll due to the interrupts which
> get enabled after hif start. Hence before the entire rx ring is
> refilled during the init, the napi poll replenishes a few buffers
> in steps of 100 buffers per attempt. During this rx ring replenish
> from napi poll, the rx reorder flag has not been set due to which
> the replenished buffers are not added to the hash table
> 
> Set the rx full reorder support flag before we allocate
> the rx ring buffer to avoid the memory leak.
> 
> Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

f35a7f91f66a ath10k: fix memory leak in rx ring buffer allocation

-- 
https://patchwork.kernel.org/patch/9876599/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
