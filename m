Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9bTH-0006UD-QY
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 19:45:41 +0000
Received: by mail-ed1-x543.google.com with SMTP id w19-v6so3476001eds.1
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 12:45:29 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41])
 by smtp.gmail.com with ESMTPSA id a27-v6sm5850157edc.46.2018.10.08.12.45.26
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Oct 2018 12:45:27 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id h13-v6so7189899edq.0
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 12:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20181001112636.31715-1-govinds@codeaurora.org>
In-Reply-To: <20181001112636.31715-1-govinds@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 8 Oct 2018 12:45:14 -0700
Message-ID: <CA+ASDXNvGG34eSsupr95p-O-CUUui2bU63LUjn6cbKiXwKhTYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Enable ath10k wcn3990 wifi driver support on sdm845
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
To: govinds@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, andy.gross@linaro.org, linux-soc@vger.kernel.org

+ linux-arm-msm, linux-soc

The MSM list should definitely be included for updates to Qualcomm DTS
files. Probably linux-soc too, if I'm reading MAINTAINERS correctly.

Brian

On Mon, Oct 1, 2018 at 4:26 AM Govind Singh <govinds@codeaurora.org> wrote:
>
> This series enables ath10k wifi driver support for WCN3990 target
> on sdm845 SOC. This series also updates the missing dt binding documentation
> and adds optional iommu property.
>
> sdm845 dtsi changes in this series are based on top of
> https://patchwork.kernel.org/cover/10573121/ change.
>
> Changes since v1:
>         Listed no of interrupts/clocks for each set of compatible.
>         Added missing 'wifi' label to sdm845.dtsi.
>
> Govind Singh (4):
>   dt: bindings: add missing dt properties for WCN3990 wifi node
>   dts: arm64/sdm845: Add WCN3990 WLAN module device node
>   dt: bindings: add bindings for wifi iommu node
>   dts: arm64/sdm845: Enable iommu for WCN3990 wifi module device node
>
>  .../bindings/net/wireless/qcom,ath10k.txt     | 34 +++++++++++++++----
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  7 ++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 27 +++++++++++++++
>  3 files changed, 61 insertions(+), 7 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
