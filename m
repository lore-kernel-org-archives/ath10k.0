Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4047C71135
	for <ath10k@archiver.kernel.org>; Fri, 13 Jun 2025 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eKtgM9vr74wvYivbQKkfWU15SlC67xuKSLL1mDKqTU=; b=tQNaIL3WFOWtkuqP7Rr/5c8jwi
	ZY5bbswcMbz/AT2SUsuSV+jlSA9mvvxFM+TbGQubp4NfynChALOuG/r99fuOh1qz11sW2fhF1eVEF
	WZmz95T0y84Q9G9f+fkmnAfTISXEpo+iTDRtkFaz4VY8WAfXrWdFZfP0vMIHsD+bZn9Mk87Us+gm4
	/iRD102BO/1WNjooAeYLekhpom1uXbnL7NFShSwbiWm2BI0GBoXJYAHQ6beXFB3T9+FL4SBDhoEXn
	p0TjEQ9GRnUJNBfrsXMaB9ONPUAzyhGmHYgXzl7qfkMxdaXLfdzZb5c5lh2nYlOWRhJLbBP0+jQOh
	XeJ+8Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ41P-0000000GRKP-1Zo6;
	Fri, 13 Jun 2025 13:00:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ414-0000000GRGY-0Nif
	for ath10k@lists.infradead.org;
	Fri, 13 Jun 2025 13:00:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D83Qxw027165
	for <ath10k@lists.infradead.org>; Fri, 13 Jun 2025 13:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eKtgM9vr74wvYivbQKkfWU15SlC67xuKSLL1mDKqTU=; b=boyWahHnWr06MmQj
	Tp3Qgwtd2Aa8rgamMBWFVB9MXwXuz2m+8qAB/ZnD44Lva8s+SjFomrXe1P59St9z
	8Shm7j9xK0eave+vRMvm6G51hrIq4r92xw4u39MblxbdQ+g4crVbswtt/1yKH4AZ
	OSQyF2KNi7X3b/FaF28JsryyNLkSKXXLj0oTVgcT1BAKsnS4/4r3pKgg8VI63n2P
	wZBUYNLrFbdk3oPHfp5a0zdSwVoBVL7pd9pvvPwrH2hVc1wGpbdLZDm/fVTE+dj8
	xsYI0r/i8kaPGQt4mJrX7ELW8ukMe7yNRDSJWdq1Rj+WXOk5NYZFP6Tgn3ZYHpL9
	xwDPvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvkg7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 13 Jun 2025 13:00:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a6f6d07bb0so47758561cf.1
        for <ath10k@lists.infradead.org>; Fri, 13 Jun 2025 06:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749819615; x=1750424415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eKtgM9vr74wvYivbQKkfWU15SlC67xuKSLL1mDKqTU=;
        b=DL430Mhe4iubbbPQF2Al0ufc0Vau8hYdGQNWS43k3pgfHPKRF8gxohlzIaBQP9dRfj
         bki43TK+EaZP7UmrphqPxZ05c4Dpwey53+3K6upjrv1hzNgebi2m9e7IT4x0rY4iEBo1
         0alI8chsEVOPP9xlKK1kPUV4gtpkEtGpykE4UE1JLpDev/pyh4R5yB88zlLW/ZBijhe8
         bc7JCduX2xeerggh9ZDv4lVefhcKh8rMso+J19aYd4tOpLK5XBHw9hrm2UykswCdHGSK
         Dluvdf1P9iW+bv05vgKhtfWQoXjchdJ0ktNCsTm9vUqg+hZ2lbscAP4R19zIhEDOha7I
         9W3Q==
X-Gm-Message-State: AOJu0YwartfsAFWzsu+YYIM3GDDEd1vKk0yUR7Kvyd00VMOxtj1wXC14
	WQ1xqqxpYlZySzhd30TN4x7qOYbBQss3dS0EoWX0mHwZjBO+k5TM0n98Kv9GnYc05SH724R2eBB
	DnvgPhyUpzzJ5V/iJWRdwjySaPhdefvxEinxBaOR7pbvSaECsLwP7ohyn46zeUKbm4RVeo4MKup
	fN5UVwydgajU1uc2QTCmj3HnKTLe+wnw/e/u6xGuk=
