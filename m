Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHpga-0006LN-In
 for ath10k@lists.infradead.org; Fri, 16 Dec 2016 10:24:21 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 06/11] ath10k: htc: Added ATH10K_HTC_FLAG_BUNDLE_LSB
Date: Fri, 16 Dec 2016 10:23:54 +0000
Message-ID: <877f70uq86.fsf@kamboji.qca.qualcomm.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-7-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479496971-19174-7-git-send-email-erik.stromdahl@gmail.com>
 (Erik Stromdahl's message of "Fri, 18 Nov 2016 20:22:46 +0100")
Content-Language: en-US
Content-ID: <5A67DD8BAC0386458F0EB163711574D3@qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/htc.h |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
> index f94b25a..2963694 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.h
> +++ b/drivers/net/wireless/ath/ath10k/htc.h
> @@ -62,6 +62,8 @@ enum ath10k_htc_rx_flags {
>  	ATH10K_HTC_FLAG_BUNDLE_MASK     = 0xF0
>  };
>  
> +#define ATH10K_HTC_FLAG_BUNDLE_LSB         4
> +

I think you could fold patches from 6 to 11 into one patch. They are all
about adding code, and most of the commit logs are empty anyway.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
