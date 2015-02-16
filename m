Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNLd0-0008Th-Nu
 for ath10k@lists.infradead.org; Mon, 16 Feb 2015 13:22:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix AP/IBSS CSA with template based fw
References: <1423749198-11346-1-git-send-email-michal.kazior@tieto.com>
 <87mw4fgolp.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkZJLaAYy+PnoLiFn5S3sfJujgRRkWcMqgdxJbbf3FHeQ@mail.gmail.com>
Date: Mon, 16 Feb 2015 15:21:53 +0200
In-Reply-To: <CA+BoTQkZJLaAYy+PnoLiFn5S3sfJujgRRkWcMqgdxJbbf3FHeQ@mail.gmail.com>
 (Michal Kazior's message of "Mon, 16 Feb 2015 07:54:17 +0100")
Message-ID: <877fvigff2.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> I actually had strange conflicts already with this patch (in mac.c). As
>> I'm travelling, please check my resolution from the pending branch very
>> carefully. I might have done something stupid.
>
> There's a mistake. Only `arvif->is_up` should be protected by
> `ar->data_lock` in ath10k_bss_assoc():
>
> @@ -1852,7 +1901,9 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
>                 return;
>         }
>
> +       spin_lock_bh(&arvif->ar->data_lock);
>         arvif->is_up = true;
> +       spin_unlock_bh(&arvif->ar->data_lock);
>
>         /* Workaround: Some firmware revisions (tested with qca6174

Thanks for catching this. I fixed it now, can you please check again?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
