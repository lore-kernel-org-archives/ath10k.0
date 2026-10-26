Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3040A606A31A
	for <ath10k@archiver.kernel.org>; Mon, 26 Oct 2026 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J5/f6lKH;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EoCgWx2Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpwrur3U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=; b=J5/f6lKHw7D6Ni
	oQdNL6x5xoiJQJP4YgOqei5Zvpu9kBmxuyCrcTHd+Tyk+tHXEVJklhY+9byXEg2LMqyXYersjJefe
	y7QH1bnW8zktjq55iqRrN8j115nK/qUnH/gHTEjw5O11nKPl0mGTnejztv9q/bm0qkaFDISyagFmW
	QNmgvuEr6nfV9ufHoJ+nkbk/Ecxq3kKUO2xnwWzKUoRUjcKSwMky5Y0eRO2YMNqCjORk5cBQaAQsl
	js1rOICb2RWrGXDCsTC2CZHZ4mUkPwsORSYxAVql9BsXNi4irwjxWvlC7PrFBqW9MectOfGQolvUn
	XgXpaBUdCr0NFMTP2qCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNvB-00000002vbm-3X7d;
	Mon, 26 Oct 2026 16:51:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNv8-00000002vbJ-1uJY
	for ath10k@lists.infradead.org;
	Mon, 26 Oct 2026 16:51:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEw9qv3584506
	for <ath10k@lists.infradead.org>; Mon, 26 Oct 2026 16:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=; b=EoCgWx2Qo+MPAhRX
	yKavjXnpRQz4TtILPEfZRKugZaBzRUP3AQALpNBmKABPC3PQYaXsEZ6aQhtM3zk2
	GtYdkV5O8ULL58BdofZ3n2d/wT1Phqg5SqbgAKbHMlRMUOWJKxXjmfiYRPNPX2Y5
	Ov7aZtKKyyLC3x5dPfVTbf5xexS71xkjQ9M3VmprPt79sqWElxGelkQmNOHZTNwK
	CFRD7HBjVV/J6AE3rieuj0ptNcWmnpR6DryEKh25NPjvqurk6nh5bKJHOZIiZ9Qr
	Xv0B7sdGbbXpm0F360sMJk/cAIr5+LS7NlOfmYPwG9i7QqPPRldmcZxesM6YfDcQ
	17uJVQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddb5vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 26 Oct 2026 16:51:37 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8488f31d754so2521884a34.0
        for <ath10k@lists.infradead.org>; Mon, 26 Oct 2026 09:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793033497; cv=none;
        d=google.com; s=arc-20260327;
        b=QHdPAxwmen2efdL7bn+nY2xGnFr97uyENQyPnVe0xCIhwUbehmTKR1cbU5umHmA+pY
         PqRXemkRs7KrFu+Y2FCeFYXkPo05KJJv2AJ0sDvEzng2lgDBYLIqQ80rpzeFfpvXprpa
         j0unhm7U/G90BLlrTgHDoE5eigB/F+qiAmai/XAbEtHUbJTvAduIGfU7be/5HYTuOlh9
         2nEw/isv+lB5x9v3v0v/1sJUnHrGv8CpDrSvDXmQOH39WwtdEXTVbV8qRakRvAQGDfbn
         EE7CYwfQWws60PXaUU+YQ6SCTBo9CqoajPYbGXEAe+zhDtzvn1kfqsuUE2i1X1uOh4ir
         5mLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=;
        fh=/Mre3J+0gAP3zQYfjKz6A5I4z3FS6MzwY4Puy7DFJt0=;
        b=dvxU4Rf9oxFRE037I1pKlE7uUav8l7vqNSiQfrm493hTksnciwF8DBfjN1ljVS2JkF
         wfWopqCRw4gQg/GFbpCqOj1D3I3dlKxVbT+6PoNfsDmVzlLaISz/Om7KEbZf0KdqTORM
         ILOBFgCl9iKPvkvLhAplruP0xm22iB7YUOkJlCRLFcnvwT+ojE6ug4BVm7eSD133AXJe
         VfjNLwIO5+/FcR4WOVtIyozMtr665vjAVlb2lxEXz9XYR6YBcANhyU/S4nXKbDWbupPZ
         zJUBgF5xsZfcgd4vv6+p1N/vKWbEmsZkcsguZ8nbbLhlob9/zEY46nqrh1EW3bJU+OYQ
         Xh7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793033497; x=1793638297; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=;
        b=Tpwrur3UiPjawztnadc6ZeR+FZ7Dpca9tYwk+15rrlv14wQvS1fe/DZhX7ECjk1ogI
         eyB0Rr8dHHqNggHUu/3Ub4i0LwkHh9ip5wYq/87KHqHInFJyDghC9twBzPyMPoy0isNC
         zG1gFzskjP6HWSWw3jHw1inKqTaPv80xotZHBrtPrq2zP8loXoEY3yykHy2pmpFVlFkT
         /KeBGJgSzbyNvX2wAmSDelhMruB4HOV/VtOH7/tWO+vVvmUFW+TmVCjAfcrnDYvVHywM
         /YsodN5U1D/htjp9HsT/qEnQy0DMQkJIw0BJmJzkO922S/NU/jgg+KTBu3f9xuj7yt7d
         kH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033497; x=1793638297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=;
        b=Et4ZAdww+R7t5+Chg0ot0lp0pSdbkJUKEqWG0RPIEJW/eBeRIRCJBqznJF6vSE9FIB
         lKveTB2cq08VLXensG4cwkBM4QPHEzE1dab1Lv+ZAzb81HK63ldA6bYcV90vC1XI4KVR
         gDvYE762+JzEikgfKWf7OurjGEf7C4WdHuAMYQub1L0GSA5rWdDxZ8s0mBpDEZJH+1F9
         h7MFAuXgYeDRw+zP3n8WdVzB40M/tfHgviuv0R4Ekc7HSfoTa6fkwbM4KWNg773VFzgo
         BwQUvVyjiuUNXTJ3y2jrKbMMKyX9wZj30sO0+TPTTeMs3mVSIdv6SXPTwm/YOj6JlIyK
         xGWA==
