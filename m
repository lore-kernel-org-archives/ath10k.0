Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from r3-11.sinamail.sina.com.cn ([202.108.3.11])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzVNb-0004AU-2T
 for ath10k@lists.infradead.org; Sun, 26 Jul 2020 01:23:09 +0000
From: Hillf Danton <hdanton@sina.com>
Subject: Re: [RFC 0/7] Add support to process rx packets in thread
Date: Sun, 26 Jul 2020 09:22:44 +0800
Message-Id: <20200726012244.15264-1-hdanton@sina.com>
In-Reply-To: <a50ebfba-9733-48db-c90b-5fc106e67f29@nbd.name>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch> <20200725081633.7432-1-hdanton@sina.com>
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
To: Felix Fietkau <nbd@nbd.name>
Cc: Andrew Lunn <andrew@lunn.ch>, Hillf Danton <hdanton@sina.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Ding Zhao Nan <oshack@hotmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "dianders@chromium.org" <dianders@chromium.org>, David Laight <David.Laight@ACULAB.COM>, Rakesh Pillai <pillair@codeaurora.org>, "evgreen@chromium.org" <evgreen@chromium.org>, "kuba@kernel.org" <kuba@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>


Hi Felix,

On Sat, 25 Jul 2020 19:57:23 +0200 Felix Fietkau wrote:
> On 2020-07-25 10:16, Hillf Danton wrote:
> > Hi folks
> > 
> > Below is a minimunm poc implementation I can imagine on top of workqueue
> > to make napi threaded. Thoughts are appreciated.
> > 
> Hi Hillf,
> 
> For some reason I don't see your mails on linux-wireless/netdev.

All is down to my inbox ...

> I've cleaned up your implementation a bit and I ran some tests with mt76
> on an mt7621 embedded board. The results look pretty nice, performance
> is a lot more consistent in my tests now.

Thanks very much for your cleanup and testing.

> Here are the changes that I've made compared to your version:
> 
> - remove the #ifdef, I think it's unnecessary

This makes the code a mile nicer and perhaps I fear pulls some questions
from EricD.

> - add a state bit for threaded NAPI
> - make netif_threaded_napi_add inline
> - run queue_work outside of local_irq_save/restore (it does that
> internally already)
>
> If you don't mind, I'd like to propose this to netdev soon. Can I have
> your Signed-off-by for that?

Feel free to do that. Is it likely for me to select a Cc?

Thanks
Hillf

