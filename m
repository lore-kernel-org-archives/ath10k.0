Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXqRT-0005CS-L3
 for ath10k@lists.infradead.org; Wed, 28 Oct 2020 18:45:05 +0000
Received: by mail-ua1-x942.google.com with SMTP id v27so1824695uau.3
 for <ath10k@lists.infradead.org>; Wed, 28 Oct 2020 11:45:02 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id s70sm25213vka.45.2020.10.28.11.45.00
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 11:45:00 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id s6so87308vss.13
 for <ath10k@lists.infradead.org>; Wed, 28 Oct 2020 11:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <1603904469-598-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1603904469-598-1-git-send-email-pillair@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2020 11:44:48 -0700
Message-ID: <CAD=FV=V0apTHaemMKvRx1HWLaO9ArC2t4ohfZ7-CthFz2NiA2A@mail.gmail.com>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi,

On Wed, Oct 28, 2020 at 10:01 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> The wmi service available event has been
> extended to contain extra 128 bit for new services
> to be indicated by firmware.
>
> Currently the presence of any optional TLVs in
> the wmi service available event leads to a parsing
> error with the below error message:
> ath10k_snoc 18800000.wifi: failed to parse svc_avail tlv: -71
>
> The wmi service available event parsing should
> not return error for the newly added optional TLV.
> Fix this parsing for service available event message.
>
> Tested-on: WCN3990 hw1.0 SNOC
>
> Fixes: cea19a6ce8bf ("ath10k: add WMI_SERVICE_AVAILABLE_EVENT support")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> Changes from v1:
> - Access service_map_ext only if this TLV was sent in service
>   available event.
> ---
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 4 +++-
>  drivers/net/wireless/ath/ath10k/wmi.c     | 5 +++--
>  drivers/net/wireless/ath/ath10k/wmi.h     | 1 +
>  3 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> index 932266d..7b58341 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> @@ -1401,13 +1401,15 @@ static int ath10k_wmi_tlv_svc_avail_parse(struct ath10k *ar, u16 tag, u16 len,
>
>         switch (tag) {
>         case WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT:
> +               arg->service_map_ext_valid = true;
>                 arg->service_map_ext_len = *(__le32 *)ptr;
>                 arg->service_map_ext = ptr + sizeof(__le32);
>                 return 0;
>         default:
>                 break;
>         }
> -       return -EPROTO;
> +
> +       return 0;

I notice your v2 now returns 0 for _all_ unknown tags.  v1 just had a
special case for "WMI_TLV_TAG_FIRST_ARRAY_ENUM".  I don't have enough
experience with this driver to know which is better, but this change
wasn't mentioned in the changes from v1.  I guess you had a change of
heart and decided this way was better?


>  }
>
>  static int ath10k_wmi_tlv_op_pull_svc_avail(struct ath10k *ar,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 1fa7107..2e4b561 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5751,8 +5751,9 @@ void ath10k_wmi_event_service_available(struct ath10k *ar, struct sk_buff *skb)
>                             ret);
>         }
>
> -       ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
> -                              __le32_to_cpu(arg.service_map_ext_len));
> +       if (arg.service_map_ext_valid)
> +               ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
> +                                      __le32_to_cpu(arg.service_map_ext_len));

Your new patch still requires the caller to init the
"service_map_ext_valid" to false before calling, but I guess there's
not a whole lot more we can do because we might be parsing more than
one tag.  It does seem nice that at least we now have a validity bit
instead of just relying on a non-zero length to be valid.

It might be nice to have a comment saying that it's up to us to init
"arg.service_map_ext_valid" to false before calling
ath10k_wmi_pull_svc_avail(), but I won't insist.  Maybe that's obvious
to everyone but me...


-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
