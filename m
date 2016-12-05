Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDv9I-0003iu-Qx
 for ath10k@lists.infradead.org; Mon, 05 Dec 2016 15:25:49 +0000
Message-ID: <58458058.5020008@candelatech.com>
Date: Mon, 05 Dec 2016 06:57:28 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] mac80211: do not iterate active interfaces when in
 re-configure
References: <1480645800-2148-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQkEaC-ZSbeK=JB=q+ucF1PWcEQXkJEp6JYv4pfOf35cHg@mail.gmail.com>
 (sfid-20161205_092619_855272_0854B225)
 <1480945950.31788.4.camel@sipsolutions.net>
In-Reply-To: <1480945950.31788.4.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 12/05/2016 05:52 AM, Johannes Berg wrote:
> On Mon, 2016-12-05 at 09:13 +0100, Michal Kazior wrote:
>> On 2 December 2016 at 03:29,  <greearb@candelatech.com> wrote:
>>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> This appears to fix a problem where ath10k firmware would crash,
>>> mac80211 would start re-adding interfaces to the driver, but the
>>> iterate-active-interfaces logic would then try to use the half-
>>> built
>>> interfaces.  With a bit of extra debug to catch the problem, the
>>> ath10k crash looks like this:
>>>
>>> ath10k_pci 0000:05:00.0: Initializing arvif: ffff8801ce97e320 on
>>> vif: ffff8801ce97e1d8
>>>
>>> [the print that happens after arvif->ar is assigned is not shown,
>>> so code did not make it that far before
>>>   the tx-beacon-nowait method was called]
>>>
>>> tx-beacon-nowait:  arvif: ffff8801ce97e320  ar:           (null)
>> [...]
>>>
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>> ---
>>>   net/mac80211/util.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/net/mac80211/util.c b/net/mac80211/util.c
>>> index 863f2c1..abe1f64 100644
>>> --- a/net/mac80211/util.c
>>> +++ b/net/mac80211/util.c
>>> @@ -705,7 +705,7 @@ static void __iterate_interfaces(struct
>>> ieee80211_local *local,
>>>                          break;
>>>                  }
>>>                  if (!(iter_flags & IEEE80211_IFACE_ITER_RESUME_ALL)
>>> &&
>>> -                   active_only && !(sdata->flags &
>>> IEEE80211_SDATA_IN_DRIVER))
>>> +                   (active_only && (local->in_reconfig || !(sdata-
>>>> flags & IEEE80211_SDATA_IN_DRIVER))))
>>>                          continue;
>>
>> Doesn't this effectivelly prevent you from iterating over interfaces
>> completely during reconfig? As you bring up interfaces you might
>> need/want to iterate over others to re-adjust your own state.
>
> Agree, that doesn't really make sense.
>
>> I'd argue there should be another flag, IEEE80211_SDATA_RESUMING,
>> used with sdata->flags for resuming so that once it is re-added to
>> the driver it can be cleared (and therefore properly iterated over).
>
> That would make some sense, or perhaps the sdata_in_driver should be
> cleared (and remembered elsewhere) at some point during the restart.

I think clearing sdata-in-driver would fix the ath10k problem, at least,
but I was afraid it would break something else in mac80211 or maybe in
other thick firmware drivers.

One way or another, we cannot be iterating over interfaces while
the interfaces are at the same time being (re)added.

Maybe mac80211 should explicitly remove all interfaces from the driver
during crash recovery?  And the behaviour needs to be clearly documented somewhere
easy to find so that we can think about and program to the correct API
behaviour.

Thanks,
Bne


>
> johannes
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
