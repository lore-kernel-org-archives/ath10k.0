Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkBgr-0008Vw-32
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 15:01:35 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 12/21] ath10k: Support up to 64 vdevs.
Date: Wed, 14 Sep 2016 15:01:07 +0000
Message-ID: <87y42ucyq6.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-13-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-13-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 11 May 2016 10:02:24	-0700")
Content-Language: en-US
Content-ID: <0AF6A5340F619944BB3C01E6E755169E@qualcomm.com>
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
> The (1 << x) - 1 trick won't work when you
> are trying to fill up all 64 bits, so add special
> case for that.
>
> And, move the limits to the per-nic structure instead
> of per-driver to allow better dynamic use of the limits.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 3f1786c..fa71d57 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1819,7 +1819,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  	if (status)
>  		goto err_hif_stop;
>  
> -	ar->free_vdev_map = (1LL << ar->max_num_vdevs) - 1;
> +	if (ar->max_num_vdevs >= 64)
> +		ar->free_vdev_map = 0xFFFFFFFFFFFFFFFFLL;
> +	else
> +		ar->free_vdev_map = (1LL << ar->max_num_vdevs) - 1;

The last sentence in the commit log doesn't match the code, I removed
that in the pending branch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
