Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2B9C55184
	for <ath10k@archiver.kernel.org>; Tue,  4 Aug 2026 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=; b=3x3g+DAelkOUDHUyyKAaAYb7tW
	Y5/S8zJ6eJxOKMXQzD9RRY/QU+5bNJa45is1e5Y3i8Bm/ukhibK2Z82FbQN4erYuTmAtGc2oBX6jw
	HmaxsaeVoEM7Y+ZK9KrH6I4kYUTGeaZe+Hzuk64lE/a8R/MT7hLg3F3CmOlbg1oguiIFF8z9Vh429
	uiOBMEfj9ooaGcMiTknwLq9xkCFMXqEgEvU+aFfQ69zcvlT90p/uupkScBbDBLgEJiqutQ1MSA/WF
	8RuLiCHIhDU8by8Wc71Fylxdvd707ZmzlOlr9q1PgpRjmyZWSM80rSGgrjTP6+ZibahJiyes5p3JA
	KHUA2C0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQJ-00000001xI1-1LZi;
	Tue, 04 Aug 2026 13:43:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQH-00000001xH8-0VdM
	for ath10k@lists.infradead.org;
	Tue, 04 Aug 2026 13:43:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXO6C185698
	for <ath10k@lists.infradead.org>; Tue, 4 Aug 2026 13:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=; b=gWSqX4AnlEtpxj6Q
	Kolx19zNihtI79jb/u5x93/3RIRF/ynzmhH52E2pAWDlIG40klO9F3WYrDnNecrA
	Mvfb6nxJuTNXh4JIR0ajkI+lba7CtsfsM09qOuD/mdptyX0Fkf+w5a8+m+IWObVr
	aoTJeUXIt42+xRXjKmsCzTEjliHe6lqAV/6HQxo0H/0HTZTXYesd8+gx2QHlfItC
	Uew28HCg6lftgQb+cr7Mj5MnfKzClGCf0NxQGhPFOyFFZNWAElTdp0VHyA92Nsf9
	Dys7phUWfnLavtU7rZNonD8m8pk88xbX8sSZjkD/5YryOFt+sg1FIwW31MLvK0VZ
	D6JX7g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4usgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 04 Aug 2026 13:43:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso50479366d6.2
        for <ath10k@lists.infradead.org>; Tue, 04 Aug 2026 06:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850990; cv=none;
        d=google.com; s=arc-20260327;
        b=gi1GAneid7BGf6U3Fv/PLXuDkDMo7vjasZ7Vz/Tsstm0BNzgIdlA5yiGP4YOIqD4WP
         pH4t9H3p82kX2qEgHSwTYpntfuCdiYanoNcB5HjjV3YQYY/+JORiHQY/xuEvNXAMDNMU
         DT0imCQ43R/z9zZ4MGBCRij749X92ILy77VQaH2nPB8Qxlkq8tZd0mY8BETZitBmLrqC
         tHbBtqkHF84bq4hiWDDPTiaHuPnqMVTQiEE2fB+tsiLI2dtsHRDyQ81D+/GkdkMZdrox
         K9yXnb5EwHNf0DzeppZ5XRQdVasomwxI2q47D1H5x2dX0WOULiVXLlZhFDnh2aAtftEB
         oDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        fh=S/JInKdlTHt1LODsR8b+B4iQRQW8QD5wko27NXm87kU=;
        b=FRhI+xdsQkTZIAZSDPe4+NxOUcW3ftLNfw4LgA63005GUjWsPHtI93qvLqDvu6l0pZ
         Erb2Ly20jtT7iRGobH87UMB7IppL0myv6gRcYQZPUdBb/qD9w4Q74kG01564HpX0pSTk
         paBG4TJ90Bl0oYSCIllSWkMMNxSkUlE8DWFn9AR+p1fzpDtvop50sU4QdAdVWNghnNbj
         FKULsnUICEygfcgxb6fTE57W9sDcxv8Fw9bccXfCaL7y90JUmxDI40L7hcQrBKEMXZN2
         2EOIuDC9Xu/p5gIHClVP9G3g5jdyYyp0zLebiq9tvJ97us2lMDa5IXNlv5No/CQE1CJc
         rCOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850990; x=1786455790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        b=W9Xe7YdbOUG87qyGcbFMRRuj6QUOe5N+HdCTUksp6jnpe4xCcf16dQecEMsEmK0uD2
         /73SsJGSBNLi/jUP7yLMBntIZNAKkIR0DcSHYWwoFlBFq8jT1vkW9O99+LQwI+iUH6iq
         1J5xxDTs3H566Zhy6TOz0ZMeUMShq2SvXMxwmiMVOOntwwuzkzPskAFSlw1ogBrUUZGR
         4yag+Ss6egoxJnO84yBsh+S13Sk9TttteX3/yzOBthSJgL2CpZmccwNqC/ggY4DbJ/vQ
         xAnNAaIAK21yEkATfWUWYjDyV0RWK3GywYwAgR45OHmQ03OP1AMl8WoON3x59P1xo+ye
         EIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850990; x=1786455790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        b=agKJNFPOaYAmj0HyXhOx/j6xUWpP7G45lPxOsZoochpwwhZnUOAs+DkE0sZSR8RlRJ
         +40hU0Vxq3Tly+VNOLpgNYcdNhfNUIxOj+Dtel51hbfz+J9vpgJ3U84zcvEaZ7F1iLO0
         jphTt0JN/NvgR/x2Ik3nLH9EF7W7XptzvP2YJTJbzfPlR8O+avD3F1kOoYjSKqpkbMdT
         HB/EjbcToWbDk45HfZz7+PflD7PaKYymKj+MNRUO9XUU3Lxt/9PtaXEeeqomlyTnnyoS
         E4DtJuc+RF1ONg3FpxpMWI/N0jWU92526DEVtdIW6mxqKHDiX8VUKCzWAhRaxrT6qAVc
         fv3w==