X-Forwarded-Encrypted: i=1; AKwUvBzbCtLhV7rywAU030TA6xFvrPrrbeth+mSbJR2jIvN0m9sEC4lJh9PJLPC0kQVc2ozjjpEAcEs=@lists.infradead.org
X-Gm-Message-State: AFq9FYJDSokEM5vto/oWlM5GDbSFFtPgJtNb87kIr+GcwBonYRL3pnoW
	wa/gajpVQo4X81hlmt2QSks6ExGPNtyy6jqjUQvCKXOMbc7BC9XEVjS8zdnl5yblUPnMBI9WuVi
	jFEg0DddKOkFhDZV5gZU418QRYmacdDno6oGV7uGO71m+CpI68beHxPIIbXFc8yB4SMIK+4DHwp
	ThBng2lM7FP7WDxZnHTaw9z0pMQZiYyo/CIFnhVWM=
X-Gm-Gg: AYBFou0KZ0m6giC8ufFCsCV8BkRbtUWpTDpGMJiCAYYHysv5QnGwLtoic5BA893o4i6
	yNF2sEEJcJu4AuPLNH9nMMwSgN/jIlj9huQnSyQLpjRSWsxNQK+1cWBmUwk/nJaQtGxh41t6PG3
	quUfTALioPrwtqdC7PifaTRfzSWESaSkTg5WiM+CGVwN5lVcQLnjE3V2JI4Sv0CxDoLP9nqedye
	vK6RHCONgPUMacQAAMLuRyVZprBHRZ4Dfys/xbN6L0btA22lxhI+MYFN9yyOWhuWaIk5WyEHlf8
X-Received: by 2002:a05:6808:30a8:b0:4d6:9293:9bc3 with SMTP id 5614622812f47-55c0035e0d8mr4594269b6e.61.1793033496502;
        Mon, 26 Oct 2026 09:51:36 -0700 (PDT)
