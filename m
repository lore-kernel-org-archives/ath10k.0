Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26CE109E535
	for <ath10k@archiver.kernel.org>; Thu, 26 Mar 2026 01:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=; b=TzXq1Qg8op1gWo3Xal2izS6SLV
	JDa0syPcR6P6oTnDaJ+J9L7T/Y0GobejdJAszIMZCCKwrsPweyoxetzf/XG05asa+2UvI++sgd9P0
	miV6zwdObC1juSw70QdsCset7XDNZ1+0C8rVVrTg3W5OQexmDzWnzFezGJhm3ML+njHU0IXfa+u1V
	AZqlOSyAQWkOSUyR/DMgR28O5K+bU+MWsh+WdTBQ+k4gPhxI1cH03NnPAsAF43TwDUGB7u+tihAcA
	pdFmAxlEs08Ce2DMmWvaQXMFw8OGXFfIUlnYIcCYdkaV+V9XIPNpu6wqaouzILlmZoESvuq865L5i
	QB1uIR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5a0C-00000004YVT-0MZO;
	Thu, 26 Mar 2026 01:59:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5a0A-00000004YV6-0DF5
	for ath10k@lists.infradead.org;
	Thu, 26 Mar 2026 01:59:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PMIFIO3070106
	for <ath10k@lists.infradead.org>; Thu, 26 Mar 2026 01:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jPgKrOCs8BV3rkHFf7zJrMHg
	/ajlW1vtOsuJgIMhY9c=; b=WwBkdG+bMNAv1+H4wYjSz+Puf4Hojd60sfYMbVLz
	6u7s1GcBAeZuf7rFY16XZRNNen6tUahqZmtZfxf58grsNZS90izuJb9GyiJNwA6l
	jyUtMU9c9gJrXpHrck5QXhLaP9mrc528Jd9uoA8GdtA9jR7E81ExXKHhYrVut73E
	4cXbuRf7ecmlOPp97UnydVYHUSGS0OAIeX3tJ/pfwMRH6KAgVVPs7d2FLHk+1Ddp
	FBl4Fp4U4exKCbvqP+V60vrbx6Lk00MyWfKihdu/ceUYWdPEjIB+Btbd/DQ866/+
	+Xeyo29QlF7hT/ik0vreVZ1XWS/2CHif9EzUZjwWwX9YSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn0g9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Mar 2026 01:59:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0601ff3d9so7254965ad.2
        for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 18:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774490352; cv=none;
        d=google.com; s=arc-20240605;
        b=kCN15HJHOgMDT+AwXUngXp7WWpxxvoTYYEHDHm/hlTMs/wZ/9U5PyJTe5JgZjk2CGA
         ZW8V/pSu/TTTqqmVBRXtqrkUGN1RTCzGfwWPlpdDRsN/aVdd0qAWGVLbVIUZnHg8PWah
         m2oLK/gu/8+EmbEvTwMFJ34s62ZkEWKBJIojbR41jhfderSGzdGtXZkvllLjUF4uGxBw
         nTEVp5DURPxJn3+X1ODdMcIO3I0bYIH1b/GwdIh/XbeDwyVCbmzTyRQQGoOegpvJxNzI
         oMQ/h5zPUwOKcgZbfIXoist905ktwAaNUQY7drQBWaaEz0tO+T9WakSuDMab1B7wBb/K
         Ep0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        fh=JSJsB01z7InAOPlnYZL31ocO6tQUN1jWuO96Ri9PY4k=;
        b=YPlTxGlUjF913GeWuf1QxEA4W0PrTQzAGZZghM7cKWaYd/32t7GiRFUKGzaU9W+6Nn
         pIKBnE9wQ3UmTuhqeWKXkd6AHhUr031JfdtsyX9MGmZLV6CSxHKdYvEXlk7rhNUbhp+n
         L1nZ6BVnbz9wEMsg4G4bBtkuZNqkMqtvNr7EYk6wFcMYSE2KZGDRP+ZSOyQvGLMLEQdX
         zeDJH2ngT9FHPrCPt4RJiThvY3bYuW4wLWSlaslMnXOHixrbUbjJ8qFYfN/pE5xU9FhB
         nPBcdRhBhitWJdcQm+RIFPNJYGl2mrffohtzekcS3rFbB6WWz+/iTETqRtwDejvi9/vq
         j1Hw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774490352; x=1775095152; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        b=TEnbJ6HHITHPH428BYKZ6PG0KzgUZhpenTqR0oLgkHef8vgdIS9dZmklCEi5Zt2txi
         NRG4YP4QMiBmJpfwV1R9ebvgK7NBQ4wb7N84VLNC6j7a/dqavfq68M6gZgFEppnlQPvO
         1cR33NyejIMtMawr1X8P+M73KWDtFl2sM2DHEl2iEdY7SHNQQZw+Wn3u1H4Z0zF7KJ4d
         Jxee/oiOqo+FJQ9gtKfNPRK7dgzTJWOOR4NiJE7PV88pxe8uT6FmH1vMcx7i2DCzQYVJ
         /Uh2T2ID959O40SnjRo9EgEMfjtUog8hHw5xjOSZdLX+mIhYVNc796NF9MK7a0XTU9jW
         7SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490352; x=1775095152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        b=DLpJgzNxBchpIPVaOzO+vu0ZiI+rUdABwoo/NFLRNrXX6FJdBNlhCU1M6JzwP5caw2
         NvjSq378krpJUwhhDob8v7mkYDJBpz4aHmZbvBlXojqsMuKwhGD7MAdwnOqIqOMtAJC5
         2SRctOVZDxS1x7Ao3D6+7jpFeYkJ2UV05IRYjgeASf/TZLSO2gsO+hp1/mN9j2ZaysoW
         KpLPKFakigJWjV4mpqJDOgs/XiGiV+WPRInNs3I4MUy1y1XtVw566/juokBBd1U57nDY
         p4Jk5SA3IroM9MlgoNQYdw4UtVcXVv9feF1/u7xZazMB91ao8cIPjetzrIrklQQ+AJuS
         JdbA==
