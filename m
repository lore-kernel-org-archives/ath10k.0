Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A917CD4F2C
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17iUDF7mL5ise0USHzQNeOsFGrHXhTmPVnwtg7/+gNE=; b=zrS/6Oss8wUZz2k2KI+xCfyGu9
	d4HIq+JrrITlVlRSWpGLBEtCq58Lz1DGh3PyfCh044I2AnzejzljCme6sHEPQtxi11FFVQHDZnfre
	U3IRcwqlZDXfeCvDfE2Z2x8QvjHXf9tpXB4+uy+IDnnDiTvxRkNHBPK8gVdroY4AepL4J0U1LF7nn
	C4UimAWKimepE3UgD/Ygbr7qc3s/9c1/e+4yd55LA4q7I8fDKQNsd8aSpp0GPtTVKsIjuULW28dhf
	A7FZU88u3KKFQvA0ztV6u4Dm1IPydl/giGFjgv24MQPhL0iC6mDcDInN9GrKR3Jt8r8O6CzKTcDzs
	/HM4Pe1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwmF-0000000AWYp-3nv2;
	Fri, 12 Jun 2026 07:58:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwmE-0000000AWYR-0BAS
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 07:58:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39adZ2516202
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 07:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17iUDF7mL5ise0USHzQNeOsFGrHXhTmPVnwtg7/+gNE=; b=Be5VGx4gTUql8Vgx
	MQd5cd2DNjjeytK/wVvLvtoz/4GCK43dIUZNL2r5LzQm64n2OSWrhgsu+S17nxAi
	biRk5OxZn7ZLEuhzG1n7N1H1hG/Hvyl2ZjPusePOMwVKv9m/jpnfo1fPGG08gdKR
	qjpflDb4jHHwjQa8Hms9E7dNyqZ39kDJ6WjummOJ8TE1sUe+W1gQWbbpKqallgw2
	orSXB+5jHzb3rVakigr3LCMzzfgBUFMlcjyakZw0BgPrmAKnvLwwQHbUHdJKNklW
	3TPJmVF/kb7CIXaZBB5jiYLL1964zpfhv1RNhb8810SNEDTCKV+lesMe5jgvamy9
	2ZUL6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r725cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 07:58:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f453a27so110069485a.1
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 00:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251084; cv=none;
        d=google.com; s=arc-20240605;
        b=SKY9lEs7xN0s5ZkvPiFR6fP+YPNyFe3RuDkhl3UcQ2V88iNdbhsdc56FVkouL49x1l
         CUEoBb1dbqmq8+nboAAn4B5DteOyngaqBL67szdQox/AFaaH6zNIAST0emuuvX4MIUzE
         mJ2BgLkMsI+imSyuClApGtl6bSXvfJ216o/UU0mU3IOqJ85hQBA/pVJsQIl8zMiorOYH
         KxVSiBR61MRzVCO5Zpv1UAEWjfY7vL8RfA9MgYupZJT7gvoqtpv698jRKtbjvZRXbwUX
         vCxZ59Zr4W4OhPV1b6bVvxZyiRib+M4gKQwbf3bJ5OtyR0w2OFs4YL6235rM1UXuegsc
         z3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=17iUDF7mL5ise0USHzQNeOsFGrHXhTmPVnwtg7/+gNE=;
        fh=XTE1Kb/jnrYB4ULJtW1isI1/Mv6/B/7VEP1v3RL72gc=;
        b=g8PVjCwTGaeDWKuyi0t+3moi70mfXP6ExFW08fLTQ8ExzYG2K56ruGBvjSsoAyqW7I
         CE72c6YbsCsyVzIdlu0s3DR42cWVx/cIopE4bTnaynIspi+7ee1KAKD3/W0HccU4EUgD
         OaVcW3Lp3Ep1L+rwY+PaZyDNQZeaN1c0E9q8yn7p7tjSIaca2VkSFEQTSCGnI8rLI7xW
         9OUYAUe5yDsvXGX1JvOuJYvNv6uqy1+vNUTsTd0EuXfVWdKTDRnFl35TV4FdLQyKWu7e
         TcHkwVH6Q8tlWm+fNHQ4eEZy2u+GXV+kbjQtuRm0uY4DkZOd8MeKfMIv9U2Qq8UtxXLO
         mS9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251084; x=1781855884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17iUDF7mL5ise0USHzQNeOsFGrHXhTmPVnwtg7/+gNE=;
        b=g9FCXO7DAnhXmL10YBRyDZ11qg8SCjH2JcONr2kGVO2l50haf5ogF08DhB7Fw9lFKl
         ONbbNtkOfyIdx1v63ArjFhIj2mJ4nfhOJf9LlhmJXm+Ab3U4EpyHcY1ziYG64/7ObfbE
         idhvBKAfvfFh5XVPCg9kvls1YR/nN3MQQjJzQLs0jWTCicnITbT5z4QtJAkVt3FHfk/k
         WdxgI4cdo6Q8+vui5detybuDHRoIquqnhFTU2aov2xMUi804HinONdHCXV6I3RP8EXU2
         DM7eBNUA6XLONyllwXfDrkdgOYQIh4aW0j3qMDgqti63HKLErg3/mOvpGtQym2Kk6nld
         N0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251084; x=1781855884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=17iUDF7mL5ise0USHzQNeOsFGrHXhTmPVnwtg7/+gNE=;
        b=c9L6eNytNboyU2xqwrnDKH7B78qMHDVDn+WZeQbd/49h7ri8Trtu/Q5tg1w4jMVr4I
         xNdXKzaR4RnNj8aiEtHR2gvehga3EarfZA2xA5yKLK49sOLz+sul3U4b337KSSGZGqK8
         p7wWqYWqDnLVwIluew3pVJ/2swMPk9yROKDDyai6f/9gCv8KWYihTfZrMDYWs/V00hFD
         3Yx2ucuryQ5uS2DIi4OoUttiZMaMByK/qeqvuAyelNG0qnlsPlNeLfhvqiOiCi7/0Tm3
         r/AgRaCRWetrg8xNOw9Jn4AB8AIVmgAt3E6hImXmO4QzHOTSHM9G4JbV5pmF7MEc137c
         /LQA==
