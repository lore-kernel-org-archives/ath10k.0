Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D9CD98CE
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=; b=3kCGTjNXtFQ6cUWeg2D5kytg0c
	psPpKQbdSf0hszrqGd+ZwqOptmQ++8hn75U7JfFPTpdzbz+w1z52K/YPzCr1K2sOOTdHaknqNokF2
	sVJn7/Pr1hk602jo9S2XHQ+n9f4fwhhbzjRUhraVa/bskpEhn8yyrHcMNw+tWyVRBTQIp8Ei37VVU
	aGu7f6x1m0Xl93w0vqeHCefOXZvkq8CDhKZrJOt9K56oiMs/NMaoptO6lpVqDXZmDF0Wd5Q51aKvm
	8i0dHN61gSUOIyJdHXAtoYh50L2FfnmF8LulxJZyIw0gDrqDdAGDDfj+WRGmRUZsbLiYd+UpsCSN5
	J4UfcxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXync-0000000AjRf-0qo8;
	Fri, 12 Jun 2026 10:07:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXynZ-0000000AjR1-2KdN
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 10:07:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bht92548506
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 10:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=; b=IgFMujEYL7nMZWpd
	KLt4YyRgH50+k1NpU1LggBs55SiDEHrC2/PN+/ZHCO7nPlyoEzT+W2Q6BK8LBbmR
	yCFP6p6SX0zKBq5OLLfmZp1tpnnRXVuRO1slxq2z4FMsarT+TYAMGo2sUFtuDXpA
	drZVZb4R+8gJtgY6prfUwMyHi47ZNvlK15W3OkA7E9sECp+s0r8FBguCM6giwm7b
	cc3j4TnyGUf3YiDyV6hYMrMW5MolB0YP+vKbEQ05H/yq7f3IzUnkHzadp4N788ug
	Z32fgVOfw+kG9QHI1EZIkUCeJWo5e77pNo7NA0LP7ntclwZLFH32bN4HLE8YiNn+
	b5HnOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29utkxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 10:07:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517c65c019bso20917701cf.0
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 03:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781258856; cv=none;
        d=google.com; s=arc-20240605;
        b=DIEizUuQzKQeRnjNAUjW2tt/OqqOnu55FZH+IS1gyb4crOaYlTvKXyoFPwVx+kMDz6
         EU759iD5e66D75LNtp1Gwgn07m28QGrEvuvY60mV6Afc9t4DS0/Zo4nwuYG1vcjeWM54
         99iuiiUqtwjijspMzrPXyZvdAuO5G9861fndAUnB/s4b4x+HOrCQXBT5M+s74rWT3Ga7
         N4Sa57Yd/n/t6m/vVyAE6GuQ49S57JpoEuEC7vStp5L5eacSlnZLEpCoZK0UT80oRESr
         TvaaSa4WQZu+6+Vo4TLplx7zXNFod1CAvGMuCs2/UiRuXUAMy+cF+B4/p8rSf6W2XzVU
         wo/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        fh=LZe1k1K+WhS3/bQTUZhvFL4gTWhnGLm0t9U9Tr4zt48=;
        b=UZq+SRFjrKXuPk60peQ7u0yN3tgVG63K2CY7O4xxr3J2BbnTKy1Uo65UaIjPlNE5Kw
         HqTS1985pfnJke0bwWXvKpKSvkO7t/KQUom0cHUk1nOpIOrg7j6s/LOJGQQ11saGQec+
         IefiGap3gtVoigNpqpFwcoPuD5d4DEXrGJHAqHGbt6VDROE6y1ubUeR4MZ15Yy3tzYn5
         a5LVR+6b89jMdGKtj+iHFoWvgGfl6Vc+4miyf3dGLDkdr58FcioPvyRrYr6VWP8eQFcX
         d2sYOnEK7rVUW5QO1gSElBqbdgZB/aIpZNlzVJOLklPFy3VQZ5Jvtv/iCFVz1k0Fa5hd
         iBwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781258856; x=1781863656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        b=TrbEMmAKmFEEGIhqKtLpdmRZ5N6yAXc5GqiqbF+xomVyzY/+hUkIYq7XKeuJ7Q61i5
         ZEtHpM+/6+zqo8bpHC9k7IhtgznUlCTmc/Q1CTWVb3HEwnn6JW4kz66VlfecnbOf3IRX
         hXzZdZr6toWZOT6H4ysqpdtUbynWEsCG/kczYoaJPkRplIoLwNLNhkLtw1daiVvTjGQN
         2RPjZIxMgSnyt8+hv6RXC2YS4Zjt0TO1EXlgjCPmbbGA3iSe8lC9iu2dlOGRRE4ne290
         v2AVuh2IJqGpho/D0+5njWZORHoA6QfknX+2QnPLfemysQGpaDlKW/U7/SClaqDSnWmg
         Y7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781258856; x=1781863656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        b=ZxJQzvrm3AFSQBwd8VWxaFIvyNtxwcVGNre0TbnsNCUTxUyWmXRY2nfox3+niqm4ib
         G0wJTtad+6sqPzO09dzt/y5UyWgCpffQ3TVOkYKEpoUxaYYzxSij2uIgBWrgAa2qiAIG
         NwWWDbTaBia4hb2NvvNyCZwvbdpqHIipbsqM2myS2PrMjl2pOlVul4c/Bs2IvtADAW8C
         eaBjVZwxbs7LWJMQTkiFS68+H2yXBXwm2VxA6aktpnIucx0rQ5ICOZTRSizv3Iz1yQuA
         rFeonMgAHdbPhmevUtb+ewP0umdTbLfw895RM/NOUKARFqSxLq06Kc9inWW+oSTpQVhv
         ZeNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zAbmySaT0AjhI94GaLjrYkBCe6u+JdEvcUCwsG+bOYta6ikdLulFHcP6DgjUZn1fGzdA3SmQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhsvIOg1+ew2cqD2cgUzPMMpscIQGq7kXzqMzbOSY69a2Bnk3m
	OGXPkmNIbwte9TroxNwfHFvyCGyS3helHpwFStixBGDrRzY2O+C7Z7RLpfELQSzeSfBGciY2Gau
	g9cvJK7r3uFjp6Q9lsWWxCTc7pAKmccBBiOGog/hW1wrqTf4UWEISlKN/Rey5j2oN7yU3HXBkHm
	sviBDu8CzUrmDbr7nWVFNLBF28ryHwpc9siPK9hLpqZ4BRPuc=
