Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B84FF8875
	for <ath10k@archiver.kernel.org>; Thu, 30 Apr 2026 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=; b=e/KZeGH+wsjYfIfnsh1kodMkvJ
	t6+IeRCFnzGylVPgn5OgKeHfXz0uhIoB2iLYsHAwK1eNnNSyNwvTmQ+QNdUfByR7pMddd8DxYpobf
	Yp2q1xfuTrFC65Xzkn+9kme5B+TNZ5A/mQFDsuyBphegEn5xGyQfl0W2StjmivGHvdMUtie5Z5AIi
	JcCBxTwrkRRMIzHRvTOEhE06HVj6NPKKqv0gVGp/2muVV6EWIQwCyLbMVe8A/qsdXm8oqQlKzgzKw
	nE0768PWpGFEruRlXQ8bHo0Ru1OGR0AvNtiJOotjLYRlsjf5tIiXibFUhYIQoXZUi2mH3R4f8Spyo
	dF+gopPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRCs-00000005W3s-1yyz;
	Thu, 30 Apr 2026 13:13:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRCq-00000005W3X-0eQR
	for ath10k@lists.infradead.org;
	Thu, 30 Apr 2026 13:13:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCN67H088556
	for <ath10k@lists.infradead.org>; Thu, 30 Apr 2026 13:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=; b=Wv4+57bHKS59t2pn
	l788D+Bh3SNVywmZLGOHfFpV5gix7UmN+Hbdo/rkaV907faoB34D6MoaRtws6I/F
	v30P+s1u0dEaN27jtCCPCVVP+r7L4EEy0FvbN7cRN35CSHU9XxqTb32ZATl5T86t
	UrmjKIcb1J8hNdRzni/k+tZLpRqGXhoJRr92bkpFOWRdgTmqxOYvkyjH1cO6GXnx
	iRe4KV/oP4i6FXY0oe260zuknkGUSwIURJlJbrNK3gxPYKc7iPfxfqQqhZFkUzNG
	0yB8b1v+rCFij5Gpwopcwf+oxHOaJvlbverrXg4+0dPQ0rN+GBwkFpQ3zascOloc
	t7rLFA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u41k6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Apr 2026 13:13:27 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-64eb0bbab48so1910932d50.1
        for <ath10k@lists.infradead.org>; Thu, 30 Apr 2026 06:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777554807; cv=none;
        d=google.com; s=arc-20240605;
        b=VpQpSVhKQO7g6HWDMtGOdzCTCUoI5cUCcn21zjqbnZ8YdvAgAccvwHOfF2M23JCE+A
         cIn/N3DJgtRFGudm3yhjmFhncqzLsFp8fl7i5dkTygDtTUWUIdHefB7ybdhXVEp0mH53
         Y66s6mzGCK0AniQ4JAC0MIGUXNkD4xSaLZfAme46Qu+0a0ty4gTbOGT/xDqxVUdlOSER
         xZY344a0aAKikqTT40WwV8QZmkauM6DyFHdXaQI/BFpQXkK7AUQZKDNqYiTYcE/dV4lN
         4/EuhvLzU6DBci+TRPrG5y6UHcIya2Qr+7MN05qVQSN7SccPk+IfDm00hIOJxL4pakzg
         63aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        fh=sS9axKdYrYEPO4R3KRVNggOhLB4cpKIKhvuh18Wi/1E=;
        b=dFeiNlShzG7PUBUnlE3E1pmHeDZRu3p0rX/cRsIB4TypLf9gJcBvqkp70ayoDQJmKy
         ykz8aiYkh7UWPsFVzfoP1eJ0If1r3z22vQydk/KKYjHewODfjiehZ5E5DFJfuXcr72rY
         H9I0AUf2XHP8YtzfWABeutObHtoakJFab78xsJv/WMBq6TPLlXS6ldljsZjTUq64DGVk
         lWYzCDRpJFDGL6IIKrmnWHbuPVL0hPIFdF5v/QQXM6xcHtfhKdFFcP5Z0BrixsjNTpFl
         Zy7TJc/92wjt6iERFyMw/jWc+mO7KZT2d+cX49Z78lg14ZKW1VhEZWLgwrVkTgPyfUDo
         wIbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777554807; x=1778159607; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        b=UogwsM5MboOKLtSEgV08dbZ9mIWeHpLMHkWlOx0ULFYKE5vVVLCg9J8FTjguyXIqTM
         y4Q1rMqtOxA0ITRMxGBT3nI15tzeG9eQ7fB8uII6/lsqV2QKdr40p1BvoQOvuak2j9Xo
         bxUlnBSPYPh0jAWLRzzNyEHE7ylrYUe7SsX4a0J475aSGK+vcjnnSz10eblZzU4wz7k1
         04ezi7ApteIgQhSBHtsVWnDZOOFT8w9FV8LyuE8xDdtZzg28q3GuA/Cc1W4htXDOxdEA
         ijis6zorouEjkkTgVJ8pdXVZrU5tvjjkaaivqZjqKEPy+lWOJkXnZ45G0BpU3q/C6zj/
         w5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554807; x=1778159607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        b=YVj517x3UU0F8/4CtHb7piPXeEn7Xi1qPkibSTOxW8DIqreGjlUz/lD3Wd9MqKU+59
         0tbz36l1ptagq89j5YKdWgB5asyYiMEBXyUDE7oMzF5Kt+K5qnm2sv//wUPxRH7xZb5b
         PwUIbWpFQ+NcyzvYhfasiuW5fZGtyhe+021/0c34ZzCsgLrbcT5KZvvIp2uurxJUYvbh
         9T2Pcsy1yXSJ4ogDiwF5VC+mN4STzZImhvs4Pbuc1/mm7Bbh75thcZ0bHyJMk3acvTGy
         aLdpTL8Sj3dXCQ2iaAiUttjjBqr6fLRhDDBO5JAOE/M+X1rYUPdlHezdtRCVGTs3NE7/
         VxnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RxneJt7AHJar3IRA5hkdOia0CqDMsGcGtrt3PGo9nTyv6CVBsFyAs4+WjdEx1+2edPZK0gms=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPs81eRYIN3GleERUl07LS6RKNLv77tCNplV2Sk2TzN0aFOYVz
	wLwxVQvv+mQo4p9RTRpUc1Jm5Ytgc8yjltI39KhQMEhtAsYK9n4FCT+xEnv60VbYZhPXYboIn6C
	B+LVcXKF4oCLGzTuEJZ1tTUt0sK2S4eS9FLhFg7r0cCRvzcBcKPc9ut+eSBrFyz5o6ERaZHSc+F
	0N5lZTNTfJtEdGq7xpjiemRXNLcifnIu5DyLmes+0=
