Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E10C369B4
	for <ath10k@archiver.kernel.org>; Mon, 14 Apr 2025 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OETJdvcRlTDOC3wxrm7MGgDibXakzm2Chi5+CwgMXn0=; b=gjTDYKQsyMPv1DDvF7kmI8L2Mp
	I5JZBvBKTap6Gfy1vMSoi6hUf64VY4gTSTd8Iz8ClIxdYWPR/oy6lswUa5r3pp7JAFk5vB67DyWkx
	WYVIYtz8F8aa07fTHOkeRjhPOx/82fAgCnDWprrBQFK/V3o6Xwd86v+9SHEu4qWxSIRgJC5Q23tjX
	EjpOgs5ZaP49QnXAbkHWvhCf/WvJocEW3/SV5JKoZ2WuFkefrop8QdXmtc+eqdzuSKysHki1MR/j0
	NEzm0lf5uHmroZzVJglMZfi10AqEu2Hi3lieeKhSOwMOtviz7s4roCHSuIP2Pe8GT5rba8g2qc3so
	mESOQj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PDJ-00000003F2b-0bce;
	Mon, 14 Apr 2025 19:11:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4P6m-00000003CJz-0fkh
	for ath10k@lists.infradead.org;
	Mon, 14 Apr 2025 19:04:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99mAs012973
	for <ath10k@lists.infradead.org>; Mon, 14 Apr 2025 19:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OETJdvcRlTDOC3wxrm7MGgDibXakzm2Chi5+CwgMXn0=; b=iqhBsErWeoSHj9J/
	E045fLrifvanLVRlAnodQyBohn4gGtolujIB2SUUzOB1CPk7IVZSQYJLnzv/sIky
	T2iI/EjCTc12ZsEw3TC+51CCdKIZky4cIvuF0PxxWJ1QdEfyWQMEx5WISqWTozZR
	rM11Ayg53i2c/y79QoXyGCeXXJCYsmEuQEnjWeFN86mEyLl/iwqpWJJJcrfgGAR6
	qGCdp3F3nWKNtGwdcWxpsSuW2WJBas6WpIyhrCDp1YII3DT/ZEGP1MKE8ClU1gvI
	E2U7vHGHi4J8dcbvE3dPLT6pWrPt/zwGTj7+8T2WshytoyYsSToeth72Ba53alWO
	gvdZZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj95hwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 14 Apr 2025 19:04:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91d8a7165so79860866d6.0
        for <ath10k@lists.infradead.org>; Mon, 14 Apr 2025 12:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744657477; x=1745262277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OETJdvcRlTDOC3wxrm7MGgDibXakzm2Chi5+CwgMXn0=;
        b=vkmefo/cluSs3NetL1zVXxz3MVOaTb/wwqKw1FY4FjzaDnxxkZ6Ruyg7Aa/Y7BMLy3
         4pccDZKaWvOkdxT3w0qGQY7+YpsOo6/DH8ug+xmBUwSBe+nVKgmIknLshOmj719Uh3+A
         Xp6efIDP54LhYlPtV+ueMyux1JWw1cddbNgi9AB579/O70+P6dOKM9PDop8yeqZBvdku
         yUb6tqKaUsiUqAmZVkZqNNTirRR/8LEc9yM7rbTf0AOoqNOW3sC/eL1I4Znj65gNL22D
         eZHnc26xcCw/Rd+ZnDfSxo6HhBeazIeiLWb6z2dgecOd1ljt6cihoqk2Eoh6jBkeUVeF
         qrog==