X-Gm-Gg: Acq92OEVYfB9f3nlFp0veLxVUFNHzpJ1XH6YIG1uEI86YgjPznoV92rT3Gf4KHEI4YQ
	e78NcGYKkmFfnAVSmZgA4uzlWL7HxOj5UKcU6LarmKAwfdvWnpHS9M6sTs6qSjNWIiE0pP7StvD
	o8snwCNUJn/wseddjh2WrnDxcKn72QqAEwurBxdAIbOp3jOqtjwLqeCeFyqOboOdU3iwkBRbMhI
	Fh4vCmsSestizwBEQmyhoJNY6vZBf0z5r3PutXcqiLuXo3WjwMKfPATWHi914mBgnZUa4VA4JB/
	G5mq+QYHp7cGP0tstZDf
X-Received: by 2002:a05:622a:38a:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-517fe229bb7mr26571011cf.30.1781258855516;
        Fri, 12 Jun 2026 03:07:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:915:bac0:fc2d with SMTP id
 af79cd13be357-9161bc13cc7mr245131985a.7.1781258430139; Fri, 12 Jun 2026
 03:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-6-45712e6b22c6@oss.qualcomm.com> <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
In-Reply-To: <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:00:19 +0200
X-Gm-Features: AVVi8CcCaLmOad_JBtnFjekoAUWHpnzgbbLT7l_V3SVx5j2zNp67A6Sx6we9iz0
Message-ID: <CAFEp6-3Z92KNVv6hbG_zrzan4+cP-TCkoc693orKwvQyvP_YHA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA5MSBTYWx0ZWRfX85HQ0Du3rN6U
 cDs25l6EsXhfDHIc7kHqLwA2L1E/scuLFAZ7LLzzl2hwwIiuuoZKuNHZgt/qQ9VSv08aA4QDBRM
 tgWRfIRtOe8WjNiBbFboRSpBYMun67U=
