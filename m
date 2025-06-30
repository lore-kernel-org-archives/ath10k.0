Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60119C7EE39
	for <ath10k@archiver.kernel.org>; Mon, 30 Jun 2025 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE23Ae+/8EzCG86+Lm/cowAvxhFQMSYP8M/1txLwQKc=; b=PXJHT1qB9BMzE/dlXPoTXki0QN
	fdznSW1xpUxVjrSM7uJ0DVTiGwT0RS+wVWntFcMXkzNT8FMdMVZbNH7SVtximYquZFtS1Q+IUFRYV
	n/vmV6St/BmedBQYlBPYPwtQNPCs6gGv/qM2WZpRNVfJ9HoP5OfPIXvWqQrQuUTT0FRF0kxbRCJT6
	kNaEYHAqFU1EcMner+3MglhRGVgsKXzxnlD6RzkxXQBVE5s/PR6HS+qAModQ/lIhVg+d4XWSkT3md
	vJXJgrefhhZO9vrSZLuwm94pLriDTA/RyC3jOFeQUbUNm5httxZKUM3VNBn6QQuwRMEtO3D8C9MdT
	3o9SgPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9PC-00000001XAu-1ZHw;
	Mon, 30 Jun 2025 07:58:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9PA-00000001X9a-1OpR
	for ath10k@lists.infradead.org;
	Mon, 30 Jun 2025 07:58:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TKh7vJ015768
	for <ath10k@lists.infradead.org>; Mon, 30 Jun 2025 07:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bE23Ae+/8EzCG86+Lm/cowAvxhFQMSYP8M/1txLwQKc=; b=Gq15H9V5LmtRRLEp
	y+fE9lHPva2w9uSZToVfnyjaDgL4naoRWb6E/1H/iTjrqn+3mHhozpiFrzYb3hoT
	G7ZVse92LVQDfoRUPOUGHukhHPGCtXZLnLI8QTyaDaqqyovx6CkVAffcvf/SIXn9
	PDqnsQIAMX+LuJNACcW4wcEuPOmXhETLF3LNKk1/90TtARs3zDN/dPf1OQ0D77pq
	OyF1wAHIuYpi6eb3vpDolxmeoRlK0AkH11n2yHa3a7QF1BI5exzXvCvqVbqP7qRE
	k2758n4nx8vM3Tr1z+J+shadB4SFGb3cQx/zvgguBIX3JMHxNYP4qQtJw6qa87P+
	1cT8Og==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k40rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 30 Jun 2025 07:58:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a441a769c7so72815231cf.3
        for <ath10k@lists.infradead.org>; Mon, 30 Jun 2025 00:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270297; x=1751875097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE23Ae+/8EzCG86+Lm/cowAvxhFQMSYP8M/1txLwQKc=;
        b=CQ/W00GA9VYdQYDvAm3fjQYyh9z30IGMlnGiklbJBRYbkkIWe+JzSFJdgIRu7S2wBA
         KJMFcWRK7X8f+/3wqFDrMYjCf5HOFpcD9MZ553mwCPlP3PZ3KYANkZV9tK8OGtLqd/6u
         on8xL3zbD+0cDHPVswAaCSQ/0lSU0SWLdQxm2lsNzevcGT93c6eCMiaySbGuNpfsaRbh
         nF1aTv0gbz9tSQzcAN/EAAqLV1y1Q0li8X31SoS2JnZWwu2JWKiecw36xrG7OLgxUFNF
         wEwEgUsIbK1pOdOGdD7oxEyxeN4l2joQUBIoLsQVo6TyljECIcqCrA8ZTiqvOk89HN7E
         KHTA==
X-Gm-Message-State: AOJu0YwgTeCuOsUvLgvooM7HgujUppC6OndKwsUluHkDonYNgEA4cDun
	Llq2UzMv4z6XXCJMFl4OPpRftRh54sBIURU6ImhcaTX8W1sIfgFhksSdNbtq2aTRbKXksok/foX
	iJ10QgGPBzh9WB+H74HriMpa5sVkGd4fKNLNLNvSkEiYnZmyRs7hCd3pKv7slhMHk8FrpiOQdPT
	gVBm62xFKeiXMz/wbSyBuYCzwIRhaye1P1f5wkMM8=
X-Gm-Gg: ASbGncto30K1bn7B2MMFKep4GWlp2e1nySiYbIpdNjuo9I2+PwU4A82MSt37XW4zwAQ
	GoHzGlRpA/+MfslUxM8JVI160Sy4/ctswCLu4hddLxohRpkzO/Pf7RDVBmX8UE29pJQklIbj7WM
	qlfIhW
X-Received: by 2002:a05:622a:494:b0:4a7:e3b:6d9e with SMTP id d75a77b69052e-4a7fc9d42b4mr157205541cf.9.1751270297224;
        Mon, 30 Jun 2025 00:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqrB2Pyp7iqU1FufTj7/z0ecuMNsxRPSq93+C6myVBFyHvWexyv/uthgNVpyXmmnzPE1k21rF9pUwTVQ+pwzU=
X-Received: by 2002:a05:622a:494:b0:4a7:e3b:6d9e with SMTP id
 d75a77b69052e-4a7fc9d42b4mr157205411cf.9.1751270296802; Mon, 30 Jun 2025
 00:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250623022731.509-1-kang.yang@oss.qualcomm.com>
In-Reply-To: <20250623022731.509-1-kang.yang@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 09:58:05 +0200
X-Gm-Features: Ac12FXxpkvzRSMs0AptSVojDd-PiVMNFRB4OEp7LhNdOem9PyCCYBuzGh5t7dOc
Message-ID: <CAFEp6-0GN+j0-z=pu8VyCa76K8HS=gHOUxNjnAt_OSCmj+XrXA@mail.gmail.com>
Subject: Re: [PATCH ath-next v2] wifi: ath10k: shutdown driver when hardware
 is unreliable
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6862439a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=Tk1VEMF_3BOPV1PWIZcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA2NSBTYWx0ZWRfXx0VniPkF/ve1
 FlIPEc4rvyQF7g5xMI2W2l5Cp0B4zXk/uCBb6KXUeTMSdcSgH0ALyhVnEO6n1bQvKXGRE3H7Fu/
 HZ6AIyDnqOl8vbfskJOCjp/iafGGKfq2+2j67HpUOb9OzFzgfIQN1ugm1sGZBtQovaRM1tzRmjE
 du9JJbfLE5DyguOOVDeYSHQyFo/9eJAnEYvGlENEOi5YfL/6fv7FCmtbAv5hzhqc8Dduztmqm5B
 SNVkRPFWTvTLqag01tszqUnSovUf5Fg016GpQV0sa7BZTZse6vwW+SxdkAZWerG+c/OpOVn1u3f
 3pa8FGwJMd8lF31j5DpK1jBVOx+3RdHcs0XepuRXwmjFRtHMuBoeasH2ouiIGfVI59tl9eYfqyP
 YHGjSDa59YwmS7TTy6SpbEi6/Tg4wm7cZv1tK2WR2dHAbRG9WxIyPKBNTHPpv2SAW/s8hpjz
X-Proofpoint-ORIG-GUID: U45NgkssLGINmyp4T_x0Y8EtRv8QcTVb
X-Proofpoint-GUID: U45NgkssLGINmyp4T_x0Y8EtRv8QcTVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=882 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_005820_381922_753A272D 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, Jun 23, 2025 at 4:27=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
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

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