X-Gm-Gg: ASbGncsS0A3xmopztLbqO2YuacVjhVOpYtTYpvmMRbnANrYvvqNiAZ2/uIV0wlre4XT
	1G3AXp0uHsl0g8oKWjw0HBrDbltOD5trXtWeXI8FlDKPBcqGDF4s/X2WQmhc7HRO3L4yjOOQbCY
	ip2I11
X-Received: by 2002:a05:622a:191c:b0:4a6:f81a:4443 with SMTP id d75a77b69052e-4a72febff3emr46139601cf.5.1749819615177;
        Fri, 13 Jun 2025 06:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXhNG6pAdisKV7R1YfNX3Tz29W+wdEkFARPRWMHpVrGeJOR7PMTBJg1AXBwf9frl/H7mWHUApAgcQdcqI1ZPA=
X-Received: by 2002:a05:622a:191c:b0:4a6:f81a:4443 with SMTP id
 d75a77b69052e-4a72febff3emr46130171cf.5.1749819609968; Fri, 13 Jun 2025
 06:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250610095455.1443-1-kang.yang@oss.qualcomm.com>
In-Reply-To: <20250610095455.1443-1-kang.yang@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 14:59:58 +0200
X-Gm-Features: AX0GCFuLIWwZKM6UXeyyTu0fXzTOnTClBNkqGI5RIWNfgcxN0MiSPe6rLnnSSvQ
Message-ID: <CAFEp6-2VOQRdYCzW1gjr71L0LZrYK5DFocUGnNoSuvAiQ32CDg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: shutdown driver when hardware is unreliable
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NuGBWoyKxY9mfOaJU9cszgGi9o5xZjyD
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684c20e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=PHlRw_kzcNOPMu9nZAsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NuGBWoyKxY9mfOaJU9cszgGi9o5xZjyD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA5NCBTYWx0ZWRfX0xYaUzG/KzLl
 caf8IGvjLwD2TzqRvCIFu31g2XBGXGmoPWMqBuO18unHXHLkuOATAUiUmImZgtkV6szHoy4kemG
 ptXjkxFJeby9y0fRaxpvzSJbzPfTi1Rx4Fwp9WAC46kfEV5Wuu0vj92epVoW2vOAs0gORUi+7nJ
 zGmNS61PtTosnNZaJ+fLsZ7f4OWf1KdgvomKHkOOgz2RTqBCza9ogSP8317UzNBLn/5a8Ea8wfk
 maDZHPikjA7bbLwbTT4dViNN6TyhIOl2mPTpCSw2lns4xr4/iC+OnAwnaemld6RNlDiy18bx0Nv
 z8NFymPHzlhWi2ZL4HjprWbOzRwrNdunkWLyd1cT92GeeXdrJsfa93I47rv2vjiJnu+xJRVbihv
 l2wYUQhD/PsKwMDICdtxK78MyoUrF3f40qR/K23yaY0dKMXhEyuEzTysEenAFJoBrqCaHF1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_060018_143513_78E09AFF 
X-CRM114-Status: GOOD (  33.08  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kang,


On Tue, Jun 10, 2025 at 11:55=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> In rare cases, ath10k may lose connection with the PCIe bus due to
> some unknown reasons, which could further lead to system crashes during
> resuming due to watchdog timeout:
>
> ath10k_pci 0000:01:00.0: wmi command 20486 timeout, restarting hardware
> ath10k_pci 0000:01:00.0: already restarting
> ath10k_pci 0000:01:00.0: failed to stop WMI vdev 0: -11
> ath10k_pci 0000:01:00.0: failed to stop vdev 0: -11
> ieee80211 phy0: PM: **** DPM device timeout ****
> Call Trace:
>  panic+0x125/0x315
>  dpm_watchdog_set+0x54/0x54
>  dpm_watchdog_handler+0x57/0x57
>  call_timer_fn+0x31/0x13c
>
> At this point, all WMI commands will timeout and attempt to restart
> device. So set a threshold for consecutive restart failures. If the
> threshold is exceeded, consider the hardware is unreliable and all
> ath10k operations should be skipped to avoid system crash.
>
> fail_cont_count and pending_recovery are atomic variables, and
> do not involve complex conditional logic. Therefore, even if recovery
> check and reconfig complete are executed concurrently, the recovery
> mechanism will not be broken.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 50 +++++++++++++++++++++++---
>  drivers/net/wireless/ath/ath10k/core.h | 11 ++++--
>  drivers/net/wireless/ath/ath10k/mac.c  |  7 +++-
>  drivers/net/wireless/ath/ath10k/wmi.c  |  6 ++++
>  4 files changed, 65 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index fe3a8f4a1cc1..f925a3cf9ebd 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>   * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>
>  #include <linux/module.h>
> @@ -2491,12 +2492,51 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>         return 0;
>  }
>
> +static bool ath10k_core_needs_recovery(struct ath10k *ar)
> +{
> +       long time_left;
> +
> +       /* Sometimes the recovery will fail and then the next all recover=
y fail,
> +        * so avoid infinite recovery.
> +        */
> +       if (atomic_read(&ar->fail_cont_count) >=3D ATH10K_RECOVERY_MAX_FA=
IL_COUNT) {
> +               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> +                          atomic_read(&ar->fail_cont_count));
> +               ar->state =3D ATH10K_STATE_WEDGED;
> +               return false;
> +       }
> +
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",