X-Proofpoint-GUID: d9uBP_QJk6LPpWvq_dJf6Abcwr0eS5GI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA5MSBTYWx0ZWRfX3sLSjaLlkv4k
 QQpZoDn7nFFztrdqCbb2tbEkApCNUDOGh1XmAxhnTLtWa5AQPFaXlLdcNKeroupNrrESCMdSW2m
 jzzSF4duljL+voQiCSe3H65Prr+itNNEgcKdirgC6IA+lXBpbiIrMsDazu68DLIBlGIlBQJ6ECS
 kszGtkMS9rPt2yjKnCwxzIfIWwxa60gROeGjdj9qX9kpyR7/Z8HKp1Wlx0O+3fWyD74OAWHZe0/
 jGB/OPP947/zJeKt39ndPIO5JV3a+iMcok7vnQLXUKoLal+52VdCadFGZHSmsupU++iG+/D5eLE
 45FkxJsR+oBu9tG5f/envr8yrkl2qXsuNoVIPgKJM8mE8IBCGIpXnmw46BG9kqJ6kwalFRu1aYF
 ndraYE3BgesE/knWb94sh3bte0PB5+rzMnHsmuGBeDZaVMng2vsPP97V1SROQI4REllZu7XCEhd
 3GLU8gNhIbtYx51U6Yg==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bda68 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=dtGr58D_ptlPQ1E9saEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: d9uBP_QJk6LPpWvq_dJf6Abcwr0eS5GI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_030737_714893_E1723DC5 
X-CRM114-Status: GOOD (  32.10  )
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

On Fri, Jun 12, 2026 at 11:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jun 09, 2026 at 09:52:31AM +0200, Loic Poulain wrote:
> > Some devices store the Bluetooth BD address in non-volatile
> > memory, which can be accessed through the NVMEM framework.
> > Similar to Ethernet or WiFi MAC addresses, add support for
> > reading the BD address from a 'local-bd-address' NVMEM cell.
> >
> > As with the device-tree provided BD address, add a quirk to
> > indicate whether a device or platform should attempt to read
> > the address from NVMEM when no valid in-chip address is present.
> > Also add a quirk to indicate if the address is stored in
> > big-endian byte order.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  include/net/bluetooth/hci.h | 18 ++++++++++++++++++
> >  net/bluetooth/hci_sync.c    | 39 +++++++++++++++++++++++++++++++++++++=
+-
> >  2 files changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> > index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75ede=
b5f6a99fb98ce4cc6 100644
> > --- a/include/net/bluetooth/hci.h
> > +++ b/include/net/bluetooth/hci.h
> > @@ -164,6 +164,24 @@ enum {
> >        */
> >       HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
> >
> > +     /* When this quirk is set, the public Bluetooth address
> > +      * initially reported by HCI Read BD Address command
> > +      * is considered invalid. The public BD Address can be
> > +      * retrieved via a 'local-bd-address' NVMEM cell.
>
> Why do we need a quirk here? Can't we always assume that if there is an
> NVMEM cell, it contains a correct address, even if HCI command returned
> a seemingly-sensible one?

The pattern follows HCI_QUIRK_USE_BDADDR_PROPERTY, the quirk indicates
that the address returned by the HCI Read BD Address command is
invalid and should be overridden using a fwnode property. Without this
quirk, even a valid fwnode-provided address is ignored. So here this
is primarily done to align with that established behavior, although
whether that design choice is ideal is a good question.

This also raises the question of why an explicit HCI_QUIRK_USE_* flag
is required to allow reading from NVMEM when the controller-provided
address is known to be invalid, rather than attempting to use any
available backend (fwnode-prop or NVMEM). but this remains
consistent with the behavior established by the fwnode-based quirk.

So, I think these aspects could be revisited in a Bluetooth follow-up
series if there is interest in reworking the overall addr fallback
design.

Regards,
Loic



>
> > +      *
> > +      * This quirk can be set before hci_register_dev is called or
> > +      * during the hdev->setup vendor callback.
> > +      */
> > +     HCI_QUIRK_USE_BDADDR_NVMEM,
> > +
> > +     /* When this quirk is set, the Bluetooth Device Address provided =
by
> > +      * the 'local-bd-address' NVMEM is stored in big-endian order.
> > +      *
> > +      * This quirk can be set before hci_register_dev is called or
> > +      * during the hdev->setup vendor callback.
> > +      */
> > +     HCI_QUIRK_BDADDR_NVMEM_BE,
>
> Also, is this necessary? Are the devices which store the address in the
> wrong format in the NVMEM?
>
> > +
> >       /* When this quirk is set, the duplicate filtering during
> >        * scanning is based on Bluetooth devices addresses. To allow
> >        * RSSI based updates, restart scanning if needed.
>
> --
> With best wishes
> Dmitry

