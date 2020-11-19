Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfXhJ-0005iZ-Rf
 for ath10k@lists.infradead.org; Thu, 19 Nov 2020 00:21:14 +0000
Received: by mail-il1-x142.google.com with SMTP id w8so3686750ilg.12
 for <ath10k@lists.infradead.org>; Wed, 18 Nov 2020 16:21:11 -0800 (PST)
MIME-Version: 1.0
References: <1605501291-23040-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1605501291-23040-1-git-send-email-pillair@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Wed, 18 Nov 2020 16:20:58 -0800
Message-ID: <CACTWRwvG=BqKAeJm18jAtMuah-=NyRPzAJMv-930eQtp+PBArw@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: Fix the parsing error in service available
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
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Douglas Anderson <dianders@chromium.org>

Hi,

The patch LGTM there is small nit, though.
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5751,8 +5751,13 @@ void ath10k_wmi_event_service_available(struct ath10k *ar, struct sk_buff *skb)
>                             ret);
>         }
>
> -       ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
> -                              __le32_to_cpu(arg.service_map_ext_len));
> +       /*
> +        * Initialization of "arg.service_map_ext_valid" to ZERO is necessary
> +        * for the below logic to work.
> +        */

Nit: The comment will throw a checkpatch warning.  "networking block
comments don't use an empty /* line, use /* Comment..."

-Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
