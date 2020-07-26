Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzbjx-00039x-1D
 for ath10k@lists.infradead.org; Sun, 26 Jul 2020 08:10:37 +0000
Subject: Re: [RFC 0/7] Add support to process rx packets in thread
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch> <20200725081633.7432-1-hdanton@sina.com>
 <20200726012244.15264-1-hdanton@sina.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <3ce69fb9-f340-d50d-8e77-61c7210a61c6@nbd.name>
Date: Sun, 26 Jul 2020 10:10:15 +0200
MIME-Version: 1.0
In-Reply-To: <20200726012244.15264-1-hdanton@sina.com>
Content-Language: en-US
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
To: Hillf Danton <hdanton@sina.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Ding Zhao Nan <oshack@hotmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "dianders@chromium.org" <dianders@chromium.org>, David Laight <David.Laight@ACULAB.COM>, Rakesh Pillai <pillair@codeaurora.org>, "evgreen@chromium.org" <evgreen@chromium.org>, "kuba@kernel.org" <kuba@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>

On 2020-07-26 03:22, Hillf Danton wrote:
>> - add a state bit for threaded NAPI
>> - make netif_threaded_napi_add inline
>> - run queue_work outside of local_irq_save/restore (it does that
>> internally already)
>>
>> If you don't mind, I'd like to propose this to netdev soon. Can I have
>> your Signed-off-by for that?
> 
> Feel free to do that. Is it likely for me to select a Cc?
Shall I use Signed-off-by: Hillf Danton <hdanton@sina.com>?
What Cc do you want me to add?

>> ---
>> --- a/include/linux/netdevice.h
>> +++ b/include/linux/netdevice.h
>> @@ -347,6 +347,7 @@ struct napi_struct {
>>  	struct list_head	dev_list;
>>  	struct hlist_node	napi_hash_node;
>>  	unsigned int		napi_id;
>> +	struct work_struct	work;
>>  };
>>  
>>  enum {
>> @@ -357,6 +358,7 @@ enum {
>>  	NAPI_STATE_HASHED,	/* In NAPI hash (busy polling possible) */
>>  	NAPI_STATE_NO_BUSY_POLL,/* Do not add in napi_hash, no busy polling */
>>  	NAPI_STATE_IN_BUSY_POLL,/* sk_busy_loop() owns this NAPI */
>> +	NAPI_STATE_THREADED,	/* Use threaded NAPI */
>>  };
>>  
>>  enum {
>> @@ -367,6 +369,7 @@ enum {
>>  	NAPIF_STATE_HASHED	 = BIT(NAPI_STATE_HASHED),
>>  	NAPIF_STATE_NO_BUSY_POLL = BIT(NAPI_STATE_NO_BUSY_POLL),
>>  	NAPIF_STATE_IN_BUSY_POLL = BIT(NAPI_STATE_IN_BUSY_POLL),
>> +	NAPIF_STATE_THREADED	 = BIT(NAPI_STATE_THREADED),
>>  };
>>  
>>  enum gro_result {
>> @@ -2315,6 +2318,26 @@ static inline void *netdev_priv(const struct net_device *dev)
>>  void netif_napi_add(struct net_device *dev, struct napi_struct *napi,
>>  		    int (*poll)(struct napi_struct *, int), int weight);
>>  
>> +/**
>> + *	netif_threaded_napi_add - initialize a NAPI context
>> + *	@dev:  network device
>> + *	@napi: NAPI context
>> + *	@poll: polling function
>> + *	@weight: default weight
>> + *
>> + * This variant of netif_napi_add() should be used from drivers using NAPI
>> + * with CPU intensive poll functions.
>> + * This will schedule polling from a high priority workqueue that
>> + */
>> +static inline void netif_threaded_napi_add(struct net_device *dev,
>> +					   struct napi_struct *napi,
>> +					   int (*poll)(struct napi_struct *, int),
>> +					   int weight)
>> +{
>> +	set_bit(NAPI_STATE_THREADED, &napi->state);
>> +	netif_napi_add(dev, napi, poll, weight);
>> +}
>> +
>>  /**
>>   *	netif_tx_napi_add - initialize a NAPI context
>>   *	@dev:  network device
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -158,6 +158,7 @@ static DEFINE_SPINLOCK(offload_lock);
>>  struct list_head ptype_base[PTYPE_HASH_SIZE] __read_mostly;
>>  struct list_head ptype_all __read_mostly;	/* Taps */
>>  static struct list_head offload_base __read_mostly;
>> +static struct workqueue_struct *napi_workq;
> 
> Is __read_mostly missing?
Yes, thanks. I will add that before sending the patch.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