You don't need a newline.

> +                  ++ar->recovery_count);
> +
> +       if (atomic_read(&ar->pending_recovery)) {
> +               /* Sometimes it happened another recovery work before the=
 previous one
> +                * completed, then the second recovery work will destroy =
the previous
> +                * one, thus below is to avoid that.
> +                */
> +               time_left =3D wait_for_completion_timeout(&ar->driver_rec=
overy,
> +                                                       ATH10K_RECOVERY_T=
IMEOUT_HZ);
> +               if (time_left) {
> +                       ath10k_warn(ar, "previous recovery succeeded, ski=
p this!\n");
> +                       return false;
> +               }
> +
> +               /* Record the continuous recovery fail count when recover=
y failed. */
> +               atomic_inc(&ar->fail_cont_count);
> +
> +               /* Avoid having multiple recoveries at the same time. */
> +               return false;
> +       }
> +
> +       atomic_inc(&ar->pending_recovery);
> +
> +       return true;
> +}
> +
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       if (test_and_set_bit(ATH10K_FLAG_RESTARTING, &ar->dev_flags)) {
> -               ath10k_warn(ar, "already restarting\n");
> +       if (!ath10k_core_needs_recovery(ar))
>                 return;
> -       }
>
>         queue_work(ar->workqueue, &ar->restart_work);
>  }
> @@ -2532,6 +2572,8 @@ static void ath10k_core_restart(struct work_struct =
*work)
>         struct ath10k *ar =3D container_of(work, struct ath10k, restart_w=
ork);
>         int ret;
>
> +       reinit_completion(&ar->driver_recovery);
> +
>         set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>
>         /* Place a barrier to make sure the compiler doesn't reorder
> @@ -2596,8 +2638,6 @@ static void ath10k_core_restart(struct work_struct =
*work)
>         if (ret)
>                 ath10k_warn(ar, "failed to send firmware crash dump via d=
evcoredump: %d",
>                             ret);
> -
> -       complete(&ar->driver_recovery);
>  }
>
>  static void ath10k_core_set_coverage_class_work(struct work_struct *work=
)
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index 446dca74f06a..06ac95707531 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>   * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>
>  #ifndef _CORE_H_
> @@ -87,6 +88,8 @@
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
>  #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
> +#define ATH10K_RECOVERY_TIMEOUT_HZ                     (5 * HZ)
> +#define ATH10K_RECOVERY_MAX_FAIL_COUNT                 4
>
>  struct ath10k;
>
> @@ -865,9 +868,6 @@ enum ath10k_dev_flags {
>         /* Per Station statistics service */
>         ATH10K_FLAG_PEER_STATS,
>
> -       /* Indicates that ath10k device is during recovery process and no=
t complete */
> -       ATH10K_FLAG_RESTARTING,
> -
>         /* protected by conf_mutex */
>         ATH10K_FLAG_NAPI_ENABLED,
>  };
> @@ -1211,6 +1211,11 @@ struct ath10k {
>         struct work_struct bundle_tx_work;
>         struct work_struct tx_complete_work;
>
> +       atomic_t pending_recovery;
> +       u8 recovery_count;

No reason to be a u8 IMO, use unsigned int.

> +       /* continuous recovery fail count */
> +       atomic_t fail_cont_count;
> +

