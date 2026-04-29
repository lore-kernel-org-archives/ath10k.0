Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9EDFF8875
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 20:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=; b=TZdg2GvtklxccJ7wdBfBAH1MC9
	Tuqfu3E0/AlzI+96NR394vVtmhGKidhevRzXmEbZlV8EBw5fU+bAB09j+y+WnzSIDLSeGoli3ZA5Z
	p2GG3eZOp6gN5Z+63GvAh4pZXgi2o0w+uqO8Vu4QxgMkWerS7yE2F3Tauoz5h+htnEfq16TI9bLMN
	JrsQyugbUP6BQa9xRVZ7OmO5mR+CUlS2/6qCXSw9KOoMR1IP16/F+y1MQgHKjVFBcPpmvQ7QWxiMX
	IzBYNayOcojBi28XBDcykld6bbb26Oay6ziEa2YYt++7UnM/dNH+YnJgh//hOwNUI2C5HBtTqLTM4
	Qm6w3/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBOc-00000004Bc7-2o53;
	Wed, 29 Apr 2026 20:20:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBOZ-00000004BbV-2BK0
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 20:20:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFFVme1728569
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 20:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=; b=ZJ1yil7RRd4FYxIp
	p7Iy/QHM4zbRhNpPA0hYLTXJPDkjEZpj0nlJd1/gcn1CaWRIma04TC5JKe3D81SW
	vVeiRZzWMnD6h1j+/NrrML/N1EdSQ9j/g1w/HfPjcjKblwHioKNVvbPOTS7wMt1g
	t0Gzh5vN5ormYORSYWNaDzPSF5QRW2Nn76i06d+SpiMnh38SIooyjOtYhh5AvjdN
	CZmgTmQB8ODoWqmGpsdbBkWvdolXxWGtqhvkZLbyynEZ4or8H895Tf9JexmnCUm7
	KfrnoxvQeAAeJ1xqAifF8YREdrGH3wXxomLatFCwx3CMWJQTzOX/W5W2A3BAs683
	leNRfg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5ktw39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 20:20:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf0245b0so3002951cf.1
        for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 13:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777494029; cv=none;
        d=google.com; s=arc-20240605;
        b=BRm017r/pyIuNAxPYheQb8TXcphnkEvkygHoETIShLGGaD0A+inUN0Vi1FHkMzdVf2
         aV+7Nyv6Za/ajaGxQabYeItD4MDVPWCG7lYHP2tXjdLIby4FPzshPc5/OzoZ7Q9b0/N5
         m4exc2HCoKzAJaibxgYdWc2Wbnw1qaFQPQ1mbKUOg/S5bFqcHUYcDqhwsP7b2FSuoXjt
         BHEsvDA8dn2N6Z9lK6uWWzHVJs/RFqTq/+IpWKniL0Edny+mEZeLIID3vq3rP+EYvo1u
         xWWDsYguGwkB2cDUNPLOON1JHX1w7JH22aMj0HfGqok+o3uxNESAIcuyMNP8z/7STZ8l
         6ZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=;
        fh=urtiGRUKKmWBxzrd8cFq1nOObu0lBF9aMtHigI90LA4=;
        b=ZflF07MaAH5bW2V6rQtij9exPOrPASt2oVkXQ4XovG9Yg7vr6FOWdxFRMcr9a8Py0Q
         9KnpOODtrviXBChFn9TPAHqS9YnnzwbiyxnUyVW1wAJyEO3oZO01Ghen4g6++W46cW7f
         lLuYzaTxCxeHyThKlyku+EosaA9TTbmGj+6BiW4ZZkwhqDLrXTl/mR3WGDLDaUY0CjqX
         ie5BoiDv3ZBgPNkxCE0LbNja3ZOwZc2a71u0w3CTLMYUyMiOU6WpwTi59OxZWXZeedJH
         il2pQSNFd6WybKwV0OREmujrqgdrqNFNow5efJilkhfOYxKYy4EP6FaW+XRiSLvZvLlY
         fOJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777494029; x=1778098829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=;
        b=KYI5Pm0g/GH6CVpL6t74FAl5GVVURQ1fVlSuRcWa2aTYpyOBt9oWWJVwCQw+Z7MIS1
         ONRnP6KEVaqjp2RG/jTI7qhZnkSFI3IdVCv7hS9JhCNDHkFK15gFpkktgNDHFvSOeX4w
         delx4WzheUvpvhHpa1erNyMioHvXC7C47L6PP1pte1V22tYzSJV4atH2ZNEEZBkSppu9
         4Yxr6bKXtNCsrtWoPYv1SF85DjFSRrdmFZCnQEp5dbKmEw+TonFblV8k+E/TWfBzU6eo
         gWduaZrVg32W8fDT5ufnBN5yK6JZ4dIMUw/LTuDtcgV0hFLLQR6ofgHqZloX+E91OTeM
         1zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777494029; x=1778098829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=;
        b=VYaa6KW/zBBjv1OWxMe5tVKQk0/zZ3I51xeO6waAimHmKc0gK6dnhKFrsTfRphvbqI
         F3DztzYhXt5s+cxFygvYIC4jf/2R+w5Fwb7uTBo1a6RYtcKJJeoLvtZWRtOyxEdREngc
         ss4B3a6j5yivfDnYCN+sGupjXa/zNg1lksBYraa0Oeeo8u6h3F2A/NhrBy+vKZQjcdnz
         wnghl79ryzMGRDzsFi59S1tte9wWXyFeeF+ZbtJFtUFopZUEuNv5INbZve86PxyqUNF0
         WUCkf8Oey3a18lCCjt95ExPmNCd+AIFQxUOOKaAApV7qqSvyDVUKEK1JuTstjIcP+XzZ
         CtJA==
