Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbqUo-0006My-5g
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 12:37:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix kernel panic while shutting down AP
References: <1412759786-10567-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87a956hosb.fsf@kamboji.qca.qualcomm.com>
 <20141008104823.GB25666@qca.qualcomm.com>
 <CA+BoTQmOZiPQRWeiZ6QqZ5MhHbweMsdf94v1f5mkYpr2461j4A@mail.gmail.com>
Date: Wed, 8 Oct 2014 15:37:00 +0300
In-Reply-To: <CA+BoTQmOZiPQRWeiZ6QqZ5MhHbweMsdf94v1f5mkYpr2461j4A@mail.gmail.com>
 (Michal Kazior's message of "Wed, 8 Oct 2014 14:24:18 +0200")
Message-ID: <87fveyg2kz.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>>> Until now we have protected arvif->beacon_buf with data_lock. How do we
>>> know that this is safe to do without taking data_lock?
>>>
>> As said, spin_lock can not be used for dma_free_coherent.
>> arvif->beacon_buf is already protected by conf_mutex. At this state
>> in ath10k_halt path, no one can access beacon_buf. So mutex lock itself
>> is sufficient.
>
> beacon_buf is protected by conf_mutex implicitly. It wasn't the main
> intent. It is protected with data_lock spinlock.
>
> Do not trust the device - if there's a spurious SWBA event while
> ath10k_remove_interface() is running you could end up with invalid
> memory access.
>
> It might be acceptable to drop the spinlock for ath10k_halt() since
> the device is guaranteed to be stopped at that point (effectively
> reset) though.
>
> Anyway I'm hoping this bug can be fixed with the gfp flag.

Yeah, fixing this with the gfp flag would be much better solution.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
