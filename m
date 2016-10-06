Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bsFII-0006z4-9L
 for ath10k@lists.infradead.org; Thu, 06 Oct 2016 20:29:31 +0000
Received: by mail-oi0-x22d.google.com with SMTP id d132so35077363oib.2
 for <ath10k@lists.infradead.org>; Thu, 06 Oct 2016 13:29:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r37ukjr5.fsf@kamboji.qca.qualcomm.com>
References: <1473801118-103112-1-git-send-email-mfaltesek@google.com>
 <87fuodswlu.fsf@kamboji.qca.qualcomm.com>
 <CAOiWkA_fuhzPeF7qPP0hLN3KTZUOi6_te5Zc3+vxKQ9GRj0VBw@mail.gmail.com>
 <87r37ukjr5.fsf@kamboji.qca.qualcomm.com>
From: Marty Faltesek <mfaltesek@google.com>
Date: Thu, 6 Oct 2016 16:29:08 -0400
Message-ID: <CAOiWkA92pCLz3jbbhcs0ba_mbwfUscrdGVN_D2W03PANBp_DmQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: cache calibration data when the core is stopped.
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

OK the v2 patch is not based on 9340953. If you  queue this in 4.10 as
planned then just let me know and
I'll rev v3 based on top of 9340953.

On Thu, Oct 6, 2016 at 3:40 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Marty Faltesek <mfaltesek@google.com> writes:
>
>> On Mon, Oct 3, 2016 at 3:46 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>>> Marty Faltesek <mfaltesek@google.com> writes:
>>>
>>>> Caching calibration data allows it to be accessed when the
>>>> device is not active.
>>>>
>>>> Signed-off-by: Marty Faltesek <mfaltesek@google.com>
>>>
>>> No comma in the title, please.
>>>
>>> What tree did you use as the baseline? This doesn't seem to apply to
>>> ath.git:
>>
>> We use backports 20160122 which has not been updated since earlier this year.
>> I can forward port it to your tree, and make sure
>> it builds but won't be able to test it. Will that be OK?
>
> Sure, I can test it.
>
>>> Also please note that this patch (which I'm queuing to 4.9) touches the
>>> same area:
>>>
>>> ath10k: fix debug cal data file
>>>
>>> https://patchwork.kernel.org/patch/9340953/
>>
>> I've modified this too, and this won't be necessary, so can you drop
>> it? If not, let me know and I'll pull it in and make sure I'm based
>> off it too.
>
> Actually I was first planning to push 9340953 to 4.9 and take your patch
> to 4.10. But your patch is a cleaner approach to this and maybe I should
> push that to 4.9 instead? Need to think a bit more.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
