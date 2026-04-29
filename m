Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC455FF887E
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=; b=R9UE9S7geoUIxQjkVcq59cDI/f
	/AnoBo9qlFUotlcQgzfmfxX4IDn02Bm+z4KezBcAAOFJdJKD/9EKauEGfbmxpCVFKRsyoslv0C7rd
	foAmiTDow3QTI4ub08c37TTWBeEKyfI/qJUyy7esmFuYjIwAz4miJvNzG1W8aFmvoYT6G6x/cMUd7
	/Lwibou2TvlNlzLWZP2mrTXZyt2uyN48xdoXEMb3miOrtDdHmke2hYVWSImbGKmXGfBDhDhzitY0p
	wqeU8llNH7D772DmjaeXEKiOrjHYQj+VbSbJktc4sGxAnJrhB0yuzuTV0e6T88cLa9Gfvd1fkjQpZ
	BENV00bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7gJ-00000003uWX-467W;
	Wed, 29 Apr 2026 16:22:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7gF-00000003uWB-3qO8
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 16:22:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEteGl3752354
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 16:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=; b=jzRi40++qm9IKV3W
	DFhl2OnAx5ljK0yTl5sdGb4NA1HEADBLS++TGqlMn+WPdwX2/6sEnm3lmv9ZYp99
	LlEcReCx/bYzwF9NLAtO7bcrJFlciMJRn4aPd4eD+Stm98eR/lZ9R/efJuSpDVl6
	p4AC2qFIxVW4C9vjed4kHsoulcpLPjlt7B+SFd8FKtUQRBzBx/9/HZp7wa0xKWjF
	8rM2KO4apJFk/+YVNR4yaMCdO560y5Z1GaPSB3DeLIl+du/7wdBMFdHNxChQbTN3
	j6zhYqIDgiwDKkVDo/UJGD/sin4FGYQlmLRq69LZ29Ly82bOVP73uBopj5ec+ouI
	5qGwVQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1jf21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 16:22:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dcc79309d0so1760553a34.1
        for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 09:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777479749; cv=none;
        d=google.com; s=arc-20240605;
        b=lDRwC/9BbABddIve8UMqYyyfA2XzQFOd3c8uu40RXysp5rHNkzsQtA8zxfMIsvgPt0
         dFeHXawTcWZ0HtzEeyvVnDWLAxlNWtPAEb5rk5UEz6kFZGyMEiLLSB9mWEU5BgsBLDrx
         NtzdBB23sGAHtIEUatIgPRWyBLuWkFO8WjFKvU8qsTfRNeTPQw75myZfC+3QZY+tfr9y
         hqbaBbm1d9aHGitTAAvgiHExQaYnWfgKsuP0B+wy0OtILpnZDFhJsRH1hjewgfVUcNSB
         10xC8nzou22u2Kt3FSVY3H0DzHHhYWXGB9oML1M6DPM2Nq0UV0JA1aC3pkTrf5j/EnS3
         zePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=;
        fh=H0e3HYzIeOBpDNG/85JgwtarnRtcZ1vbV7Gf6AB9gts=;
        b=A/Bnxr++udE7prBgLsewM6Hm8qVJz/q5LA7St9EgDQ9e9kab9fVyzFA2QwnxABc1NQ
         yZTUcBx6eNJSFGggzzwVH03kEhRO/GkgWkD60S+hYhXcMoe6CO66LHSJhuaBm3ZkC6Rg
         H7txUnbsbcCCfKKditEk5vfpTzVfi5P1PLrNq67YTGEc9P8A+WfQ6uOgBTNNY/YINlkE
         +IlWgLOS6z1m+BkuNN5nsA3BTcD1dAgjSSeEY8vdiZbxggtkyOJ3RvA6ghj/z++uOt+H
         h7whqpLsKdNTFRA5hDC/Yzg8LaBTNd+9dthwvWqe0D/Cgdt6yGHXIwdLgYNhHIrKldiM
         lTIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479749; x=1778084549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=;
        b=S1QyKoGT92cFa93FkdheNQN2qzd3QRbBywKm3hVEma/vtgiuD63VWsX8yF69AKB+NU
         ZF79VkK25KAcUOU8qpmEPPuDtYjevYxyr16ETcIVs+o7VNy8/sMZk01h5wXEw2AZmoxQ
         917RyulCqJ2mvKFDblRjaNJT7DMh4vr96J1wvT9n8KDzDCaH3EulEOM5XEABp2J4bdmC
         xlxC4DDyXmXX+/8lCDf3bBhHCZNCfXQQx8X6Vlv+PSl8HSbUjaCw9Iz1YRlnUVLrfFE5
         snxQqDokSofDXPS2Is0rCwS8CprLKkf+PCBsWD9SSt7rp+9l5vW/1gZL7MifZ3K8ogBu
         ACBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479749; x=1778084549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=;
        b=HT882BXk1cRyJgxYULPTZaf/mP41eK20w8HPmYqp8R0plNWl6M96JctybYBrpCZM6c
         zzVTi/zOya/44fzptpvClaeFfD5gTz078yWg9SOrNqfuo2wPgz8935Z06sd/5In7lnkD
         Zs41PPVlnSYCL8pExHZR3IfTwviPlQ+QTU3o7iB/zk24nzT4Es01dapk5pDbYhgy2o7P
         jJbKuR+qfEhn34pO7yJ01QVyOkmF4WJtegmr4BhbT1ZMlRxjANsjJRoOuQe7+2FjEcJU
         0i+NIFe+qUZFC5ieqmTx0M7aPBFBIjY3HsUwy5BIovUDGo7Gmvth3XuPNxPfd9cZHtP5
         drXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WU/t3MRyR+xsZX40EWmCyvO97/EUEYZMcgpo5RbjGQeNr948Py6Aqmc0EZZBIojfGjaAfb0c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnty0bTxROAMd6+SSCvIPTE8OLz+EUeo6U2Tt36Sm0yBJK56C8
	bUFEeP3JzFJdo+gLDjGNtxQ6/70f6ks0EI7lh4Y8MM5wHycyRIO5i+dMKVf/ZS3NAWJ+hFmkUv1
	q6mvgH84sfbw/644y12Ke8Rh9oVl5qz+WUfT+9LI7qmFAoHhi+JoPN3x5hLZFCtMdYlP2OmeFXz
	6oKGTSwY9aQstM4Ji3fmgUCkMTpwmzoc0GcF3ZY88=
