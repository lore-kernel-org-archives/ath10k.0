Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10FBC98321
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=; b=fLcz97SnL7Q+Wec3k8eJmfJuHf
	TYzuwcVZ7gj6upQ+x6ReLGvPtfWskVXbxQSlr/o0pok72KeJPYlhoHY05COthl/CofFOOt3qMHCBv
	6qIPQ9yO7IXfA5C3F/i2WKU+gutE2yfFESkKDkAAgzWagoxjQs4mqR+Qev9sc2A1gEI56fpnVNl+7
	BTSU0d6LdXKyLrHaxotbeKb6ZvwKY61qAfw9AcP64++9WEDQc/SLqLptCUdtdNM/m4uKC9k66vuga
	Te/7q1DUwZK1zBLrN51xsbenjzm/6pl/KYindd2LQSHgtGwSQ7BQ5HCjOK8gAihGtMvYJEkia18me
	g5beInEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAsE-0000000EAw8-0SKH;
	Fri, 25 Sep 2026 18:42:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAsC-0000000EAvm-1QuK
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 18:42:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0lYI2124483
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 18:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=; b=aSlUeud9MMrnTvaE
	fBNW17DTlK1pd3VcwQpUk4ojbblR/A1hMmRDFhOv4r5cy3OVu8i2q6RmCi/4vkuZ
	vUfJnemh4SMXjd7YTf5sbLQCTkc017+cBse1LMO1nsJkHCEWniirrH+WKHG39Sy8
	my8Qbas7L+ScsIZTV2pNDMGhJ3LWocXSDZvk5Td6QyumagYlnF3T/M65woH/CUay
	IGqzzkIMWOsK+Mg9kxItyfWdlSbMOxtpgASz+AMsYETe9UpdCinK6WF8DBzpNC6p
	SaGtAz+max3hYXt17goBn1g67FdMVjHnVQNwOXVfg+HpnIOlmupIwqr2msOh/dir
	1yJ5vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq0asfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 18:42:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c292c2fc1so287256985a.2
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 11:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361734; cv=none;
        d=google.com; s=arc-20260327;
        b=T2zDnXRYncQzaYgyzRzNE65gNoAmeUezDrclsMtk+kDEL71yJu89+sjastCKMb7Y83
         5SD5lw/17bWSwTGMBXrrVLUi7Hs2XN6aTic24oS84kyREzGMsia3CGEnUh3LIOQM0JPd
         /82yP1krHECqaGokAWgAMvCIcbiqJlv/qkJdw39lmzdgO1GL/dQer6S1GpP3eJWkf41x
         BHzOKWsCdWFITs87z541pmtNKis3QMQ44+Ys4kLs4euXqL9IQJsQMqo+xFN02DXP0U5H
         G5gaKrpoVlrNPMj6Pc6UFB89i7THl2rGqWNWKjq/+7qbw45jInltocB9sgF5nzEHOHTy
         DsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        fh=YqrypNwDWboLa5L9ew4giN7hM6FsoyRviiPCYuPXRSA=;
        b=IUPGcvN3YT7Ycn1vnTsRvlvMVPsBWF2mZIUU3zmjVfoO2RffVo9xiXl4aYLpJ78ogm
         Kl48ysc4OW84R7tzmz/wed9EJHqeLQszGbYnyN/MFBZdWhdA1a6TGbAdALno7s5RNDPt
         qtMienDruLxIoNCrqoW6QwS3UrgLZaIj6XeuFvjwrERfg0UeR7pJQyAt9/Bm0Y71Eyln
         +zl6W+K8Xdrj3LDHHgSU+v6A3XM4sIK6E6yFJQEIkp4e2ZOIJOKWmRueNeitli/ohM/g
         jGDrhvRdg2MEuZ/SbzEBmYOBIkuspw9TjlYCJuZHIYH9w+ayq792mBzKmaJzVKkVh22m
         njKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790361734; x=1790966534; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=QsdX4SFjJEKfcilxyIONCm6u6LaK77DGJfYKWl8yLOkJiqKwBM32vql7NnCs2VvNkO
         IAHMgKy3Ww4L3XQB3dbIWmfHBAiQhWs0/JjFdxi6ksLijz4lE2/W1AtON38ldjxMgetj
         fMiErPKAZZb8OhR/QzOr511/1KiqU2lNFj/wNw1aPSt2BZqYBXiFL2PVq/ZFBUVfd6hm
         7pS9sEaojTGDChsTg7JPeqwHYB/CCdLIkHI/BeY2qECYMYoL4jzvgv/5v4RjrQrY29O4
         v26DwwuvD+eoEWa0LrsgVhY1fvsDVC4bI053D77aqTZjHwCOQdNMJu64La26a/nPRLYm
         bFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361734; x=1790966534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=JCTz3cUQP5SM1tcWI/a2J/3IoZbsxH8BrRHdyYLcbf35ywSQBsPw9Yei8GdAo3YbRB
         AlIdjkgD4DUmCSBdHJd5nGO61tmw8KXbkoAZUT5NSkh5T5FC2EcGIwjvCR7E8M4cEP0u
         SpchK3KtIsg6ZtDNG2CYeIBMrVi16pIS5+qGjGVHQcQinvjmibwoANLVv1UtQkylUzJV
         u9RowfDZsW49G7K9mQwsSYlvJTuvVHAyxT4x1NSEBmpWuUEPkRs5/HG/Gw8F/4ACEU/2
         2qRT6xW5SvwB2yhnGnlQHve80LrCKmsEuUKaX/TUb/jfcNhL13c7MJ9kiHtLMp5nRT5T
         EmRg==
