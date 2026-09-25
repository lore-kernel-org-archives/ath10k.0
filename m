Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0701C9830D
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=; b=BOOXJHWx/OHnnGPYAj1bsygcIQ
	6LSK+cw5NpiUbRJxPj1omxLIyjOMMExFpUtnJo9cPFOvQ7pm4lw1knvhkuGZcrxQAX6S612wfkVF9
	eX+d806s9NqMDfRFoFSOQ7edvEPAgmTxKWI6bTgdGwD3rgV0nhUAF/k/7CghGFzPf6R1ki0/HcmJB
	zATieWmfHOaEWGATnc/xNQ42WLBLqWqV+Qxj+PCglIyF0IWXx3M2fZXBUZggmhrNxeiuv7emvPnvA
	LUlQIAXu9tvR8KjLSCMAbOW94CINmy2UxDigN7wZuD6vNWmqoPnxMoaMaZyQJHb5I+kFQud0nh5d1
	evXgIh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA68t-0000000DT7v-0IUE;
	Fri, 25 Sep 2026 13:39:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA68r-0000000DT7V-16XF
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 13:39:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD3UNf3532398
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 13:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=; b=CiFirrNMJE46vkez
	ab/ALVoKzVYq3KdM+wurlRbp1B6pozl0+xZlajKqHYhciUozzuBY7HlW4B9bEgeq
	01aTayxTFbLZjXcK2kUyA4C5CGDxayVgrjT12DPiulgqZp8+24MXVbQFUBKalGN5
	p9GwIgBIhMFeCrnL/r+4yFxTmyyyZcUvwHKtmgVueHEfPC1dTHXv2IcCvaA5pY9E
	bXsatblJpbCU9xw3/A1vAwABdtqMVYDxHNRpOtBokCQv+9P5D3KSurkRHYF8jsvl
	7RxWADkv+Ho9B8J+D3C4m7HNizpmI3Gz6NL7dRH63YIWrYea4jFZFF+zLX2j8bQ9
	XChfMQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbcm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 13:39:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532d420abc1so19274311cf.1
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 06:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790343548; cv=none;
        d=google.com; s=arc-20260327;
        b=eTespbNd02u0CzqC6z5MwZv++UkLxtsu30VRZdh6whChMbah5wIMdzH6S9+tlaYbmI
         1R1O8LtdaSv38JaPdCQfSVQu4XXjrH2SUK3wDlf1eBZojrqBwIaU1afeQThXfE7Go1uX
         ekWSBJ/FcxO692LwI37gRg32qT7e0quJyVs8Ov/QbVQWBMWch2OXq+e4MRlOIoN6t4Ma
         wyA1A/LcDZGH3M27C49pX9JuaBIYzde6Uyh00iCbb71WHOvaUuYAVxOkI1TxyoyksGG7
         Jrn01LBfiw2wAFOEXlMEPsU83fTqxl06Cdhy/0AvLSn5MNXtWKSDQuiCfWiuojeKJ6W7
         0O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        fh=2yP1P9+iCPhUvXFtxAdf5bUULBU+6C076AqZfyfMY1Q=;
        b=Ok2zznBh/HxYw0g5n33B6pON44YCRus225vCTDrRC+W+hKgVcHbqKZ0Hx2FAtd2flY
         KMZKJNXgiA0dFuSkDu0g3LyCdyyat/BKs84swA7bN6JVUVoacFVCtyL96AfZ+ECeSLSD
         MGpDk/uuYmvaSDHl11zAbjiLHIFvp8vRN4HC9BTkprh8X3kjOlpRRvOTQvkwKnzougQX
         sh5goFR5ZT7f5QMaTDD3bE1meSQ3L2lskOqCmV7aw/x+qxmPHpnsLNEry8Y+wUbqAlvH
         SBRNmj8VogbPSxx4WWkf0o4jfb81oJis8L6jltc50j+ON54XAAQNF960KhdLdbxlC+/X
         cTOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790343548; x=1790948348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=GGpvlmFg8oZgD8z5sAEVj00QiCLGtOpTUtabwISJ9fWbBcwSahJ1aHY6rfxru98oh0
         R1lz7567MWP6DvJDQpQaVS+jywZo/a6oSNRaPkl7AIfrdh4ffXYw0cJx4MBQHUif009+
         NGvLlmt3priZmHWpkT/cLoByAQi6O8FfGVpdoLQIrK8QaDcf2ym2939h8IzPvgrhSEY/
         DwuYP7Trd/TmgepRncUsrg5jXvUue6PACa5DUJu7WGg9ZcQX/3gRNJq94AYtnlMRBajY
         VEMXrZFRozhHx+efQ0imsJrad9uw/Bg9/eTg4iGEEk7wKd3jqvFiX3MOh7UJKhN0Ciuf
         HHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343548; x=1790948348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=E2hVR8VHLfehzdOyeQCbV/afZT3yENpBtv3vSVrHJJsXc4xIlJtVMnXh31+rcuvqeP
         7YXcInSub/vlEv1zTRSobTd4Feb2JEDh61ktU67troCtHwi1f5OSJBQlb39gQ+ATkYqv
         TGlvS/WvaBzGMNFhU93TemNwPY49T4r+FVGFZFL/5QSis7+30m/imgsxi2EP6/FmtrT1
         oB3fK66LthvQP6gvjhc7AcssL4Hf4C/wyxvYKzeAkzRbvGH5OqWs18Ey6Vki82Ak5zhz
         knjFGY/6vnv72nJGnFqaGc/mQJGFPEz5OCCrzUpL1p0YtSVyPQw2WZH1Vy5MJ1p+jZ4j
         l+bA==
