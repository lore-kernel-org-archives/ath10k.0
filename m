Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faNQ5-0001ek-Ld
 for ath10k@lists.infradead.org; Tue, 03 Jul 2018 15:40:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 2/6] ath10k: Add support to create boardname for
 non-bmi target
References: <20180605123448.32331-1-govinds@codeaurora.org>
Date: Tue, 03 Jul 2018 18:40:30 +0300
In-Reply-To: <20180605123448.32331-1-govinds@codeaurora.org> (Govind Singh's
 message of "Tue, 5 Jun 2018 18:04:48 +0530")
Message-ID: <87sh50nx8x.fsf@kamboji.qca.qualcomm.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, Rakesh Pillai <pillair@codeaurora.org>, andy.gross@linaro.org

Govind Singh <govinds@codeaurora.org> writes:

> From: Rakesh Pillai <pillair@codeaurora.org>
>
> Add support to create the boardname for non-bmi targets
> like WCN3990, which uses qmi for bdf download. This
> boardname is used to parse the board data from board-2.bin.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 14 ++++++++++++++
>  drivers/net/wireless/ath/ath10k/core.h |  2 ++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 4cf54a7ef09a..8a592019cc4d 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1429,6 +1429,20 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
>  		goto out;
>  	}
>  
> +	if (ar->id.qmi_ids_valid) {
> +		if (ar->id.qmi_board_id > 0x99)
> +			scnprintf(name, name_len,
> +				  "bus=%s,qmi-board-id=%03x",
> +				  ath10k_bus_str(ar->hif.bus),
> +				  ar->id.qmi_board_id);
> +		else
> +			scnprintf(name, name_len,
> +				  "bus=%s,qmi-board-id=b%02x",
> +				  ath10k_bus_str(ar->hif.bus),
> +				  ar->id.qmi_board_id);
> +		goto out;
> +	}

Why not just use %d? What benefit would hexadecimal format bring?

And why %02 and %03? I don't see the need for that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
