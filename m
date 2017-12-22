Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSPCN-0001yy-UD
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 15:25:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 04/11] ath10k: add start_once support
Date: Fri, 22 Dec 2017 15:25:08 +0000
Message-ID: <87shc2aip8.fsf@kamboji.qca.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
 <20170917194013.8658-5-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-5-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 17 Sep 2017 21:40:06 +0200")
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

> Add possibility to configure the driver to only start target once.
> This can reduce startup time of SDIO devices significantly since
> loading the firmware can take a substantial amount of time.

But it also makes it impossible to restart the firmware if it crashes,
right? Good to mention that in the commit log.

> The patch is also necessary for high latency devices in general since
> it does not seem to be possible to rerun the BMI phase (fw upload)
> without power-cycling the device.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -784,6 +784,8 @@ struct ath10k {
>  
>  	bool is_high_latency;
>  
> +	bool is_started;

Is a separate boolean really needed? State management becomes really
difficult if an enum ath10k_state and this boolean to define the state
of the device. Can't you use ar->state?

> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -569,6 +569,12 @@ struct ath10k_hw_params {
>  	bool is_high_latency;
>  
>  	enum ath10k_bus bus;
> +
> +	/* Specifies whether or not the device should be started once.
> +	 * If set, the device will be started once by the early fw probe
> +	 * and it will not be terminated afterwards.
> +	 */
> +	bool start_once;
>  };

I would actually prefer that the bus driver (eg. usb.c) decides this and
provides it though ath10k_core_register(). It might be that some SDIO
devices have a GPIO line to reset the device etc.

The struct ath10k_bus_params I mentioned earlier might be handy also
here.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
