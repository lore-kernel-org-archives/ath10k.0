Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biLzJ-0005yn-Rk
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 13:37:02 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: Grab rcu_read_lock before the txqs spinlock.
Date: Fri, 9 Sep 2016 13:36:33 +0000
Message-ID: <87k2elp53z.fsf@kamboji.qca.qualcomm.com>
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>
 <1471569995-10028-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1471569995-10028-2-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 18 Aug 2016 18:26:34	-0700")
Content-Language: en-US
Content-ID: <76A7257AC0529E4381414B8CCD775BFD@qualcomm.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> I was seeing some spin-lock hangs in this area of the code,
> and it seems more proper to do the rcu-read-lock outside of
> the spin lock.  I am not sure how much this matters, however.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 916119c..d96c06e 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4307,8 +4307,8 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
>  	int max;
>  	int loop_max = 2000;
>  
> -	spin_lock_bh(&ar->txqs_lock);
>  	rcu_read_lock();
> +	spin_lock_bh(&ar->txqs_lock);
>  
>  	last = list_last_entry(&ar->txqs, struct ath10k_txq, list);
>  	while (!list_empty(&ar->txqs)) {
> @@ -4342,8 +4342,8 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
>  			break;
>  	}
>  
> -	rcu_read_unlock();
>  	spin_unlock_bh(&ar->txqs_lock);
> +	rcu_read_unlock();

I'm no RCU expert but this isn't making any sense. Maybe it changes
timings on your kernel so that it hides the real problem?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