X-Forwarded-Encrypted: i=1; AKwUvBw/HMFH+PLxMqSbsv9BX1Jws0yvwGBqBamXTpD1A4Q7QAUjsS2BHbnDpc5dBF6lQ8zbWP56jys=@lists.infradead.org
X-Gm-Message-State: AFuF++lwUIKSgwG1K4Zg3CBCB3ozZGOX9rHCXhWeS+6Jjg/s8lPcm84L
	NCDE06W8WsQ3fd/lDxz5eXntuKfB0fBL5wAbMXHuqppjtYi5lfr/RX0rrhVkwt2BcHtw+VBFkei
	F+InFj4yoFmAfTkyDXqZR3uA8/ZT3GZXsOIW79OYYCziZXkNbszApfd20mVfXEWFqK5mkJp7+mq
	9a6Iw0sXhO1hqWyQto+tUGKbEDVxbXGjRrmq9piv4=
X-Gm-Gg: AYBFou1/rz5yrVSrFnLtGVlbD/TwLMQTAHpeLu5H6vwZeFT6dtQ8xRtig/UG97OZuSC
	gyHuAdugv7/6InwKGNZG+Y/swv8LIdKnV91dehTy55Y78GWUednknCV6rBgGVHSQtI5ZMehQBQJ
	afEpTPgiJxPXeZ9AHfFrP9eg4Q14ZoXIEIgE6af1ro5+iRBuz5qXVaBAatPMAiAEAwaDzBfOYKG
	xl8TSkAdUX3AnV+oedWJ0K/nu0wVVnWouInSqB1w114EiNRkDD5UOUUEL6IFp0tuZDe6XZbgueh
	AoMngGR4nGeNdt7FeUzZ1CEBqpZz
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93c43cfd3cdmr614936985a.25.1790361734019;
        Fri, 25 Sep 2026 11:42:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93c43cfd3cdmr614930485a.25.1790361733529; Fri, 25 Sep 2026
 11:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
 <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com> <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
In-Reply-To: <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 20:42:01 +0200
X-Gm-Features: AclHuK9eWyYSXO1LoWJtwtSLZuLm-A6-I11eiFIWKFJB95hJR5ZP3c6jJQ_Yo60
Message-ID: <CAFEp6-074kS9GO2TFcR69fMjuu7Y2Os68CzWs-KUfmZDYaPZ-g@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfXxLXhHgpm7mrA
 GrCBQfQdyibCtJAtofzPm2ZFzvUD9fbxGjmIz4dnbvF3d3iscp/I9tUShXFiDu7Bw9Xl6NT7HrJ
 /4+EqqsXp+udBOpywZw0MS8JuGDaVUc=
X-Proofpoint-GUID: AZMm2npcWNYzjnprbxTbpphvfIqZ2zPY
X-Proofpoint-ORIG-GUID: AZMm2npcWNYzjnprbxTbpphvfIqZ2zPY
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6c086 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=8pm97rweiJCjLsilNG8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfXwytle59IddZJ
 dj9wdSbjJo8mEgHmdvQu/DRcwhfweyoD8n7ajrzcoEP6kfx533Y3tkD7ZGzlApSh0iK4a10aywh
 7riX6bLy2ZjeiV7YgcRxvJQ1q3VP1uL/f5Z63e47Nm1CvD/ZfJqWJQ25u+nIQGI2FjgLzSqhvZz
 rsrNwxwYDNRUN5AN0AXkJXW8YE2Bz/id79Kbtm1/vWC9mQDVOEDIhIf4knemrPHm+3mALzjQV4+
 uH6Bsd7H4N68QV8x9PG9MezIGriCvR1CDs0lPti4bVTSQVjp0255efsPMoW2RXPFsKs7q3/EWaa
 Xs1D6F7k48f+ose2s39DHwHLxhhLjGXgTj0ZxinzD0gms1AOq+Ctj8SE1l20GsXRUj7QK0fSOHR
 WHlXPWInFm/aucPYZXeAfHsxIEQIPuBMMzvqwqYEKwnmpZhyzFn1XsW5kgpc9yYBWYPhJIJ6lcw
 XYdj2IapNsBwzXHndnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_114216_500230_ECB1F2A5 
X-CRM114-Status: GOOD (  20.82  )
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

Hi Jeff,

On Fri, Sep 25, 2026 at 4:10=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 9/25/2026 6:38 AM, Loic Poulain wrote:
> > Hi Jens, Luiz,
> >
> > On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@ker=
nel.org> wrote:
> >>
> >>
> >> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> >>> On embedded devices, it is common for factory provisioning to store
> >>> device-specific information, such as Ethernet or WiFi MAC addresses,
> >>> in a dedicated area of an eMMC partition. This avoids the need for
> >>> and additional EEPROM/OTP and leverages the persistence of eMMC.
> >>>
> >>> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> >>> Bluetooth Device address are stored in the eMMC Boot1 partition.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node =
itself
> >>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18
> >
> > If you're happy with the current state, would you mind picking up the
> > block-related and Bluetooth-related patches in the respective trees?
> > They are independent.
> Should I take the following, or someone else?
> [PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM=
 cells

Yes, it would be great if you could take it. It=E2=80=99s mainly about addi=
ng
the possibility to source a few device-specific values, such as the
MAC address and calibration data, from the NVMEM area, regardless of
the backend, so no dependencies. Moreover, the ath10k driver already
supports those NVMEM cells.

Thanks,
Loic

