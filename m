Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyd4V-00052Q-0C
 for ath10k@lists.infradead.org; Mon, 15 Jul 2013 07:19:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [ath9k-devel] [PATCH v2 1/3] ath10k: implement device recovery
References: <1372148011-28234-1-git-send-email-michal.kazior@tieto.com>
 <1372148011-28234-2-git-send-email-michal.kazior@tieto.com>
 <87bo6hh2hz.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkJLTLRrO41bNJ+x1fAKb39AQ2J4QfinFbE4=BqwPu0VQ@mail.gmail.com>
Date: Mon, 15 Jul 2013 10:19:16 +0300
In-Reply-To: <CA+BoTQkJLTLRrO41bNJ+x1fAKb39AQ2J4QfinFbE4=BqwPu0VQ@mail.gmail.com>
 (Michal Kazior's message of "Fri, 5 Jul 2013 10:05:36 +0200")
Message-ID: <87r4f0p9xn.fsf@kamboji.qca.qualcomm.com>
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
Cc: "ath9k-devel@lists.ath9k.org" <ath9k-devel@lists.ath9k.org>, ath10k@lists.infradead.org

Hi Michal,

sorry, I forgot to answer this one.

Michal Kazior <michal.kazior@tieto.com> writes:

> On 5 July 2013 09:47, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> I feel that RESTARTING_OFF and RESTARTING_ON are a bit confusing names,
>> especially when we have OFF and ON states. Wouldn't RESTARTING and
>> RESTARTED be simpler?
>
> RESTARTING/RESTARTED seems confusing to me too. The whole thing
> shouldn't be considered restarted until mac80211 calls in
> restart_complete() - but then again, at that point we should consider
> the state as STATE_ON (and we do). Having RESTARTING_OFF / _ON gives
> off more info about the state hw is in.
>
> Ideally we should have only one state - RESTARTING and guarantee that
> the hw is in a workable state before we call in for
> ieee80211_restart_hw(). We'd need to skip hw startup in ath10k_start()
> in that case and make some code from ath10k_start() reusable and
> callable from ath10k_core_start().
>
> I can't really remember the reason I went with this particular design
> now. Perhaps this can be addressed in follow up patches later?

I would prefer that you still rename the states to what I suggested.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
