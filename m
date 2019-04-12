Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEw3e-000774-EO
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:17:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 6/6] ath10k: sdio: replace skb_trim with explicit set of
 skb->len
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
 <20190409190851.4557-7-erik.stromdahl@gmail.com>
Date: Fri, 12 Apr 2019 16:17:26 +0300
In-Reply-To: <20190409190851.4557-7-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Tue, 9 Apr 2019 21:08:51 +0200")
Message-ID: <87zhovcqhl.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> This patch fixes a bug with padding of the skb data buffer.
> Since skb_trim can only be used to reduce the skb len, it is useless when
> we pad (increase the length of) the skb. Instead we must set skb->len
> directly.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 3eb241cb8a25..989e3f563f3d 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1496,7 +1496,12 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
>  		skb = items[i].transfer_context;
>  		padded_len = ath10k_sdio_calc_txrx_padded_len(ar_sdio,
>  							      skb->len);
> -		skb_trim(skb, padded_len);
> +		/* FIXME: unsure if just extending the skb len is the right
> +		 * thing to do since we might read outside the skb->data
> +		 * buffer. But we really don't want to realloc the skb just to
> +		 * pad the length.
> +		 */
> +		skb->len = padded_len;

Good catch! But I don't think you can modify skb->len directly like
that. There is skb_pad() but that doesn't change skb->len, so that most
likely needs more changes. So maybe skb_put() is the safest here?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
