Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C6606A32A
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jYngucUU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zf00+kHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=klmkOspt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=; b=jYngucUUQzaY+k
	ONAwCh6WAvCAfZOg3dgsjrkCaSqCcCrncwEwbsrrHz8jfCDajPBiOEko1lr9H6KBbYJfb6mbFzkmK
	O8AEnT8llQMHPbU/xMJ17E2OeklULu+jgSBxeqNbpRpPTAjx2RygoPtHa2X9SFJh07wu8xBJS2vKn
	QdbbOYXLpTbRg6Df3q7WbK7B26uyBE4okkNLoOq+rIj3KNOvbHvyV8UzVd1SmzQnhYlr+KxjLEmuf
	aaNU9EueevmN7R28eOpk2iAeT42SS8KOmmlvBSw3sBffaFrkLrOESWSVWmkqZpBaqtb+QwKh9bDMl
	S3hd0BPSr8QJ2kXvwWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnDk-0000000HOTC-15kx;
	Sat, 21 Nov 2026 15:41:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnDg-0000000HOSq-3t8M
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 15:41:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFabbR2563186
	for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 15:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=; b=Zf00+kHYG0nXv34R
	uTOrosKKQBy6BVaqL1IvPXEI/Uf+CQnI1Ajk6ucZ3ELCIllSNbsgbycGIvtsEzcX
	wCDl1fbGNDf6YLEynk4b9VFFbxsij6jAR9c1tRc+p1gjL4bcU84QgEbnZ3oPL2r2
	tFa6UWHiltGB66Tzk0FSIbu8XN9MSruR/BeP3HGUMFtxgM0RAcZsX8etsEOdlD7h
	j86zbS1agFGHdPfk+uCecXjR8h7CY2JZ4fHq1C1Jbz8TLeTsoh3KhYGAK8br1FKm
	+cJ5iFNaVSzsLYgS3FJY0g21QFKhAj0CKgxp0334cGKnH8sR92kLFrhT8SBSaq1U
	yv2XmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w01f45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 15:41:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso395345585a.2
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 07:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795275698; cv=none;
        d=google.com; s=arc-20260327;
        b=l3dKmxfpJTMO1t40a2Gxpgvdtj5qWkpWEjgX/CSXPqmktRtJkIMCwnpjAZGLnOdUSp
         x9fSwDPPpxfYD0d1TkLspRZkZRd3ZT6poXUgct4qRvUBypVyYEqrWSmP+rZ67JUetpl7
         PW6cjUcApCyvi/T/02tPr9f9mxQJ6iBMf//5LiETsS3fOsnWp2OJ26wPUbznm5bCWdcu
         CBu53AD3gVMVD0oO2GUoFlrOq2CnAoRqf4KFQxEnhfclj0V+GgerPtIXNu1JST5qLOqq
         OtM01hyxuR0jjhU/ELr8mtaMrbYupu3MZquJtf9HAr/G1xgyHowy2Km7VuuToZ0wcTk9
         hajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        fh=MBjZzw1j77PbAizcl0j563H/+Y9/YNHA21WEfiaseT4=;
        b=UwyiAaYWrmJqUpFlFsBO580VarL1fKDDVRW0orJKbpH1ERsOi59Bv6d/2GooKpuntK
         rxugkNKvY909e2kMIaRxYAykRttTXR+dxwMTwiW1y/v2SK7SikjuxsMg0e0cuy7hIE+/
         +SwalLu0c9oievrnJwiGr8R59uoRtVVDKWCA+xLzdtfiiHWYKIhzQ+6OHYzG/qt6g+uW
         KACZ+LlppyePs6dgjWRDKMmawd5fKI8WoZr3LTHt7vAIrzZfvwzucwOBHnQNCnEumWG2
         pJSTQjshqoljUkRXOlCHbC39MuzFTB8I+hFmsNLlw0oHuLE7Cc9pAXDwWM2omqMq6lWq
         Ygfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795275698; x=1795880498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        b=klmkOsptDif/+NahpRuob6jKR7miEOyFAXMA/Ax0ihLWRWhFxouefClztHO1gc/h+l
         0nbfLdkaAZlsaLBZJAAnurqNHvTzRDVfxqTBtLPB2b9R5iCtGpm4+MRENlIebPfr0fyb
         BbK88KChPJ/bJroPJNk0lXrF8DPM09YyT74U1niToBlMz8KuRAk4beol99D+L9ArdLvG
         +HMFaHdBD3O4XEzeTIcMP8CRj+5r39VTCKkOONFgMq1FdgIalSeCh4IWl+5oiAgKxR+Y
         JNSw5JPZjGMZTMddNrTgBLPGJKwnjIowyQ7Z07I6k37NujzW39oI9WjaUCkwC1UwVKh8
         FIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795275698; x=1795880498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        b=JtnhNbf41s5LjD0VH3AxdjVxml5HdSXg6ntf+JXyNcxfm+2dlpl54Rmp3ib+AWvkpB
         7bo56yBiI4OCZ9Mt1BjI2QeQrvS9jGNqyn5n4PuaPq/7SdD2dQtGMcphyBGPlVcTAqL4
         g+RvnS1tdg1xehZqB3xqFElthNhO0NhQbXEMApH47jZRqXzh0TJEA4WwYORdpfHm2Tom
         QB4aB7FUkqL1vhJTCElX7FHvRkAdM3vZM0DZpmY9+xUoUomgcDoqt+dbQjenZkji9pTQ
         ytjUnRLkzfIdVp1k/084MFPfoyyH4TglpdsSvLz2TMkHIk2ygvSUX/8N+D64EORUEuaq
         u+UQ==
