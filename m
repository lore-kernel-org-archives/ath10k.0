Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB852C624DE
	for <ath10k@archiver.kernel.org>; Fri,  4 Sep 2026 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=; b=t24bTUFB9+nQ1oPlB9i5PTFcW6
	2NUOWUzS3uRcLXag+hrXhSbjzvHvFhyfLD4jHy1II5n1sXdz/Kanpo01eXb7GRoD20rAwid9Z+dmU
	94f7G/5FG1S54dMEM6CP32Y85F3/4oCFftq9JAdMkLw+RoARyr6pBfmxZUZSDESxe9zkd6B/q9vAD
	00rj7uq6Ct/QdGDkkgVIYSEbqHNmdMGmcQ8WUBtZIlWJiQLHli6pI1utzVsUJA6qMqxk+AsBJ557t
	35vM6EFA1Pm85V+28EH1gGsKD9jRxVjGdkgfrSiqnmN2jK1YmD8TgGBFBgj4EjiB6ZAzih42W/U+5
	ElpfNEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pbp-00000001SFM-23yK;
	Fri, 04 Sep 2026 08:49:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pbm-00000001SEg-3PMS
	for ath10k@lists.infradead.org;
	Fri, 04 Sep 2026 08:49:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mqCK4111326
	for <ath10k@lists.infradead.org>; Fri, 4 Sep 2026 08:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=; b=LLLWgy7x5kHSkJEf
	cKUpXSkYGkLubmh33Qp1ekl3zR4KPpk8MrHnMN0GSSstVS5gLOMsisTCzd/08KgB
	+w7EE0lYZBQID94Ka80EKQSn4C7KMZH6iivHtoVjKTxEXgTZNCHq6lKuQfvI5rSB
	Mkqip1Hfrq2rKNSkjV19duUZkHXbKiqub50XxgcfzoUdl4JuPBK5cZUx8mCpyjQp
	HG+SQAgl/fdh/g/H9Eo/baAdCSHZ8jekrCA31dMZb4RwFkLik1E793hGiuMwCZd3
	e/TR77OzaVLgdZhwzy6ouWFeVJanyqRop2MboGj2L9Fit1v6dapoEftLimQsn5Q1
	3HNWVA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b1cc61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 04 Sep 2026 08:49:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so1100810a12.3
        for <ath10k@lists.infradead.org>; Fri, 04 Sep 2026 01:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511754; cv=none;
        d=google.com; s=arc-20260327;
        b=IoafUb2PZSm+FrxOB9duEp8AruHrP73d5FF969woZ9xp3zxWcomQ1RLEBlZ+5l8eqs
         p5p0+6StkXV/arm1ETFBMlACKMjXnUgjMjWc/yy48TDzsEeOkUgjhS3v6dQJ4A1lRsAC
         C8s5Iao6zuG0BXQlHRIqAMCn2A0TliNNw4G8PEMJA5DTThpYza3l3XevjBOHIheO4K27
         tyrITLBHZ+Tc65t/6o6lFFG6ZnOvNlQ5FvRmPcLQ2TFBviyeQC8eXNr8rv5Np5wBDIIs
         zPEzBNQgj+6wM5XP34o33QbL+vSg1idzqX9295kpP4Xw7S5HaZimAhNRVuvKDYbIUkbm
         vVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        fh=StKc0YsjNfykld+IryWArwh4RjvoOYSFZGWS//hkSFQ=;
        b=V2vsL+JDBDK3087vVmoYuf0ETjifBkby0VBHBXlUqQQKlL1pKWjwIdUE23WjnuxPVE
         AKhshBaPunfgx9YHrBE9smJ3DZaJ4EDc/zga04p5aTfeGVxI0xn36RojkUR3sDVc8j0a
         3E0A1ox6iVDGLwcHsRX11+YyEwmXafGqswT1Un2v+OpRFxjqe5VSEg5LcPyR18ubI+VG
         MXk0L4LYXJtp5VK1zEVkp1vKnhvKctzNqSQFX/W8rA7EQMVPsZGrA7QiR34FS6sgOZ+Q
         7PddbLtYdL81PTzJqko6Vr9xX5OlXeRXfBixnUsicNRJ4p7iAUzBGHmevbZAXLsW5+Aa
         WmzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511754; x=1789116554; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        b=ILx7prWvuzADRwtvJTFg3KRFW5ristCu3hVNoYxb8k7+PRxZEld9gKUhGAJy5VdopI
         HwMTPA+C7vsIzBqtGRZ5n1uK8+emFy2yCGlFQz9KtEMxydhuV52Ri73Kn7YwlJ2ldOk6
         uJwGii+Oxuj27yPD7uH9FkZqq43tewVeBM3cI8oQaONHewFwhkMXzmv+wycWS3GALYD+
         luItBMCPmzYp1/N+8bMM2DboVulmAUBLaOJ5BuP+lPQD7JjGUFk9Mp9mFGPlQB8G817k
         2+dOg9SkXO5BwpNyNGuRs+ZBzUOpUqi0GBWsmIPNYg56gc/8RpljfbrqpOR07Q7SzPxh
         wafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511754; x=1789116554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        b=iNjvu6D4GX1GaNBIdhEm0zRsBxbtvMnwuvdpfVZIzXEMXbVh+6PXNI3rjqQtNYtu3M
         4YS0WK/sEAVXTnMjG7JCQaw8wqXwF2cf0juyDosbIi0plUCh44n8AY7kUxMQxvb/qF7t
         Oc+Neuu88oKj96M1oiO4AzTCt1yb/iGD4azXcLleDQ144v3BBYyGG1eRqJooDx19pA9U
         15bVKR017ZnWTGlt0nSCl2vIVT2hX0tWSMeA1tfUvLWHpiSJtycgELNVUt8CnZ5TvJxT
         gw28A/p42mUOvMf+LgYTrcMxbDF9nOR6YrCB9rTY81BSM/NB+K+DMpSisq6NzK+zPn5P
         Ph1Q==
