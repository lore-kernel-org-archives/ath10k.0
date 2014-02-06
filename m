Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBLzD-0001ip-4K
 for ath10k@lists.infradead.org; Thu, 06 Feb 2014 10:15:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/4] ath10k:  Add more details to some debug messages.
References: <1391637514-17140-1-git-send-email-greearb@candelatech.com>
Date: Thu, 6 Feb 2014 12:14:42 +0200
In-Reply-To: <1391637514-17140-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 5 Feb 2014 13:58:31
 -0800")
Message-ID: <87eh3gim3x.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> ---

No s-o-b tag.

Also I would prefer style like this for patch titles (especially without
the double space after the colon):

ath10k: add more details to some debug messages

And thirdly :) please also CC linux-wireless for wider review audience

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3418,7 +3418,8 @@ static void ath10k_flush(struct ieee80211_hw *hw, u32 queues, bool drop)
>  		}), ATH10K_FLUSH_TIMEOUT_HZ);
>  
>  	if (ret <= 0 || skip)
> -		ath10k_warn("tx not flushed\n");
> +		ath10k_warn("tx not flushed, ret: %i  skip: %i  ar-state: %i\n",
> +			    ret, skip, ar->state);

I'm trying to keep warning and debug messages clean, maybe this is a bit
more readable:

"tx not flushed: %i (skip %i ar-state %i)\n"

Or another option:

"tx not flushed (skip %i ar-state %i): %i\n"

I would go for the latter.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
