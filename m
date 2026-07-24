Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C921C531FA
	for <ath10k@archiver.kernel.org>; Fri, 24 Jul 2026 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=; b=BViCwmJjyomcaFc6VJTRQbLzvV
	kFw+xzq0CfQ1D3WzOKFyiDuJDnJzU+H9AGZknDAcewAYbXHoDhEulBHAh82hb+QQE+vhtgJrOt/Bi
	F+C7wrKmnD2X6+iGKfijY6DDfNd65wslznqoHvNJSybcbSpgXa1PWpIpw1Kg3Lhbz/y4Me0QOuyN/
	w/QamD/2PJHbmEp4Y/2v7k6u4noV9iI/g6Z227AqMlb+NQSJ5YZ+jLUE5pHBdgHFy0mnc+Q0dRJf+
	xJ3y8/oS8RgFVstGEb884T2x5M0JepeUiNZSzlGMbh552YWaGB4HixFRbD4FtpE4yrrDdGNMq977F
	Ed0zKqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIcK-0000000Gout-49Wy;
	Fri, 24 Jul 2026 16:19:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIcI-0000000GouO-1I4d
	for ath10k@lists.infradead.org;
	Fri, 24 Jul 2026 16:19:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb5qW2933423
	for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 16:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=; b=nbVcHouGe6Z+VeOs
	h7qeGBArJI327t86C+PrctOZsyltv748m/ScDV0HsPpenC1z3jFTg4LyiV6J/FyZ
	owGOr/4SL9LTo2UqQvKh0uDL88gNcHr0uVKuOvntU6WpM2VT9F00DWYccU7reCNf
	3W+Shr4Az7Cj3bgZwWT10I5+AfeG1ieAsn6FNNauwF6wH+zK8KT/3uOxiM0PKJA5
	g5hCgpfIWj021uazh1SKvG5t/yYiUeiG3mZT3crN8cA/gFB3Nd8A8h8MQQObHNWx
	CXusUmB8HAJeYd6rra2az3epDYLosYNDbtF7F4WrLTpOgjM4yHXPbGflsMaEgVX3
	My6sdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8s4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 16:19:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so62866685a.3
        for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 09:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784909956; cv=none;
        d=google.com; s=arc-20260327;
        b=PMgDcCT3RPEEtrj0P6uzWqK0boMjnn1HDKznyxxTo/xDdkJwfA3uqLTclmAafSWdSn
         5bXTfAIZ4w/A2hIuOwd3JIzxr4udlrJqPuaw18vbI/LjIqG6MHIvWo5Kyge7ibQAaY0t
         CImXjSNgXwdwRyzGrYvOgmuQUGQxpW+1FI0/6Ho35xAXQ2L37DiZYwVlnm2YKHWVLpQo
         ObQ5+VwMQy17jkq9vjhci9reSPFnvO3uomtfG6TtWKYry7oWFJtrsQyLfyJURNO+1In6
         KeG945bRr9r8MQt7gG3uMYOtrNRZXhwak6WjZwpAs8F3JA3FPKL31ea2eB1BmI+xQz58
         wVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=;
        fh=AchxWgyqh4MvQQlplvUFZcE0NZy+Wgpyp4ZcCgMXKE4=;
        b=L1pPZm6apGD2r6tVT8+MMuDMejV6+D1hD7dEXW+hIlbFKhMf9WzFfTY6G7a7uKQnm9
         Ua/cs+Y0fPh+3L5z0uJMdsvSWkGmZT8Q/rEbZBOJ6r/iGaTzULCL6EEkJk/70HRR/6jJ
         08zwsmN0ZSYnj23xoRW5Q1si7FyN3mLFacdUZ0vZZCxXsuuMx/H0DtT/MkikzqHPxIaj
         k/cY60FrRUoyA1cEPjd43jH6O8y52HA+HU2iADCvWToXNYmj+iS1lOIebeSBY98SqEUw
         1nH4rQwZ6S3IYlv0EnZkD20XAGBXVPIWL2Cfsc0BhYqgxQPVa09ERt0bAeQuC1kq41ZC
         6brQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784909956; x=1785514756; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=;
        b=NvHD66vLr2P7xpOx0HerVvw800unCc7xNdne9ovkfrCdO7VevkQQVMCFs9brnLNJ0d
         17vCo04qV0qTBmeDDJqmUaL3KaJl1nSX9whBha869YlaPjyLu3gWvj01GDTVVxtIkBHx
         rJlUAS9Rq5s+fFvKzih+VTwH4XGXAAO83f0qG6j4o1/ns39AXZVe4OTk1H5YN+JocPA0
         AjYQMo86M/TNNME9NpJUSxXQ0lFqlngn0UhHsJP7Ze6NlmmRFQfwxQnM+XqmMWCfkgyj
         A3vW1GVZLsd5jUmwjOBGg7pBZOG4PnZl/OiHC6+W1Mo69hxdb5rUxA5QdiidEhbpCU5v
         NNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909956; x=1785514756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuTrxtmptBklBXvMb0kKcU77gZb2KY5onwBT7j6J+nk=;
        b=E5ct3Pq+ZXNW2vqfDW0duKf+LmYYyQscXDk3rPX0VYGYu+WQe8EFtolgGFYvRe89zj
         0AiQ0C3JVBxFlhuGZC5CpKw9rkWVE/ExqCfywcZ75iRR5ofv+pIM14MXLbVJaRKzIT8H
         RXYCFbB5msH05/1ANoU2WlTw2Hws27wVedH2vhopu92+iCdJmeBT/zrNOgbL73c8NXpG
         zMHZ8pQFgIlyCjjjP5I7xC1KqlJpFSIWyAtwMq0GnerJmKmqSIZi+/3N9iDCCPNwlRyy
         b7STkXiWwIyE6lpgMv9Qg4e9/LoE9KywrOcFaaP446yTyiVC7c5rR7wKX7udKVijiiVI
         0QTg==
