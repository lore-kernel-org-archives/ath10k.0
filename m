Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCYE0-00029B-HZ
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 22:54:06 +0000
Received: by mail-vs1-xe41.google.com with SMTP id q15so5292696vso.1
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 15:53:53 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id 126-v6sm3420000vkl.3.2018.10.16.15.53.51
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 15:53:51 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id y5so4034184uap.4
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 15:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
In-Reply-To: <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Oct 2018 15:53:39 -0700
Message-ID: <CAD=FV=WP-Xx+xeCGTxSFcSrmhAv-6F3zm-0hnLxhHi84u-fUkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt: bindings: add missing dt properties for
 WCN3990 wifi node
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
To: Govind Singh <govinds@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>

Hi,

On Wed, Oct 10, 2018 at 4:53 AM Govind Singh <govinds@codeaurora.org> wrote:
>
> Add missing optional properties in WCN3990 wifi node.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 28 ++++++++++++++++------
>  1 file changed, 21 insertions(+), 7 deletions(-)

Point of order: please CC LKML on _all_ your patches.  Yes, it's a
firehose.  CCing LKML allows your patches to be found on
lore.kernel.org's patchwork and also allows people to find your
patches via <https://lkml.kernel.org/r/MSG_ID> links.


> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 7fd4e8c..f831bb1 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -37,12 +37,20 @@ Optional properties:
>  - clocks: List of clock specifiers, must contain an entry for each required
>            entry in clock-names.
>  - clock-names: Should contain the clock names "wifi_wcss_cmd", "wifi_wcss_ref",
> -               "wifi_wcss_rtc".
> -- interrupts: List of interrupt lines. Must contain an entry
> -             for each entry in the interrupt-names property.
> +              "wifi_wcss_rtc" for "qcom,ipq4019-wifi" compatible target and
> +              "cxo_ref_clk_pin", "smmu_aggre2_noc_clk" for "qcom,wcn3990-wifi"
> +              compatible target.

I always get confused with these big bindings patches that hide
everything under a big "Optional properties" section to avoid
specifying which properties are actually optional and which ones are
required.

After your patch and thinking about "qcom,wcn3990-wifi" in particular,
it's unclear to me which of the following is true (or maybe something
totally different I didn't think of)

A) On wcn3990-wifi these clocks should be a required property but it's
only listed under "Optional" because it's not used for some of the
different WiFi drivers using this same bindings.

B) On wcn3990-wifi these clocks should either both be there or neither.

C) On wcm3990-wifi you can specify zero, either, or both of these
clocks.  AKA they are independently optional.

It might make sense to reorganize this bindings to make this clearer?
...not just for clock but for interrupts / regulators as well.  Maybe
you need to break this down into sections per class of compatible
string, or add a list per compatible string down below?

Also: even stranger is that even though you list two clocks here the
current driver I see in linuxnext only has "cxo_ref_clk_pin".


> +- interrupts: reference to the list of 17 interrupt no's for "qcom,ipq4019-wifi"
> +             compatible target.
> +             reference to the list of 12 interrupt no's for "qcom,wcn3990-wifi"
> +             compatible target.
> +             Must contain interrupt-names property per entry for
> +             "qcom,ath10k", "qcom,ipq4019-wifi" compatible targets.

...and just to add some credence to my concerns above, "interrupts"
are currently listed under "Optional" properties but I don't think
that the wcn3990 driver will actually work if you don't specify any of
the interrupts, right?  AKA for wcn3990 they are _not_ optional and
you must have exactly 12 interrupts.


One separate issue I have is with your example, which you didn't
change in this patch.  You should fix the example with the same
feedback that I had to your patch ("dts: arm64/sdm845: Add WCN3990
WLAN module device node").

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