X-Forwarded-Encrypted: i=1; AFNElJ8IwD8JcX5ZNqWwFSNjSRgp0oMINWPbQTNHCyvyDr9i2CMSTKaDwTo4IAc504WKGkV2YtuSfj4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB4tSfdG9o2Ue+I7+0Zu6ZY1K6RS3mdeupnuXT/uDiyw0FB0EP
	09lO86BjqI7w7X8aR01+zE/BEOJ5ef+7blYOKfxfyhjAgnwE09u8AUSjZB2pw3RCiweOEXzfO+Y
	IfpOnVGZQsZT0RuduHX1u+Z3D5t5hwMTekdGJMiqRzfuNIXZNdLzggnBB+au7OefLNDnZ9VpwgE
	UZ/Ik15rOq9Hxf7jDHIyEMcd4bUy5S23VJgPDhMhQ=
X-Gm-Gg: Acq92OHql10VXnkfFYcpYZmb7eRDLEoNc+IPKsBxgWwvX3ECSxN/3nWbwQnjvQQ/qKO
	dvCO71/MBe18a76sxRkLlop+cSHAA6OlxON3mUQzoH0OS6QTvwItJT5l80o3LhhD45UMqToRyOT
	64SPniJkxy+9hIkiKvnWbV9nme5KE+ItQ2AH2OIgeYAg1KMQZz6yj5ZihDH48yDvqfl/G62Tw0i
	ljPHURSvyXqMMoCK5cO86+KRFI89tNz9neEq4eWQ30ToF+AskOPngy7NwR0vl6iobFLnV3PUvm7
	mXKr6oGbSjAp6bsKXfg1
