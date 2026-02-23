Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520FBEC1136
	for <ath10k@archiver.kernel.org>; Mon, 23 Feb 2026 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMZVUbPRlhsPwvvYy5fOPbSt3iZilYmAeRJ1XOI+5wI=; b=0zk/gKrukr1lwoGCvr2/jfQkjS
	sAcPNQlIVLXIOT45i4aQ8cy+H8DdefkF6GFHigdyXx9Mjqrj8ifHddOdDYmcgc9NxFVT9gvHHqAHv
	bUbKALghgOV//dr3Jwtys+ZoHK21cgdOB8Dg9HBmp1E2N9Dl7OLA/iTiMbTLfpJgNBYP8G7eOER+y
	uOkL/hH1lSpr4z4A4aOuqGyXkrjTfLY8yLT6Wg+u1/1LpyXy9uW87Y9Xaq7PLAi1A4qnW67rsmAAP
	fMABJVG25EeJ4sADhGoa21FsGibWRvrgr5jB89e5V6TZigNqL7HT/AJmbIBr5IfcRv9vPp1v6egtv
	mnHEXBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucvT-000000012WM-2oOs;
	Mon, 23 Feb 2026 20:53:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucvQ-000000012VX-3S8c
	for ath10k@lists.infradead.org;
	Mon, 23 Feb 2026 20:53:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NH4OW8910235
	for <ath10k@lists.infradead.org>; Mon, 23 Feb 2026 20:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMZVUbPRlhsPwvvYy5fOPbSt3iZilYmAeRJ1XOI+5wI=; b=KI79qAKtF0Onc3WA
	hPbvyTG8nA/HkXJU5h4TcXDO0eSfLTKMPdLuTJ6apd3sfyBI2MSE7W0N3AOa43Q/
	grHlpf/17Kw7nCWHJfebd997MufX4yeWRcYS++h/tTI6OHXe06K4PrpSXukNgNmS
	PL4xPH3VyxeOwid8S0mnODKPniihvpgCh7JpSt/g8ynGSKwtREk+sTp3/2igHazx
	m+FDDWGWT02Xq0OqyXSC+n+er+uJwbV4XJz0ZjTF8Ri3DEkVB1qvErYPUglgzKnR
	mLB+6TNew/DWkcD6aF6AuecH+BPxSV3uNviJqEtP3Bn30j2RTq9Ksg1KazaDag5q
	XkgCsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj8nru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 23 Feb 2026 20:53:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946f51b8c8so317072936d6.3
        for <ath10k@lists.infradead.org>; Mon, 23 Feb 2026 12:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771879983; cv=none;
        d=google.com; s=arc-20240605;
        b=ewzPL41lwcNgRqGaf7jJUdxjAFK15PhJVf3LP7Uprf8IrIp05fm1yBt0xWzPCFHa7g
         10PWNxwJt66/upseyZ34JWOSecPsfRiO/Q4oVwD2WN9sQHrXTulnEWwDrgLBNkDKpdZ7
         bKAN4gS8iSlGwBlg9VkIN2Xw4x4v+iFzJUJFeoa24ux0ZmDZKSiZNX5R6oUN0K7Z/6xP
         Nyrjx+BwZSZeLpJa4/DSU/yb+Lu55nVT/MxW5NziQJN2SBqf8lM6myYmnr59F3feyIDo
         D+L7uG4rEOGVPQ/Q0qBWppuCzMWlY4JW/frX2ADv7ki2wP1VTiigta2QNkPiyXDLyLre
         YZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LMZVUbPRlhsPwvvYy5fOPbSt3iZilYmAeRJ1XOI+5wI=;
        fh=nIsb9VGh+abSlXWLrRH8PRREC53ryNtZaUiGd48qMIc=;
        b=SQShD1PMCdXt+X3HoH4nIHcE+zF0SJPSdOeyerQhKTbGeQ+Y3ipC/Amezz08JYCRVX
         5ctryCoHQhT65v+jvW7S0/e5XQQiENpVvml6Rj2VbCzBgHp81OsenTaypST/vRDQCB9n
         9p/ySEdgzeCfezmYry6x5B7+8kCUaUgXCQxwpx3lmIXnI7T/v8LLW251uehdMn8F1STp
         hSldqVZFaD5hCE+SBX0GYKYHF1U0vETqc+siXG+ABHd5oLd1nLTwl9JoKYoZnomP0JHx
         wz9/F52aFj1D84zKMneJtwoD5gQcSt7o9c1c9XxQuITtF8jC9J4cfUi0KBpKOxvyUPrs
         /Udw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771879983; x=1772484783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMZVUbPRlhsPwvvYy5fOPbSt3iZilYmAeRJ1XOI+5wI=;
        b=AZRQgTqB5Mj9/aT2GwndBIJfFoTmu5JMfxXxZLSTvchZ7JvbPwknokEXTLhJTLre9O
         jbinDC5OelBSPX10JlkMMSvC0OYjMF9F3raZribm9rTw7XPS+fGkeIRcNXaY1ydbQV9B
         Nkc0jWkwKsmPfgYOLD+r89PKgPTdY2GIfPiNeMt91aUpeUK86ZfUo8lBdtyvc+R6dZZT
         O18mLgAdA9t9YvtWizItAIE+2yILheViSVlt7nBRQzza0wG2uiB2AHjgsFCXehehREWw
         icwWXIJXCqs9oxZt0SwA6esHRq/+x0cgIauuSO1CCRO8KI3tA7NitE+zUBgzqTmCokyr
         xq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879983; x=1772484783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LMZVUbPRlhsPwvvYy5fOPbSt3iZilYmAeRJ1XOI+5wI=;
        b=aBdjFdOmxHJ278Ai7lo0rA32uZeIMCUGXnelLvyavvalRhwvt+XvmriXFuQZGMzjg+
         tI7f6D9tEh8ZhobcGg91hk+z3Q3VGVxoIUos55YRCtoPMPLb0NSKjg/4PWzI+Tr3oCJx
         1HuG6lJusIPruxGqT3moBh9fYpNzTim8NuGMrKgx6/CEwSpl3PRnJo6GfTJhYcTloEc7
         zOXRktksQ8Njw/ZoMB8VpPQRg3xT+3mDTTmzrXSRqOffYbC+PMw/t3pAmx35QrTfs8+7
         aFCmTSgQooh6STd6vUCv15VStTn5qm0bAWwVeigsLYU6BOkNoQggKSIqupeEYOpsSUyc
         Wl+A==
