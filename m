Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkrwY-0007gW-1a
 for ath10k@lists.infradead.org; Mon, 25 Nov 2013 08:54:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: active/idle time from ath10k
References: <CAPqRyK8aiF4cnz+V9bDyPKPakjZ5ee3e+OFxmsnTaTMhh8An5g@mail.gmail.com>
Date: Mon, 25 Nov 2013 10:54:30 +0200
In-Reply-To: <CAPqRyK8aiF4cnz+V9bDyPKPakjZ5ee3e+OFxmsnTaTMhh8An5g@mail.gmail.com>
 (Phil Moora's message of "Thu, 21 Nov 2013 18:09:36 -0800")
Message-ID: <87mwksq2t5.fsf@kamboji.qca.qualcomm.com>
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
To: Phil Moora <phil.moora@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Phil Moora <phil.moora@gmail.com> writes:

> Is there a way to get radio active time or idle time from ath10k? By
> active time, I mean that the radio was transmitting or receiving
> something.
>
> I looked at ath10k_get_survey function but
> (1) I don't want/need to hop across channels, just need the statistics
> for my radio's current channel,
> (2) I want the statistics periodically, as opposed to survey dump
> which is only available at request.

I haven't noticed firmware supporting anything like this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