X-Gm-Gg: AeBDievQ/lBEyTtEAgrHpL5XDBLHUfWA5WiyUoYDudmJy0VhQUKVdy3MyLdkOALRTsX
	QzzTem7H8MB3OxFQpYh5YoP+WnGUIrj+YnHpKm5/cFfIa4RiLe1jkMT79iTQtfdASsUeczHPKxt
	bHTyQqp749JGuONTm6VyUC26O5qJcW67YN30HPWeMmsZFVG8kFxHGQr0KWnndvzXOzeAZYv1lHv
	lfvLyE381rxm4e5uNnXV1pFhktQy9vYYCj+IB1u5EbaY5REtlA=
X-Received: by 2002:a05:690e:4299:10b0:650:ece:89fd with SMTP id 956f58d0204a3-65c1b0a4185mr1181519d50.27.1777554806657;
        Thu, 30 Apr 2026 06:13:26 -0700 (PDT)
X-Received: by 2002:a05:690e:4299:10b0:650:ece:89fd with SMTP id
 956f58d0204a3-65c1b0a4185mr1181471d50.27.1777554806063; Thu, 30 Apr 2026
 06:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-1-6ad23e75190a@oss.qualcomm.com> <20260430-bird-of-sheer-ampleness-744e7f@quoll>
In-Reply-To: <20260430-bird-of-sheer-ampleness-744e7f@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:13:15 +0200
X-Gm-Features: AVHnY4I6bR6fdSxJnXBrJdTY4FKOp8Nu9g27U_d0aw_5w0XdML8zMEtBVrvqIXA
Message-ID: <CAFEp6-25Xad_LT8L-HPpOpXf7j1S=Vew=iSgxEmAHd_on+jkcA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: mmc: Document support for nvmem-layout
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
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f35577 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=Q8QnmAOcOvJ-T5SqZIoA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: djp49jvwTJjawmVWnJcn_eXxoWmDSQlZ
X-Proofpoint-GUID: djp49jvwTJjawmVWnJcn_eXxoWmDSQlZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzNSBTYWx0ZWRfX6LRJlWZ1e/Qs
 eWkdGrnEmU3jjqxxOhfGiVBAvJ7Iyzq6AbuFBZAX7oL+4RTsbAM77zSLf7Vbn11z1Mk6qmpHcVC
 C9WlE5h4/FlSLmsZu1q3mxM7XVTxF9TtVPWsmPfnjLLKg9BSawRF+t4QJ29d7geXB3v33O8cwYC
 aokg2bMtYJZOh+hMaw9F2CEB+bl/Ut6IklkKbWuzW8BgCs/Cv5sYP+b258XFy1ZDusWUo9swlFM
 YE34TamA/q9Qy76aRU6g4cx0DwMKEgiJXuVbOVe0xKiscJfKCPtrrlUzc6wPzteVF5/EvyLEfLd
 MG4s7f362ihcuBWMLvJppLkiVG6a3ZuCIbRwBhdhEuP5fk6hU4N/Xjqct3X2AF+n+ipr4XJewoN
 scmNAcMCJGsWdVJeumxBB/HTrmYat5Ea9R1oKPymsqGN922+tkaiEmMV94wtPiOkp9drOsTHNTt
 j9k6rOk71DW/363Kfuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_061328_198966_BA624AB4 
X-CRM114-Status: GOOD (  13.27  )
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

Hi Krzysztof,

On Thu, Apr 30, 2026 at 11:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Apr 28, 2026 at 04:23:06PM +0200, Loic Poulain wrote:
>
> > +                    compatible =3D "fixed-layout";
> > +
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <1>;
> > +
> > +                    mac-addr@4400 {
> > +                        reg =3D <0x4400 0x6>;
>
> This looks incomplete. Why isn't this mac-base type of entry? And how do
> you address it from NVMEM consumer?

This indeed falls under the fixed-cell/mac-base type, thanks for
pointing that out.
NVMEM consumers reference these entries using the nvmem-cells
property, via the corresponding label/phandle.

>
> > +                    };
> > +
> > +                    bd-addr@5400 {
> > +                        reg =3D <0x5400 0x6>;
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> >
> >
> > --
> > 2.34.1
> >

