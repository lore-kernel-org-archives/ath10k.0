Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alObZ-0004oH-3M
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 22:28:50 +0000
Subject: Re: Deadlock on (faked) firmware crash, CUS239, modified 10.4.3
 firmware.
References: <56F5F38A.2070602@candelatech.com>
 <CA+BoTQmwGONqJ0MgccrMzzx9UsGuRCZpdy1RSqdgkcNm_te0xQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FC52F5.7080407@candelatech.com>
Date: Wed, 30 Mar 2016 15:28:05 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmwGONqJ0MgccrMzzx9UsGuRCZpdy1RSqdgkcNm_te0xQ@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>


> Hmm.. If it still reproduces can you try the following diff?
>
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3780,6 +3780,8 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
>                  list_del_init(&artxq->list);
>                  if (ret != -ENOENT)
>                          list_add_tail(&artxq->list, &ar->txqs);
> +               else if (artxq == last)
> +                       last = list_last_entry(&ar->txqs, struct
> ath10k_txq, list);
>
>                  ath10k_htt_tx_txq_update(hw, txq);

Ok, I added this code, and can still reproduce the code.

Firmware is crashing multiple times a minute in this machine in it's
current configuration.  Right before it hung, firmware crashed and
was restarted, and then I get the hang notification.

I don't see any obvious bail-out in the tx_push_pending logic
if the firmware crashes?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
