Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSOtz-0005w0-OX
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 15:06:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 01/11] ath10k: high_latency detection
Date: Fri, 22 Dec 2017 15:06:02 +0000
Message-ID: <871sjmby5h.fsf@kamboji.qca.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
 <20170917194013.8658-2-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-2-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 17 Sep 2017 21:40:03 +0200")
Content-Language: en-US
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

> The setup of high latency chips (USB and SDIO) is
> sometimes different than for chips using low latency
> interfaces.
>
> The bus type is used to determine if the interface is
> a high latency interface.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 1 +
>  drivers/net/wireless/ath/ath10k/core.h | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index a4f635820f35..f1924c974a12 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2496,6 +2496,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>  	ar->hw_rev = hw_rev;
>  	ar->hif.ops = hif_ops;
>  	ar->hif.bus = bus;
> +	ar->is_high_latency = ath10k_is_high_latency(bus);

I would prefer the bus driver to provide this via a parameter in
ath10k_core_register() call.

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -789,6 +789,8 @@ struct ath10k {
>  
>  	bool p2p;
>  
> +	bool is_high_latency;
> +
>  	struct {
>  		enum ath10k_bus bus;
>  		const struct ath10k_hif_ops *ops;
> @@ -1013,6 +1015,11 @@ static inline bool ath10k_peer_stats_enabled(struct ath10k *ar)
>  	return false;
>  }
>  
> +static inline bool ath10k_is_high_latency(enum ath10k_bus bus)
> +{
> +	return ((bus == ATH10K_BUS_SDIO) || (bus == ATH10K_BUS_USB));
> +}

That way this function is not needed.

Also I'm wondering should the parameter be actually 'struct
ath10k_bus_params' (or something like that) to make it easier to extend.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
