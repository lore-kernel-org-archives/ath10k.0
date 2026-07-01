Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EFDC43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=; b=jHt0jR0uCAiw6pgtxUX2PiAOiB
	hoc3H43WBx1RtiHGK1JLTq6AT3rTY62nCz8p65krOczFNXa1g3bVLEwpi8dG0vuVLciTtn68P9o4f
	FYNzhsEZ2JLhcRPtf8D8N+y00Tr/swcbu3fsYEZAyhhfNTDiXVCvegvbeMoF+zKIC6l2HFU+3KJR6
	4ZPhbehLO46AHjI+VDUXIBF7PcJriDSohaGusBu2Ch6P8VE69NjxMZI5ueTHO5cASb+kpnUwkuUcw
	HI/w00umCDV0B9bsexFIpvQ81yIaAdmkCpIIjI9KwFYNgMbYfpsqvhJBwJ7y2d6EqG3DqHWWC63uP
	yOV50jIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev6m-00000002C2R-3Cym;
	Wed, 01 Jul 2026 13:36:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev6j-00000002C20-3Pdr
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 13:36:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Xvs681092
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 13:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=; b=D0TYYJLhf1Zwu2jk
	spVTvuXD1DtrAeoeC2o9zHuxnGi5L2oNStqdVlMFzAka42qve3FCqsZ0imRiSjGS
	wY7ttgiTuQozDBsloMvMWMZ7rH/qOR9G1lDsmLiF7+3AQRgTZm29mCqmNwGw2zKN
	vUeqWlghwM2RkTREn3uRhASvg6bSZRMNTxyjChtRcJbcOyj43Bn47PrPRgooNtem
	izYRe/87MwRcAlgJr+M4KcqpvbGLoJprSrbUKhtWlVLLmIPX48qaTHAE596YlbJv
	Qs74Yv6HObEi99FocjmPI1rDGZPAdejjSZRzvLFUsQfNCiXq1CiD5iYcCYaKTrC8
	PAdhXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3smeye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 13:36:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6ed4fe99so125684285a.0
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 06:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782912964; cv=none;
        d=google.com; s=arc-20260327;
        b=TQLVAEEKE2jlCokPGyRemOmMcbAiaQXh82X7vV+ML5KImD8QUqUGNSZxGTYQchr7rQ
         ZNxDRAPBpgRvrBmijzmlqh8em/5ywBHg5EGUVam1YTY4zWm4G/m/v8xYdusPnTjZjTF/
         bzUUa/7koD7ywZudyuWRnfVhNaKvNqqsAo/UCdDhZ9f9bGZ3OMw9kWI1o8YmGa4i2sPj
         j93r7HzNJX2fm0PDRyLJnqVSuSlMtjaKz5uPrAnloSjuUxcxKuaJX/puiYRqPmOsGe2I
         ZH4NAPtz0gcjf5hYZHU7iLeoQUd3vVq3PAxVe6u5E/iayQy/e5ecV3WUINqcAoQTtQVd
         qHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        fh=SuE5BIQgB5gqebsN8K/+plOdd7Zbf7NNnWt82sSnTk8=;
        b=YDUukRfYVL+232CMTo9YORSnI73krPyx/yk6EW3QXMsidVRvylqe1jbM9INaHvTodf
         6QGI4xj3IsRXoYEq2RTI3WY6avJUoFCJ1z6MR4+m/75tG6q7my1vmzG/H+AmUjKKa5c4
         ozoEsjegRI6YKGcT6rcxaBTXXuRO3s1zdr0myDKer5+EP9AuISe3BBYV3Lby534digka
         /9W+gfJglOO+hpP6gHMqh9VzpHqi0A/XS3rVaSIrTq5KU0NQ9AgdkhKZxHqcpkSOgzp8
         CXOoVol/AicpJk91VTgu4R7humPIrmJ+yAmj2kblA4n3caEi3ZsNsmtquGlBiT4SlJVk
         fYzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912964; x=1783517764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        b=krg42nir2IdelbP2FoPin9mTMZLdmDGQTvzN/58FF8Upu0Kj1tieHtcikOFJ/4jZTH
         RanI9pk8X/OTJeWhId4/19Zdjl0IJwXaY4VIIbr9uVoSdeJsG/MY6mEqA1PmPGXzTfVx
         M0hsGaNRvVbPHDmVdmFF2agIAdB2EtAo4kQ6G1mJKwotmtagyJ/X/3NB4YYdG5uDnqX9
         eigDCqaf7Gr4TeRCoJkEXUySEKAUPR0wQXQql/aCqrWcZQIKc7iNDZniSVr9Mz1jlrlK
         OSNTRnGvWhXcZcp18driWqBGZqi01rURO3o8dDjz8dZs9av5oF0cT9JoyD4j9D2A+Ddk
         JqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912964; x=1783517764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        b=EmDh5+Z2LAttE04UJ+ZESrieSQ75OjYC1KNwb4hkQ89Z9KN2oaDXH/stcKCxix9MWY
         8cPUFfRWN+aC0g1hjBYaZmt9iDrcqBYwAi0Ywo9N7ljU/NpNYHHZFwjaZYStAva/NQIN
         Ic4mvDkf+vBouEiG2pY7RUTXj6Xrp/jAGymCsu+SziDki3PcTqai6K2iC8/TPa1RWOoi
         0bN7PD8uC4Z8+UqtSe3QIfUa23NoXkfO/arBlYutTv20lppGPjSUInq5csZmy5hMXXh0
         ye/6E5JfkyC0UWairHh5JoVvOQPJAK9j69sc3To+ibx2E6Ffsdbgr54huDRUCXb6yMcp
         y9lg==