X-Forwarded-Encrypted: i=1; AL+hErGYgtMo9TV5QeMm/3v7TDXbqgUVgRiodSanRTnjAXwrtukhCRUctega7mOkG9SRPNsTFdhRM6c=@lists.infradead.org
X-Gm-Message-State: APuU4Z8eBghvuLXYAvN0iGk8Y5HTyxGoi+d9hKup69NqtkokDmOrlnIT
	wi4yqDswRiDusx4EYPxhiwKe68UA8szkNw1CZ7xgLpsuiwif93sPe2xYf7A+l3ZFSyvagRMiKRi
	UXtKr8ar690vwqxL7/4z0T1CsJtQGO7y4ffiOfzI2FIefw5/7FZgDkwNgBBfJoYEUylonltCM40
	ALFtYXf/CCZPi1C6snzQZ7F4R5d5GazpwyMXMIRuQ=
X-Gm-Gg: AZFdTZfqfFmgtWnMfMO3JHUyvURDQHVlHHNOJrw90/Vm1Sh7vXBt67QkjD0YbvaYcKC
	2lye4Z0Ht1lAzcDxF5MRjwLHq6Bc3B1814Zbg0ucsjcvm/0qX+QrY42I6zoumMWdTgJbP80Z+ir
	fdd/x9rY6oQyKyq4qUyVGcN0YqflCGyWO87PMqdyBGIj+VtlDgooykNg6E1Eu5CcyWv4W5ldQFs
	DzIAyLnW5ARa+w5ve6J1O2wFS4wvT8SwpaYR9PR31jhd7jJS0VP53WdwlDMQ+YQcEObjoedBNU=
X-Received: by 2002:a05:620a:450e:b0:949:6fb1:b422 with SMTP id af79cd13be357-949ba9b7194mr1114808785a.16.1795275697844;
        Sat, 21 Nov 2026 07:41:37 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:6fb1:b422 with SMTP id
 af79cd13be357-949ba9b7194mr1114805185a.16.1795275697365; Sat, 21 Nov 2026
 07:41:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120202652.344435-1-mick@yoxcu.de> <20261120202652.344435-2-mick@yoxcu.de>