X-Forwarded-Encrypted: i=1; AKwUvBxfBmHDOJCgykwoPqaVvnFknPyK3+0eQkKLzO+BgwE5xdxRGADk8abdHi9Dld1M4P8kuQ9TPbs=@lists.infradead.org
X-Gm-Message-State: AFuF++latqlTlfyXsQ1D20KUITsGRtz523PB8R5yUfL0VIaABHA5AUuW
	mcqcDbo+2dL4kLgtCmPnX+RBGlKzcmQZZQRl5or9NcwT2U+2DMSLigRsD0BcwIGbQ/CWLDGLUN1
	KObtY7Q5F+GywOpaGBJuoiAcviR4txJYk6SXVKwFbp5oFFs/0HWvCiowKsEMI3q2uNnxAK/soL8
	6dAXNyftfIdT5udffhyHROcs7wLbqvpQMd7X6b1sA=
X-Gm-Gg: AYBFou2adl1YM4+N4rUqVCTccelck7IvUbzV1tpcD8JOmJ86ZdPMKqRlIQL6SfLdyFn
	089AGdaZa4ppzPe4SGRC2ZsbOVkzbgzN4FFIX3PvtQDx8ppBMVS8Hl49eCe5KrKwp6CZpoLPl4i
	mTaUrtU8nmSMqhcbsLhfTdHISjOyAG8vuYcOppuyzmYe05ypsqQBPLXfjwaqggVc1TR475CtsiG
	miNHMxR70tEjm/MK4w9aqYidHfdji+AKfB57uxqmDNLCeV2suabNbpy+EJSCiyYYZuC2zgOcp4=
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id af79cd13be357-93c43bf1ff2mr431889885a.29.1790343547634;
        Fri, 25 Sep 2026 06:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id
 af79cd13be357-93c43bf1ff2mr431882585a.29.1790343547133; Fri, 25 Sep 2026
 06:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com> <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
In-Reply-To: <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:38:56 +0200
X-Gm-Features: AclHuK99T0Ubawi22EyQadvbidnQEmVlySi-fMkWCvta4a9Udx0OX1G_I0L1lvQ
Message-ID: <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6797c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=MW6_J8xfeE2cRKj6bkYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: i9TIOP1lvumRyEtrVHvnm8dyjPjMbktN
X-Proofpoint-ORIG-GUID: i9TIOP1lvumRyEtrVHvnm8dyjPjMbktN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfXyT57F6z/2VJJ
 QrPny9KOT3PRc2F2Pi0l7SZD9u9P/okENkTq4SMCW1y4KKoSJeHYZAT8Gi5glezlNJnvuSLnpgo
 VYtnX4naPCPNh8qTGYB41vW4guwmB1rRHqaunsV98dkwD0dZ0BUGvcRV0sD94kWE9lCilVkaXp8
 eXKeFsAVDwPCT2EBJCRADxAfJJf7ojHGgSmQX1txUTg/dxfoCqZ8yKZUGYnGA0pMIV2JOOoUUP0
 HJ448YC/9TXal7pswyxLzNS3ujmroBxeZdKlG8p1OJ6PmQrkn0sR2ch77cfPhBd6DI4+QW+xxLW
 kAVZ8gud6Pck5xBuodVZc0JLvW03H/19OSDdmUyxtI4Ftlv6WIwpScfkg0xXYzv/SSNnEX+p+J3
 PgJhYitMbSuSYMTztz3BWOOJs7CI8BrIifFRQ5X3htDw2wrOSiJcpjFlFCAfXgFjD8OBmFAz30N
 nhVxQK8/tW/IjPopQkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfXxPfHlo2Wv0iv
 h7vUK7xwwzCkvueFFGzzVI2jSCsGe/tAZzOAiQBV3AlnC0d8WxPsWQ6LmlBWO1eU0JXYB5uKHRX
 XbeeSu28c1EWls2HSHnEDwzRveQYH3Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063909_306421_B8B8F8B5 
X-CRM114-Status: GOOD (  15.58  )
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

Hi Jens, Luiz,

On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@kernel.=
org> wrote:
>
>
> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> > On embedded devices, it is common for factory provisioning to store
> > device-specific information, such as Ethernet or WiFi MAC addresses,
> > in a dedicated area of an eMMC partition. This avoids the need for
> > and additional EEPROM/OTP and leverages the persistence of eMMC.
> >
> > One example is the Arduino UNO-Q, where the WiFi MAC address and the
> > Bluetooth Device address are stored in the eMMC Boot1 partition.
> >
> > [...]
>
> Applied, thanks!
>
> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node its=
elf
>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18

If you're happy with the current state, would you mind picking up the
block-related and Bluetooth-related patches in the respective trees?
They are independent.

Thanks,
Loic

