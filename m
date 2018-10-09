Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9lVm-00078W-K8
 for ath10k@lists.infradead.org; Tue, 09 Oct 2018 06:28:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id b5-v6so297558plr.5
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 23:28:43 -0700 (PDT)
Date: Mon, 8 Oct 2018 23:28:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 4/6] firmware: qcom: scm: Add WLAN VMID for Qualcomm
 SCM interface
Message-ID: <20181009062840.GA8498@tuxbook-pro>
References: <20180815092637.11455-1-govinds@codeaurora.org>
 <20180815092637.11455-5-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180815092637.11455-5-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, andy.gross@linaro.org, niklas.cassel@linaro.org

On Wed 15 Aug 02:26 PDT 2018, Govind Singh wrote:

> Add WLAN related VMID's to support wlan driver to set up
> the remote's permissions call via TrustZone.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  include/linux/qcom_scm.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index b401b962afff..da63d84e1e91 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -1,4 +1,4 @@
> -/* Copyright (c) 2010-2015, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2010-2015, 2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2015 Linaro Ltd.
>   *
>   * This program is free software; you can redistribute it and/or modify
> @@ -33,6 +33,8 @@ struct qcom_scm_vmperm {
>  
>  #define QCOM_SCM_VMID_HLOS       0x3
>  #define QCOM_SCM_VMID_MSS_MSA    0xF
> +#define QCOM_SCM_VMID_WLAN       0x18
> +#define QCOM_SCM_VMID_WLAN_CE    0x19
>  #define QCOM_SCM_PERM_READ       0x4
>  #define QCOM_SCM_PERM_WRITE      0x2
>  #define QCOM_SCM_PERM_EXEC       0x1
> -- 
> 2.17.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
