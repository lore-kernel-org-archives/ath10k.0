Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLYRx-0007hc-SH
 for ath10k@lists.infradead.org; Thu, 06 Mar 2014 13:35:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Missing memory barriers
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <8738j4ftep.fsf_-_@kamboji.qca.qualcomm.com>
 <CAHqTa-0L5oJKSuJ9XEsprKJciMsEa5aFfLpaBLZ4Jsxw59XAmQ@mail.gmail.com>
Date: Thu, 6 Mar 2014 15:34:34 +0200
In-Reply-To: <CAHqTa-0L5oJKSuJ9XEsprKJciMsEa5aFfLpaBLZ4Jsxw59XAmQ@mail.gmail.com>
 (Avery Pennarun's message of "Thu, 27 Feb 2014 22:10:31 -0800")
Message-ID: <8761nrsb6d.fsf@kamboji.qca.qualcomm.com>
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
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Thu, Feb 27, 2014 at 7:48 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Avery Pennarun <apenwarr@gmail.com> writes:
>>> - there are definitely some missing memory barriers in here; in a few
>>> cases you can clearly see a write getting done before the read that
>>> came before it.  Looking at the definitions for iowrite32 and
>>> ioread32, and for rmb() and wmb(), we can see that the use of rmb()
>>> and wmb() do not work properly (at least on ARM) when you care about
>>> the ordering between reads and writes.  However, I don't think this
>>> actually causes the problem.
>>
>> Can you tell more about this, please? Did you find out where we are
>> actually doing it wrong?
>
> Sure.  It's been a while since I wrote the above and it was with an
> older version of the ath10k driver, but basically what happens is as
> follows.

[...]

> The bad news is that, while inserting the extra barrier did clean up
> my bus trace, it didn't fix the underlying problem.  When the chip
> dies due to this cold reset operation, the inability to read the
> status register is only a symptom, not the cause.  In the end it's
> harmless that we end up doing the first read before the write
> operation finishes.  What happens isn't what the code says, but I
> don't think that matters in this case.

Thanks for the excellent write up, I understand this better now. I
wasn't expecting that this would fix the cold reset issue, but these
kind of issues should be good to fix anyway. You never know what kind of
bugs they might cause in the future.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