X-Forwarded-Encrypted: i=1; AFNElJ8GTVKyiBmkH/H3WXlUq36tIvfhapmXWNhmMFDkmVzBQMHGnhDgcmBfaVMJSnll6xi9cjt7OVc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0sbR0zmbeiQd3AXcA6KDHO0b/g2nmSu2wRf6OeTHcp4u3/xaL
	Lq4wLX6eIosPZGcJ6a99jbKl5hlulk3FC+eBkw/eYvyDcad9PQn3ABC59wyuUVQWjFCRltNHo6u
	wW3ex52cTud7rhkEEzPbNFtofMuAu6IGmwH+8C1dkw1SYky3E4cVoihkgW+Meh9W32EVNQ541b9
	3VcXfFVtl4f5/raIrzpRLM2Xq8FXkjif8p83C9eUk=
X-Gm-Gg: AeBDieu4sXcisdRVEpX6r1rz+reK6ZX3ZcymquIapjOodNnm8Pqeu+9nsxr5AxwjVO6
	aHC9M7Cuw2ON2+CG/LTKwpZpVnJ+HrkPcVvfCnmVlKHIY3J9JSNKL6Tyh6UY/Z6TQLJQxsGt3l6
	g42JVffh7w03uWsjW5qc8VdbOLP9dIknxQ13E42/DtyxJc//0AClD4CX9IG9QaGyeJOD3VxoMBl
	9mkp+EU+dA6F6z8Qza7VZrBbBXzdLgS9SPqnN11705rR0TkDQ==
X-Received: by 2002:a05:622a:4cc6:b0:50e:89e9:271c with SMTP id d75a77b69052e-5100e10eb2fmr114762481cf.17.1777494029278;
        Wed, 29 Apr 2026 13:20:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc6:b0:50e:89e9:271c with SMTP id
 d75a77b69052e-5100e10eb2fmr114762001cf.17.1777494028820; Wed, 29 Apr 2026
 13:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com> <b4de6c89-dd89-4e02-8d79-911e4f9f0813@lunn.ch>
In-Reply-To: <b4de6c89-dd89-4e02-8d79-911e4f9f0813@lunn.ch>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:20:17 +0200
X-Gm-Features: AVHnY4IQns7j5YMIXICXGX8mkvbJAvEU7QYVILcU5HpEGI8Bxfo-jvWggVlQrrA
Message-ID: <CAFEp6-1GdaJd6Ua15TsyQC07QDbArXO2JZa9nKVFoCG=4xBpWQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Support for block device NVMEM providers
To: Andrew Lunn <andrew@lunn.ch>
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
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDIwMiBTYWx0ZWRfXwd74lQyuFDPu
 qdJ1xl22o9h5ZetTMwQC9IUTSlU1A7Lg4lTlZkDNlu4hJ2A++pR4H1xRmx6+cXD4oGv98qF0yME
 DSiCaZJ/02YLR9zK5NkUYXvhY7ySrEjrNHNpZgkmpc1Uu9GBjebEaKdPy5JiufqCqkspbvXzWjn
 FxtyOvxzNK5V7DgAde27m0YTgc4+mvjlIWcGwiyuTIpZPx8AA76idEDWuoeCRYZpTPvxPHvrp25
 I9Xkpj52sIpdAQYP2cuwxH3tAIt0zKA5S3GcI/CotQkvuJ/AF9ffS/OK60lsG38hUhF1RHx7lPQ
 JD/bfUFtC4GPbZLDWyaWIuk8tMid7Um+X3/EBHyhQofp4BMHvwzCc17AFLxvA3GHYphH4pQdEW3
 OWr2FaT4oJPuHoDl/d59ktov+xG1JBObdEUCqzVo1XcLLLgx9zndprJOltFXZKkRjpEImXkWMEn
 Z5JCBLFEHwpFyKj24Qw==
X-Proofpoint-GUID: EVSsSefJ4ecWrQzYWfoE7CPJQwvyxZIj
X-Proofpoint-ORIG-GUID: EVSsSefJ4ecWrQzYWfoE7CPJQwvyxZIj
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f2680d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8 a=ICsrgdoeZ6IjgJzXnBsA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_132031_722652_EBB1BA1A 
X-CRM114-Status: GOOD (  21.92  )
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

Hi Andrew,

On Wed, Apr 29, 2026 at 3:06=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Note that this is currently limited to eMMC-backed block devices, as
> > only the eMMC core associates a firmware node with the block device
> > (add_disk_fwnode). This can be easily extended in the future to
> > support additional block drivers.
>
> Would this be
>
> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/mmc/core/block.c#L=
2641
>
> Looking at that function, mmc_blk_alloc_req() i don't see it doing
> anything different between an eMMC and MMC.

Yes, that=E2=80=99s correct, in the previous sentence I should have referre=
d
to MMC-backed storage rather than specifically eMMC, since the MMC
scope also includes removable MMC/SD cards. That said, eMMC is more
likely to be used as an NVMEM area.

>
> An eMMC you don't expect to go away, since it is soldered
> down. However an MMC can be ejected. Is the code prepared for that?

I was about to say this wouldn=E2=80=99t be an issue, since the NVMEM devic=
e
would be unregistered along with the MMC card removal. However,
looking at nvmem_unregister(), it simply performs a kref_put(). This
means that if a consumer still holds a reference, e.g. through an
nvmem_cell, it might still be able to access the NVMEM reg_read
callback after the NVMEM device has been unregistered and the
NVMEM provider data (bnv) has been freed...

I guess I need to try and dig into this but at first glance it seems to be =
a
general NVMEM issue, since even though most NVMEM providers are
not hard-removable, there is nothing that fundamentally prevents them
from being logically removed/unbound at runtime.

Regards,
Loic