X-Forwarded-Encrypted: i=1; AHgh+RqdhMxH+B8S7cq21paR8v4TbpJ/S0fYQDuAM6dSf7v2jiW0hf3Y+8GonSe0JR7JyNz3LMkUaog=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTJXg0LCPrPMpKuGfngHWMFfmt3ev/ZxDQpLvik1sL+MV7cQAB
	N77BsMKBuegW4nKqTdVm0kQ4my5bEK8MjOTa8hcuwr3Zt9SyAhUkY2IMvDtJ/M5QvmpvSNzBLgo
	eFm2tW992SRAfN1XJvtp4myZRTHQELxRU1Asen1Ch1fniaKntOM5uYBwF9XBIywo1Sal43yDu0z
	0P8NlBBF1mI4apLgAx4ljdTSfECRwzfI0e89B1cn8=
X-Gm-Gg: AR+sD12/AtkoUQaM2uO87+W9iImdvVoAcQYNSrPPXHUI6sOf4bbm92xGa0xzxHq0Eig
	ZOJKp1bk0fto2jJHAP2zsnovakWtwMu5cnKVmte2AnnomTQKrpw30t7TtsegNuwWFH9upTUZxMY
	SgwqiPFZ4RjHODyV4O1tzGkM0SSb4i7oOiTi2P6CjMfYCu56CIFL3jUeW0flZeL47/QPuNpfzN2
	GF6CF88eRaao8vft0P1jL71x4L2bCeGYrpQ+5hTTh7r2aQ1dxW2G9LWvb3HUj6yIHGbqzho34o=
X-Received: by 2002:a05:620a:a29b:10b0:928:f440:2dc7 with SMTP id af79cd13be357-93103608240mr655012785a.35.1784909956509;
        Fri, 24 Jul 2026 09:19:16 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:928:f440:2dc7 with SMTP id
 af79cd13be357-93103608240mr655005485a.35.1784909955860; Fri, 24 Jul 2026
 09:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
 <amLwz6WuHYUwKKJo@infradead.org> <CAFEp6-1_iariDyqWj0KezHAtULSO+piPHX0F=Z46Rx4KDNLmXw@mail.gmail.com>
 <amNkX6HV7c_8jRUa@infradead.org>
