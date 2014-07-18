Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X87Ti-0005Rr-Dn
 for ath10k@lists.infradead.org; Fri, 18 Jul 2014 12:41:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: fix Rx aggregation reordering
References: <1405505855-13741-1-git-send-email-michal.kazior@tieto.com>
 <1405509540-32691-1-git-send-email-michal.kazior@tieto.com>
 <53C66422.10702@gmail.com>
 <CA+BoTQn8TYX4vDx=K4P5rE+LBXrrUL2q1E7GsiOpBj82QgRKsw@mail.gmail.com>
 <CA+BoTQkk5oYS4JZ5a6W02rZ62AgxcHE76knS7QA2VfZDxYi2Jg@mail.gmail.com>
Date: Fri, 18 Jul 2014 15:41:07 +0300
In-Reply-To: <CA+BoTQkk5oYS4JZ5a6W02rZ62AgxcHE76knS7QA2VfZDxYi2Jg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 16 Jul 2014 14:41:27 +0200")
Message-ID: <87tx6e261o.fsf@kamboji.qca.qualcomm.com>
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
Cc: Varka Bhadram <varkabhadram@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

Michal Kazior <michal.kazior@tieto.com> writes:

>>> Here my concern in amount of time holding the lock...
>>>
>>> spin_lock_bh(&ar->data_lock);
>>> peer = ath10k_peer_find_by_id(ar, peer_id);
>>> if (!peer) {
>>>         spin_unlock_bh(&ar->data_lock);
>>>
>>>         ath10k_warn("received addba event for invalid peer_id: %hu\n",
>>>                     peer_id);
>>>         return;
>>> }
>>>
>>> No need to of putting the debug message inside the critical region...  :-)
>>
>> Sounds reasonable in this case as I'm not printing spinlock-protected values.
>
> ..and I realized this isn't true upon hitting the send button.
>
> The other print uses peer->vdev_id. The peer was acquired under a lock
> and must not be used after the lock is released. It'll just look
> confusing if I mix ordering of unlock/print in some cases so I'll
> leave it as is.

I actually prefer also the original form of "warn(); unlock(); return;",
somehow it feels more natural for me. And this is on error path where
efficiency is not really a priority.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
