Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F94C4167B
	for <ath10k@archiver.kernel.org>; Tue, 29 Nov 2022 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLaeIR4dRZnPA1YuZT7uPa7JCAqjmCeps9ZoaPnTNh4=; b=XaNQFiRY2tAdzP
	CDE0dqkI1tmKAGOyaOmcxQcBnGA0TxgL+RN0rAxVeObYMaGA0YV0YJb0Pq7wuEqf0YoOtsxsN6hE0
	RCaDrQl6r5q2N2Yff5MYaTMBKwD2O1rXe1wRudTEXJX15wY3gD9vdUCtbcBanhLR+USswl4k44GXS
	aui5IYkgalWvZKtF2L1eY8gZeyWtXV6e7m1dhhz2Hw68BFHqUSdIZE1EYGCaelUaq/m6JNie7boci
	RtXnHCb9Ui7gSXsZ4FlrOUa+tl1BlARrzxEzx2531ZHLwlrTxq1xThBw12/ymTpDJz2u/HJ5QZWOl
	J/Oy45Ap/6yJx1M4xivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p032u-009vUT-MI; Tue, 29 Nov 2022 16:01:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p032r-009vRY-75
	for ath10k@lists.infradead.org; Tue, 29 Nov 2022 16:01:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F8FE6179B;
	Tue, 29 Nov 2022 16:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EE2C433D7;
	Tue, 29 Nov 2022 16:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669737675;
	bh=8uKzlZTZC2ESrdzmt02/0HkkY8tj+YyjH5lSyh2/YO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwujNeHxIeWrco7PrymPAw/sUMvLOyF7r1hnfVrUrfKSGtB6r4VuhrUA9i97muYid
	 TUlzKotRYr5hdhguQlEhlRdgxtkNcRzGUM+W9R0oq/wqlSUS8JyX09P9bAxoIz5onS
	 4rQSmqgzSw8F78D8WbJfwnD7+dQh0MSaTSP7YTY3zGC1ZWSUYIG+bdN12h2Zy5VZo1
	 qwrP3O++dnmu47U+btgGwgon7+dD0jKFB5g6lkM7epb2OC7KuD8Q7caFonZuxpcItG
	 vNOILe6ynowSrzgik86daIvwswInLymyYlRpD/XATy0pG+lMjZSkPwTYTwU2+ZLQQ1
	 /OpJPIpxNzOsA==
Date: Tue, 29 Nov 2022 09:01:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mpubbise@quicinc.com,
	rameshn@qti.qualcomm.com
Subject: Re: [PATCH v4] wifi: ath10k: Store WLAN firmware version in SMEM
 image table
Message-ID: <Y4YsyaIW+CPdHWv3@dev-arch.thelio-3990X>
References: <20221117180534.2267-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117180534.2267-1-quic_youghand@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_080117_363731_E79734A8 
X-CRM114-Status: GOOD (  28.33  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, Nov 17, 2022 at 11:35:34PM +0530, Youghandhar Chintala wrote:
> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
> 
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
> 
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
> 
> This change is applicable only for SNOC/QMI based targets.
> 
> Example:
> cat /sys/kernel/debug/qcom_socinfo/cnss/name
> QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
> Changes from v3:
>  - Changed patch title
>  - Changed naming conventions
>  - Removed MAX_BUILD_ID_LEN usuage
>  - Added condition to call API
>  - Changed depends on QCOM_SMEM to select QCOM_SMEM

You cannot blindly select user configurable symbols that have
dependencies, otherwise you end up with Kconfig warnings. I see the
following warning in -next when CONFIG_HWSPINLOCK is disabled:

  WARNING: unmet direct dependencies detected for QCOM_SMEM
    Depends on [n]: (ARCH_QCOM [=y] || COMPILE_TEST [=n]) && HWSPINLOCK [=n]
    Selected by [m]:
    - ATH10K_SNOC [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH10K [=m] && (ARCH_QCOM [=y] || COMPILE_TEST [=n])

That should likely be changed back to 'depends on'. The reason the other
QCOM symbols are selected is because they are not user-selectable, so
they have to be selected by the configurations that need them.

>> ---  drivers/net/wireless/ath/ath10k/Kconfig |  1 +
>  drivers/net/wireless/ath/ath10k/qmi.c   | 35 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
> index ca007b800f75..e0a51dad8e42 100644
> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -44,6 +44,7 @@ config ATH10K_SNOC
>  	tristate "Qualcomm ath10k SNOC support"
>  	depends on ATH10K
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	select QCOM_SMEM
>  	select QCOM_SCM
>  	select QCOM_QMI_HELPERS
>  	help
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 66cb7a1e628a..cdcb162f93c2 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/net.h>
>  #include <linux/platform_device.h>
>  #include <linux/qcom_scm.h>
> +#include <linux/soc/qcom/smem.h>
>  #include <linux/string.h>
>  #include <net/sock.h>
>  
> @@ -22,6 +23,10 @@
>  
>  #define ATH10K_QMI_CLIENT_ID		0x4b4e454c
>  #define ATH10K_QMI_TIMEOUT		30
> +#define SMEM_IMAGE_VERSION_TABLE       469
> +#define SMEM_IMAGE_TABLE_CNSS_INDEX     13
> +#define SMEM_IMAGE_VERSION_ENTRY_SIZE	128
> +#define SMEM_IMAGE_VERSION_NAME_SIZE	75
>  
>  static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
>  					 struct ath10k_msa_mem_info *mem_info)
> @@ -536,6 +541,33 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar)
>  	return ath10k_qmi_mode_send_sync_msg(ar, QMI_WLFW_OFF_V01);
>  }
>  
> +static void ath10k_qmi_add_wlan_ver_smem(struct ath10k *ar, const char *fw_build_id)
> +{
> +	u8 *table_ptr;
> +	size_t smem_item_size;
> +	const u32 smem_img_idx_wlan = SMEM_IMAGE_TABLE_CNSS_INDEX *
> +				      SMEM_IMAGE_VERSION_ENTRY_SIZE;
> +
> +	table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +				  SMEM_IMAGE_VERSION_TABLE,
> +				  &smem_item_size);
> +
> +	if (IS_ERR(table_ptr)) {
> +		ath10k_err(ar, "smem image version table not found\n");
> +		return;
> +	}
> +
> +	if (smem_img_idx_wlan + SMEM_IMAGE_VERSION_ENTRY_SIZE >
> +	    smem_item_size) {
> +		ath10k_err(ar, "smem block size too small: %zu\n",
> +			   smem_item_size);
> +		return;
> +	}
> +
> +	strscpy(table_ptr + smem_img_idx_wlan, fw_build_id,
> +		SMEM_IMAGE_VERSION_NAME_SIZE);
> +}
> +
>  static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  {
>  	struct wlfw_cap_resp_msg_v01 *resp;
> @@ -606,6 +638,9 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  			    qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);
>  	}
>  
> +	if (resp->fw_build_id_valid)
> +		ath10k_qmi_add_wlan_ver_smem(ar, qmi->fw_build_id);
> +
>  	kfree(resp);
>  	return 0;
>  
> -- 
> 2.38.0
> 
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
