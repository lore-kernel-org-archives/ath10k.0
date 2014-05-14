Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkZT7-0000we-B4
 for ath10k@lists.infradead.org; Wed, 14 May 2014 13:43:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: 2014-05-07 fixes
References: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 14 May 2014 16:43:08 +0300
In-Reply-To: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 7 May 2014 14:33:24 +0200")
Message-ID: <87k39ofpcj.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, apenwarr@gmail.com

Michal Kazior <michal.kazior@tieto.com> writes:

> These 2 patches address kernel panics reported by
> Avery recently. One of them was most likely
> reported by Ben some time ago already.
>
> I've never seen these panics myself. It'd be great
> if you guys could give it a try and (assuming
> you're capable of reproducing) see if it actually
> helps.
>
>
> Michal Kazior (2):
>   ath10k: fix htt rx ring clean up
>   ath10k: fix handling of wierd MSDU chaining cases

Thanks, applied.

I didn't see any reports if these help or not, but the patches looked
good and I applied them anyway.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
