Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEX7r-0006Vz-UF
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 04:13:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/6] ath10k: use inline ce_state structure
References: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
 <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
 <1377601683-12072-2-git-send-email-michal.kazior@tieto.com>
Date: Wed, 28 Aug 2013 07:12:33 +0300
In-Reply-To: <1377601683-12072-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 27 Aug 2013 13:07:58 +0200")
Message-ID: <87y57mjvwu.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Simplifies memory managament of ce_state.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Sorry, I noticed this only in my second review round:

> --- a/drivers/net/wireless/ath/ath10k/pci.h
> +++ b/drivers/net/wireless/ath/ath10k/pci.h
> @@ -233,7 +233,10 @@ struct ath10k_pci {
>  	spinlock_t ce_lock;
>  
>  	/* Map CE id to ce_state */
> -	struct ce_state *ce_id_to_state[CE_COUNT_MAX];
> +	struct ce_state ce_states[CE_COUNT_MAX];
> +
> +	/* makes sure that dummy reads are atomic */
> +	spinlock_t hw_v1_workaround_lock;
>  };

That lock doesn't look right. Is it a leftover from a rebase?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
