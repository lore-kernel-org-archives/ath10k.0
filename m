Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVnFx-0008BL-7q
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 20:29:30 +0000
Received: by lbdu10 with SMTP id u10so11519350lbd.4
 for <ath10k@lists.infradead.org>; Wed, 11 Mar 2015 13:29:06 -0700 (PDT)
Message-ID: <5500A58F.3040904@cogentembedded.com>
Date: Wed, 11 Mar 2015 23:29:03 +0300
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC v2] ath10k: move code from parameter list into a
 function
References: <1426100519-20636-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1426100519-20636-1-git-send-email-hofrat@osadl.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Nicholas Mc Guire <hofrat@osadl.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Jeff Haran <Jeff.Haran@citrix.com>, Valdis.Kletnieks@vt.edu, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Pat Erley <pat-lkml@erley.org>, Bj??rn Mork <bjorn@mork.no>

Hello.

On 03/11/2015 10:01 PM, Nicholas Mc Guire wrote:

> Putting code into the parameter list of wait_event_timeout() might be
> legal C-code but not really readable - the "inline" code is simply
> moved into a function and that passed to wait_event_timeout() as the
> condition. As wait_event_timeout will always return >= 0 the following
> timeout check is fixed up to  ret == 0 .

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
[...]

> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index e8cc19f..a7a12cc 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4463,11 +4463,25 @@ static int ath10k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
>   	return ret;
>   }
>
> +static bool check_htt_state(struct ath10k *ar, bool *skip)
> +{
> +	bool empty;
> +
> +	spin_lock_bh(&ar->htt.tx_lock);
> +	empty = (ar->htt.num_pending_tx == 0);
> +	spin_unlock_bh(&ar->htt.tx_lock);
> +
> +	*skip = (ar->state == ATH10K_STATE_WEDGED) ||
> +		test_bit(ATH10K_FLAG_CRASH_FLUSH,
> +			 &ar->dev_flags);
> +	return (empty || *skip);

    Parens not needed here.

[...]

WBR, Sergei


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
