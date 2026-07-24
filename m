Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E4BC531F9
	for <ath10k@archiver.kernel.org>; Fri, 24 Jul 2026 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5OlX/Y6fa0OuZR2iBX6/mXLJfOttN3HOhph3Z5qUHg=; b=hEhkyn5eJYQP2Y8JA/vMFObbl7
	W1pNmmTW97axJ/D1d6G2M/bJ4eWxXSt1XLxVvE2dU884ubLajGdoTNjrF4lnYALfftgkMrQ1rnuFq
	3uYyg3MwXdOOvc7o5YgPdsLQa7+VdZIHwocRai66SCBsnCH3tkycVC1UEMpfxxVwhgwkrnOKbZSov
	a/Jghz7+jvYfvgrvFPYVqn8laQ58CqvSTX2/YhgBUBZmu8tk0GpoXB5S7aFD1bPbtWhngTU7nsynz
	cgxolQZw2bqngdjjeh7JmZXDEP5r2iOaCakJ7za4NHT6bv75sI/0TxZNsa3a++QjBwMt6ZKzAoLBN
	PEjHl77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBw6-0000000FvjS-33T9;
	Fri, 24 Jul 2026 09:11:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBw3-0000000Fvij-2LEI
	for ath10k@lists.infradead.org;
	Fri, 24 Jul 2026 09:11:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lKmR2162940
	for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 09:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5OlX/Y6fa0OuZR2iBX6/mXLJfOttN3HOhph3Z5qUHg=; b=fFoOGKKO4kuyp0nT
	fF4He1gizvhJK/K+jNtuOmypiLe6jcOVryJajikOpMWYCWrTS20qU1uMr4+XdwJN
	tTM0mxWFT/Od2Mrr2t5O8+Q2SdbOmkq1KLhcxc02DyHdofedHmiCoIbGVoFhg/xR
	l5KYAG0qovNkLgmzyMcM/AtZac0ZULjkaLPLANK6D1fpZM0jLeSV5wiH7vMXdmB6
	z5dXGDJENHc63BKY/hdm8PiZ1lKJ9fh/srkorkOtsJl6da+w4lUgzG887tC08ZQm
	si2bm2K2ch2+CbmZj7ViAsAjYEoAlGSfqOxdtFumsP+R95kw2BTpuZKHKPnHy5e4
	dNOL1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vke8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 09:11:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so24355185a.1
        for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 02:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784884273; cv=none;
        d=google.com; s=arc-20260327;
        b=OU2m0U/+wSdORcZqGO8HPwo8UObcezQTksajV+cNj/zu7XAUnooaO+ndOKZ7RPCKTf
         Zr6mdZe+gwH14JrVhaHe7hrsIiY23hl6GRKiJMgIP6GsWYJhtM1z9XXq3+58uvsm1HIq
         rokf6QQ+7HOmIZdyaTpraVmi0sRMojQVjWzmqz1pG1QPw9a9JaBt5PnGEN9ljsO6jCOp
         hOxmsgyRrBT8qRDGqh1ZACRBH8WpAj57OQ8CiNlW/89RhZldkSke/IZua7KsGII3pgXG
         jKcql9r1yAbc6Is52H4QuSwd2mcrkOIqm0HpXc/6CsBMeRSL3k4HVTXfRp8SsWlgSOQm
         y7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O5OlX/Y6fa0OuZR2iBX6/mXLJfOttN3HOhph3Z5qUHg=;
        fh=uQi6xqrZUGoC0GzXCRx2H5/snuz4ywn3SJd8YD3n4h8=;
        b=ZOi/vbBMzvoJCjbs0kMXdyIL20O0mLsA0BXhObrX7Oq9CQmeVEmZInK/xgta6mwXOT
         Cg/bmEIKffH+4oSJWuUcMDWs6vm78F3wz2QsNgpXcj9JGNfk9mzH27b72hPGHz/NDklb
         vJc1W2o++7TJ7DO4xt1YvF60FE48WnG6VnHaqonD6FWaxeG3BsBuIA/X4Iul/LWV/YHX
         zRTAPc2tw3lGhjZj3oAsZRtzUV8s83HfOLM8vvV+VDsLECqf5/E9hENhQPCMmiopxtxd
         1a7NcJWtaKgKxebx43fBrFqzI5WBLy+/eSiVH63TD+cejLBnw89KHJeDeh67w9OstFgc
         XLqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884273; x=1785489073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O5OlX/Y6fa0OuZR2iBX6/mXLJfOttN3HOhph3Z5qUHg=;
        b=Gc8lv9K4qXgWaLYlGu7abVhZDOVNVT2BWVFy1/+SLycpFpyzKQd6sb+ROHK2QqxFVn
         JB/H3enTqlFLqOwifYQJwjiqxOz/FrSUZb+CX4DiuwuX677T8yQmHgfv7tx47AB+svpd
         VUbNADxtI6rSCXc/+iE1D64AzKHBAkb5khzOBHl5DaL6NP1N6U6WiWOQriuRQSvD4CfY
         9bH/Ix+qFWsqQ+pVjZPLb3vi+KttyAfra6ia8PKewyySPqphhxPGFa1qZ+gF0FGrviRx
         sRG/jlm1vfX6xB3mIl+tQn76xEaqsiEcQUBipH9jvePfkRMQsIBpguldmah17uAua90Z
         6URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884273; x=1785489073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5OlX/Y6fa0OuZR2iBX6/mXLJfOttN3HOhph3Z5qUHg=;
        b=ZRtMbqkLEb6NmictXmtCaOqmm01vO2bnrxzyOJZttNIJp4l3qUmAwdjDqZj9GL5zfO
         fH/M6/pPfN4hIIfIzGx01+4+yF5fNxzd4I+x24jxIiaQ3pHGW2zarDZm/qwI9X6VNZ5H
         8wO7fWI6ohQx11DinXs9z3g9nCRcjgMusCMlKFEas5d1krv9V/on8ZMbTNRy2/XWMyCz
         wqnNQLNMgNVJ/PR22x48vYcC8zlOnUFxfuThKB5hpNpmHQDFUkkWsVuX4nzmXvys/nNJ
         sAPf6FU39IayBWS4WyBcGTaOWFqogGuaOZWpUx9P3qMFJ69XHOkDYUulJPoFbMDdLM4C
         q/TQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdoKEYrnIPPpVQMAcl+gBBeCNvYX3cfysgC+l49KuDlsa3+6OQDKm0Am1J7Q6PJKy1wJ1y93U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSU/GX2qbY/JIxSACkzgQuBOOP+hZwTgfqc5ygOgn27t53i95e
	KuPQboG/DkqWQGoOkg0NJxjZAJu8uLOZyyMdAezxWpEQzLZBoRp0HIXF8Icr7vCwlDD3+g1Annc
	9zGTDGUeaoq2ylkM6WjUwibRlyD09oO0nqXudCcIiR7Z5Q9R9bA6VNaTbcIYXo8elqgrhqcGWL5
	u4waH5d0YfWHb9IjMQ0RnlKdIWaY72C1mHknJqMHQ=
