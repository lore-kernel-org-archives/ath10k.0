Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78ECD8C9F
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=; b=TU5MBqUYsibSvMG440TqI+vj0Y
	5upd9hhJLjUulYgITRBvSqLzAzal1hkJCpIom8XK/PE/uGdrU8ZTjRhvNGLAvsUjzmlwY7xhpWMsu
	PIVs5jI1FpVONDcl2OvdOPN7u1dK9aAQ7CC+VyXtbZtmL39Zvn31EtmYBI7erlS/gwa5NdJkto+P1
	jjUzoZ3EVD00j8ZMP9JnYnpOdo9JTup3bGZLGXt9ROr+/b7OWrar18pnr5VqtVSNygcmBlJRvtYen
	rlckenVoZr816WHqaFktedXy2whQrt3Lo4AtB3nrjWqvorz9gvBC2wdyQArpUtjtFLUHZrrW4PAc4
	buXtQHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYPk-00000003S7e-3LGI;
	Mon, 08 Jun 2026 11:45:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYPi-00000003S6n-2FHr
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 11:45:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9Mw33038117
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=; b=gyjq1X81lQIRnvcO
	G1um2E6TV7hqmLL1Crrjwm5U2JX9LsLsEKMoBAB5r9dv+Re6mmmqF2N4BlWwnJWe
	WipwNPhnPDyTaQA1648cU+hTlv0M50/vvS6qQKzliDV+B0P+UasYAt4nGWww+/2V
	Jt2hVfesaJfjYeEx6LLpZB3Zd7kugW563Aw8AhYGU9FXuGT9sI2lmrgrxr4ipjYE
	RyrKH1rZFL3kTTJ+uQ3sF56wCseXRx5Ce/219eLO3wNRU5YKKduHHRQ7HWqC5dUT
	x7K2ybfU3hPnmKnk9GZzZSnL5s9fuvmjIHV2Ao63T44wc4jwbv7XlGhlcM4VQxJB
	Ow6dcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj86yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 11:45:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517b75c1ee3so15001951cf.3
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 04:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780919105; cv=none;
        d=google.com; s=arc-20240605;
        b=NddPfVPpSJrp1ROE5xJNg3zpBokkTt/FzgEwGV0csmZusvRfnefmSYFLS9dmvcjd3v
         EqVBUYiSctrwHE0fry2kyc6arJVrcWe3lEydwnuwgvyhmMjk2hf0z4/8EoBVfebLw5iV
         BlSldRceqs156Ymy2IUiw2EpcF5+E6qToX7qKM1HuVeglPB+peTvn+J8NTujzvjGxK8S
         7D/DOCzgSjkBz1iXRLL8QKEcoIWQXEIPqW4Yc5PsyLewcXCLYD2qPqJeSuEGx4svalKO
         k9/c47gmBImRKVL6oT7GpgTY8IKGDFMekBnrHq4Y7v8UEntI3JSP+TkQqWLsrKRfSA3Z
         Gh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=;
        fh=PPSIRqL19WVmbs1oCyb81hdL5lUnTStfd/KX3RNsbuA=;
        b=dSRowOO4mxUtyDLCdzw0hY/77esW94iJJyOoVZIh9roiH4XoRXOMFYY3MHFXARJcc4
         Bj4gpaGHV5OZg1zB1KVfzRr3bOMGZjqyN/D/a/S/X+bqtD0P6WMBKULdAUOmaoJ2/gFV
         Gw8ywnenxsOJrvqcbBNUlA0d+u+C/fc5JzCHimqvc6tUMyIfeFzCz9rLuy6l/zBUl8pD
         5J4b8lk7h706EpF8sU1pZzMeQX2iwu7/u5g9a6J9/O7IFTFfcDW0xfx0xJQGhglfGSel
         F96wMoKHHCar07IDU2sQRHBWZV6cK2cH59nfwYk53IT7SuUVbgquJoPtKLfHR7kpeG1Y
         PF1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780919105; x=1781523905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=;
        b=KiYuUo9/MGD8l6rfkSy5AW7ULe6TLmMPkWJrH2Ldvl/i1CoIdYryxE8k+zqfKetLUA
         BfSiSOP5/Ung6UU7vENE/F65/zXqI/9BLqzSW7DlzZ3PRsfYoMWhC590+p+Soonn4VLr
         3wQE19RomniWl4oMa8Rg1YDX0EjoIk/ksMBc4wxMRSUrD+vFq9PhlW/Hof2QxAaO/PFt
         ohnY9LPVIir17kPtCPfBTjnlLFVyJeL5TiklrAu9IMDHadleUStFCp+8LM+AAMDPdOqm
         XqotZv01l4aZ3CW3Z72Ij/2DYs35BlabEdhLKCtrsxvanDJoRBJC9GipTLYLvYOA4FAz
         Jlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919105; x=1781523905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pj8HGTOjIgEwJxXsqFpmeuzcGz93+i2/L//Hl7KmKx8=;
        b=RJE5OtpcZFmFI8TBA2nv/67+OiiIfGOYwZmAWPPOKQnB97NeQrY6GfiVLLuZLRoYRA
         aJ0r7Uyv6b1pnRYiVglsKk0/+Mp0TLZcBtGRjwe9qlL8rto8Fh214IyUKsxU5CeM41ve
         CQTzXxMEFTCIrPu8rcIUU9fKn5qyQAunFcbKXlgQ5NlHsyrw1ipNdVq9GlXwcldFkWIL
         a7MI7D3A50rv96OiUwwCiVcPT9zrTMoGcS1L7h06dWlCnqYhVVFx/O1VtfokTTZaly0L
         h+f5Ba5jnwMaWaDFYTALyfKDmV0nqPbe6xskEKM5Zcj6NArNG+7Ci9FO4zSXF3mrcSPj
         dvGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QsbXflC2pO3kcwqzz2v7MTcYyJyiFuX8uHUDO0+nq9oR57UpRUl1AxiHOyyT+UuyhntmuwcY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYQxnxkAGREVs33Y6BF68SqSpfcqPW5B9VlnPMJUaqjU2IMcA3
	TnWAz99gjilAoTabiUyxQ/tAwHMPZ2z5LW7Mp5zZ1ZzVpIDBdBog5GJnVcCDyUcq1tSW4rAQj5d
	OuYzml31Nh9FYuvb5xZ9YwialfMe8wzVy8LvtxXK8QgyMMp1D4XKpZjl5RzuWwrYdvdWsRKnwcf
	ot2jfYWy7ki8Zi4n7Z8VBVx00DI72kk7oUxp9aYXw=
