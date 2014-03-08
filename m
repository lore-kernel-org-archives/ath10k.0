Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMKZ4-0004xd-MR
 for ath10k@lists.infradead.org; Sat, 08 Mar 2014 16:57:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware crash when sending large numbers of forwarded packets
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
 <87iorpnmlo.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1BjUQH_zQp=8NEHt7LQ1JQAG5ftzx+u4i4OqEqaG7teg@mail.gmail.com>
Date: Sat, 8 Mar 2014 18:57:04 +0200
In-Reply-To: <CAHqTa-1BjUQH_zQp=8NEHt7LQ1JQAG5ftzx+u4i4OqEqaG7teg@mail.gmail.com>
 (Avery Pennarun's message of "Sat, 8 Mar 2014 02:20:28 -0600")
Message-ID: <87pplwmxwf.fsf@kamboji.qca.qualcomm.com>
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

Avery Pennarun <apenwarr@gmail.com> writes:

> On Sat, Mar 8, 2014 at 2:03 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> What I recommend is to use the master branch of my ath.git tree. That's
>> fairly recent wireless-testing (max 2 weeks old) plus latest ath10k +
>> ath6kl patches I have (ie. merge of wireless-testing and my ath-next
>> branch).
>
> Ok, thanks.  We're using a fairly old kernel on our device right now
> (3.2.26) so we're using the ath10k driver from linux-backports.  This
> means it's a little tricky to pick an arbitrary version if it has
> diverged to far from linux/master or linux-next.

Yeah, you are not the only one using ath10k with linux-backports.
Ideally we should have our own "backports-ath10k" which contains latest
and greatest ath10k from my master tree. This would be really handy for
debugging problems and verifying bug fixes, but I don't see any way to
find time for that right now :/

> I did try a few different versions though and they did the same thing.

Yeah, I wasn't expecting master branch to contain any fixes to your
issues. This was more like a generic comment.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