X-Gm-Gg: AR+sD11WRVC5oCh0QS9yw2aaF/bZj3dzozasIYCPaV4Zmy1wl7e4yAlJOcrs4UJkLlo
	dbGBY0HBPHDtMvDHkr5maogIHKbNeXBpPzbM8yTtRsrtDZNE2tMESmW+WVMUyQ4hdp9YgMoCJWu
	eG0oR8Zw8FT5k8t4JaO/9hJ1IR5rs0p44fV3+6JjRmJ+K9dmNPjWy40ZAmLFdwsCG92kCZwDvlj
	WRUMtMMidN+togjXg5ewFBK6BqdlYNj6cjY1DuLXKT2KI++EklJKaMdMBAi//mbjdkYSOFIKfw=
X-Received: by 2002:a05:620a:403:b0:930:af44:8b21 with SMTP id af79cd13be357-93103a68f31mr501109885a.79.1784884272917;
        Fri, 24 Jul 2026 02:11:12 -0700 (PDT)
X-Received: by 2002:a05:620a:403:b0:930:af44:8b21 with SMTP id
 af79cd13be357-93103a68f31mr501106385a.79.1784884272380; Fri, 24 Jul 2026
 02:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com> <amLwz6WuHYUwKKJo@infradead.org>
In-Reply-To: <amLwz6WuHYUwKKJo@infradead.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 11:10:58 +0200
X-Gm-Features: AUfX_mzY-jAiHKnG4b5Pch2pLupvUwr-6r7tvUG9t9AtuCn-3Z_s2fU6zpincMM
Message-ID: <CAFEp6-1_iariDyqWj0KezHAtULSO+piPHX0F=Z46Rx4KDNLmXw@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX83AOoHUyn/hn
 +0BJN/d7+1Z6eTU/X2sBOarJH04hhMi4Oz3IOz+Ypsxt6Qp9aIxR21DKWRBJDPsxwafVpE6py90
 cLtw6xW9GMJCxitgGBBzN5LFkv6psIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX5TKprcfkGtiZ
 /VKiMNEuwT0vAqwWRmEOnQJYCmCoac7I3lSNtASVDmZFLRe9vyerGF8XqDQICVfE3nbibBcuoSV
 emdMbzlPSdq3nz2j/IbVBF73lrBej/8E15YFtsC7+TniLhXm5sBpXKRiGERsmGHxjP5CAYKVWSC
 Is3NH8GDzRs34Qp8qq9q1vcIvjtRvE0s/gZCHN5CUARaDIHEWgWkgtGexOh9yP4hVQHz9w4wQBO
 jsRH9Gzz/zqaKQybesshv61g+Nl5HOyAsLAAj4er59BCwEgm180W8fsqay7HHrzLbDrlLWnkaTs
 6Xul3WK3btj0K42AjZXXzpagy/GATY3GkQv4+eY6pVX1uDx1MyNyIoB/nXezD9wRRgfeE/s0PMx
 krZNgV5O+clS31ZlpMTqdt8lc/OGNCEsl3oSYiOhKxiiHPgDhF8ZnUAwwiLfT1aMpi1G7liT3Df
 +7zdhcvS8oCG8vfy1ZA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a632c31 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8 a=u64WRsu7ulRtC4VldfMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 9H_8kfGS-V0VtaRz3hQrqLA4VTv5W6Jy