X-Forwarded-Encrypted: i=1; AHgh+Rrbj+F9rHa47A4ZXYIPFLB/b1Y2q28DGQAcoN7P/ios4rKoidcy9+iOpcWn7F8Mx5jvgt4Yp7o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7jMnN5jdi9y4VqVa2Pm0n/P6yze++CqHKPrZ51qYhS07H6G8B
	riJ5dhto+g70D6iPPxj0nR2Yf0xRXNIbT903quvmgaQcpk/WgcDb6RS7Q5khq/KBc23uhNB3oCq
	xoJenujIRAAeW0D7WTUUptIdEKHO5W4NnKojB2kqSCj6fVQVAIiLWK86IrhyX68hnCgchQUKQfn
	r1vsNc5HCjY8jR5HXOLyx3UdL1V+FVMyOpXWmjz48=
X-Gm-Gg: AR+sD12WGx3Et+AgdciQ1qF6VXNZOHCs+AVaAEt+1GtiqXh8Yl9x55+4iur7A5QppeY
	H4hfbHIoK4Ma7UHjyNk0uxcyvJ8JUl5IKS8Ka4A2ND2bOHDCPtx86MSzlgIom1pQfQ+CezLggbO
	gVfflrvGE6/G6AjBSeGbdL2nm8uI8W2Gi2Yp7k/0oMWewG+zCS7sLvrn7wpA==
X-Received: by 2002:a05:6214:20e5:b0:8f3:ba0f:e7b9 with SMTP id 6a1803df08f44-90849603117mr235603286d6.18.1785850990519;
        Tue, 04 Aug 2026 06:43:10 -0700 (PDT)
X-Received: by 2002:a05:6214:20e5:b0:8f3:ba0f:e7b9 with SMTP id
 6a1803df08f44-90849603117mr235602546d6.18.1785850990119; Tue, 04 Aug 2026
 06:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com> <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:42:57 +0200
X-Gm-Features: AUfX_mzk0wJt2Gak_njsh0rcAEI1svN-3axItB8B6ASWCCxtH7hxRBo8wnhVM-8
Message-ID: <CAPx+jO8rMUaw7MAYpfp4cLASZ75mfFD4n3NOi2wdHNVvnb4rbw@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a71ec6f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=F73tXhIjRpzWiH7OJSEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: hZ4b1kKw2vhrZNGmKng1clK2W0btpTCR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX57iXiOEdGsiv
 euOKxoBBRUGYAm+ApQC8v4tvcy9ZHfOCRNRjcI6jKEcrZuGXReXFkmGb7nuEPgWZnLA0TgJZupe
 /DL+FJB3fC+AoyHgZxupQzILGeKyHbA=
X-Proofpoint-GUID: hZ4b1kKw2vhrZNGmKng1clK2W0btpTCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX3VIOdm/nuNE6
 MhQSsquPFzFuu5Ts4+4DkR+J5G37inbh1WuN3gHLQkD/11Q2gYO/GGuHA8SL5eN0p7IxYaEyLib
 +i7iP7iczValb/MwDomdqqyCPehBOlChGSTUWw2d/ZX5Q3RVDFk6SnczCBKYTc10n0MPU6Hajdj
 1Gb+vLwZ+q9Qohtli/SCv5uG3IPSfNAzLq9ShdnKleHPCoVUEgPcvf9AtllO3+cqIAR0ObTRZL9
 0IdZo1ejX3Y4xzR0RE/OpQt10TU0SPvKbsqWhvlyhImOc0WLgmrqI5t5m5au99VZE5Gbuvg6Yla
 wiIiQ08/ySelXqyXoKXniaC/lRduZKVuTXYGtOfRp3cv7Rag9g3zNf8JbI0V5zSRUt+2VDBsdgQ
 Zi6DSjIy2RyJQUTB0uhC9gnjRvQmCh0OIv4sL4TE2qt+lel3AlfGkelt6S0Cqh1Pou7yxjW118p
 wcrTyMeEYBQv2NuOd/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_064313_166715_B4295A1C 
X-CRM114-Status: GOOD (  20.65  )
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

On Thu, Jul 30, 2026 at 6:00=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Allow an eMMC hardware partition node to describe an NVMEM layout so the
> partition can be exposed as an NVMEM provider. This lets a partition
> (e.g. an eMMC boot partition) store device-specific information such as a
> WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
> cells.
>
> Accept "fixed-layout" as the partition node compatible, in addition to
> "fixed-partitions", so the layout can be described directly on the
> partition node.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

I don't think there is any reason to push this any further, the
updated mmc binding is ready to go. So, applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml          | 23 ++++++++++++++++=
+++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Docume=
ntation/devicetree/bindings/mmc/mmc-card.yaml
> index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b=
58a5fdbee218358 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> @@ -38,7 +38,9 @@ patternProperties:
>      properties:
>        compatible:
>          contains:
> -          const: fixed-partitions
> +          enum:
> +            - fixed-partitions
> +            - fixed-layout
>
>  required:
>    - compatible
> @@ -86,6 +88,25 @@ examples:
>                      read-only;
>                  };
>              };
> +
> +            partitions-boot2 {
> +                compatible =3D "fixed-layout";
> +
> +                #address-cells =3D <1>;
> +                #size-cells =3D <1>;
> +
> +                mac-addr@4400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x4400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +
> +                bd-addr@5400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x5400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +            };
>          };
>      };
>
>
> --
> 2.34.1
>

