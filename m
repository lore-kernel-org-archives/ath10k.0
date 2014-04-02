Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVTAI-0000tN-MZ
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 21:57:47 +0000
Message-ID: <533C87C1.2090908@candelatech.com>
Date: Wed, 02 Apr 2014 14:57:21 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Clean-ish rebase on top of 3.14.0 (final)?
References: <53399703.1060302@candelatech.com>
 <87ioqtsdgt.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ioqtsdgt.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 04/01/2014 12:42 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> Kalle:  In case you end up with your tree in a clean rebase
>> on stock 3.14.0 (or as clean as is reasonable), could you let
>> us know and give us a bit of time before pulling down more
>> upstream stuff?
>>
>> The reason is that I would like to freeze a 3.14 kernel with whatever
>> ath10k patches are currently in your tree and attempt to stabalize
>> it...
>
> Do you mean 3.14 plus only ath10k patches? Or are you willing to take
> other wireless patches as well?

Other wireless patches would be fine.  I just don't want all of 3.15.0-rc1,
at least until I can snapshot a 3.14 to try to stabalize.

> Basically I have two branches in my ath.git:
>
> o ath-next: wireless-next + latest ath10k patches
>
> o master: wireless-testing + ath-next (= latest ath10k patches)
>
> I only merge latest wireless-next to ath-next seldomly, usually once
> every 1-2 months. But I merge wireless-testing to master branch at least
> weekly.
>
> One idea would be that you merge 3.14 tag with ath-next. That way you
> get latest wireless code on top of 3.14. Would that work?

That sounds like a good thing to try..I'll see how that works.

Thanks,
Ben

>
> I'm planning to merge wireless-next to ath-next once John opens his
> trees again, which usually happens just after the merge window is
> closed.
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