X-Proofpoint-ORIG-GUID: 9H_8kfGS-V0VtaRz3hQrqLA4VTv5W6Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_021115_715631_AF253860 
X-CRM114-Status: GOOD (  31.86  )
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

Hi Christoph,

On Fri, Jul 24, 2026 at 6:57=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Jul 03, 2026 at 03:45:18PM +0200, Loic Poulain wrote:
> > +       Allow block devices (or partitions) to act as NVMEM providers,
>
> Based on the code below I don't think you actually support partitions.

Right, I was planning to add partition support in a follow-up series.
But since this is really supposed to be a block-agnostic feature,
whether it's a disk or a partition, I'll include partition in v8.

>
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from, void *val=
, size_t bytes)
>
> Overly long line.
>
> > +{
> > +     dev_t devt =3D (dev_t)(uintptr_t)priv;
> > +     size_t bytes_left =3D bytes;
> > +     loff_t pos =3D from;
> > +     int ret =3D 0;
> > +
> > +     struct file *bdev_file __free(fput) =3D
> > +             bdev_file_open_by_dev(devt, BLK_OPEN_READ, NULL, NULL);
>
> Please try to avoid all that magic autfree stuff that makes the code
> impossible to read about.

Ack, I've received mixed feedback on this. However, given that there
aren't any particularly complex or numerous exit paths, I guess the
explicit release will make the code clearer.

> > +     if (IS_ERR(bdev_file))
> > +             return PTR_ERR(bdev_file);
> > +
> > +     while (bytes_left) {
>
> .. and just use __kernel_read instead of badly reimplementing it.

Ack.

>
> > +     config.name =3D dev_name(dev);
> > +     config.owner =3D THIS_MODULE;
> > +     config.priv =3D (void *)(uintptr_t)dev->devt;
>
> Why is this storing the dev_t and not the block device itself?

It was originally intended to avoid races with device removal, but now
that we're synchronized with the block subsystem, that's no longer
strictly necessary.

>
> > +
> > +             blk_nvmem_add(disk->part0);
>
> Hmm, and you're always doing it for the whole device.  So the intefaces
> really should be based on a gendisk, not a block_device.

I will add it for partitions as well.

>
> Also once you register the whole devices as nvmem provider, we really
> should keep it from being used a block device, shouldn't we?


I'm not sure, the whole concept is block backed NVMEM, so we still
need to add that block as base layer, though we could discuss
suppressing uevent for it. Preventing block usage would make the
feature much more intrusive than other NVMEM providers like MTD, where
the underlying device stays accessible. And we may genuinely still
want to write the disk (e.g. for factory provisioning), updating the
very data the cells point to, etc. There's also the layering aspect,
if a disk (e.g. mmcblk0) has logical partitions on top (mmcblk0pX), we
still register/expose the whole disk mmcblk0 as a block device
regardless. So if a disk contains NVMEM cells, I think it should still
be exposed as a block device as well.

Regards,
Loic

