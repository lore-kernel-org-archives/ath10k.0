Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E498A606A89F
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zajUJhqU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bbSAKYvX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgZycA0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=; b=zajUJhqUjfuVod
	n29TRm1V3EhoSENF2/yLQ483DshJzo8nQqNiu88wWF7QGssVXsUXiZPBKJz/LPkPVOcbgN0vhPVau
	mRJITblC9vT58s/c8k+g3kXrPwwgJWf3syg94Xsp4pL9DT9RElsImNjj3k1y1dEZO673dIuMm5f7d
	alb9/cSYCaHe1LJ+UdlxYQKG9PhVR8W4CBbEyWGz77fvmKKFgD7NIeIS+MKKJxgdkEEOvhn0JtAgH
	9F+zARHuBgaedDfI58csjlpmjQmPKBTh71TK340jeb/vOkQzdufdWEob+7Fq4ltcLz3OW/5n0OlHY
	VUV6krPbV79e1G1HhgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtU9-0000000DRmU-3BZt;
	Fri, 13 Nov 2026 15:46:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtU7-0000000DRm0-1aBi
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 15:46:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5al1189956
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 15:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=; b=bbSAKYvXGPvY0V+N
	bRG4Xt3FavZ5yMSnamztID6YOs2nG5iqmKqal1KXsVHcKuu9c9TtY/Dx5CUQDZSU
	i/IVhBT9pio/QK0QcHi+XJgKNSKHHM7O7DZXDR0aErFywvK5ymRgqcLBEu0k4Cgk
	9Kx1aPCQFjevHwOaySSk58RdPJH/p/QxVsqxVyDSnqWLlVJwNFSolL2yBumQn7r6
	g+K7FL8BVIjcgx9Kwso7KI97YqLBb0PxNSvrNBDjosi+wajwg1P5NHfWcv9qTFV7
	bzEvqB5k2aiVkbAckBc0AUrnoBt+oScbHpRuF2aS1G/PEGSVn8Pna13vR0mLxSxa
	p7X14Q==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufk1gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 15:46:38 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5384e381fbbso702316b6e.2
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 07:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794584798; cv=none;
        d=google.com; s=arc-20260327;
        b=lPtzbiqNHLQwoRapJ46+/J5c2JqTx+zYaazaXytv3A4WeDeB0rIgdsCd+OWpjUDs2A
         8Xas3aUHTVyKuq2Ig2403/AWeLRoqt/JT5ZVAEqJqdbOwJC7VmmmUN7eiZXltNMI0/3e
         i+R/Ak4TOLMMG+d1jNcgP651xEEiDEoksJUsgKdiaa7bilm9U6ResRC4ubEHBxO/R5AG
         c9ryJ8EpOi/DpqbMLUD1nF19Gc9FyPf/DFADjqXf20xulQPTP48C8Rfr5R5OUCzqwZ0J
         1yZ2sxvtZ1g82rF1/4+T/Q74n8wqZI//HR4YqXxFNnZyxOHtSdISX1rwl1QPrZgR5La8
         tL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        fh=oQKVMOvz12qTAfmWxIvpmojsqn40tY7v3kPg3YdYDck=;
        b=fsI4dPpu8v/vTAoRlox1GmXHa05F5fPaMVGkKx9MfiRjpdIC8lPA1IV6k2qNFYHmL7
         T5ejNM3TyRkLOMeoRXqGsOci0bhoLTfIix3Kcvo2vVwMCMffuozsjrnXiHLS9eI/eWhu
         +9LCLkwtElif3zMswhzCfBYYyelMWHvVhDRo52MyhLePwBEZuuewf6vhRr8OHiC3EMoc
         TwBur2PDXYz4TVrOhrsURLCzqfUcuOu19A6N0fXLJYVJ2e1b/uxpqLiy+FoduZY/TlDx
         +gF9h9CI3kEvKH7/USadWqrF/WV6pE9dVWfTMfSClyUW7j9DlR/edRL83F3IKKx7yOaN
         IFUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584798; x=1795189598; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        b=LgZycA0ie+3dpwuAQsboPiKh4pslWKpnIXetjFMzPPXfM0yut9MPScTaRIVCZvNUkY
         oWbp6NT/vH4x9ET82rvJqHpVf98/+w2673Nt5UnTqe5C+Go7SxsNL28ecEOi/mgnvCfT
         rM/5AuqRTpwsAXptDa2MKpAdu7lHo9ws4j/y0mtZ48bK5K78tIgXlUm11U6/+6E4lMvL
         r0ShpxyAM3t3LkeNs2lYt+UC/3Zl/je8AFwTYsCtiUuFML6XPx6vTvlKdP17tHWuirQT
         kdbplcfUrQcnzMSHS9LPnaqqYKsVHKgIeMwSGaLEPJXHvouuQ9cdOn3W+VRXLFmL5E2L
         VIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584798; x=1795189598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        b=ce6Y5nBLXUJ/8/inRDjOAewl5kd5eZ34HBr46pLD+yJcVl9hW8kWkUJ3H/iEw2L160
         BLirVH+AYcAVmk3fhWBk5uCF54S/B3dBAeBw0vlsXek52PXt7FqhSarpJOvSy9D5F6EY
         kJsxagu45ABP2hvHHDMhxDyHcruNiW1YOnFE17uklzf2a2zgyL7hziFGNOrA6rnc5GeP
         Ys2T+zo/3BJnXSK3i0nE4b0/+ApqtWc8KLW/H2Sin+YWPCOay05tM1/hnjFNAjWvxsi0
         QdzHAntdCl/UjiTusp4eUxd4xJPoHQyS8DT3iaH7V0zlEqvxr3cQMMg9tl7TQkU/mfpU
         Q4dA==
