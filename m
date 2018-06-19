Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVPOv-00046p-4Y
 for ath10k@lists.infradead.org; Tue, 19 Jun 2018 22:47:03 +0000
Received: by mail-lf0-x242.google.com with SMTP id d24-v6so1935429lfa.8
 for <ath10k@lists.infradead.org>; Tue, 19 Jun 2018 15:46:50 -0700 (PDT)
Date: Wed, 20 Jun 2018 00:46:46 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 5/6] firmware: qcom: scm: Add WLAN VMID for Qualcomm
 SCM interface
Message-ID: <20180619224646.GD1635@centauri.lan>
References: <20180605123709.1882-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180605123709.1882-1-govinds@codeaurora.org>
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
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org

Acked-by: Niklas Cassel <niklas.cassel@linaro.org>

On Tue, Jun 05, 2018 at 06:07:09PM +0530, Govind Singh wrote:
> Add WLAN related VMID's to support wlan driver to set up
> the remote's permissions call via TrustZone.
> 
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
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
