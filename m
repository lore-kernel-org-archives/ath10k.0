Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkton-00079Y-Cp
 for ath10k@lists.infradead.org; Thu, 15 May 2014 11:27:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 2/2] ath10k: setup AMSDU subframes to 1
References: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
 <1400151186-24949-2-git-send-email-janusz.dziedzic@tieto.com>
Date: Thu, 15 May 2014 14:26:34 +0300
In-Reply-To: <1400151186-24949-2-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Thu, 15 May 2014 12:53:06 +0200")
Message-ID: <87a9aj9tat.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: while1eq1@gmail.com, markaswift@gmail.com, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Fore test purpose only.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 75b3dfb..1e492a1 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -847,6 +847,8 @@ int ath10k_core_start(struct ath10k *ar)
>  	if (status)
>  		goto err_disconnect_htc;
>  
> +	WARN_ON(ath10k_htt_h2t_aggr_cfg_msg(&ar->htt, 64, 1));

I anticipate we will need to change AMSDU values in the future and it
would be good to have some proper interface for this command. Maybe a
debugfs file which takes both values? Or something else?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