X-Forwarded-Encrypted: i=1; AL+hErGjYOJsDkFx5yGMD9pYXH7FLmXWgICSTy40pL+xIyCvUviobsdSzjPx+kVgcxp5uljTMHOFZEU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/b0FG16Z54EKQWKUBLN7V8EuwZ69BBWxZ2zZvYLYWOVaRPHEbE
	Det4wbCLIzK9mML2rdy3bIoO3sA0cgatLNoXPCvKmOCJ3UbClB1xMqkiYKed/8Bw5EmOayi0RBu
	MgCYU0d5r9C1fKOsUgbe+OwsFVHap/B/lsdGIt8q9eIUFlEYLCZHPhhM0qvunL4ABRY3m0yZP1R
	aLZMdNmMJEDaKbPzJU12VLLC6m4+CjyLsynquYadI=
X-Gm-Gg: AYBFou0ljuggXOjaUtgHzGrL98ErgmGWHAZrv+sP72mhWbH8SxzLQBSU5bt/cI4JVNR
	N8kEJ/wAEl2xzGdt37q15ncJP+rCTSM1Y+Tft8Iomdk5/074EHFWP1JwWCGQKrQ8NU1PI0MKwk1
	lWKACmm4Zs/Tk/p6yD6QPcANfavrJyKqCDBy1xWZYyT2cyyT8a+FG0/+ejTGGilI0VGfK4ZE+ZS
	PA2l2qesu75CttiE9EVipzSPdTuF48FWFyo5unjA0U1Odzg3Eh0rtf1Ve93dY6iGKxC/hwvO7Q=
X-Received: by 2002:a05:6808:1303:b0:4fb:ac9b:b084 with SMTP id 5614622812f47-56e6530bb19mr2540024b6e.37.1794584797981;
        Fri, 13 Nov 2026 07:46:37 -0800 (PST)
X-Received: by 2002:a05:6808:1303:b0:4fb:ac9b:b084 with SMTP id
 5614622812f47-56e6530bb19mr2539998b6e.37.1794584797569; Fri, 13 Nov 2026
 07:46:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
 <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
 <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com> <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
In-Reply-To: <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:46:25 +0100
X-Gm-Features: AclHuK8sUK0_ujE66S2lKh9E6PaK84E5j9tQjywkDGncX8ILJWnaaM_7a6IV7jo
Message-ID: <CAFEp6-1xf+ab7FhbBJPH05V7zK+bs4vVwVHJCHZEBCbjcKw9EQ@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>,
        Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DQZOj8Q_WdsEqawDjIeslnso0Cdo9dVO
