Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCgSa-0008UL-Jh
 for ath10k@lists.infradead.org; Wed, 17 Oct 2018 07:43:40 +0000
MIME-Version: 1.0
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
Message-ID: <153976208916.5275.15753381614937010537@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 1/3] dt: bindings: add missing dt properties for
 WCN3990 wifi node
Date: Wed, 17 Oct 2018 00:41:29 -0700
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
To: Govind Singh <govinds@codeaurora.org>, andy.gross@linaro.org, ath10k@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-wireless@vger.kernel.org, robh+dt@kernel.org

Quoting Govind Singh (2018-10-10 04:52:54)
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
> +- interrupts: reference to the list of 17 interrupt no's for "qcom,ipq4019-wifi"

Nitpick: Can you write out "numbers" instead of "no's"?

> +             compatible target.
> +             reference to the list of 12 interrupt no's for "qcom,wcn3990-wifi"
> +             compatible target.
> +             Must contain interrupt-names property per entry for
> +             "qcom,ath10k", "qcom,ipq4019-wifi" compatible targets.
> +
>  - interrupt-names: Must include the entries for MSI interrupt
>                    names ("msi0" to "msi15") and legacy interrupt
> -                  name ("legacy"),
> +                  name ("legacy") for "qcom,ath10k", "qcom,ipq4019-wifi"
> +                  compatible targets.
>  - qcom,msi_addr: MSI interrupt address.
>  - qcom,msi_base: Base value to add before writing MSI data into
>                 MSI address register.
> @@ -55,7 +63,8 @@ Optional properties:
>  - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
>                                      the length can vary between hw versions.
>  - <supply-name>-supply: handle to the regulator device tree node
> -                          optional "supply-name" is "vdd-0.8-cx-mx".
> +                          optional "supply-name" are "vdd-0.8-cx-mx",
> +                          "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".

Why can't the wifi firmware manage these regulators itself?

And these names don't seem to match any sort of schematic or really
describe what this device is. From what I can tell, we've combined the
off-SoC wifi module with the on-SoC wifi I/O space into one DT node here
and then relied on that node to make some driver probe in the kernel to
do wifi stuff. Can we model this properly by actually showing that
there's something in the SoC, and there's something outside the SoC, and
these two things are connected by having two nodes and a phandle between
them?

>  
>  Example (to supply the calibration data alone):
>  
> @@ -133,8 +142,10 @@ wifi@18000000 {
>                 compatible = "qcom,wcn3990-wifi";
>                 reg = <0x18800000 0x800000>;
>                 reg-names = "membase";
> -               clocks = <&clock_gcc clk_aggre2_noc_clk>;
> -               clock-names = "smmu_aggre2_noc_clk"
> +               clocks = <&clock_gcc clk_aggre2_noc_clk>,
> +                        <&clock_gcc clk_rf_clk2_pin>;
> +               clock-names = "smmu_aggre2_noc_clk",
> +                             "cxo_ref_clk_pin";
>                 interrupts =
>                            <0 130 0 /* CE0 */ >,
>                            <0 131 0 /* CE1 */ >,

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
