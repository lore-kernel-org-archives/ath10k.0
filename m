Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdhpM-0004uu-Ak
 for ath10k@lists.infradead.org; Fri, 13 Nov 2020 22:46:18 +0000
Received: by mail-io1-xd44.google.com with SMTP id p7so11412833ioo.6
 for <ath10k@lists.infradead.org>; Fri, 13 Nov 2020 14:45:53 -0800 (PST)
MIME-Version: 1.0
References: <1603904469-598-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V0apTHaemMKvRx1HWLaO9ArC2t4ohfZ7-CthFz2NiA2A@mail.gmail.com>
 <87wnyzkkum.fsf@codeaurora.org>
In-Reply-To: <87wnyzkkum.fsf@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Fri, 13 Nov 2020 14:45:41 -0800
Message-ID: <CACTWRwu4XeNhUTsKPa2S1hBJ2tawo4Jx5rVFuht4=Gi1WgOvsw@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: Fix the parsing error in service available
 event
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Rakesh Pillai <pillair@codeaurora.org>

Hi All,

The V2 patch now has good comments and probably spinning off a new V3
might be a good idea. Here are a few comments to the discussion.

In response to Doug's comment
> case WMI_TLV_TAG_FIRST_ARRAY_ENUM:
>   arg->service_map_ext_len = 0;
>   arg->service_map_ext = NULL;
>   return 0;
Since the TLV messages are parsed iteratively for each tag, if
WMI_TLV_TAG_FIRST_ARRAY_ENUM this comes as the last TLV tag then this
might cause the map_len to be zero even if there is a valid tag like
WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT , so having a "valid" flag
seems to be a better and scalable approach.

> > The TLV TAG " WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT" is the first
> > and a mandatory TLV in the service available event. The subsequent
> > TLVs are optional ones and may or may not be present (based on FW
> > versions).
>
> From ath10k point of view never trust what the firmware sends you. Even
> if WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT is a mandatory TLV it
> might be missing for whatever reasons. The same is with buffer lengths
> etc and always confirm what you are receiving from the firmware.
>
Looks like the length for each tag is already being validated in
ath10k_wmi_tlv_iter() and would return error if the length does not
match against the wmi policy., so I think the tlv message validation
is already being done. Kalle, Is the expectation here is to do
anything additional ?

-Abhishek

On Thu, Nov 5, 2020 at 11:25 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Doug Anderson <dianders@chromium.org> writes:
>
> >>  static int ath10k_wmi_tlv_op_pull_svc_avail(struct ath10k *ar,
> >> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> >> index 1fa7107..2e4b561 100644
> >> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> >> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> >> @@ -5751,8 +5751,9 @@ void ath10k_wmi_event_service_available(struct ath10k *ar, struct sk_buff *skb)
> >>                             ret);
> >>         }
> >>
> >> -       ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
> >> -                              __le32_to_cpu(arg.service_map_ext_len));
> >> +       if (arg.service_map_ext_valid)
> >> +               ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
> >> +                                      __le32_to_cpu(arg.service_map_ext_len));
> >
> > Your new patch still requires the caller to init the
> > "service_map_ext_valid" to false before calling, but I guess there's
> > not a whole lot more we can do because we might be parsing more than
> > one tag.  It does seem nice that at least we now have a validity bit
> > instead of just relying on a non-zero length to be valid.
> >
> > It might be nice to have a comment saying that it's up to us to init
> > "arg.service_map_ext_valid" to false before calling
> > ath10k_wmi_pull_svc_avail(), but I won't insist.  Maybe that's obvious
> > to everyone but me...
>
> It's not obvious to me either. Please add that comment.
>
> BTW, for some reason Doug's response didn't get to patchwork:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/1603904469-598-1-git-send-email-pillair@codeaurora.org/
>
> Though I do see it in linux-wireless, so most likely this was a
> temporary glitch in patchwork. But it's just worrisome as nowadays I
> only check the comments in patchwork before I apply the patch.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