X-Received: by 2002:a05:6808:30a8:b0:4d6:9293:9bc3 with SMTP id
 5614622812f47-55c0035e0d8mr4594249b6e.61.1793033495896; Mon, 26 Oct 2026
 09:51:35 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-ath10k-temperature-v1-1-e5cd6fde7f1e@gmail.com>
In-Reply-To: <20261026-ath10k-temperature-v1-1-e5cd6fde7f1e@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:51:24 +0100
X-Gm-Features: AclHuK_Jmeq84Mm4fd65kQjsPYcOJSPjKDNZR_s6Js0HaIcEN6qdLR_UOiC3E4A
Message-ID: <CAFEp6-0LiHBGz+yZb4+fExSFR3U=pgKbCui6ZdTxVc39VjHbQw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Stop unanswered temperature reads
To: effeffe99@gmail.com
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 5TZ-9jpaZHj3CWr8MzacjfbBkQlcyjEy
X-Proofpoint-GUID: 5TZ-9jpaZHj3CWr8MzacjfbBkQlcyjEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX8Fyn2YFnlkYt
 TP4tavPN/TZ8hkXw1TZJxOUBlMEBZvqEch2XxsY/hA+gpsw2bei8hEPCHYwT+l6tmTaulybi/YV
 KraphiU76wUrWGknxgKRDG9i4cJ1u22Yu0j3gq2yt5VYuF5HiD0jb4PJkN7Dd4DICyi/eF1Wnnd
 UPB5p8PIUNwiL+MWFUuhvY3KM6pm9yECesOfV3815pfHKAh4/NU5NwCnwQORO1oz8GXrGKFePKZ
 B14gDPkxOYszL3k+1DDIanYYxEvzO0WnznDkMJlVhDoQuQ8kRrsgPnt2pmxbsqD2jQ9lhMEsXWx
 sEqW8BYYBo6aW2XdbVeIyvJE+i/IRLtKWIMqIjmXeLD3ZGumT38rpzhch20TpYUr9EoC+80qALl
 VwX5MSA2gk4dCgTb6IVIzYFIsdIokaSjN+i5WNt2eQsMp/8FHEeGZegVIvP1nEt0l5wtQ5Uy98D
 aQttjqUErDg9Q8YCJKQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf8519 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=pn2aKBgt1YT2jw1FRdIA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfXwvPs9SW/n5DW
 BVezUW45vvBJMDB4BxyCh0D1qZyHYd2D1XUWuhkxdkEUiOcGaP7NyRk4g2yAkfMDL0kaoAU5z2a
 KYF809TTUKXhxdE2GfQpjArwh+IszOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095138_643964_3C5FD0EE 
