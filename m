Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAyV6-00046q-Tn
 for ath10k@lists.infradead.org; Wed, 05 Feb 2014 09:10:34 +0000
Received: by mail-la0-f44.google.com with SMTP id hr13so89394lab.3
 for <ath10k@lists.infradead.org>; Wed, 05 Feb 2014 01:10:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <874n4enkbs.fsf@kamboji.qca.qualcomm.com>
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-4-git-send-email-greearb@candelatech.com>
 <87lhxqoghd.fsf@kamboji.qca.qualcomm.com>
 <CADnKcViuR401=cmsMSAVGL04pQ5U5+Kwn5-iUjQ5HfEbbhWcxA@mail.gmail.com>
 <874n4enkbs.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 5 Feb 2014 10:10:05 +0100
Message-ID: <CADnKcVi5YEgVMtpmMNWOwwqv18ayjp5oiLfOSZxQ-1QJPHzhhA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ath10k: Better tx/rx debugging.
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, greearb@candelatech.com, ath10k@lists.infradead.org

On 5 February 2014 07:29, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Marek Puzyniak <marek.puzyniak@tieto.com> writes:
>
>> On 4 February 2014 19:55, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>> greearb@candelatech.com writes:
>>>
>>>> From: Ben Greear <greearb@candelatech.com>
>>>>
>>>> Make it easier to grep for htt rx errors.
>>>>
>>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>>
>>> [...]
>>>
>>>> @@ -961,6 +962,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>>>>                       }
>>>>
>>>>                       if (test_bit(ATH10K_CAC_RUNNING, &htt->ar->dev_flags)) {
>>>> +                             ath10k_warn("htt rx: CAC running\n");
>>>>                               ath10k_htt_rx_free_msdu_chain(msdu_head);
>>>>                               continue;
>>>>                       }
>>>
>>> I'm a bit worried about this one. Do we guarantee that we will never
>>> receive frames while CAC is running? In other words, is this a normal
>>> event or really an error in the driver which requires a warning
>>> message?
>>
>> Actually this happens quite often during CAC. I remember we had some
>> print there and we got it frequently (let say 10/s).
>
> Yeah, this was exactly what I was wondering.
>
>> So probably it would be better to have choice to enable this log print
>> when someone need this information otherwise by default it should be
>> disabled.
>
> Maybe a debug message is better?
Yes, for example with flag ATH10K_DBG_HTT.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
