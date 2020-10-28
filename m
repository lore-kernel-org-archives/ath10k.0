Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXoWN-0000Nc-Ov
 for ath10k@lists.infradead.org; Wed, 28 Oct 2020 16:42:03 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1603811067-23058-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=XRyeXcE93nZgOy+x5eWcHcKKwbJccuWFkx+cA8tEXwZQ@mail.gmail.com>
 <003801d6ad41$a1bb8970$e5329c50$@codeaurora.org>
 <CAD=FV=U_Dwb=YRMKcKME9vdxbSgSn-08dznoVXY6VzCaHL8OnQ@mail.gmail.com>
In-Reply-To: <CAD=FV=U_Dwb=YRMKcKME9vdxbSgSn-08dznoVXY6VzCaHL8OnQ@mail.gmail.com>
Subject: RE: [PATCH] ath10k: Fix the parsing error in service available event
Date: Wed, 28 Oct 2020 22:11:43 +0530
Message-ID: <003a01d6ad49$3a93f040$afbbd0c0$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Doug Anderson' <dianders@chromium.org>
Cc: 'Abhishek Kumar' <kuabhs@chromium.org>, 'Brian Norris' <briannorris@chromium.org>, 'linux-wireless' <linux-wireless@vger.kernel.org>, 'LKML' <linux-kernel@vger.kernel.org>, 'ath10k' <ath10k@lists.infradead.org>



> -----Original Message-----
> From: Doug Anderson <dianders@chromium.org>
> Sent: Wednesday, October 28, 2020 9:33 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: ath10k <ath10k@lists.infradead.org>; linux-wireless <linux-
> wireless@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>; Abhishek
> Kumar <kuabhs@chromium.org>; Brian Norris <briannorris@chromium.org>
> Subject: Re: [PATCH] ath10k: Fix the parsing error in service available event
> 
> Hi,
> 
> On Wed, Oct 28, 2020 at 8:47 AM Rakesh Pillai <pillair@codeaurora.org>
> wrote:
> >
> > > -----Original Message-----
> > > From: Doug Anderson <dianders@chromium.org>
> > > Sent: Wednesday, October 28, 2020 8:07 PM
> > > To: Rakesh Pillai <pillair@codeaurora.org>
> > > Cc: ath10k <ath10k@lists.infradead.org>; linux-wireless <linux-
> > > wireless@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>;
> Abhishek
> > > Kumar <kuabhs@chromium.org>; Brian Norris
> <briannorris@chromium.org>
> > > Subject: Re: [PATCH] ath10k: Fix the parsing error in service available
> event
> > >
> > > Hi,
> > >
> > > On Tue, Oct 27, 2020 at 8:20 AM Rakesh Pillai <pillair@codeaurora.org>
> > > wrote:
> > > >
> > > > The wmi service available event has been
> > > > extended to contain extra 128 bit for new services
> > > > to be indicated by firmware.
> > > >
> > > > Currently the presence of any optional TLVs in
> > > > the wmi service available event leads to a parsing
> > > > error with the below error message:
> > > > ath10k_snoc 18800000.wifi: failed to parse svc_avail tlv: -71
> > > >
> > > > The wmi service available event parsing should
> > > > not return error for the newly added optional TLV.
> > > > Fix this parsing for service available event message.
> > > >
> > > > Tested-on: WCN3990 hw1.0 SNOC
> > > >
> > > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > > > ---
> > > >  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> > > b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> > > > index 932266d..3b49e29 100644
> > > > --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> > > > +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> > > > @@ -1404,9 +1404,12 @@ static int
> ath10k_wmi_tlv_svc_avail_parse(struct
> > > ath10k *ar, u16 tag, u16 len,
> > > >                 arg->service_map_ext_len = *(__le32 *)ptr;
> > > >                 arg->service_map_ext = ptr + sizeof(__le32);
> > > >                 return 0;
> > > > +       case WMI_TLV_TAG_FIRST_ARRAY_ENUM:
> > > > +               return 0;
> > >
> > > This is at least slightly worrying to me.  If I were calling this
> > > function, I'd expect that if I didn't get back an error that at least
> > > "arg->service_map_ext_len" was filled in.  Seems like you should do:
> > >
> > > case WMI_TLV_TAG_FIRST_ARRAY_ENUM:
> > >   arg->service_map_ext_len = 0;
> > >   arg->service_map_ext = NULL;
> > >   return 0;
> > >
> > > ...and maybe add a comment about why you're doing that?
> > >
> > > At the moment things are working OK because
> > > ath10k_wmi_event_service_available() happens to init the structure to
> > > 0 before calling with:
> > >
> > >   struct wmi_svc_avail_ev_arg arg = {};
> > >
> > > ....but it doesn't seem like a great idea to rely on that.
> > >
> > > That all being said, I'm just a drive-by reviewer and if everyone else
> > > likes it the way it is, feel free to ignore my comments.
> >
> >
> > Hi Doug,
> >
> > The TLV TAG " WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT" is
> the first and a mandatory TLV in the service available event.
> > The subsequent TLVs are optional ones and may or may not be present
> (based on FW versions).
> > This patch just fixes the bug, where the presence of any other TLVs are
> leading to a failure in parsing the service available msg.
> > If, in future, we plan to use any other services from firmware, which is
> exposed in the extended TLVs, we will need to add a new variable (and not
> service_map_ext) to set the service.
> 
> I'm not sure I totally understood your response, but look at it from
> the perspective of the function ath10k_wmi_event_service_available().
> 
> That function calls:
> 
>   ret = ath10k_wmi_pull_svc_avail(ar, skb, &arg);
> 
> ...if it gets back a non-zero error code, it assumes that the
> "arg.service_map_ext" and "arg.service_map_ext_len" values are now
> valid and it can use them.
> 
> Before your patch, ath10k_wmi_pull_svc_avail() was returning an error
> code.  That let ath10k_wmi_event_service_available() know that it
> shouldn't look at "arg.service_map_ext" and "arg.service_map_ext_len".
> After your patch, you're not returning an error code but those fields
> aren't being filled in.
> 
> Said another way, if you remove the initialization of "arg" in
> ath10k_wmi_event_service_available() then everything is broken.  While
> things work because you _do_ have an initialization of "arg" in
> ath10k_wmi_event_service_available(), it feels fragile to me to rely
> on that.

Hi Doug,
Got it. I will send a v2 which will address this concern.

> 
> 
> -Doug


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
