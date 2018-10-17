Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCgLB-0004E6-TD
 for ath10k@lists.infradead.org; Wed, 17 Oct 2018 07:34:08 +0000
Received: by mail-pl1-x643.google.com with SMTP id v5-v6so12247512plz.13
 for <ath10k@lists.infradead.org>; Wed, 17 Oct 2018 00:33:51 -0700 (PDT)
MIME-Version: 1.0
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <1539172376-19269-3-git-send-email-govinds@codeaurora.org>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-3-git-send-email-govinds@codeaurora.org>
Message-ID: <153976162862.5275.4810472671573539341@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 2/3] dts: arm64/sdm845: Add WCN3990 WLAN module device
 node
Date: Wed, 17 Oct 2018 00:33:48 -0700
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

Quoting Govind Singh (2018-10-10 04:52:55)
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

Please specify these as GIC_SPI and give trigger types (level high I
guess?). I'd also drop the comment and add interrupt-names to match the
comment. It's self documenting that way.

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

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
