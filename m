Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wka8s-0005S5-7f
 for ath10k@lists.infradead.org; Wed, 14 May 2014 14:26:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: fixes 2014-05-14
References: <1400069786-9764-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 14 May 2014 17:26:15 +0300
In-Reply-To: <1400069786-9764-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 14 May 2014 14:16:24 +0200")
Message-ID: <8738gcfnco.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This is another pair of patches.
>
> It fixes a crash recently reported by Ben, but..
>
> I've been able to find only a single code path
> that called free_irq() twice in upstream code.
> However it doesn't match the call trace reported
> by Ben. I have to assume this is related to his
> local patches or this is a very wierd case of
> recovery race between userspace/mac80211/driver.
>
>
> Michal Kazior (2):
>   ath10k: fix core start sequence
>   ath10k: prevent hif_stop being called twice

The patches don't apply anymore and the conflict was not trivial enough
for me to fix it. Can you rebase, please?

(This is the thread I was supposed to reply, sorry for the confusion.)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
