Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqJht-0005BA-Cl
 for ath10k@lists.infradead.org; Fri, 30 May 2014 10:06:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 2/2] ath10k: add testmode
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
 <20140528091956.8030.46201.stgit@potku.adurom.net>
 <CA+BoTQnLPua6Mds+ywPY==9QtnHbuucVamDYpWnfwKiC7J=9dQ@mail.gmail.com>
 <87ha48693v.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=rNe_xcmp6yGsE1iGoRnGq_ZksfHg6JW_-U1iK3NszjQ@mail.gmail.com>
Date: Fri, 30 May 2014 13:06:05 +0300
In-Reply-To: <CA+BoTQ=rNe_xcmp6yGsE1iGoRnGq_ZksfHg6JW_-U1iK3NszjQ@mail.gmail.com>
 (Michal Kazior's message of "Fri, 30 May 2014 08:17:14 +0200")
Message-ID: <87ioon4m42.fsf@kamboji.qca.qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 29 May 2014 14:51, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> BTW, please edit your quotes. It's pain to find your comments from a 700
>> line monster :)

This request still stands, even though 170 lines is much better than 700
lines ;)

>>>> +       if (ar->state != ATH10K_STATE_UTF)
>>>> +               /* utf firmware is not running */
>>>> +               return;
>>>> +
>>>> +       ath10k_htc_stop(&ar->htc);
>>>> +       ath10k_wmi_detach(ar);
>>>
>>> Why not ath10k_core_stop() ?
>>
>> Doh, I can't remember anymore. Maybe because of the htt calls? But I
>> agree, we should call core_stop() for symmetry. I'll investigate.
>
> Well, you already call ath10k_core_stop() in ath10k_tm_cmd_utf_stop().
> I think it should be safe (without getting deep into this) because you
> only skip htt_connect (basically a htc service connect command) and
> htt_setup (htt rx ring setup and htt rx version req commands), but
> maybe I'm missing something.

Ok, I'll check it carefully.

>>> I'm a little confused how this works. When UTF firmware is loaded does
>>> it generate regular WMI events? Or does it generate UTF_EVENTID only?
>>
>> Only UTF_EVENTID, at least for now.
>>
>>> Is there a particular reason for ath10k_tm_event_wmi() to be called
>>> before the switch() and have it no effect on processing of the event
>>> later whatsoever?
>>
>> I want to send the full WMI packet (instead of UTF_EVENTID) to user
>> space to make it easier to extend this later, in case there will be a
>> need for that in the future. For example, there can be new event ids and
>> whatnot. The less we need to change the user space interface the easier
>> it will be.
>
> I get it now. We could call skb_push() in UTF_EVENTID case to get back
> the wmi header. It's not very pretty but saves a lot of work (i.e. no
> need to depend on ar->state and no need to create a worker/skb queue)
> now.

That still limits us to only UTF_EVENTID, I would like to avoid that.
And I want to send WMI events to user space only when it's explicitly
enabled via testmode interface. But I have some ideas, let me send v2.

(But only once I have managed to make my huge email backlog smaller,
argh!)

> We could also depend on cmd_id to accept/reject skbuffs in
> ath10k_tm_event_wmi() since, at least for now, there aren't any
> special cases to handle. But then.. will we really ever need to have a
> passthrough (i.e. pass buffers to userspace but still process them in
> the driver afterwards)? Does that even make sense?

I think that's getting a bit too complicated. Basically we just need
ath10k act as a pipe for WMI packets.

> Either way I think this (why we want to send out a wmi packet
> including its header to userspace) should be documented.

Yes, I'll do that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
