Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSthw-0001ai-EB
 for ath10k@lists.infradead.org; Wed, 26 Mar 2014 19:41:53 +0000
Received: by mail-la0-f44.google.com with SMTP id hr13so1886230lab.17
 for <ath10k@lists.infradead.org>; Wed, 26 Mar 2014 12:41:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5332E6C6.7040700@candelatech.com>
References: <1395428150-31996-1-git-send-email-greearb@candelatech.com>
 <871txr7svw.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmquq7dXTV0sSV1mJ0+8-9OuiCnqz2iN8VNO4J3iaeexQ@mail.gmail.com>
 <53306239.2020006@candelatech.com>
 <CA+BoTQkCmJbvQjZ3vTV7AP1EwdcH_pAd0pex_v9bZDzwZdufbw@mail.gmail.com>
 <53319D65.4090907@candelatech.com>
 <CA+BoTQnMmwsz0438yVrP_bQ-AKZaoktW7NrGAODVEx4w21-dEA@mail.gmail.com>
 <5332E6C6.7040700@candelatech.com>
Date: Wed, 26 Mar 2014 20:41:26 +0100
Message-ID: <CALhHN=o+G2vmou_Kofz--+fE-cvQcBXg9MZv4ERd9ik8EZLUiw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: Add debugging for tx-credits usage.
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 26 March 2014 15:40, Ben Greear <greearb@candelatech.com> wrote:
> On 03/26/2014 12:18 AM, Michal Kazior wrote:
>>
>> On 25 March 2014 16:14, Ben Greear <greearb@candelatech.com> wrote:
>>>
>>> On 03/25/2014 12:27 AM, Michal Kazior wrote:
>>>>
>>>>
>>>> On 24 March 2014 17:50, Ben Greear <greearb@candelatech.com> wrote:
>>>>>
>>>>>
>>>>> On 03/24/2014 04:21 AM, Michal Kazior wrote:
>>>>>>
>>>>>>
>>>>>> On 24 March 2014 12:12, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>>>>> -     status = ath10k_htc_send(htc, ATH10K_HTC_EP_0, skb);
>>>>>>>> +     status = ath10k_htc_send(htc, ATH10K_HTC_EP_0, skb, __LINE__);
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Using line numbers in debug messages is very cumbersome. Some people
>>>>>>> cherry pick patches, have their own changes and whatnot which will
>>>>>>> make
>>>>>>> it more difficult to read the debug logs. Isn't there any better way
>>>>>>> to
>>>>>>> do this?
>>>>>>
>>>>>>
>>>>>>
>>>>>> I would prefer to explicitly wait for tx credit replenishment in
>>>>>> ath10k_wmi_cmd_send() after a command is sent instead of all these
>>>>>> prints. This way you can get a full call trace if it times out.
>>>>>
>>>>>
>>>>>
>>>>> Would that be a performance problem (by effectively allowing only a
>>>>> single
>>>>> item to be sent to the firmware at any given time?)
>>>>
>>>>
>>>>
>>>> The only thing that may suffer here is wmi mgmt tx but I wouldn't
>>>> consider that performance critical.
>>>
>>>
>>>
>>> In that case, why use credits at all?
>>
>>
>> Excellent question.
>>
>> Firmware provides 2 HTC tx credits for WMI. I guess this is on
>> purpose. I imagine WMI mgmt tx can hang (i.e. not replenish tx
>> credits). In that case the remaining tx credit could be used to try
>> recovering, e.g. down/stop vdev (I think it should drop all pending tx
>> and thus free the stuck HTC tx credit).
>>
>> It might be a good idea to keep this recovery strategy in mind when
>> implementing the "wait for tx replenishment" wmi tx blocking.
>
>
> Seems to me we should just fix the firmware to respond quickly..and if we
> know exactly which
> command is not being answered (quickly) in the firmware, it might be easier
> to debug
> it.
>
> That said, while debugging I think I have seen cases where one message would
> be consumed for a long time, and then suddenly it frees up again.
>
> So, I'm not sure what to do.  Maybe could improve firmware to return an id
> so we know exactly which of the messages was processed, and then the driver
> could do the work of figuring out what commands are outstanding by just
> keeping
> a copy in RAM....
>

I suspect mgmt_tx frames (for AP FW we send them using WMI) without
ACK couse this problem (disassoc + deauth probably). Question if we
saw this problem with 636 firmware? In 636 we send mgmt frames using
HTT, so we don't consume WMI credits.

I will try to reproduce this tommorow.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
