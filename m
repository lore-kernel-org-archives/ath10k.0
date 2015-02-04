Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIyg1-0006Nx-Ne
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 12:03:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: More than one ath10k NIC will not load (bisected)
References: <54BECE4D.9020308@candelatech.com> <54BF0B42.7050101@dd-wrt.com>
 <54BF13AE.5010909@candelatech.com> <54BFF788.2000500@candelatech.com>
 <54C00239.7000008@candelatech.com> <54C166B8.7060405@candelatech.com>
 <CA+BoTQmF+z5+HW+=xis7LPSmq6sSxn2ZuiJHGM83dAAftkN_sA@mail.gmail.com>
 <54C26EB3.7050805@candelatech.com>
 <87vbjit58l.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmGWLDHGa=GkhtDaSupsY-nd5e5nUuwg6iMAN4d8WjOTA@mail.gmail.com>
Date: Wed, 4 Feb 2015 14:02:51 +0200
In-Reply-To: <CA+BoTQmGWLDHGa=GkhtDaSupsY-nd5e5nUuwg6iMAN4d8WjOTA@mail.gmail.com>
 (Michal Kazior's message of "Wed, 4 Feb 2015 10:35:41 +0100")
Message-ID: <87mw4tubo4.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 4 February 2015 at 10:07, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>>> Hmm.. This removes warm_reset in probe function but I fail to see how
>>>> this could end up not loading one of the NIC *silently*?
>>>>
>>>> Anyway there's a pending patch which adds the reset back:
>>>> https://github.com/kvalo/ath/commit/bdcd6f4e4ac5d2d2a56da4813f56655e6db0ee45
>>>> . You might want to try it and see if it helps.
>>>
>>> Reverting the patch made it work again for me.
>>>
>>> I don't understand that code well, but perhaps you are disabling
>>> a shared interrupt that silently stops the second NIC from
>>> being able to do it's thing?
>>>
>>> Do you have a PC with 2 NICs in it that you could try yourself?
>>>
>>> I can grab you the logs of a failure to boot later today.
>>
>> What should we do with this one? I didn't look at the details yet, but
>> do we have any other option than to revert?
>
> I believe this is an issue in Ben's userspace (he sent me logs
> privately) or some sort of kernel event bug. It basically looked like
> this: both devices were detected by ath10k and both started
> register_work. One of the devices loaded all the way while the other
> tried to load a few non-existing firmware files and it stopped. Few
> minutes later there was a hung task splat pointing to
> request_firmware() called from ath10k suggesting userspace didn't
> handle firmware request.
>
> The "offending" patch effectively removed 200ms from probe() in
> ath10k. This could've change timing on request_firmware() calls on
> Ben's system. Btw. the 200ms is back again now with
> 1a7fecb766c83dace747f42b25bbb544b00a0163 ("ath10k: reset chip before
> reading chip_id in probe").
>
> Marek tried running 2 qca988x on his laptop some time ago (with and
> without the extra timing) and didn't have any issues.

Good, thanks for checking this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