X-Gm-Gg: AeBDieutHmTGGCyBtwG4dPPXMiP6Ql6YqwCb6hi2BZpOBvvMqHykFROpgfWc5VXbzDW
	U7Inz4xEDmLJIzrvLuhWXYqgGshXRzjKimqM9m3gT2rd0jV/kUaQwVeVal0IAkI0feiDuujPM2z
	pF7BwGdCeWT61AwJIC48koOcdJELTuW7CtfdsQgCtWQCtrj7AFOGFhm8opNkU8jJovkwhd8+ojA
	V72HDLHoktbhuzWzbv+j1CoamPFQisSheQ55nmKLCXwgGXZiA==
X-Received: by 2002:a05:6820:1014:b0:696:6e28:8c19 with SMTP id 006d021491bc7-6966e288f89mr732620eaf.20.1777479748813;
        Wed, 29 Apr 2026 09:22:28 -0700 (PDT)
X-Received: by 2002:a05:6820:1014:b0:696:6e28:8c19 with SMTP id
 006d021491bc7-6966e288f89mr732600eaf.20.1777479748427; Wed, 29 Apr 2026
 09:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-7-6ad23e75190a@oss.qualcomm.com>
 <CAMRc=Me9G9vd06a39vi_UrXCTkUtJQRogm2MqgnwLS_r3Thyzg@mail.gmail.com> <e0adaf64-10d7-4e28-8403-769e3070ec30@lunn.ch>
