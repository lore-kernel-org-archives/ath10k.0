Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77790606A32D
	for <ath10k@archiver.kernel.org>; Wed, 28 Oct 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aIYr30BV;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PubdOhds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPLMYiro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nMCl26GplXZxVfA3z6wvxxHkOSfHu4GP/gV70gc3/S0=; b=aIYr30BVyof5jK
	Bho2n/g7ryYEQydXtic/KmC02o9zB3Oe+zWFpxaA9QsP/6xTEo+ZFBQt5Q8cUSXUV8EAt0dhbA+RL
	NMMglYrIdBZcC4t9mBgy/8tsJ7sedZLnSh/hJMvDqx483w9nzQmibe3G/L1kZkhKeJOt0rqjHY6EI
	6+AtkoUS37Xk6+HrjAoW5iY4AdDMGKiz8xYOGWoxcHOos6QVLO3pN/aydonIOXlOYPEiE8MDw2sbF
	Q57yBbyjwuxRF0G65NpE0elHeAcMsfp/sCJGguS2Asi1pAqT3OhEaryrgyjurj/9QFk+Gh/NWK2+l
	Ig6WyD3SBX8sajtJ+pjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6ag-00000007Xwj-3upK;
	Wed, 28 Oct 2026 16:33:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6ae-00000007Xw9-1ISB
	for ath10k@lists.infradead.org;
	Wed, 28 Oct 2026 16:33:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAd66423516
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 16:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMCl26GplXZxVfA3z6wvxxHkOSfHu4GP/gV70gc3/S0=; b=PubdOhds053PXJgr
	tMN3WnB3XG+pyAjJvzQ5K00+Uev9qdAHKDRu6MCYn7rE0BkbCLqRff4xtGL/koEF
	9l+UkQI3L/BLuXaWsQWRheuI71wCpSCC8aAnLiTfbYPSLLx5WY+g9EFDhhiJ3MoG
	gYjt/jOgiWY1gO1UB3Cj8ldnfweT6MgDxlBIoaNjkLhOJVhAwYYXD35dGq6E9Ow3
	9/GtLPvBEYSIiKXI2j6iCLNLkdbJOmmM8XoazOTyfkXKLhXnv2Sr9B9gG5jvVwvG
	DF+D6ejgIrDKBZQ/JmmxuzblndpbUfvKQgbVWUroysTbvdwxT0GYWdblwJ3N62Nm
	ZqJdKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1vj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 16:33:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so229234985a.0
        for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 09:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793205205; cv=none;
        d=google.com; s=arc-20260327;
        b=CC1arWE7WqbQhhIIaEGTn+Xq+E2scBgM23on2gdjZ0E8NAjj8PcLSuMMW01Watu6Tm
         EE1aKbSf0uZoMsYCXhL01pjkXeFRm8UVTXHyv94IrP8vGQsZSBP1MahO7a8UT1Bb2Rul
         3lQm7ioOkIDUrjH9p/KrnYds68uJ52a6idemGw2HtGM9r7bNWj6jzO2tijsPf8BD60kK
         WqfvrXPYzFeAeRqfJDxYexMhSs3u1+bTb+cEIJtRcK2N0WKFOYK+JhusAt4LR5zffu1Q
         keQlgXskdW7ai3+iogKNvcB/rwZ3pigCsoPFAJJNnc7nUjh2t00Nr5E53y1ubQ9oxSqJ
         Oflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMCl26GplXZxVfA3z6wvxxHkOSfHu4GP/gV70gc3/S0=;
        fh=I3ADZt6JkwzXm0vnO6F52OmklC5oLA5P2DXa2Wl3XSQ=;
        b=Ijro3PBeD4VD1PDehwiA0hZ1AujWM54yrLimFhIaZrldDQro11j1bOQjwvWGrH5c1Q
         iE56bxRc6g+UQ8eA/Xy5e7Cn66sx+QmKxYkPkRwOTBNv9E7xu1CWIOnmAEQsixTxk0Gb
         /nTfpIzePLIIsF1Kktzl7H5f3FcsOEidMiX2TcLqudo1OB423x8fs/PjfewLBmHqTVrz
         hpGSqW9DXeDmNJkH7RlyASBghltmGcFE7fgGXecxHTylAgmY4QLDjxcLsFRpp+9eZBUd
         N0XMFPKvQ5YFHUsAyy88DJQka0zoHqCTYgCzzKfXhPTd8UqhyC6kz3Yliw86MH3Koi2N
         YZBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793205205; x=1793810005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMCl26GplXZxVfA3z6wvxxHkOSfHu4GP/gV70gc3/S0=;
        b=YPLMYiroxeI9c91GU85S7xorFxDXLZduUNAuf1i/Mk1ZQfwUsM/cho5DqGuykOqJJ/
         9F/FZRrXF/53/jGdrE/T+gDKF1aln4v3JuqECQwYzPSFSHDaxOP3RqIM3IIu2mvpsqM+
         EfZhRhiby/NK9BUE/jjrPJPkfW7iSn85KwOje+OxzFcfKLlcIMJTjQCjY5ju5TvMnr1N
         u3VxCcbIJPQ3r4YtJnJ8Gs7Lqxz2Z5wRgHXfuJu97tBXPYyZ8nw2Fz8O3HcxRwKOJLyr
         e1bdXH75oN6yIDmNcv2bOANwb+5fTl+eDI2ZI5c/D3XLvXcaaMHjstTcP5wlUOoVWcLS
         f8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205205; x=1793810005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMCl26GplXZxVfA3z6wvxxHkOSfHu4GP/gV70gc3/S0=;
        b=TVj9kk2Uqsok77NHX76fO6/zzlwCvWLoE+RLQ6dxjRVV8DB9bE7jqzzPOIMUYDqoVI
         DEC9+hjtKDsYYJpny06dhxZaRfyF+MIU3aXULR0CXUXBs6bbaK1jqRKHoICf1eZ/1Wnk
         bGfdoTDxnRTIoWipQzAvONX4Ya5xVYwsCQh7h4iT7TkG0EpCDBwtA0i4LzhusQuQmDUy
         sYs3cgiwbNTaeOyMhoaIPAeqO1y8xpFSatL2Av+UkobU/g7/XbBINvwSEHo0VgGulgQM
         BDPJLLW2uRX+dQS3BY49377dvzS5kKmGiPldwULgGHS8PdrlblNT8sBXKcDgLhRflrRX
         KVXA==
