Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMCEg-0007g7-0l
 for ath10k@lists.infradead.org; Sat, 08 Mar 2014 08:03:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware crash when sending large numbers of forwarded packets
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
Date: Sat, 8 Mar 2014 10:03:31 +0200
In-Reply-To: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
 (Avery Pennarun's message of "Fri, 7 Mar 2014 05:38:07 -0500")
Message-ID: <87iorpnmlo.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi Avery,

Avery Pennarun <apenwarr@gmail.com> writes:

> I'm having a problem where if I transmit too fast out the ath10k
> interface in AP mode, I get a near-immediate firmware crash.

[...]

> Versions:
> - kernel is based on current kvalo/for-linville branch (should I try
> something else?) but seems to be the same in linux-next-20140114 so I
> don't think this behaviour has changed lately.

I do not recommend using for-linville branch for anything. As the name
implies, it's only for John Linville to pull ath10k and ath6kl changes
to his tree.

What I recommend is to use the master branch of my ath.git tree. That's
fairly recent wireless-testing (max 2 weeks old) plus latest ath10k +
ath6kl patches I have (ie. merge of wireless-testing and my ath-next
branch).

But if you prefer to have clean history (which wireless-testing doesn't
have), you can also use ath-next branch directly. That contains the
patches which I'm planning to send Linville next.

I wrote some documentation about branches here:

http://wireless.kernel.org/en/users/Drivers/ath10k/sources#Git_branches

But in a nutshell, use the master branch if you can. That way you are
best aligned with the ath10k developers and also spot any regressions
early on.

> - firmware version 10.1.467.2-1, but also tested with 10.1.467.1-1
> with no difference.
>
> I assume other people are not experiencing this or they would have
> mentioned it by now.  What can I do to help debug this?

We have reported the issue to the firmware team and got some feedback
already. Hopefully we know more early next week.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