X-CRM114-Status: GOOD (  37.16  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 5:36=E2=80=AFPM Filippo Falezza via B4 Relay
<devnull+effeffe99.gmail.com@kernel.org> wrote:
>
> From: Filippo Falezza <effeffe99@gmail.com>
>
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
>
>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>
> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> lm-sensors, hang for 5 s on every run, and configuration changes of the
> interface wait for conf_mutex in the meantime.
>
> Whether the firmware answers cannot be told from the chip: firmware that
> answers and firmware that does not both advertise
> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> Instead, remember that the running firmware did not answer, and return
> -EOPNOTSUPP right away on later reads. Forget it when the firmware
> starts, so that a restarted or updated firmware is asked again.
>
> The first read after each firmware start still takes 5 s when the
> firmware does not answer. Reads on firmware that answers are unchanged.
>
> This change was written with the help of an AI coding assistant; see
> the notes below.
>
> Fixes: e98199a8c27f ("ath10k: enable QCA6174/QCA9377 to read the chip tem=
perature")
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---
> Notes, not for the changelog:
>
> - Tool: Claude Opus 5.5 in Claude Code wrote the code and this changelog
>   during an interactive bring-up session for the Moto G 5G Plus. The
>   request was to fix `sensors` hanging on every run because of ath10k.
>   A first version disabled the read for all WCN3990 through a hw_params
>   flag; it was replaced by this one so that it does not assume all
>   WCN3990 firmware behaves the same, as Loic Poulain asked of another
>   WCN3990 firmware workaround ("ath10k: WCN3990 firmware workarounds for
>   WLAN.HL.3.2", March 2026).
> - Tested on: Moto G 5G Plus (SM7250, WCN3990, firmware
>   WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1), linux-next next-20261021 plus
>   device support patches, with this patch in place of a local WCN3990
>   quirk. First read of temp1_input: 5065 ms, -ETIMEDOUT, one warning;
>   next reads: 8 ms, -EOPNOTSUPP; a full `sensors` run: 25 ms (5 s or
>   more before). After switching Wi-Fi off and on, which restarts the
>   firmware session, the first read waits 5 s again, then -EOPNOTSUPP.
> - Not tested: firmware that does answer the request (QCA6174, QCA9377,
>   other WCN3990 firmware); for them only reads after a timeout change.
>   Not run: sparse.
> - Build: W=3D1 for arm64, no warnings; checkpatch --strict clean.
>   Applies to ath-next (cd026e68f).
> ---
>  drivers/net/wireless/ath/ath10k/core.c    | 1 +
>  drivers/net/wireless/ath/ath10k/thermal.c | 9 ++++++++-
>  drivers/net/wireless/ath/ath10k/thermal.h | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..9467e4c3099a 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2985,6 +2985,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10=
k_firmware_mode mode,
>         clear_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>
>         ar->running_fw =3D fw;
> +       ar->thermal.temperature_unanswered =3D false;
>
>         if (!test_bit(ATH10K_FW_FEATURE_NON_BMI,
>                       ar->running_fw->fw_file.fw_features)) {
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wire=
less/ath/ath10k/thermal.c
> index 9bb486f8e920..1079d552cff4 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.c
> +++ b/drivers/net/wireless/ath/ath10k/thermal.c
> @@ -75,6 +75,12 @@ static ssize_t ath10k_thermal_show_temp(struct device =
*dev,
>                 goto out;
>         }
>
> +       /* Don't stall every read on firmware that never answers */
> +       if (ar->thermal.temperature_unanswered) {
> +               ret =3D -EOPNOTSUPP;
> +               goto out;
> +       }
> +
>         reinit_completion(&ar->thermal.wmi_sync);
>         ret =3D ath10k_wmi_pdev_get_temperature(ar);
>         if (ret) {
> @@ -90,7 +96,8 @@ static ssize_t ath10k_thermal_show_temp(struct device *=
dev,
>         time_left =3D wait_for_completion_timeout(&ar->thermal.wmi_sync,
>                                                 ATH10K_THERMAL_SYNC_TIMEO=
UT_HZ);
>         if (!time_left) {
> -               ath10k_warn(ar, "failed to synchronize thermal read\n");
> +               ath10k_warn(ar, "failed to synchronize thermal read, not =
asking again until the firmware restarts\n");
> +               ar->thermal.temperature_unanswered =3D true;
>                 ret =3D -ETIMEDOUT;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wire=
less/ath/ath10k/thermal.h
> index 1f4de9fbf2b3..cb930da5c04a 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.h
> +++ b/drivers/net/wireless/ath/ath10k/thermal.h
> @@ -19,6 +19,8 @@ struct ath10k_thermal {
>         /* protected by conf_mutex */
>         u32 throttle_state;
>         u32 quiet_period;
> +       /* the running firmware did not answer a temperature request */
> +       bool temperature_unanswered;

Maybe just "bool broken;" or alternatively a new
ATH10K_FLAG_TEMP_BROKEN dev_flag.

>         /* temperature value in Celsius degree
>          * protected by data_lock
>          */
>
> ---
> base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
> change-id: 20261022-ath10k-temperature-22b119fd615c
>
> Best regards,
> --
> Filippo Falezza <effeffe99@gmail.com>
>
>
>