> Thanks,
> 
> - Felix
> 
> ---
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -347,6 +347,7 @@ struct napi_struct {
>  	struct list_head	dev_list;
>  	struct hlist_node	napi_hash_node;
>  	unsigned int		napi_id;
> +	struct work_struct	work;
>  };
>  
>  enum {
> @@ -357,6 +358,7 @@ enum {
>  	NAPI_STATE_HASHED,	/* In NAPI hash (busy polling possible) */
>  	NAPI_STATE_NO_BUSY_POLL,/* Do not add in napi_hash, no busy polling */
>  	NAPI_STATE_IN_BUSY_POLL,/* sk_busy_loop() owns this NAPI */
> +	NAPI_STATE_THREADED,	/* Use threaded NAPI */
>  };
>  
>  enum {
> @@ -367,6 +369,7 @@ enum {
>  	NAPIF_STATE_HASHED	 = BIT(NAPI_STATE_HASHED),
>  	NAPIF_STATE_NO_BUSY_POLL = BIT(NAPI_STATE_NO_BUSY_POLL),
>  	NAPIF_STATE_IN_BUSY_POLL = BIT(NAPI_STATE_IN_BUSY_POLL),
> +	NAPIF_STATE_THREADED	 = BIT(NAPI_STATE_THREADED),
>  };
>  
>  enum gro_result {
> @@ -2315,6 +2318,26 @@ static inline void *netdev_priv(const struct net_device *dev)
>  void netif_napi_add(struct net_device *dev, struct napi_struct *napi,
>  		    int (*poll)(struct napi_struct *, int), int weight);
>  
> +/**
> + *	netif_threaded_napi_add - initialize a NAPI context
> + *	@dev:  network device
> + *	@napi: NAPI context
> + *	@poll: polling function
> + *	@weight: default weight
> + *
> + * This variant of netif_napi_add() should be used from drivers using NAPI
> + * with CPU intensive poll functions.
> + * This will schedule polling from a high priority workqueue that
> + */
> +static inline void netif_threaded_napi_add(struct net_device *dev,
> +					   struct napi_struct *napi,
> +					   int (*poll)(struct napi_struct *, int),
> +					   int weight)
> +{
> +	set_bit(NAPI_STATE_THREADED, &napi->state);
> +	netif_napi_add(dev, napi, poll, weight);
> +}
> +
>  /**
>   *	netif_tx_napi_add - initialize a NAPI context
>   *	@dev:  network device
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -158,6 +158,7 @@ static DEFINE_SPINLOCK(offload_lock);
>  struct list_head ptype_base[PTYPE_HASH_SIZE] __read_mostly;
>  struct list_head ptype_all __read_mostly;	/* Taps */
>  static struct list_head offload_base __read_mostly;
> +static struct workqueue_struct *napi_workq;

Is __read_mostly missing?

>  static int netif_rx_internal(struct sk_buff *skb);
>  static int call_netdevice_notifiers_info(unsigned long val,
> @@ -6286,6 +6287,11 @@ void __napi_schedule(struct napi_struct *n)
>  {
>  	unsigned long flags;
>  
> +	if (test_bit(NAPI_STATE_THREADED, &n->state)) {
> +		queue_work(napi_workq, &n->work);
> +		return;
> +	}
> +
>  	local_irq_save(flags);
>  	____napi_schedule(this_cpu_ptr(&softnet_data), n);
>  	local_irq_restore(flags);
> @@ -6333,6 +6339,11 @@ EXPORT_SYMBOL(napi_schedule_prep);
>   */
>  void __napi_schedule_irqoff(struct napi_struct *n)
>  {
> +	if (test_bit(NAPI_STATE_THREADED, &n->state)) {
> +		queue_work(napi_workq, &n->work);
> +		return;
> +	}
> +
>  	____napi_schedule(this_cpu_ptr(&softnet_data), n);
>  }
>  EXPORT_SYMBOL(__napi_schedule_irqoff);
> @@ -6601,6 +6612,29 @@ static void init_gro_hash(struct napi_struct *napi)
>  	napi->gro_bitmask = 0;
>  }
>  
> +static void napi_workfn(struct work_struct *work)
> +{
> +	struct napi_struct *n = container_of(work, struct napi_struct, work);
> +
> +	for (;;) {
> +		if (!test_bit(NAPI_STATE_SCHED, &n->state))
> +			return;
> +
> +		if (n->poll(n, n->weight) < n->weight)
> +			return;
> +
> +		if (need_resched()) {
> +			/*
> +			 * have to pay for the latency of task switch even if
> +			 * napi is scheduled
> +			 */
> +			if (test_bit(NAPI_STATE_SCHED, &n->state))
> +				queue_work(napi_workq, work);
> +			return;
> +		}
> +	}
> +}
> +
>  void netif_napi_add(struct net_device *dev, struct napi_struct *napi,
>  		    int (*poll)(struct napi_struct *, int), int weight)
>  {
> @@ -6621,6 +6655,7 @@ void netif_napi_add(struct net_device *dev, struct napi_struct *napi,
>  #ifdef CONFIG_NETPOLL
>  	napi->poll_owner = -1;
>  #endif
> +	INIT_WORK(&napi->work, napi_workfn);
>  	set_bit(NAPI_STATE_SCHED, &napi->state);
>  	napi_hash_add(napi);
>  }
> @@ -10676,6 +10711,10 @@ static int __init net_dev_init(void)
>  		sd->backlog.weight = weight_p;
>  	}
>  
> +	napi_workq = alloc_workqueue("napi_workq", WQ_UNBOUND | WQ_HIGHPRI,
> +				     WQ_UNBOUND_MAX_ACTIVE);
> +	BUG_ON(!napi_workq);
> +
>  	dev_boot_phase = 0;
>  
>  	/* The loopback device is special if any other network devices
> 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