In-Reply-To: <e0adaf64-10d7-4e28-8403-769e3070ec30@lunn.ch>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:22:16 +0200
X-Gm-Features: AVHnY4IKbhM_HKhU56A0ru1z2waWryyeh9i-sfRAmlk4QJVuWsNhvXilz3QVxic
Message-ID: <CAFEp6-26sVj21JVECREORdq+UeFTB22MoqAm6Pd2fTosCQau9Q@mail.gmail.com>
Subject: Re: [PATCH 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
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
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f23045 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=J1Chn9sQg74BwZjCRdUA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2NSBTYWx0ZWRfXxT/IcZOSct/x
 M88Hm9dhl+4AEHVqxgy8yX+mC4HMncR5RTRHj8Gh4F3w4MQAcheKK7/YZJEotz0LxEZ25aNHb/r
 pt9YT9SAHJq0qr6SSQkOF7ZE1ibKZwuR4015ZMKI7umsSsUZ/KXIJkfAir7E2lEOu6T3IQiMtQO
 efwmDu5SU4EZmHR28daHtNjDhT/62Xj4vRv51rMgFKRjE9zFRtcuOvfX6yZEPdN72c5cdSL4D+y
 TUNXBMTxYBdeDBXBzRWOzZUDuYYj7vq2MasvdrlUDOGLvIfiVoE/+TG9SEM/v80uAntk8QGKSOQ
 BCWdkyAvHgigcHA8ltg0eUdragJ+1p/TTII225167meM87mHVfEwl4C+L3sauDydyKqY2oaboOF
 7UVmaHg4fG3YVqG2WkdHslEHp6sfQ1F861Jpu+37bz7/5oZOZqPWLxw/9DWXXfwyG9RrgpG3DfJ
 1r4tFU+H1wmoLKxppoQ==
X-Proofpoint-GUID: ZpcalIVGMLC7bz8vCx6U4kdRz8j09YjD
X-Proofpoint-ORIG-GUID: ZpcalIVGMLC7bz8vCx6U4kdRz8j09YjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_092232_073774_582D31D6 
X-CRM114-Status: GOOD (  25.36  )
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

Hi Bartosz, Andrew,

On Wed, Apr 29, 2026 at 3:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Apr 29, 2026 at 10:53:13AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 28, 2026 at 4:23=E2=80=AFPM Loic Poulain
> > <loic.poulain@oss.qualcomm.com> wrote:
> > >
> > > Some devices store the Bluetooth BD address in non-volatile
> > > memory, which can be accessed through the NVMEM framework.
> > > Similar to Ethernet or WiFi MAC addresses, add support for
> > > reading the BD address from a 'local-bd-address' NVMEM cell.
> > >
> > > As with the device-tree provided BD address, add a quirk to
> > > indicate whether a device or platform should attempt to read
> > > the address from NVMEM when no valid in-chip address is present.
> > > Also add a quirk to indicate if the address is stored in
> > > big-endian byte order.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> >
> > Is there any reason why we can't extend the existing
> > of_get_mac_address() with another property name and use it here? It
> > already has support for mac addresses from nvmem.
>
> Does it even need to be a different property name? Is a bluetooth MAC
> address somehow different to an Ethernet MAC address? Isn't it just a
> EUI-48, independent of it being Ethernet, Bluetooth, wifi, fddi, token
> ring, homing pigeon?

In terms of naming, I followed the pattern of the existing DT
properties: for Ethernet/WiFi there is mac-address property, and for
Bluetooth a local-bd-address property. So it seems reasonable to reuse
the same naming for the NVMEM labelling. Also One thing to keep in
mind is that Bluetooth has historically handled addresses in
little-endian format, while Ethernet MAC addresses are typically
stored in big-endian format (as far as I know).

That said, a more generic EUI-48 identifier could also make sense if
we want to go in that direction, with expected property/nvmem-cell
name(s) as parameters?

Regards,
Loic

