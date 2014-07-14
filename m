Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6gBY-0002vy-ID
 for ath10k@lists.infradead.org; Mon, 14 Jul 2014 13:20:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: sanitize tx ring index access properly
References: <1401954520-3365-1-git-send-email-michal.kazior@tieto.com>
 <1401954520-3365-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 14 Jul 2014 16:20:08 +0300
In-Reply-To: <1401954520-3365-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 5 Jun 2014 09:48:40 +0200")
Message-ID: <87vbr0krg7.fsf@kamboji.qca.qualcomm.com>
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

> The tx ring index was immediately trimmed with a
> bitmask. This discarded the 0xFFFFFFFF error case
> (which theoretically can happen when a device is
> abruptly disconnected) and led to using an invalid
> tx ring index. This could lead to memory
> corruption.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/ce.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
> index d185dc0..7c6c7d5 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -603,16 +603,19 @@ static int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
>  		if (ret)
>  			return ret;
>  
> -		src_ring->hw_index =
> -			ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
> -		src_ring->hw_index &= nentries_mask;
> +		read_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
> +		if (read_index == 0xFFFFFFFF)
> +			return -ENODEV;

I changed this to lower case, as it was before. Let's use lower case hex
values in ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