X-Received: by 2002:a05:620a:2406:10b0:911:1a2c:f953 with SMTP id af79cd13be357-9161bc5db30mr150537085a.20.1781251084068;
        Fri, 12 Jun 2026 00:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2406:10b0:911:1a2c:f953 with SMTP id
 af79cd13be357-9161bc5db30mr150534285a.20.1781251083533; Fri, 12 Jun 2026
 00:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-2-45712e6b22c6@oss.qualcomm.com> <20260610-funny-paper-warthog-25fa0a@quoll>
In-Reply-To: <20260610-funny-paper-warthog-25fa0a@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 09:57:52 +0200
X-Gm-Features: AVVi8Ce9FPbWU1H1fFzoHrS06e66vPYKJ71XBeMTddYgFQq0vpvNpz1VnR725W4
Message-ID: <CAFEp6-0Jqw4HqTu89QVOVtWEYMpNdnd0vYxRyZDgn6oMENCqTw@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
To: Krzysztof Kozlowski <krzk@kernel.org>
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
X-Proofpoint-ORIG-GUID: f16-4xvj44hiBNqrWQ77KqsBtPqYk0Kz
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bbc0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HRdx1Oj2DPauqesJAvUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: f16-4xvj44hiBNqrWQ77KqsBtPqYk0Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MSBTYWx0ZWRfX6LsrHQOZueZH
 G4/MRaxqlGuaLG2LZWiN3mmSNTekTTbfn4AvZMYrumhx6c0DBR8u4j7GUfDRBHzQRIVHI+C+EiQ
 tYjsRNs4YxgxtERcl+OINkC/M6et7CuFMMWvzvyjC38btHHoiqgu5LtIWt2KRW85g1Wr4nw+fCC
 o2rET8+MSYoHzYI5zlnbs3Y1OX6Tjk8HPnE3unFmbsDLmaQK9QALVyyFwbT3WTGfK9MYvnAqKV6
 yRb1aRhYYlPQv3MREQDdz+D8NuhGQLCwcAib38MaLMpOjpXCut+KOzqruxDZvkWBkvLWWF6IbeS
 nWJfMCx/u9zqpx+SYxyMho+a/6nw/6cenGa52uLAYyYx6okyDe/FU156VpBskzKwafemEiSYvsA
 ml45yFvXC1VnyUW+zLrFaQzK3SEmKF2ykxp1GEoMBhjvx+2mXmmnKIsVLl+rpz9YK1NIlCZPrPs
 1QgOEntKnCn7NlxHnBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MSBTYWx0ZWRfXzFxUM9lbe8wv
 7Tqa8vOtZPvdlw8WwvN/lFYh2S/lrr1uLfjsJnyq4dL/8d1UO4/N2SLBXMF1hBrZtawjLzd+yFC
 tyfSQjvwleBRcaLG6oHHkA0xB7Yp+5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005806_089294_D1616544 
X-CRM114-Status: GOOD (  19.79  )
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

On Wed, Jun 10, 2026 at 9:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jun 09, 2026 at 09:52:27AM +0200, Loic Poulain wrote:
> > Document the NVMEM cells supported by the ath10k driver, the
> > mac-address, pre-calibration data, and calibration data.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++=
++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k=
.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> > index c21d66c7cd558ab792524be9afec8b79272d1c87..7391df5e7071e626af4c64b=
9919d48c41ac09f1e 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> > @@ -92,6 +92,22 @@ properties:
> >
> >    ieee80211-freq-limit: true
> >
> > +  nvmem-cells:
> > +    minItems: 1
> > +    maxItems: 3
> > +    description: |
>
> If there is going to be resend:
> Do not need '|' unless you need to preserve formatting.

Sure, thanks.

>
> > +      References to nvmem cells for MAC address and/or calibration dat=
a.
> > +      Supported cell names are mac-address, calibration, and pre-calib=
ration.
> > +
> > +  nvmem-cell-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +    items:
> > +      enum:
> > +        - mac-address
> > +        - calibration
> > +        - pre-calibration
>
> This means you expect random order with variable number of items. Is
> that intentional? If yes, please provide short explanation in the commit
> msg.

Yes we may or may have any of those cells. Will document.

Thanks,
Loic

