Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCX9b-0002zU-Cc
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 21:45:29 +0000
Received: by mail-vk1-xa41.google.com with SMTP id l65so5844577vki.8
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 14:45:16 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id v127-v6sm629531vke.46.2018.10.16.14.45.13
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 14:45:14 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id a202so19461274vsd.5
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 14:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-3-git-send-email-govinds@codeaurora.org>
In-Reply-To: <1539172376-19269-3-git-send-email-govinds@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Oct 2018 14:45:01 -0700
Message-ID: <CAD=FV=WEJoGKXy_V0KRv-kR4EBFKns_6TDqBvKN5GBKNakPR3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dts: arm64/sdm845: Add WCN3990 WLAN module device
 node
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
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on SDM845 soc.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  8 ++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 26 ++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index eedfaf8..b89b8dd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts

nit: it's usually considered nicer to split the patch into two: one
which adds the node to the SoC file and one which enables it in a
board file.


> +               wlan_msa_mem: reserved-memory@96700000 {

Everything else calls this "memory@", not "reserved-memory@".
Presumably someone (like Rob H?) thought that it should be "memory".
Please follow the pattern.


> +                       no-map;
> +                       reg = <0 0x96700000 0 0x100000>;

nit: though it doesn't really matter, it'd be nice to follow the
pattern and put "reg" above "no-map" like all the other nodes in this
section.


> +               };
>         };
>
>         cpus {
> @@ -1403,5 +1408,26 @@
>                                 status = "disabled";
>                         };
>                 };
> +
> +               wifi: wifi@18800000 {
> +                       compatible = "qcom,wcn3990-wifi";
> +                       status = "disabled";
> +                       reg = <0x18800000 0x800000>;
> +                       reg-names = "membase";
> +                       memory-region = <&wlan_msa_mem>;
> +                       interrupts =
> +                               <0 413 0 /* CE0 */ >,
> +                               <0 414 0 /* CE1 */ >,
> +                               <0 415 0 /* CE2 */ >,
> +                               <0 416 0 /* CE3 */ >,
> +                               <0 417 0 /* CE4 */ >,
> +                               <0 418 0 /* CE5 */ >,
> +                               <0 420 0 /* CE6 */ >,
> +                               <0 421 0 /* CE7 */ >,
> +                               <0 422 0 /* CE8 */ >,
> +                               <0 423 0 /* CE9 */ >,
> +                               <0 424 0 /* CE10 */ >,
> +                               <0 425 0 /* CE11 */ >;

Please change all the above to look like:

<GIC_SPI num IRQ_TYPE_LEVEL_HIGH>

...specifically:
* GIC_SPI is 0, but GIC_SPI is more documenting.
* having 0 for the final element means 'IRQ_TYPE_NONE'.  On newer
kernels commit 6ef6386ef7c1 ("irqchip/gic-v3: Loudly complain about
the use of IRQ_TYPE_NONE") will cause loud yells if you do this.
* I don't see what the comments about "/* CE# */ buy you.  Remove them.


-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
