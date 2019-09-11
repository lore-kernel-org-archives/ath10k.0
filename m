Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i87f5-0005Sc-DP
 for ath10k@lists.infradead.org; Wed, 11 Sep 2019 18:48:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: WARNING at net/mac80211/sta_info.c:1057
 (__sta_info_destroy_part2())
References: <CAHk-=wgBuu8PiYpD7uWgxTSY8aUOJj6NJ=ivNQPYjAKO=cRinA@mail.gmail.com>
 <feecebfcceba521703f13c8ee7f5bb9016924cb6.camel@sipsolutions.net>
 <87ef0mlmqg.fsf@tynnyri.adurom.net>
 <383b145b608e0fe3a35ffb0ceb99fdf938d4e2bb.camel@sipsolutions.net>
Date: Wed, 11 Sep 2019 21:48:09 +0300
In-Reply-To: <383b145b608e0fe3a35ffb0ceb99fdf938d4e2bb.camel@sipsolutions.net>
 (Johannes Berg's message of "Wed, 11 Sep 2019 20:23:33 +0200")
Message-ID: <87zhjak6ty.fsf@kamboji.qca.qualcomm.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>

Johannes Berg <johannes@sipsolutions.net> writes:

> On Wed, 2019-09-11 at 21:19 +0300, Kalle Valo wrote:
>> > Looks like indeed the driver gives the device at least *3 seconds* for
>> > every command, see ath10k_wmi_cmd_send(), so most likely this would
>> > eventually have finished, but who knows how many firmware commands it
>> > would still have attempted to send...
>> 
>> 3 seconds is a bit short but in normal cases it should be enough. Of
>> course we could increase the delay but I'm skeptic it would help here.
>
> I was thinking 3 seconds is way too long :-)

Heh :)

>> > Perhaps the driver should mark the device as dead and fail quickly once
>> > it timed out once, or so, but I'll let Kalle comment on that.
>> 
>> Actually we do try to restart the device when a timeout happens in
>> ath10k_wmi_cmd_send():
>> 
>>         if (ret == -EAGAIN) {
>>                 ath10k_warn(ar, "wmi command %d timeout, restarting hardware\n",
>>                             cmd_id);
>>                 queue_work(ar->workqueue, &ar->restart_work);
>>         }
>
> Yeah, and this is the problem, in a sense, I'd think. It seems to me
> that at this point the code needs to tag the device as "dead" and
> immediately return from any further commands submitted to it with an
> error (e.g. -EIO).

Yeah, ath10k_core_restart() is supposed change to state
ATH10K_STATE_RESTARTING but very few mac80211 ops in ath10k_ops are
checking for it, and to me it looks like quite late even. I think a
proper fix for ops which can sleep is to check ar->state is
ATH10K_STATE_ON and for ops which cannot sleep check
ATH10K_FLAG_CRASH_FLUSH.

But of course this just fixes the symptoms, the root cause for timeouts
needs to be found as well.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