X-Gm-Gg: Acq92OF6EUd1zXi5CWfEH8oRYSsLbdk9waYl5Rsm8yxEszI76iD3wXaV1AGK95sg5x/
	zHiHpq0UNymwB/tGKtnIw4P5V64KIvX1/2X5+AgzMfoD6yFYTFZyEgDLGxms0Q5+CET5O6C2Xxn
	QuKeFdWfcfspPdX4FYmGuARX3nS3EbV3OzvKnwdE6kcr0OJPKK4sikciylz0WNgufvdpRl8LEAY
	QHXuSuNimijQ2bpicgS3OQsChVH2gZhwE3x/du/Clsfwcek0kyrDNeOBx0S1U11DoJwymV16qpo
	UNpLj3xSEnOkgrvimZMUuVE0yqnAWpnk
X-Received: by 2002:a05:620a:170c:b0:915:8f76:8005 with SMTP id af79cd13be357-915a9dc9a4emr2367274885a.47.1780919104824;
        Mon, 08 Jun 2026 04:45:04 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:915:8f76:8005 with SMTP id
 af79cd13be357-915a9dc9a4emr2367267185a.47.1780919104401; Mon, 08 Jun 2026
 04:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
 <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com> <f528672e-ab4f-4844-bc7c-1f8f1c4dbd3d@oss.qualcomm.com>
In-Reply-To: <f528672e-ab4f-4844-bc7c-1f8f1c4dbd3d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:44:53 +0200
X-Gm-Features: AVVi8CcIivK2P5dE8YRtSTP_9u8m9dGK-3gXU3su59C5FvR4dQPnW2soKiKG5MQ
Message-ID: <CAFEp6-0u1DBhXo9DCie5HCGTjcduWcHAiifVo88vFJwjYcjCog@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: yLgludLjt2o6yQfZY-GWJMese7BHpI4d
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26ab41 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=4LeufcCx7mgyzPUJGOcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yLgludLjt2o6yQfZY-GWJMese7BHpI4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExMCBTYWx0ZWRfXyS21m+xGgUYZ
 cejWqjcQQp/L/PrGDBpi8iqILWaGbIZiZ328MgyhGT7+KVRqR1vqB/dQJbexVUPHBk4fImqmO31
 iz9y+QSBshBbTmT2ysNWBczwcXiOAujIKdJlGocOYMcN0KuPtcAZ9QGp6In5KHaIq2C+St2w9fv
 y2zIvUPWIBLGKs14USdB/mu8jwF179pgxS5fLDtJZWFIRVZeEfS67CxeyWfhLc2mbVJuYDWqDHt
 QsBLuW8bEtU9kH6QrQM9MHR6BgjTlKA7l6cwHlanjO3iw4qgDRRsFcTOzcjWHK95B1nIIjna2On
 3njQbnk/wXXG1zXY/MRE7k9TYBKlyJCXZjy0be0Sy+jgDuVssqobFd/ApWorxm4JGdLWHCPPGIl
 RoQ0vqG5KAD2mOY81oUfkSnplTZxmJPIX64189WqjJ0/AK5h2+RtJflVOLZVknhe3wEsGxLqjrh
 OA23GH4SX5CW798TPig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_044507_017528_136E3324 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Jun 8, 2026 at 1:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/8/26 12:50 PM, Loic Poulain wrote:
> > When the controller BD address is invalid (zero or default),
> > set the NVMEM quirks to allow retrieving the address from a
> > 'local-bd-address' NVMEM cell. The BD address is often stored
> > alongside the WiFi MAC address in big-endian format, so also
> > set the big-endian quirk.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++=
++++++++
> >  drivers/bluetooth/btqca.c                          |  5 ++-
>
> Squash mistake?

Indeed, thanks Konrad.