X-Forwarded-Encrypted: i=1; AJvYcCUt2IR0vEw02/EuPF3UyKVeQIMBYYNqZWYpNwINn7tSjeMON8wMxFxrXzWiLvq0j0ICJGhUgqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ6Q3sD6zvdJ2AiFeOyn0lcDTuvAXEYBUQMqV0Rnaj1qVWNulG
	jRDaCzG066RcVARVuFGr/OyqurZbZ8QbzFrdC7rMOzAMcftm4QWmNZQJ6V4JvjuwWEWeXj6pZ1/
	9sDrI8PL/92BvhxugbwZtSBwDxuxYuw7CtwYFYmkglCmxZI9doKResDNTMYYMnvr8fBwVosrJjU
	HqPzzAF+HURy6W9FPRpX2GGGv1FePMFJd/+pM3THA=
X-Gm-Gg: ATEYQzz6lIsvYh5mW9RhCfrBZgc/ZLADUU1qGaLyw4VCM4Ir2gANwKHPYtfVZxBnHmd
	C96zQWlR/rkClXRvXjR6ZxtNb0ZShTnhhpQa6PF3m0htImGlp4lPo4wzwz5QaepNzyVo4DHMmFU
	7kOBHjVhEJvmTaPSpHnSN7K0/sYdfXScwzmCyQcUDi0dbND4EZpBBjwE0PK0yXm7cMlHBxDpDb7
	x/az0+NxmEw8utogsF6cTKvhyT/j9v/9z+fhzg6
X-Received: by 2002:ad4:4eed:0:b0:896:f42f:bf18 with SMTP id 6a1803df08f44-89979d7fb09mr142264876d6.54.1771879982637;
        Mon, 23 Feb 2026 12:53:02 -0800 (PST)
X-Received: by 2002:ad4:4eed:0:b0:896:f42f:bf18 with SMTP id
 6a1803df08f44-89979d7fb09mr142264526d6.54.1771879982042; Mon, 23 Feb 2026
 12:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20260223024854.18910-1-rosenp@gmail.com>
In-Reply-To: <20260223024854.18910-1-rosenp@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 21:52:51 +0100
X-Gm-Features: AaiRm51myZ0XPmTyc8ptgY48vi5mlFNztPXeF0Morq79CXan0I0UtBgybpkVAYo
Message-ID: <CAFEp6-1RM2KK4hGOPy0_gBbsymu8WsbpFyz-dUHxC3ys_AVeGg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: use non devm for nvmem_cell_get
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699cbe2f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: OemsDWrG9TQW7C62LURLrYScQEByIkuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE4MSBTYWx0ZWRfXx70se2Sk4VKi
 YO3REUeqWewTsvNov6rBLfoSHJ17up1IJjZWQXsjTAbFUK8lhockVOXYggfdHfMhxxoOKWtShNE
 38u86uCBXenOYGiR5mEV4IQHtBDLtrlyXGSk1+NNucsxVGI6+4/4a/bHjGgpv/OyA0etwF7NpZx
 Ie2dkl+MC5mF0jb3WjEc4R1aNkNe/RltG9GGpfnAensGYVD2OIUdDDD1Fj++Ljq1H3auclnxUIb
 HlfO5+ZWRxwMWubWH8lBDltfCqH0Exb8A7FNPP22NxlXjukIsASMhw1D8GmUvpI6x7AshbUfQsR
 JIAMvyigwDxAdNheHLj3bXmMq9+7PJcPrPv6syCcitQ7HkbNuK64y/qC6636rjH4amNoPHhJbwr
 701uOzRPQU0UUxrFjk/iUfc+2speQzcUWjRuJ4+BSR9M0qcqTIC10XhjqMIdMocu2TjFubp/qSs
 rmCM7OdVC9Rqk0Qg/DQ==
X-Proofpoint-GUID: OemsDWrG9TQW7C62LURLrYScQEByIkuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_125304_888219_4BD1F2B1 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, Feb 23, 2026 at 3:49=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> There's absolutely no need to extend the lifetime of cell to post
> removal of the driver. It's only used in this function.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 5c5bd5ef7175..38c5f5f95433 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1981,13 +1981,14 @@ static int ath10k_download_cal_nvmem(struct ath10=
k *ar, const char *cell_name)
>         size_t len;
>         int ret;
>
> -       cell =3D devm_nvmem_cell_get(ar->dev, cell_name);
> +       cell =3D nvmem_cell_get(ar->dev, cell_name);
>         if (IS_ERR(cell)) {
>                 ret =3D PTR_ERR(cell);
>                 return ret;
>         }
>
>         buf =3D nvmem_cell_read(cell, &len);
> +       nvmem_cell_put(cell);
>         if (IS_ERR(buf))
>                 return PTR_ERR(buf);
>
> --
> 2.53.0
>
>

