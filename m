Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowBj-0005u9-Ud
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 21:47:13 +0000
Received: by mail-vk1-xa41.google.com with SMTP id b205so2243861vkb.8
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:47:11 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id a21sm3724362vsq.15.2020.06.26.14.47.08
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 14:47:08 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id l24so3486608uar.10
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
 <1593194502-13164-2-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593194502-13164-2-git-send-email-pillair@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jun 2020 14:46:57 -0700
Message-ID: <CAD=FV=X+v1TpZQPBZNV_Azt8J=0ZJw+XGJhLbnBxaZJGCCPwVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt: bindings: Add new regulator as optional property
 for WCN3990
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi,

On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add an additional regulator supply as an optional
> property for WCN3990.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Overall though: aren't you missing a whole lot of CCs?  Have you tried
using get_maintainer?


> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 65ee68e..b7188d3 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -65,7 +65,8 @@ Optional properties:
>                                      the length can vary between hw versions.
>  - <supply-name>-supply: handle to the regulator device tree node
>                            optional "supply-name" are "vdd-0.8-cx-mx",
> -                          "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
> +                          "vdd-1.8-xo", "vdd-1.3-rfa", "vdd-3.3-ch0"
> +                          and "vdd-3.3-ch1".

nit that could probably be fixed by maintainer when applying: missing
comma at the end of "vdd-3.3-ch0"

I will also note that this file is in dire need of being converted to
yaml.  Pretty soon I think people are going to start disallowing
changes to the bindings that haven't been converted to yaml so you
probably want to get a jump start on it so future patches aren't
stalled.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
