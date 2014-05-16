Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlJ5t-0007qn-NX
 for ath10k@lists.infradead.org; Fri, 16 May 2014 14:26:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath9k/ath10k: remove unnecessary channel_switch_beacon
 callbacks
References: <1400248534-16763-1-git-send-email-luca@coelho.fi>
Date: Fri, 16 May 2014 17:26:13 +0300
In-Reply-To: <1400248534-16763-1-git-send-email-luca@coelho.fi> (Luca Coelho's
 message of "Fri, 16 May 2014 16:55:34 +0300")
Message-ID: <87y4y13im2.fsf@kamboji.qca.qualcomm.com>
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
To: Luca Coelho <luca@coelho.fi>
Cc: ath9k-devel@venema.h4ckr.net, linux-wireless@vger.kernel.org, michal.kazior@tieto.com, ath10k@lists.infradead.org

Luca Coelho <luca@coelho.fi> writes:

> From: Luciano Coelho <luciano.coelho@intel.com>
>
> The channel_switch_beacon callback is optional, so it doesn't have to
> be defined if it's not going to do anything useful with it.  Both
> ath9k and ath10k define the callback and just returns.  This commit
> removes them.
>
> Cc: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Luciano Coelho <luciano.coelho@intel.com>
> ---
>
> I'm plannnig to remove the channel_switch_beacon callback (actually,
> replace it with a more generic one that can be used for STA and other
> iftypes too) and ath9k/ath10k are the only (non) users of it. ;)

John, I'm planning to take this as I think we will get less conflicts
that way. But let me know if you want it instead.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