X-Proofpoint-ORIG-GUID: DQZOj8Q_WdsEqawDjIeslnso0Cdo9dVO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX5v6CtNdbSvXN
 zlB0JL4OZLeB4tgFECD5+pgxgqeSw9pHHT38Q58VaaXzkWnfquZph+jgeukQDF905rDzVz38e43
 NMXn+m8N5tJTJWJJzQbJHJVE8HmISiCGlS0lLDwNTj/ajOc3auf7zA3zE0UbBGBpJPS38Im7GX6
 cUwkmn1OBnwaxmxZ7hT4fnfM3cvMLeXgDlXiuB5TsdTZh3oNeM1xH5gIbFEZtLdzsrhLRjZYXV9
 FpMVtUmFblXzZgespjd4QlCVxybObTHsyO01fEaSWE5arXKmGXfp7HC5xcXh/jX8D4rR5pogO4c
 LEakN3WAe8YZV9lRbW8y9TDAsBquQkOopLn6ASKDOJFAu0Jv/gg6YgdTW54fHb4niakhMXjUO5u
 ErCIls+nJoygWGm8OKe+gVkLj7PddhINaDT0Ev21f09rOd6aIyr8Au2geYb1Wo3ZOgJFX7Ux2D6
 BEgQE9BvHmV134FlzNQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af730de cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=4MXX5DyrQvMvXEW-PiAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX6ElCT5q/rSAC
 4boJeKW41Ne1UZj90icdKg0jwaQ2qcSmSkRsj4lRw1xhgU1OZenwa0aIEPE/ldAxh+VBZN3kgBU
 TwICqkPmzqkz07jIqf8d0UxrBtCJTAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074639_420877_56636693 
X-CRM114-Status: GOOD (  23.80  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nagashima,

On Tue, Nov 3, 2026 at 5:45=E2=80=AFPM Nagashima, Shunsuke <shunsuke@nagash=
i.ma> wrote:
>
> Hi Loic,
>
> On Tue, Nov 3, 2026 at 2:46 PM Loic Poulain wrote:
> > If Linux-firmware ships 01387, someone will need to confirm that the
> > MFP capability addition works with that specific firmware version. For
> > QCM2290, I can probably test it myself and provide a Tested-by tag if
> > you can describe the expected testing procedure.
> >
> > Yes, to Jeff.
>
> Thanks. Then I'll start with the qcm2290 file only, and leave the
> shared 01387 file until someone can test it on a db845c or an axolotl.
> Note that qrb4210/firmware-5.bin is a link to the qcm2290 file, so the
> change covers both.
>
> Test procedure:
>
> 1. With the current file, dmesg shows these features (crc32 a79c5b24):
>      wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
>    Connect to a 5 GHz WPA3-SAE AP (PMF on) and run iperf3 to a wired
>    host, up and down (-R). Do the same with WPA2 on the same AP.
>
> 2. Make the new file (qca-swiss-army-knife ath10k-fwencoder):
>   F=3Dwowlan,mgmt-tx-by-ref,non-bmi,single-chan-info-per-channel,mfp-supp=
ort
>   cp firmware-5.bin firmware-5.mfp.bin
>   ath10k-fwencoder --modify --timestamp=3D1706616060 \
>       --features=3D$F firmware-5.mfp.bin
>    md5sum: 58982403c9c56a4b888fe0ab3104d7de. Only one byte changes
>    (offset 33, 0x00 -> 0x10). Without --timestamp the tool writes the
>    current time and the md5sum changes.
>
> 3. Put it in place of ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin and
>    reboot (ath10k reads the features only at probe). dmesg should show
>    these features (crc32 f9e8f071):
>      wowlan,mfp,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
>
> 4. Repeat the iperf3 runs. Also disconnect and reconnect to the WPA3 AP
>    about 10 times, note how long each reconnect takes, and check dmesg
>    for "firmware crashed".
>
> On my comma four (WLAN.HL.2.0.c10-00459), adding only this bit to
> its firmware-5.bin, with the kernel unchanged, took WPA3 from 22.6-31.6
> Mbit/s up and 21.6-21.7 down to 273.8-287.7 up and 242.5-243.7 down,
> close to WPA2. Without the bit, ADDBA Requests went out unprotected and
> no Block Ack was set up, and with one AP a reconnect took about 24 s;
> with the bit it took 1-5 s.
>
> A failure would be an association failure or a firmware crash. If WPA3
> is already close to WPA2 with the current file, please tell me too:
> then this firmware may not need the bit, and the test only shows that
> it does no harm. A monitor-mode capture is optional; with the new file
> the ADDBA Request frames should be protected.
>
> If it works, I'll send the file to the ath10k list, to Jeff with you
> in CC, with your Tested-by.

It works for me on qcm2290 (Arduino Unoq), and greatly improves
throughput on my WPA3 AP.

Regards,
Loic