X-Forwarded-Encrypted: i=1; AJvYcCVNX3pU9OROuLvszZOe3M1I3OdC1aVIKOTvf41V4hZRfz1WmqQUOD++IjjgyYlcHgidxaT5FWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHkSfUnDUkNLnG25/0t3J1HUyJO4CAwU/dOiyDWPh/oaz4GOmZ
	yRaJWxmQJv0x8CddshuSBOG2p8KTaOkJuEBr6OD0XwQYlZMDkzU2dHytBaISrKyORwO7V/gzs4X
	S+iXHXcVkIz+Dc3uxQPEYkO+/NxykvwYHFrqlj3IOps7hdfmIDmMx3igeVABzDgmMrt9aJLDLbz
	Pl5xiiRbnfEt6SRIuGPpN1/AIDqJ5RlKed6Jr9rfM=
X-Gm-Gg: ATEYQzzBnwvH7EU+tBybl22ynYXjblX1GPIv0rbkTGeVZz6TQt6AzEQBDcyQE5iBaBz
	tezirODfTsOcwkGkxXyGJhH8hePAB84pljtpW0F5oZuj2cn6DxpDaHDf0op/129tnB+Z4/UuYq2
	icTOwBW2FjcKamwboinVgzZ+UZvpSx+sYN3dz38u7h+idsPjDHvBeZpt8krE/pjZcnMuFgAyWVa
	XeOZVQEG4AqxEwlSkEq
X-Received: by 2002:a17:903:3c47:b0:2b0:6df2:8cd8 with SMTP id d9443c01a7336-2b0b0abe504mr63387335ad.40.1774490351612;
        Wed, 25 Mar 2026 18:59:11 -0700 (PDT)
X-Received: by 2002:a17:903:3c47:b0:2b0:6df2:8cd8 with SMTP id
 d9443c01a7336-2b0b0abe504mr63386895ad.40.1774490351133; Wed, 25 Mar 2026
 18:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-7-948df19f5ec2@oss.qualcomm.com> <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
In-Reply-To: <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 03:59:00 +0200
X-Gm-Features: AaiRm515yskxcvd1wtiR9718njLTgP_TuNpDNdd4YtWA6E6jp6B_uzG9KDE4-bM
Message-ID: <CAO9ioeVLy_Uzn7L9MyET5wg8CMR132+Dda5JzjdAB=6vz2NEMg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-bluetooth@vger.kernel.org,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c492f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=l3dzM3eKOFk7Ec1IfqUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8Ib8I7cqZyDyncrA-qxjs9XQoY5wbMK1
X-Proofpoint-GUID: 8Ib8I7cqZyDyncrA-qxjs9XQoY5wbMK1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxMyBTYWx0ZWRfX+cFUdzWNSKD3
 +V1hEJgMwaLRuYY31KnKc2mhfgMv/uJ/St3i+gwC2k5puYe/+x6OeLeF+Cbn5bZG9SQ9ToZXXRi
 9omQnThhgPb3mvELT3z2V7oy6su+v+bpoTgFvBbsPC4bKwifKQuOBHk7G/b+J7tJjkQFj1OExuv
 QOInrYeqdr1gRCBzAbWKWcKtp/WIVu1V9vBWLAq99NzVmKSwWyjGsBAesCjErf6F6TDdbCe1O76
 z6L/5/lh38bhvKswrYa7qSmQkrDZe8H4lAyS3gsilA8o0NQZnlbyMUqQw2ZbODEwEyFYgE3Mk1U
 BYwcp/811q/dOrqJlVgv0TGH7zATSdmHx6pU2uYK9hmCuoESm7tDo4vwgSs4gNK/RlxJkiadbyh
 WA5DMLC/SEh4gvMCAlsGG8tjJrX7Q4E87xH8Opw+U5atOpqnCcov/52Gp1fZS8Vcfd9L6Eo8eJu
 Ix8JmrmYGuxTnVK4s/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_185914_208573_67417152 
X-CRM114-Status: GOOD (  14.05  )
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

On Thu, 26 Mar 2026 at 02:02, David Heidelberg <david@ixit.cz> wrote:
>
> On 19/01/2026 18:08, Dmitry Baryshkov wrote:
>
> [...]
>
> > +     wcn3990-pmu {
> > +             compatible = "qcom,wcn3990-pmu";
> > +
> > +             pinctrl-0 = <&sw_ctrl_default>;
> > +             pinctrl-names = "default";
> > +
> > +             vddio-supply = <&vreg_s4a_1p8>;
> > +             vddxo-supply = <&vreg_l7a_1p8>;
> > +             vddrf-supply = <&vreg_l17a_1p3>;
> > +             vddch0-supply = <&vreg_l25a_3p3>;
> > +             vddch1-supply = <&vreg_l23a_3p3>;
> > +
> > +             swctrl-gpios = <&pm8998_gpios 3 GPIO_ACTIVE_HIGH>;
>
> Do you know if the GPIO is common for whole sdm845, or it's only recommended as
> reference design, or nothing?
>
> I did test defaulting to GPIO 3 on Pixel 3 and WiFi works as before, but since
> previous downstream kernel didn't touched GPIO 3 at all, I'm worried about
> toggling unrelated GPIO.

It is an input-only GPIO, but nevertheless, if you are not sure, just skip it.

-- 
With best wishes
Dmitry