X-Forwarded-Encrypted: i=1; AKwUvByWt2KZuGp53GGbyhXlaAs5xenW4sBbqdJDa3uJMWDKdv+KKnUTm2hT2Z3dHE0OikBJ60UBlrQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lTkAJxmlieP6bcX0ltKrzf6v/a84wiVPwczHHtc4xVcYpOglUR
	pR770x82r2/ig95bVy3OX3jmKd/jdHcNgDG2esRyT0cAcOmw6f84i7Bk5xWKIF1G8UesaWSsssq
	ihfzFSpzo5CwOvxz+g1Q6FbGhkkd5yQv9zM+MmuAmFczZ+OHGev0ilKOr9iAFDA34BVwOX3G4e3
	afWVFD8EBelD/TjuDziDtZITOOVVT8xpjcGkYZIq4=
X-Gm-Gg: AYBFou1eZ4A19bodsXY/VxK3AjtZ6PG29SPHJHsgkj1znq1K7THY9Umnxgco9AIjlG6
	HpzCj2rL7F6HxgAA01VYmmE2R+0y2s3byxT5H/NaFtwyfQ2Cc431XBeO4oJBw3j9vyG0ANJAozF
	4PKfApljJxhmAVWL0jdD4Ejlv2HkzPrbqlixTminQcg63HO9rOsGYUDT92aA==
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id adf61e73a8af0-3da3a066ef5mr7202828637.19.1788511753685;
        Fri, 04 Sep 2026 01:49:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id
 adf61e73a8af0-3da3a066ef5mr7202771637.19.1788511753245; Fri, 04 Sep 2026
 01:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com> <20260806-block-as-nvmem-v10-1-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-1-be598b2a5606@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:49:01 +0200
X-Gm-Features: AcwNN1Uv_B6HKhzdhsS9aNd75U_pKuJYfQt9a9aPW0x1SCz-kw1mAB0yNJHs0Mo
Message-ID: <CAPx+jO90ut8ZPh51BPyJLpTT5u1i9HTWKyNUWRsFdH+mD1uqgQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
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
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: vOkJyiAMAdRhk37IgZEFmh9MtGtTaAgh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfX7s65cY0xtcsR
 hIB3kI3OHUNre1hQoK5hdf2sy5RNjaB4KnDowqHIUgoCtN6rrkAS18tDz+pEYXwbrQMCSc4bPaj
 aBeJpKe5aKcJmJKgly9abmg8LhwN07s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfXzpgMbsJNP2oJ
 gvmQp4BZFSR67XlVA85Ng+Z6uHZC2d1Y0Pa9i/1Bpql5RRM7CZf1zawCGosFQNbiqJ2rdpRMvm8
 bMddvAeuagivVjQ13PIDS/NXc/aNCIFKL0TBZBc8KO2JiVRNr9kPV94HoBLve1BVg8YYiy+Pr8e
 r96P0NLit7DkqxIZV63MksoJPe1ksMJJGA92wAi/WnFcwAA/YdsO5VXDHH/jFol8zcwN6DLdY+a
 Hgmu5W3R6zJTIA+AHjNbFuibp3WN7/ivHXRU/w74d+WiLqVkII/fSIrxeG2OSd6aDi9+BFpZt9W
 /5uzE00IXGirRxc/i2JpVmRjuBnhHvsHNfizXvOQmYT3EwXoWkRo+tL4zQS/H772IZFlTXb38Mx
 9Az15wna+24ufw3fKocp+8zIZtxHklB2FSuN9lKpeSvGJUkxcJMqnAiEVfT7ZI1u4KuAaCV5MD4
 o0F3LV+l5mfVCyWeieA==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9a860a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Mn6x9y97Zr2TNExHCMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: vOkJyiAMAdRhk37IgZEFmh9MtGtTaAgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014914_855931_A8AA4981 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, Aug 6, 2026 at 4:38=E2=80=AFPM Loic Poulain
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
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

FYI, this one is already in v7.3-rc1.

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

