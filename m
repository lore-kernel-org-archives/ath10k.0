Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i87DA-0001at-Ee
 for ath10k@lists.infradead.org; Wed, 11 Sep 2019 18:19:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: WARNING at net/mac80211/sta_info.c:1057
 (__sta_info_destroy_part2())
References: <CAHk-=wgBuu8PiYpD7uWgxTSY8aUOJj6NJ=ivNQPYjAKO=cRinA@mail.gmail.com>
 <feecebfcceba521703f13c8ee7f5bb9016924cb6.camel@sipsolutions.net>
Date: Wed, 11 Sep 2019 21:19:19 +0300
In-Reply-To: <feecebfcceba521703f13c8ee7f5bb9016924cb6.camel@sipsolutions.net>
 (Johannes Berg's message of "Wed, 11 Sep 2019 12:26:32 +0200")
Message-ID: <87ef0mlmqg.fsf@tynnyri.adurom.net>
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
Cc: Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

Johannes Berg <johannes@sipsolutions.net> writes:

>>    ath10k_pci 0000:02:00.0: wmi command 16387 timeout, restarting hardware
>>    ath10k_pci 0000:02:00.0: failed to set 5g txpower 23: -11
>>    ath10k_pci 0000:02:00.0: failed to setup tx power 23: -11
>>    ath10k_pci 0000:02:00.0: failed to recalc tx power: -11
>>    ath10k_pci 0000:02:00.0: failed to set inactivity time for vdev 0: -108
>>    ath10k_pci 0000:02:00.0: failed to setup powersave: -108
>> 
>> That certainly looks like something did try to set a power limit, but
>> eventually failed.
>
> Yeah, that does seem a bit fishy. Kalle would have to comment for
> ath10k.
>
>> Immediately after that:
>> 
>>    wlp2s0: deauthenticating from 54:ec:2f:05:70:2c by local choice
>> (Reason: 3=DEAUTH_LEAVING)
>
> I don't _think_ any of the above would be a reason to disconnect, but it
> clearly looks like the device got stuck at this point, since everything
> just fails afterwards.

Yeah, to me it looks anything ath10k tries to do with the devie fails,
even resetting the device.

> Looks like indeed the driver gives the device at least *3 seconds* for
> every command, see ath10k_wmi_cmd_send(), so most likely this would
> eventually have finished, but who knows how many firmware commands it
> would still have attempted to send...

3 seconds is a bit short but in normal cases it should be enough. Of
course we could increase the delay but I'm skeptic it would help here.

> Perhaps the driver should mark the device as dead and fail quickly once
> it timed out once, or so, but I'll let Kalle comment on that.

Actually we do try to restart the device when a timeout happens in
ath10k_wmi_cmd_send():

        if (ret == -EAGAIN) {
                ath10k_warn(ar, "wmi command %d timeout, restarting hardware\n",
                            cmd_id);
                queue_work(ar->workqueue, &ar->restart_work);
        }
                        

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