X-Gm-Message-State: AFq9FYITZq3o+vONAj6sElWpTzAwT6F5UVJFK5uSgpcPaD3M5K4FuW3d
	FEKY6sFDEV0CdhQdoKjXGhB1YQMUjLeOhnx4X09by2rwkfGuMcz87Ih5n5maw4VUVgTcijZD2u5
	cKDkjLqm+4O/kevQxtRxay+EMepiPulHC4fY/0QePV+IB2Qlk3zRd8pBT9MsJkkXuuHC6gJcTYp
	vsvF9Y9BX5fqW+rbdinA8YT+fWIsnGmMvzk+45K/HrYsKINC4=
X-Gm-Gg: AYBFou1wFzlTJLcWn9qvM+4jlNsYmchiMxWtDMOXwqoYEx62T5EiOQKlYNZ4+RKfqZQ
	HOe/ypsiVikRrtBCJM9wFgqxtSOT9DKGhIJ5eit89gOCtHTWD0s3RZBxgX5Aa5D6SrNXFSajCeK
	vD024/NG5k8fwXrxAcCbhdtMyY11xw4oIlhd7QxiHNdm20fx8Z149j7FcIxCYF3O5to/9epwzXB
	iPIm2B+X7e/xmymkw573e216d6MUQBp8gCmib1fqvUn/d+TTEBg8bZnNT396aSu90f20EnPQQbt
X-Received: by 2002:a05:620a:2988:b0:93f:6c67:152d with SMTP id af79cd13be357-94408cff37cmr414897985a.38.1793205205514;
        Wed, 28 Oct 2026 09:33:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:93f:6c67:152d with SMTP id
 af79cd13be357-94408cff37cmr414893485a.38.1793205205076; Wed, 28 Oct 2026
 09:33:25 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028-ath10k-maint-v1-1-1e6ee9fb2616@oss.qualcomm.com>
In-Reply-To: <20261028-ath10k-maint-v1-1-1e6ee9fb2616@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:33:12 +0100
X-Gm-Features: AclHuK-FAaiso13VSs1Q86BX-7mZZKYFl_4QgbBTTpBl4HJMDxaY_XPNrodUpd8
Message-ID: <CAFEp6-2RH0FMkFRtANS=TWVRZ1tOUAUYYA47CasK8ypvE=nFYA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: Add Loic Poulain as maintainer
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: puaK-QlysdOw0qPf86_-CS51S3U3ci6g
X-Proofpoint-ORIG-GUID: puaK-QlysdOw0qPf86_-CS51S3U3ci6g
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae223d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=vd1Rj9lYTNlzg6lyGooA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NSBTYWx0ZWRfX3S1Rx7HguSJW
 UaCqN07MKdUV3NSGazgSwWwDX6ma5lNTFbpHxdHWs0zceoB+w6BbceUj0vYGn1IlCwuNnpgyPQM
 P/1x2cU6Jh784oS96gx2/tMFEMUMnUViHiCHkVtPKyo77rTTz3VbQb9CsIfZKRJqJ0nVCSqCQI9
 O26oMhy8Aq4hXcAjNnAc2Z/FmDetwy8M3Hx5+VezdpUADrPO9AwPFmR/2FXmqIr6YgOsLm/SN6S
 XCbVy5InOLxHjcbc8O851r05Xsnm4kudGb5lwO/LJOdzeJ5Ld6o3ZSWi3BVM4AM6Y39l4eHh3oR
 ekTpuIfNNhGjLNqR/zZE196YtH0vR4jwMfWxs6kyXLOBBIiQxlt5+OjglGOIT0flSbbjUcrSMPt
 hIab98Pz4dHagZyFhFxbslBJVqS7aLf0PgQja5H37pPdIlUHMnIiDXbpsSM7rUN+HBF4Vye8cD8
 wN9iclPNmmq+5p6i5TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NSBTYWx0ZWRfX/dse1kVhqPos
 kDfdnyUua1//8CzZwlnaE6BgDoAFgif2PRo0ci4laV3dP0Ow6enFkN+S57GkVbzom+ABf16Tnaf
 iCiu+a+gqWTqChcWAn9ulGm28/XcKIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_093328_483746_A002F5F8 
X-CRM114-Status: GOOD (  14.89  )
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

On Wed, Oct 28, 2026 at 4:19=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Loic is maintainer of the wcn36xx driver, and is now actively
> working on ath10k, so he makes the perfect co-maintainer.
>
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc64d98a080b..7adcdcc77d5e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22417,6 +22417,7 @@ N:      ath12k
>
>  QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
>  M:     Jeff Johnson <jjohnson@kernel.org>
> +M:     Loic Poulain <loic.poulain@oss.qualcomm.com>
>  L:     linux-wireless@vger.kernel.org
>  L:     ath10k@lists.infradead.org
>  S:     Supported
>
> ---
> base-commit: 6a9b6e4b4fce0ba899eb6f830736af565a2f4fa4
> change-id: 20261027-ath10k-maint-e5343748ec7d
>