X-Forwarded-Encrypted: i=1; AFNElJ9hZ98Rx187nfLTuwQeTD17xYvAd1bBfJlv4/TwR+2NuL2ra1kNtRIWR/hOvCqQCA1zNZr9NCc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpCbMlMrcOapGcoNaplFtaj3ZhVjPTxHHeWg5Z90fQhHlEuR4a
	v3cRinRjTSNAAYhuf87rRqCLRwejslDUmLA9vjw2iuZGDU5gv7z2xmKdDqSpMHq+FLi6sEv5cE+
	suamJHY061qtJwAv4eTJEx1OYDTYNNOYB9PGONsp8xbNsySksHqZ2wqhUfTFmakceVWr9gcaSqb
	9vgJRy9e6fWvKIi6iE3NYkFWI4VFV8V9SL44V1+mU=
X-Gm-Gg: AfdE7clDCGQQ0mZvQKPjtqJLwrALXMoaEP8yA82YsmXjvunRQ/H0XgtwU0+5Le0ajhW
	jC4HGLyk0nd3NGqGtRCqMMwGt5+8GRm/Aq4XwPZ/66eWsPHkxtVJ1OACfqruc+94+sUcde4BN2U
	BpGMnSSPY9E9XMuN5g6HICQnP1H+MIcJYvgJwVq5XnRYhrRakNK5FwLo5ikgHKuaoJ/rFdKrV5k
	q4Wnsi6F9s+DAYyu3garpCU5lwwA6PSl8VlpOuwCDoCmCZ3+ZANpqr4lAk+am/5iRP2K6tdzQ+1
	Oz2bIeCjyA==
X-Received: by 2002:a05:620a:28d3:b0:92b:6805:91be with SMTP id af79cd13be357-92e7853d109mr199307485a.70.1782912932523;
        Wed, 01 Jul 2026 06:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92b:6805:91be with SMTP id
 af79cd13be357-92e7853d109mr199161785a.70.1782912918609; Wed, 01 Jul 2026
 06:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
 <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com>
 <20260630180219.GA4139943-robh@kernel.org> <CAFEp6-163adAq8-H_pCzGnq+Fo4jpyKGs6Jv25j3fSpZg3COjQ@mail.gmail.com>
 <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
In-Reply-To: <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:35:07 +0200
X-Gm-Features: AVVi8CfNT2AJJTgPBXfFVJQmZjW_-a9Isbc3rycVEtJcwbZkpqGBU1gJZohgDaU
Message-ID: <CAFEp6-20FXTOKQ6EPuR8OUDkqE4JXcUbXaFy7kRFt4fzszPQCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] block: partitions: of: Skip child nodes without
 reg property
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        daniel@makrotopia.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fBt4IAjm-rmi4dvZl7N0olry1RMCCHQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MiBTYWx0ZWRfX3cn8SneCMzZr
 4izKPVs3TJ0WwtbhSbRhYRE89MoUMbE6QCE2/QoPnJes7uj1VEh6ogLDx2r7uipN73OKqp5fEur
 3zWXEjnc1cKWV4mjE1FDofTufpaUG57SwAyZ8aZ1QR4F498qTfUavRFBC10Qe8KyxnLJKx1mTG5
 BJcj5CLfGo8F1P/HR7wxXchu/BAg0Padx1oCZWsCZ8rTaQL4Ym5cNBep4YUW76cAoxPIp60o5rI
 wdEuy0yQ1dktGTne9Xt6WWUtasvkFTTKIdDfkkVXTMUdXLrkZnXZEAmyktkgcle5L1w0KM7A+84
 r1MEUqgySctiu2uwK51KguvzzOHudwzY1JSyTxxKa31k/dABkL4X/BTUbeMM68dJ93K84TpSbKY
 nn/FwPKkqYe8kEBKcLtJHWXcibBk9J6mKigRPv3Cg2xpXlHf+BukImh59OM7cthmzCVCq3qR0FT
 PtVkx55mM8gKm7inB4Q==
