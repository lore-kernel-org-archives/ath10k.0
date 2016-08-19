Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baa42-0001oG-4d
 for ath10k@lists.infradead.org; Fri, 19 Aug 2016 03:01:46 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: Grab rcu_read_lock before the txqs spinlock.
Date: Fri, 19 Aug 2016 03:01:14 +0000
Message-ID: <1471575674214.65791@qti.qualcomm.com>
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>,
 <1471569995-10028-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1471569995-10028-2-git-send-email-greearb@candelatech.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 916119c..d96c06e 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4307,8 +4307,8 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
>         int max;
>         int loop_max = 2000;
> 
> -       spin_lock_bh(&ar->txqs_lock);
>         rcu_read_lock();
> +       spin_lock_bh(&ar->txqs_lock);
>
Ben,

It is quite possible that push_pending can be preempted after acquiring rcu_lock which
may lead to deadlock. no? I assume to prevent that spin_lock is taken first. 

Could you please explain how this reordering is fixing dead lock?

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
