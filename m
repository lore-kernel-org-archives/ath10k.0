Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaw7z-000492-5k
 for ath10k@lists.infradead.org; Fri, 06 Nov 2020 07:25:44 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Fix the parsing error in service available
 event
References: <1603904469-598-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V0apTHaemMKvRx1HWLaO9ArC2t4ohfZ7-CthFz2NiA2A@mail.gmail.com>
Date: Fri, 06 Nov 2020 09:25:37 +0200
In-Reply-To: <CAD=FV=V0apTHaemMKvRx1HWLaO9ArC2t4ohfZ7-CthFz2NiA2A@mail.gmail.com>
 (Doug Anderson's message of "Wed, 28 Oct 2020 11:44:48 -0700")
Message-ID: <87wnyzkkum.fsf@codeaurora.org>
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
To: Doug Anderson <dianders@chromium.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>

Doug Anderson <dianders@chromium.org> writes:

>>  static int ath10k_wmi_tlv_op_pull_svc_avail(struct ath10k *ar,
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
>> index 1fa7107..2e4b561 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -5751,8 +5751,9 @@ void ath10k_wmi_event_service_available(struct ath10k *ar, struct sk_buff *skb)
>>                             ret);
>>         }
>>
>> -       ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
>> -                              __le32_to_cpu(arg.service_map_ext_len));
>> +       if (arg.service_map_ext_valid)
>> +               ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
>> +                                      __le32_to_cpu(arg.service_map_ext_len));
>
> Your new patch still requires the caller to init the
> "service_map_ext_valid" to false before calling, but I guess there's
> not a whole lot more we can do because we might be parsing more than
> one tag.  It does seem nice that at least we now have a validity bit
> instead of just relying on a non-zero length to be valid.
>
> It might be nice to have a comment saying that it's up to us to init
> "arg.service_map_ext_valid" to false before calling
> ath10k_wmi_pull_svc_avail(), but I won't insist.  Maybe that's obvious
> to everyone but me...

It's not obvious to me either. Please add that comment.

BTW, for some reason Doug's response didn't get to patchwork:

https://patchwork.kernel.org/project/linux-wireless/patch/1603904469-598-1-git-send-email-pillair@codeaurora.org/

Though I do see it in linux-wireless, so most likely this was a
temporary glitch in patchwork. But it's just worrisome as nowadays I
only check the comments in patchwork before I apply the patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
