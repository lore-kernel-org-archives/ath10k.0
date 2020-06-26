Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowGR-0006aW-S2
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 21:52:04 +0000
Received: by mail-vs1-xe42.google.com with SMTP id f24so6278193vsg.1
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:52:03 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id s19sm4205073vke.14.2020.06.26.14.52.00
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 14:52:01 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id b205so2245930vkb.8
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
 <1593194502-13164-3-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593194502-13164-3-git-send-email-pillair@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jun 2020 14:51:49 -0700
Message-ID: <CAD=FV=V1C2Lu31n8xQ8HPf21fNo_Da2SLtZAeStFBEou9+geEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: Add support for chain1 regulator supply voting
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
To: Rakesh Pillai <pillair@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi,

On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add support to vote for chain-1 voltage regulator
> in WCN3990.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 645ed5f..407a074 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -45,6 +45,7 @@ static const char * const ath10k_regulators[] = {
>         "vdd-1.8-xo",
>         "vdd-1.3-rfa",
>         "vdd-3.3-ch0",
> +       "vdd-3.3-ch1",

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...with the slight nit that ${SUBJECT} and description should probably
call it "chan1" and not "chain1".  Presumably the maintainer can fix
when applying.

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