In-Reply-To: <amNkX6HV7c_8jRUa@infradead.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:19:04 +0200
X-Gm-Features: AUfX_my698y_ctqeRF24VMWwW_1w27mTDvVkuG8C8ZhXfnEBEfynx8DYsYuY-cE
Message-ID: <CAFEp6-2sZTBba4isNDmykh1X0HCxoeWQb5_bJp7AGQHU1E+MLQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] block: implement NVMEM provider
To: Christoph Hellwig <hch@infradead.org>
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
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a639085 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=JfrnYn6hAAAA:8 a=-e8Xlw_gh5nxI56MKtwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0NiBTYWx0ZWRfX5p4UJS5lmswR
 dod9qvzaAHlp++pgyhxGIJnNp4F4KXHhD3g0gtPeKwECNn5YUAbyE6ZzuiWvP3yVrQdL1rPlJkx
 x0J3e0+p9a2/K6G+V9PMYM67rdte23avdoxhOy2sZBeMsnjKEd8babM1OmMHNZ6o9Sbdxpl8P7+
 K7+tv2de2llE3MkaKQ1c7alXmNA0myxSp+NvScfa9MfdUWmdTCSyFqDC5iG3Nqs6+aAHSmrNNiz
 RzI7AMxr6MmlIpQML5YiwCBG3WI/vXwON6c/FcYsrYFuqGA4DxUWNFpmt3gCfu7rBgFfmHfau4r
 0HVXTeapGrWfrnUIXzMEqbVIrCQEzER+qSTqTpAz0ajXhB5z2EcQVJC2t1cldJLgQM50NcZmQy/
 bjWMBevkG2tH+mHRZhGcqKA1qjxPcYE1bWVpWWzV5psRVI0wr0cRWy0dgTybYiYGwbMxx295H1V
 oKhyhmW+HdCz28QTFiQ==
X-Proofpoint-ORIG-GUID: pDboqZlMOOYPzYZ5kyiIlPnDNrrgf-eG
X-Proofpoint-GUID: pDboqZlMOOYPzYZ5kyiIlPnDNrrgf-eG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0NiBTYWx0ZWRfX7bDnzInbaurn
 KXKmFrI8ih4R1oBlklSO+EHNORGjL9Ae/Guu/BDClQFDhqV5+KGRdBAh2d6QIkATs6I4TWvbDPX
 QtcG4gG1Th/jHwLRRigfNDgjk+S0S34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_091918_373524_C2F37F30 
X-CRM114-Status: GOOD (  31.96  )
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

On Fri, Jul 24, 2026 at 3:11=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Jul 24, 2026 at 11:10:58AM +0200, Loic Poulain wrote:
> > Right, I was planning to add partition support in a follow-up series.
> > But since this is really supposed to be a block-agnostic feature,
> > whether it's a disk or a partition, I'll include partition in v8.
>
> Please include the partitions, as including them or not matters for
> the interfaces.  What is holding that support back now?  fwnode
> magic?

Yes, there is a bit of fwnode magic involved in partitions of/core,
but adding it is fairly straightforward.

>
> > > Also once you register the whole devices as nvmem provider, we really
> > > should keep it from being used a block device, shouldn't we?
> >
> >
> > I'm not sure, the whole concept is block backed NVMEM, so we still
> > need to add that block as base layer, though we could discuss
> > suppressing uevent for it. Preventing block usage would make the
> > feature much more intrusive than other NVMEM providers like MTD, where
> > the underlying device stays accessible. And we may genuinely still
> > want to write the disk (e.g. for factory provisioning), updating the
> > very data the cells point to, etc. There's also the layering aspect,
> > if a disk (e.g. mmcblk0) has logical partitions on top (mmcblk0pX), we
> > still register/expose the whole disk mmcblk0 as a block device
> > regardless. So if a disk contains NVMEM cells, I think it should still
> > be exposed as a block device as well.
>
> So we now get two unsynchronized ways to access the same device?
> At least we need to prevent exclusive openers on the block device
> side.  And document the side channel very well.

Yes, effectively, so the simpler is to open it exclusively per read
in reg_read with a holder (exclusive). This gives us proper exclusion
against other holders, but only transiently for the duration of the read.
It's the simpler solution if acceptable.

Another option would be to claim the device for the whole NVMEM
lifetime, but currently we can't bdev/open the block device from
nvmem_register(). That path runs early, while the disk/partition setup
already holds disk->open_mutex. So that would require a larger change.

Regards,
Loic