In-Reply-To: <20261120202652.344435-2-mick@yoxcu.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 16:41:25 +0100
X-Gm-Features: Aa3M54pCyq3c11vW8Cv8YJB0fq3KEU2hM8dxCkOG_3zQ7oEIL2UMWXIcnugLorw
Message-ID: <CAFEp6-39PaCm5JoFVwpYQEuM7Eg0xDKwWKnripuDwh8fVXS24A@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath10k: configure the WoW action frame wakeup filter
To: Michael Auer <mick@yoxcu.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2MiBTYWx0ZWRfX3j1Fr+mmp3Rv
 cT9r7QgfouJRXL2eUpTn2xEWK4AslmampfDnpiuLZlUVgMgmFCiOho3iBLJPewxygh1VhV97T0E
 uvxOim0y+7se2f+7DxWP5OcrHoZBvH/jWbsyb2zxJuRAs6HfH1SxEeZ7Svk3PqO4SmNTj8lfgw7
 J8U7BCu3eJ2JOD8Yeu+S+VkoYSTQOGPaec9Dfj66Xf8ovu5pOWO4rusSf0KK5f307CD3LF4WWo4
 Ow7ciO4gSZh388+Kz4LaIvYA3f5Bx/F570V+pZ4sXfvkbdXNi3om9eY9+q60cPyPPbFuboItF7i
 0tvhpK0VpBDXL08GT2ILb0+pzVFIR2TcAlJd6lFtIyvZZmDHOMcNWvvSMMak0uTURrE2VdTqWUF
 Y2byrbfb7UG0S2zLJ3IVyStSSN0b8HljcgdJvByaidGfGk4BFXVcXlwCLvVqZP6ASU0EmM3Gh7m
 IJsNVM+2sc/GVEfAWSg==
X-Proofpoint-ORIG-GUID: JgZubPPln_JfJlL_j2FTdp0kHw5nTV-X
X-Proofpoint-GUID: JgZubPPln_JfJlL_j2FTdp0kHw5nTV-X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2MiBTYWx0ZWRfX4AzyX+Bi3XZw
 8Q/4+KRWH0oLBS734f0lIzMEtaI+mtgi7pgs9cVwq/O6IM3ZVVEANBKnmZzqpgdJYAHzCMyeEIm
 m0uTbzbqKOJW8YJf3Ca6kk08TAvMPoY=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b01bbb2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=K619b0bAtYckEcRTAzsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_074141_113790_EF598006 
