Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQALa-0003Qj-8n
 for ath10k@lists.infradead.org; Fri, 14 Aug 2015 08:28:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 2/2] ath10k: rename qca6174 to qca61x4
References: <1439469147-9408-1-git-send-email-michal.kazior@tieto.com>
 <1439469147-9408-3-git-send-email-michal.kazior@tieto.com>
Date: Fri, 14 Aug 2015 11:27:23 +0300
In-Reply-To: <1439469147-9408-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 13 Aug 2015 14:32:27 +0200")
Message-ID: <87zj1ujmvo.fsf@kamboji.qca.qualcomm.com>
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
Cc: arnd@arndb.de, linux-wireless@vger.kernel.org, twilightrook@gmail.com, ath10k@lists.infradead.org, oscarrydberg@gmail.com, vvanpo@gmail.com, joseph.salisbury@canonical.com

Michal Kazior <michal.kazior@tieto.com> writes:

> This cleans up the naming a little bit. Both
> QCA6174 and QCA6164 are in practice the same as
> far as driving them is concerned.
>
> Unfortunately firmware paths will need to stay
> untouched, i.e. QCA6164 firmware will still be
> looked for in QCA6174 to avoid breaking backward
> compatibility with older /lib/firmware setups.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This is purely cosmetics and only visible to developers, users won't
notice anything, so I'm not sure if this is worth the trouble. With
proper documentation I would hope that any developer will realise that
QCA6174 actually also means QCA6164 support :)

And more to the point there is nothing preventing coming up with a new
version with a name like QCA6964 or QCA9121 so the prefix would be wrong
again. This has happened with ath6kl in the past.

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -63,49 +63,49 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  		},
>  	},
>  	{
> -		.id = QCA6174_HW_2_1_VERSION,
> -		.name = "qca6174 hw2.1",
> -		.patch_load_addr = QCA6174_HW_2_1_PATCH_LOAD_ADDR,
> +		.id = QCA61X4_HW_2_1_VERSION,
> +		.name = "qca61x4 hw2.1",

What if we instead change the name to "qca6164/qca6176 hw2.1" or
something like that. Would that help?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
