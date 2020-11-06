Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavzO-0003Mq-Lf
 for ath10k@lists.infradead.org; Fri, 06 Nov 2020 07:16:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix the parsing error in service available event
References: <1603811067-23058-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=XRyeXcE93nZgOy+x5eWcHcKKwbJccuWFkx+cA8tEXwZQ@mail.gmail.com>
 <003801d6ad41$a1bb8970$e5329c50$@codeaurora.org>
Date: Fri, 06 Nov 2020 09:16:45 +0200
In-Reply-To: <003801d6ad41$a1bb8970$e5329c50$@codeaurora.org> (Rakesh Pillai's
 message of "Wed, 28 Oct 2020 21:17:19 +0530")
Message-ID: <878sbflztu.fsf@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: 'Abhishek Kumar' <kuabhs@chromium.org>, 'Brian Norris' <briannorris@chromium.org>, 'linux-wireless' <linux-wireless@vger.kernel.org>, 'Doug Anderson' <dianders@chromium.org>, 'ath10k' <ath10k@lists.infradead.org>, 'LKML' <linux-kernel@vger.kernel.org>

"Rakesh Pillai" <pillair@codeaurora.org> writes:

>> > diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> > index 932266d..3b49e29 100644
>> > --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> > +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> > @@ -1404,9 +1404,12 @@ static int ath10k_wmi_tlv_svc_avail_parse(struct
>> ath10k *ar, u16 tag, u16 len,
>> >                 arg->service_map_ext_len = *(__le32 *)ptr;
>> >                 arg->service_map_ext = ptr + sizeof(__le32);
>> >                 return 0;
>> > +       case WMI_TLV_TAG_FIRST_ARRAY_ENUM:
>> > +               return 0;
>> 
>> This is at least slightly worrying to me.  If I were calling this
>> function, I'd expect that if I didn't get back an error that at least
>> "arg->service_map_ext_len" was filled in.  Seems like you should do:
>> 
>> case WMI_TLV_TAG_FIRST_ARRAY_ENUM:
>>   arg->service_map_ext_len = 0;
>>   arg->service_map_ext = NULL;
>>   return 0;
>> 
>> ...and maybe add a comment about why you're doing that?
>> 
>> At the moment things are working OK because
>> ath10k_wmi_event_service_available() happens to init the structure to
>> 0 before calling with:
>> 
>>   struct wmi_svc_avail_ev_arg arg = {};
>> 
>> ....but it doesn't seem like a great idea to rely on that.
>> 
>> That all being said, I'm just a drive-by reviewer and if everyone else
>> likes it the way it is, feel free to ignore my comments.
>
>
> The TLV TAG " WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT" is the first
> and a mandatory TLV in the service available event. The subsequent
> TLVs are optional ones and may or may not be present (based on FW
> versions).

From ath10k point of view never trust what the firmware sends you. Even
if WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT is a mandatory TLV it
might be missing for whatever reasons. The same is with buffer lengths
etc and always confirm what you are receiving from the firmware.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