X-CRM114-Status: GOOD (  26.24  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

On Fri, Nov 20, 2026 at 9:27=E2=80=AFPM Michael Auer <mick@yoxcu.de> wrote:
>
> On WCN3990 almost every system suspend with WoWLAN enabled ends within
> a second. The firmware wakes the host with wake reason 38, which is
> WOW_REASON_ACTION_FRAME_RECV in Qualcomm's fw-api. ath10k's wake reason
> enum stops at 27, so the debug log shows "wow wakeup host reason (null)".
>
> Qualcomm's own host drivers (qcacld-2.0 and qcacld-3.0) send
> WMI_WOW_SET_ACTION_WAKE_UP_CMDID, which sets the action frame
> categories that may wake the host. ath10k never sends it, so the
> firmware default applies.
>
> Send it for station vdevs in ath10k_vif_wow_set_wakeups() with the
> values of qcacld-3.0: allow spectrum management, QoS, public, SA query,
> protected dual of public, WNM, WME, FST and VHT action frames, and
> ignore spectrum management Measurement and TPC Requests. A failure is
> logged and does not abort the suspend.
>
> Also add wake reasons 28 to 38 and print the reason number, so unknown
> reasons are visible.
>
> On a OnePlus 6, 3 of 3 WoW suspends were woken within 1 s with reason
> 38 before this change. With it, suspends last until a real wakeup
> (magic packet, pattern match or RTC). In a one hour idle test with a
> push connection the phone was suspended 87.6 % of the time.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1
>
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---
> The per-category array has 32 words, like the 2018 qcacld-3.0 for
> sdm845. qcacld-2.0 and newer qcacld-3.0 send 256. The fw-api defines
> it as a variable length array, and all allowed categories are below
> 32. I only tested 32.
>
>  drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi.c     |  4 +-
>  drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
>  drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
>  6 files changed, 133 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wire=
less/ath/ath10k/wmi-ops.h
> index f3f6b5954b27..780c2947cc5f 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
> @@ -179,6 +179,8 @@ struct wmi_ops {
>                                                     enum wmi_wow_wakeup_e=
vent event,
>                                                     u32 enable);
>         struct sk_buff *(*gen_wow_host_wakeup_ind)(struct ath10k *ar);
> +       struct sk_buff *(*gen_wow_set_action_wake_up)(struct ath10k *ar,
> +                                                     u32 vdev_id);
>         struct sk_buff *(*gen_wow_add_pattern)(struct ath10k *ar, u32 vde=
v_id,
>                                                u32 pattern_id,
>                                                const u8 *pattern,
> @@ -1422,6 +1424,23 @@ ath10k_wmi_wow_host_wakeup_ind(struct ath10k *ar)
>         return ath10k_wmi_cmd_send(ar, skb, cmd_id);
>  }
>
> +static inline int
> +ath10k_wmi_wow_set_action_wake_up(struct ath10k *ar, u32 vdev_id)
> +{
> +       struct sk_buff *skb;
> +       u32 cmd_id;
> +
> +       if (!ar->wmi.ops->gen_wow_set_action_wake_up)
> +               return -EOPNOTSUPP;
> +
> +       skb =3D ar->wmi.ops->gen_wow_set_action_wake_up(ar, vdev_id);
> +       if (IS_ERR(skb))
> +               return PTR_ERR(skb);
> +
> +       cmd_id =3D ar->wmi.cmd->wow_set_action_wake_up_cmdid;
> +       return ath10k_wmi_cmd_send(ar, skb, cmd_id);
> +}
> +
>  static inline int
>  ath10k_wmi_wow_add_pattern(struct ath10k *ar, u32 vdev_id, u32 pattern_i=
d,
>                            const u8 *pattern, const u8 *mask,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wire=
less/ath/ath10k/wmi-tlv.c
> index 01f2d1fa9d7d..2a3b2bc2a478 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> @@ -3713,6 +3713,51 @@ ath10k_wmi_tlv_op_gen_wow_add_wakeup_event(struct =
ath10k *ar,
>         return skb;
>  }
>
> +static struct sk_buff *
> +ath10k_wmi_tlv_op_gen_wow_set_action_wake_up(struct ath10k *ar, u32 vdev=
_id)
> +{
> +       struct wmi_tlv_wow_set_action_wake_up_cmd *cmd;
> +       struct wmi_tlv *tlv;
> +       struct sk_buff *skb;
> +       __le32 *bitmaps;
> +       void *ptr;
> +       size_t len;
> +
> +       len =3D sizeof(*tlv) + sizeof(*cmd) +
> +             sizeof(*tlv) +
> +             WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES * sizeof(__le32);
> +       skb =3D ath10k_wmi_alloc_skb(ar, len);
> +       if (!skb)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ptr =3D (void *)skb->data;
> +       tlv =3D ptr;
> +       tlv->tag =3D __cpu_to_le16(WMI_TLV_TAG_STRUCT_WOW_SET_ACTION_WAKE=
_UP_CMD);
> +       tlv->len =3D __cpu_to_le16(sizeof(*cmd));
> +       cmd =3D (void *)tlv->value;
> +
> +       cmd->vdev_id =3D __cpu_to_le32(vdev_id);
> +       cmd->operation =3D __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_OP_SE=
T);
> +       cmd->action_category_map[0] =3D
> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
> +
> +       ptr +=3D sizeof(*tlv);
> +       ptr +=3D sizeof(*cmd);
> +
> +       tlv =3D ptr;
> +       tlv->tag =3D __cpu_to_le16(WMI_TLV_TAG_ARRAY_UINT32);
> +       tlv->len =3D __cpu_to_le16(WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGOR=
IES *
> +                                sizeof(__le32));
> +       bitmaps =3D (void *)tlv->value;
> +       bitmaps[WLAN_CATEGORY_SPECTRUM_MGMT] =3D
> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IG=
NORE);
> +
> +       ath10k_dbg(ar, ATH10K_DBG_WMI,
> +                  "wmi tlv wow set action wake up vdev_id %d category ma=
p 0x%08x\n",
> +                  vdev_id, WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
> +       return skb;
> +}
> +
>  static struct sk_buff *
>  ath10k_wmi_tlv_gen_wow_host_wakeup_ind(struct ath10k *ar)
>  {
> @@ -4272,6 +4317,7 @@ static struct wmi_cmd_map wmi_tlv_cmd_map =3D {
>         .wow_enable_cmdid =3D WMI_TLV_WOW_ENABLE_CMDID,
>         .wow_hostwakeup_from_sleep_cmdid =3D
>                                 WMI_TLV_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID,
> +       .wow_set_action_wake_up_cmdid =3D WMI_TLV_WOW_SET_ACTION_WAKE_UP_=
CMDID,
>         .rtt_measreq_cmdid =3D WMI_TLV_RTT_MEASREQ_CMDID,
>         .rtt_tsf_cmdid =3D WMI_TLV_RTT_TSF_CMDID,
>         .vdev_spectral_scan_configure_cmdid =3D WMI_TLV_SPECTRAL_SCAN_CON=
F_CMDID,
> @@ -4604,6 +4650,7 @@ static const struct wmi_ops wmi_tlv_ops =3D {
>         .gen_wow_enable =3D ath10k_wmi_tlv_op_gen_wow_enable,
>         .gen_wow_add_wakeup_event =3D ath10k_wmi_tlv_op_gen_wow_add_wakeu=
p_event,
>         .gen_wow_host_wakeup_ind =3D ath10k_wmi_tlv_gen_wow_host_wakeup_i=
nd,
> +       .gen_wow_set_action_wake_up =3D ath10k_wmi_tlv_op_gen_wow_set_act=
ion_wake_up,
>         .gen_wow_add_pattern =3D ath10k_wmi_tlv_op_gen_wow_add_pattern,
>         .gen_wow_del_pattern =3D ath10k_wmi_tlv_op_gen_wow_del_pattern,
>         .gen_wow_config_pno =3D ath10k_wmi_tlv_op_gen_config_pno,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wire=
less/ath/ath10k/wmi-tlv.h
> index ea18ed8939db..2af7c9df4260 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> @@ -189,6 +189,10 @@ enum wmi_tlv_cmd_id {
>         WMI_TLV_EXTWOW_ENABLE_CMDID,
>         WMI_TLV_EXTWOW_SET_APP_TYPE1_PARAMS_CMDID,
>         WMI_TLV_EXTWOW_SET_APP_TYPE2_PARAMS_CMDID,
> +       WMI_TLV_WOW_ENABLE_ICMPV6_NA_FLT_CMDID,
> +       WMI_TLV_WOW_UDP_SVC_OFLD_CMDID,
> +       WMI_TLV_WOW_HOSTWAKEUP_GPIO_PIN_PATTERN_CONFIG_CMDID,
> +       WMI_TLV_WOW_SET_ACTION_WAKE_UP_CMDID,
>         WMI_TLV_RTT_MEASREQ_CMDID =3D WMI_TLV_CMD(WMI_TLV_GRP_RTT),
>         WMI_TLV_RTT_TSF_CMDID,
>         WMI_TLV_SPECTRAL_SCAN_CONF_CMDID =3D WMI_TLV_CMD(WMI_TLV_GRP_SPEC=
TRAL),
> @@ -2202,6 +2206,34 @@ struct wmi_tlv_wow_add_del_event_cmd {
>         __le32 event_bitmap;
>  } __packed;
>
> +/* Action frame categories that may wake the host from WoW, as in
> + * qcacld-3.0: spectrum management (0), QoS (1), public (4), SA query (8=
),
> + * protected dual of public (9), WNM (10), WME (17), FST (18), VHT (21).
> + */
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0       0x00260713

You describe the bitfield above, so please add defines for the categories.

> +
> +/* Per-category bitmaps of action codes to ignore (1 =3D ignore). Like
> + * qcacld-3.0, ignore Measurement Request (0) and TPC Request (2).
> + */
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES      32
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IGNORE        (BIT(0) |=
 BIT(2))

Same as above.

> +
> +enum wmi_tlv_wow_action_wake_up_op {
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_RESET =3D 0,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_SET =3D 1,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_ADD_SET =3D 2,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_DELETE_SET =3D 3,
> +};
> +
> +/* WMI_WOW_SET_ACTION_WAKE_UP_CMD_fixed_param, followed by a
> + * WMI_TLV_TAG_ARRAY_UINT32 of per-category action code bitmaps.
> + */
> +struct wmi_tlv_wow_set_action_wake_up_cmd {
> +       __le32 vdev_id;
> +       __le32 operation;
> +       __le32 action_category_map[8];
> +} __packed;
> +
>  struct wmi_tlv_request_peer_stats_info {
>         __le32 request_type;
>         __le32 vdev_id;
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19c80..eca6bb189577 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4673,8 +4673,8 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k=
 *ar, struct sk_buff *skb)
>                 return;
>         }
>
> -       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %s\n",
> -                  wow_reason(ev.wake_reason));
> +       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
> +                  ev.wake_reason, wow_reason(ev.wake_reason));
>  }
>
>  void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff=
 *skb)
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless=
/ath/ath10k/wmi.h
> index 7f50a1de6b97..f1a560fb3447 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -944,6 +944,7 @@ struct wmi_cmd_map {
>         u32 wow_enable_disable_wake_event_cmdid;
>         u32 wow_enable_cmdid;
>         u32 wow_hostwakeup_from_sleep_cmdid;
> +       u32 wow_set_action_wake_up_cmdid;
>         u32 rtt_measreq_cmdid;
>         u32 rtt_tsf_cmdid;
>         u32 vdev_spectral_scan_configure_cmdid;
> @@ -7060,6 +7061,17 @@ enum wmi_wow_wake_reason {
>         WOW_REASON_DFS_PHYERR_RADADR_EVENT,
>         WOW_REASON_BEACON_RECV,
>         WOW_REASON_CLIENT_KICKOUT_EVENT,
> +       WOW_REASON_NAN_EVENT,
> +       WOW_REASON_EXTSCAN,
> +       WOW_REASON_RSSI_BREACH_EVENT,
> +       WOW_REASON_IOAC_REV_KA_FAIL_EVENT,
> +       WOW_REASON_IOAC_SOCK_EVENT,
> +       WOW_REASON_NLO_SCAN_COMPLETE,
> +       WOW_REASON_PACKET_FILTER_MATCH,
> +       WOW_REASON_ASSOC_RES_RECV,
> +       WOW_REASON_REASSOC_REQ_RECV,
> +       WOW_REASON_REASSOC_RES_RECV,
> +       WOW_REASON_ACTION_FRAME_RECV,

I think addition of the new reason and above debug message change
should be split in another patch/commit.

>         WOW_REASON_DEBUG_TEST =3D 0xFF,
>  };
>
> @@ -7095,6 +7107,17 @@ static inline const char *wow_reason(enum wmi_wow_=
wake_reason reason)
>         C2S(WOW_REASON_DFS_PHYERR_RADADR_EVENT);
>         C2S(WOW_REASON_BEACON_RECV);
>         C2S(WOW_REASON_CLIENT_KICKOUT_EVENT);
> +       C2S(WOW_REASON_NAN_EVENT);
> +       C2S(WOW_REASON_EXTSCAN);
> +       C2S(WOW_REASON_RSSI_BREACH_EVENT);
> +       C2S(WOW_REASON_IOAC_REV_KA_FAIL_EVENT);
> +       C2S(WOW_REASON_IOAC_SOCK_EVENT);
> +       C2S(WOW_REASON_NLO_SCAN_COMPLETE);
> +       C2S(WOW_REASON_PACKET_FILTER_MATCH);
> +       C2S(WOW_REASON_ASSOC_RES_RECV);
> +       C2S(WOW_REASON_REASSOC_REQ_RECV);
> +       C2S(WOW_REASON_REASSOC_RES_RECV);
> +       C2S(WOW_REASON_ACTION_FRAME_RECV);
>         C2S(WOW_REASON_DEBUG_TEST);
>         default:
>                 return NULL;
> diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless=
/ath/ath10k/wow.c
> index 92af8bc63362..5fc68e6cdeb6 100644
> --- a/drivers/net/wireless/ath/ath10k/wow.c
> +++ b/drivers/net/wireless/ath/ath10k/wow.c
> @@ -380,6 +380,16 @@ static int ath10k_vif_wow_set_wakeups(struct ath10k_=
vif *arvif,
>                 }
>         }
>
> +       if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_STA) {
> +               /* Without this filter WCN3990 wakes the host on action
> +                * frames right after WoW is enabled.
> +                */
> +               ret =3D ath10k_wmi_wow_set_action_wake_up(ar, arvif->vdev=
_id);
> +               if (ret && ret !=3D -EOPNOTSUPP)
> +                       ath10k_warn(ar, "failed to set action frame wakeu=
p filter on vdev %i: %d\n",
> +                                   arvif->vdev_id, ret);
> +       }
> +
>         return 0;
>  }
>
> --
> 2.43.0
>