X-Proofpoint-ORIG-GUID: fBt4IAjm-rmi4dvZl7N0olry1RMCCHQ4
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a4517c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bM2Xkg4KEcMkddnjsM8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MiBTYWx0ZWRfXyBPVRJFttSAb
 o+Z64Icf7j+1gCRPtmN36giHs4lB4IowJlL2QNs7p2ju/3Skyleahn45lB5XN6za4KY4bIIeZng
 Mt2pXMYtOg454gdPcS/sImTOjfNY6cE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_063605_857882_3FE2E197 
X-CRM114-Status: GOOD (  35.59  )
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

On Tue, Jun 30, 2026 at 11:46=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Jun 30, 2026 at 2:59=E2=80=AFPM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Hi Rob,
> >
> > On Tue, Jun 30, 2026 at 8:02=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Mon, Jun 29, 2026 at 10:55:20AM +0200, Loic Poulain wrote:
> > > > Child nodes of a fixed-partitions node are not necessarily partitio=
n
> > > > entries, for example an nvmem-layout node has no reg property. The
> > > > current code passes a NULL reg pointer and uninitialized len to the
> > > > length check, which can result in a kernel panic or silent failure =
to
> > > > register any partitions.
> > >
> > > That does not sound right to me. A fixed-partitions node should only =
be
> > > defining partitions with address ranges. I would expect a partition n=
ode
> > > could be nvmem-layout, but not the whole address range. If you wanted
> > > the latter, then just do:
> > >
> > > partitions {
> > >   ...
> > > };
> > >
> > > nvmem-layout {
> > >   ...
> > > };
> >
> > In our case, the nvmem-layout needs to be associated with a specific
> > eMMC hardware partition, nvmem cells can be a simple sub-range within
> > the global eMMC, each hardware partition (boot0, boot1, user...)
> > having its own address spaces.
> >
> > That said, your point about not abusing fixed-partitions is valid. I
> > initially dropped the compatible =3D "fixed-partitions" from the
> > partitions-boot1 node when it only carries an nvmem-layout and no
> > actual partition entries, making it a plain named container node. But
> > it's a bit fragile if we want to support both nvmem-layout and
> > fixed-partitions.
> >
> > Regarding your expectation of a partition node being a nvmem-layout,
> > do you mean that the nvmem-layout should live under a fixed-partitions
> > node? Something along these lines:
> >
> > partitions-boot1 {
> >       compatible =3D "fixed-partitions";
> >       #address-cells =3D <1>;
> >       #size-cells =3D <1>;
> >
> >       nvmem@4400 {
>
> partition@4400
>
> >           reg =3D <0x4400 0x1000>;
> >
> >           nvmem-layout {
> >               compatible =3D "fixed-layout";
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >
> >               wifi_mac_addr: mac-addr@0 {
> >                   compatible =3D "mac-base";
> >                   reg =3D <0x0 0x6>;
> >                   #nvmem-cell-cells =3D <1>;
> >               };
> >       [...]
>
> Either this or replacing "fixed-partitions" with "fixed-layout" if you
> want to make the whole boot1 partition nvmem-layout looks like the
> right way to me.

Well, now I think both approaches make sense. We should support a
fixed-layout on the entire hw-part/block, while also allowing it
within individual logical partitions.
Support for the former would only require a small rework/addition in
this series (to have the hw boot partition a fixed-layout) . The
latter could come in a follow-up series, as it would require some
additional fwnode logic.

>
> > That makes some sense, this would require extra work for the
> > emmc/block layer to also associate fwnodes with logical partitions,
> > not just the whole disk/hw (hw part), Is that the direction you'd like
> > us to go?
>
> Yes.
>
> > Also, Note that regardless of which approach we settle on, this
> > specific fix/patch remains necessary to validate the partition node
> > and prevent NULL-deref.
>
> Fair enough, though the reasoning for it would be different and
> perhaps should give a warning.

Sure.

Thanks,
Loic