X-Forwarded-Encrypted: i=1; AJvYcCVdet0TI9EfCkACxfskY1v9ua3y7LkLrveDPZHa22XBFNoH4P8u40W83P0/G8kv3izBMiaTWvU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCdW/IaPq9mEx9PfAv28EX52obCKW4ytB72VjkzuOIFzkIH27s
	HbU/MMB7bOxYU3jCHPM+MF80zprvbFEDU/wohfkAyQBB+n3q2fvfu6l/JJ4NUbSOmY2jVMrBlBr
	GvyT6VhmESPQsJ0RcFEbv4YxvdzJ3GRfWcAOzP594Z2KBKUDV198WU6H0KCdxDGfyQqbwS+MWq8
	whznAJ1ESip/y3xyzYog2hFdsBCXw+UDxx9hI=
X-Gm-Gg: ASbGncv7wDzVWLVsi4a2NW77rjRKM49H3/oI0Fnj5TFyl+x95nhKElCh7B0XxgLl4r9
	JFVjNxr7YxxmCa3eoDOnZsikehZErObuaJS6mrelZqftywmDtAAevu7o/NkWuCBcW/y74a3Q=
X-Received: by 2002:ad4:5aac:0:b0:6e8:f945:ec5 with SMTP id 6a1803df08f44-6f230d9f19dmr188265116d6.24.1744657476377;
        Mon, 14 Apr 2025 12:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzelK//k2TwD46eVAuZhiJNjDOOOFl3EoM1T+XqSjz0DyaIMYpfLn3sF+Nm6yY82gIZ0h6m/EK/PQS4Vwle6I=
X-Received: by 2002:ad4:5aac:0:b0:6e8:f945:ec5 with SMTP id
 6a1803df08f44-6f230d9f19dmr188264526d6.24.1744657475883; Mon, 14 Apr 2025
 12:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de> <20250414-restricted-pointers-net-v1-4-12af0ce46cdd@linutronix.de>
In-Reply-To: <20250414-restricted-pointers-net-v1-4-12af0ce46cdd@linutronix.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 21:04:25 +0200
X-Gm-Features: ATxdqUFggdvW0Cci0Y7dRfrjAmK6JyGKc4MbfrCN7JALN63x-K56mHIpeth7yd4
Message-ID: <CAFEp6-26mFztO-AfGrL0cScGFMR5Z3Sp1KOsUvH_FoJfK+8q2w@mail.gmail.com>
Subject: Re: [PATCH net-next 4/7] wifi: wcn36xx: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Przemek Kitszel <przemyslaw.kitszel@intel.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: aUg-CRUAiXXUpUjakloPq0IZtw7h8L5c
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fd5c45 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ZS808JPYK9pMg9uJusAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: aUg-CRUAiXXUpUjakloPq0IZtw7h8L5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 mlxscore=0 mlxlogscore=995
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_120440_391648_3760C0B9 
X-CRM114-Status: GOOD (  20.58  )
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

On Mon, Apr 14, 2025 at 10:27=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping looks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> There are still a few users of %pK left, but these use it through seq_fil=
e,
> for which its usage is safe.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Acked-by:  Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/wcn36xx/testmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/testmode.c b/drivers/net/wi=
reless/ath/wcn36xx/testmode.c
> index e5142c052985ddf629b93d7b9687e6ba63a48e8b..d7a2a483cbc486308032709a9=
9bba9a52ed0ff59 100644
> --- a/drivers/net/wireless/ath/wcn36xx/testmode.c
> +++ b/drivers/net/wireless/ath/wcn36xx/testmode.c
> @@ -56,7 +56,7 @@ static int wcn36xx_tm_cmd_ptt(struct wcn36xx *wcn, stru=
ct ieee80211_vif *vif,
>         msg =3D buf;
>
>         wcn36xx_dbg(WCN36XX_DBG_TESTMODE,
> -                   "testmode cmd wmi msg_id 0x%04X msg_len %d buf %pK bu=
f_len %d\n",
> +                   "testmode cmd wmi msg_id 0x%04X msg_len %d buf %p buf=
_len %d\n",
>                    msg->msg_id, msg->msg_body_length,
>                    buf, buf_len);
>
>
> --
> 2.49.0
>
>

