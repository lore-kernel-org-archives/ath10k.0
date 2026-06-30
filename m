Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352E4C43458
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24HwDmxkwRqteaHOqqQJzmtBl1Z3hVbm1sSUYzWXHUM=; b=ZSPfW+C/AXEm5kYBGBTCrKFDoW
	ze2QwVuZQRXhef7B8jOe3aRTlTU0tf+LDd4gAS/aafsclQ/v3QQijhsZag+JuyVTGW3zzisvfrX79
	0Is5h+rzxArBvUUC5MMonCSQmKM6gtOVY/pqVHbN3beRB65EjfzLq161cD3RAH52g0zso1IFbMhSL
	f33jy/cx6awHORHpHFg7oKp0zlnRg4YAQA3bXYcGh0h7uygN/A+QUcsmKfS3Vgc6ViDr8TH1qJkmt
	OZtOGRDvxEtJP5Q61NEJmTrS8k9x6O2x4O2Fe//vTlhuPtWb6wcxo+rSQWdnFSd7bNLVFBEDJsPg6
	5/cWQ1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weecD-000000009Xi-1bxX;
	Tue, 30 Jun 2026 19:59:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weec7-000000009Wn-0G2c
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 19:59:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDmWE2947194
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 19:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24HwDmxkwRqteaHOqqQJzmtBl1Z3hVbm1sSUYzWXHUM=; b=cdR8HRwpOL0F5KGf
	Pa72vskx0M2kP/Z35S2cu0vrb4j+OEKIt6KMM7Th6UonX+P19BpjlUhTk5Li1d1Z
	Y/Wv59ciZPfT/RYaiQrRsZFm3fZPcDfKBwaFfoTbWjAmnFyZj3n9bpk2D9uAq+as
	Zefne9lZYGQzV3whovwFyt/TN8jYz46vzYj5NL0+/lOGbG9MlNpdo0tsMl5xk0yg
	fCV3pDFQVQuR35FiZSvIftsxLo2l1P5E5HN15BL52dlkXhgQkdoSVKvLPz9tpEoo
	i0SPA3tzquu7dDbPf2qsPBmIKC29344dcx2/YoqDcNf3SztycbPjKCqS4n+bRngs
	SWWdJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avptyg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 19:59:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso76871406d6.3
        for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 12:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782849561; cv=none;
        d=google.com; s=arc-20260327;
        b=e8//QMwVzysnruGyLlodeHCX3k3j9cWCKs8Vq6yGHHLGyjRlTTQgL6Ms00QMrQt5M2
         ZqcLgrAFXsWMA/D7Uas3o1GRNHCxIjSxlaIVSpbZhIJISWl3JCfXgwqNQQP3lZljXwjn
         5v2KH4/cgLPbKY4OH/eaJGKOGeALzK8HlbrwAyKudXukV3rn5OzOeWa3weGf8Fg8Nfh/
         +G3nYvbCqr3LgboWdqGXHgvU9K83aPnQsqlgbUNCTycbg3mSqCc5yeYp9TWYSuajkVKq
         7RS5RMPNgmAAdoAHCufUOdPjR7XW6uNReMP/Gj0+seRXFA/VbkNe2RxdwT9HcT7PQUaV
         Qi/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24HwDmxkwRqteaHOqqQJzmtBl1Z3hVbm1sSUYzWXHUM=;
        fh=ts4BVQqDcfckc/l0aP+MSWx64OcuaC5X8jqnx7PUiT0=;
        b=OR6RoS13+e9y/8IY3khISBpenr28uzcONzfasj7mKEan8MDRFiEmYWqNVeRrI3ZFKi
         vwn05Am7egvW/j/cbhETUU3Gw9R3JRG7Ywd/vPhSEVF2jx+fPz36zVFqEGvVCkjfZ5Cp
         wfHaELcdmKBIpW62uMkHCM2uYnm0tl0lW57zsCafnw6YrZKWoFQ2s8OSkphkx8+AbzOr
         JvfyRA1d9ZJL6C1vsWR++otceRY4w89qVVVB6gqhq6VhF8CvUPBHx6kmhY7tMrTo5NHV
         1uFznlB3MGq4cPmulel8pI0LrX1EOZlIQ5otWCVf/uGcYcWvLFIq1vVBrKRU4Ld97ud+
         4l6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782849561; x=1783454361; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24HwDmxkwRqteaHOqqQJzmtBl1Z3hVbm1sSUYzWXHUM=;
        b=HuOczBjIkoOjL4JdzeQU7URmSuDS1odpUKhfTqpG0W9KUJL2vQvdVbOeHYzBU2K/bp
         0D2bhULrB04je5+ApfYz3uU8qVfKkDCof42Bk+EXAQ4YMYwhp3m8JHN7VPgKn6S4S2Ml
         /gPm9WS0uYnlYTngR+ueGrmKMvKYIr/2+DJkNL2CefgeA9BW1fQMq72v5FD7hGe7X4UH
         5jO4ZUMAIA09mfYu+y8o2Po5iajWjsuhGfZxIbKRHCynnBsBaifHTYN0Qd2KajZoKp3s
         8/emji5t+p8lbJOfmPFRLlZxtlZtslCDXdg2Xh4wiqHeJ2/+iDYj7OO1rcY47ShyLlRX
         gJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782849561; x=1783454361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=24HwDmxkwRqteaHOqqQJzmtBl1Z3hVbm1sSUYzWXHUM=;
        b=Yw/BpPCyI3H+y8U848186GOTPQNqg6poFYACoVYhQTSWopBmRSxkpeBDnHSkJkU82+
         /SvZlSCti+EAEws7/ejreVWr1hHfEO0rdf0/2PUrMLlLgs0ses0zyhDi0gfChfl+KOL/
         IlHJih6ORgCkMD6RcJR9KjPQyU9JZgclVdHvHpW2l/7iSn6RM8DNQzXirFYO12GXMcR4
         pkgMuG1kiS196QS4qesskYmCzwOeJNbam6eHhyAjfOFD0Zxrzc0PZN3F3Y+miXczLJ7Q
         hE+OZwCBWPybsn7XB13PL1IET4/3Kv+PzVTwEFap0MEeXHCgrDIm9XsKlDIwq71nfzIW
         +Vmw==
X-Forwarded-Encrypted: i=1; AHgh+RpAhqkHAFS2pnJxTwsveEr0lQFBTvproGKpeQ28gJfUcdlvghoyux8L1DViS3TVfGEQfaDELkU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRBPK0xu+exMoBz1i8MIsx9WXiHH1u49letwdlFGWiHf2wP3k2
	7+tiB2sDO56413gbkMfqxnj1RMtjqTirz8Dpc+SgjVraix0OyztRJKWb6UMIjlsRRjaYFkRV6M6
	niqWTfRQrpziZW2j0XNSrpQWLpdXDLTphA9A3JuGx/ce1AKSwY3cLxW8stDCLuZUNmMYN3zbjwh
	8MwhNhyO8w+nkCu6HrHo29e2aapAsFXzYA6PJRHp8=
X-Gm-Gg: AfdE7cnCQ6mIj9/k9VOQdSXDIswDFGLhV2MFo7HteDPJIBFD7ZDEfaQ6KmHkqKh2InE
	L3Kw3JmyElesD98BnB4m0IHulMYcPNPBT9hqwA4+YGWUSjbVjTv+yYtI8RwV4+1M42a84ZT5VLe
	slJ4F+y7Cup0doXO30KOjVsayXuvyCqP2AWUdWQe9g16sFooS3wdKTCNTiMZMomFpUkaA+OoRjt
	sGBlgp/YmtVHzNBlIxoYafdJnWhASz001ziUAHU2XCnjYRJisBjgjMRqG0J5EVDS5P1BslLeHRb
	jdnpSRxQ5SU=
X-Received: by 2002:a05:6214:821b:10b0:8ce:e651:5d63 with SMTP id 6a1803df08f44-8f2d1343d13mr25863786d6.31.1782849561037;
        Tue, 30 Jun 2026 12:59:21 -0700 (PDT)
X-Received: by 2002:a05:6214:821b:10b0:8ce:e651:5d63 with SMTP id
 6a1803df08f44-8f2d1343d13mr25863166d6.31.1782849560532; Tue, 30 Jun 2026
 12:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
 <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com> <20260630180219.GA4139943-robh@kernel.org>
In-Reply-To: <20260630180219.GA4139943-robh@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 21:59:09 +0200
X-Gm-Features: AVVi8CcrbqRCRkmYSZLH_ub9JNgkd2IUQmjyz1dD9_QoekOgl29FSB3CCebEUbk
Message-ID: <CAFEp6-163adAq8-H_pCzGnq+Fo4jpyKGs6Jv25j3fSpZg3COjQ@mail.gmail.com>
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
X-Proofpoint-GUID: hg9futArRWnLhfGVu-wTHFMEJGs-2Kw5
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a442019 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=2sLY7anfMaDELvqluMMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE5MyBTYWx0ZWRfX0ldlShQyU8S8
 RiyJzdKm3b3F9WiOseVUw3Kqjv3pxquyeA3Yne7xQKNX3YTvIIr9LpZv3bY48fvstnFp9PkD7LB
 l3RZNS2NUHqER6OKIocS/kVCORuG8Zvr/l3zQxI+z6boIRee3KTu0XNj9Qx8oxZkCzmgAA0wNBM
 gzf1ZeYpU4S3ozDmoLJJ7kT61Nnj0N14JbRE0Uwfqe/aF7zdLLP7law3malxBPx/8lw7coF7mQ3
 Wd7bJUr1uBWvvY96ipQnuJ9eucqB9XXImo0W50oCHFXAjcil03LKAUBLEugvpuulEpqvw6kpfrr
 hZ2jT3xEsut847fec5EymSSarMRL8rGygyl1nqdNJa/BopdLkuVsmZY+4+EyoncbEIAqKr+pNAM
 CjIochudWTREAzcW3kcVSnrYSmu0hU2SvGze0xEJJE1cAJxW+s8V7KJy/VaJ4WZcMeI3FOkrGKs
 O3jg5o/fpgRxBg5NjtA==
X-Proofpoint-ORIG-GUID: hg9futArRWnLhfGVu-wTHFMEJGs-2Kw5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE5MyBTYWx0ZWRfX3NSuUB3tFYR4
 mKCu/Zrt3LXbXjjDgU1kRdVeL/3Dj+Swct07jAtky1t+ytEdELwTl2oxuIXhgBPsLC/O/5OFaHN
 X2XC7KbzLPP4nt+MNsPgCyL4vDWguD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_125923_213324_0326E0FB 
X-CRM114-Status: GOOD (  23.68  )
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

Hi Rob,

On Tue, Jun 30, 2026 at 8:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Jun 29, 2026 at 10:55:20AM +0200, Loic Poulain wrote:
> > Child nodes of a fixed-partitions node are not necessarily partition
> > entries, for example an nvmem-layout node has no reg property. The
> > current code passes a NULL reg pointer and uninitialized len to the
> > length check, which can result in a kernel panic or silent failure to
> > register any partitions.
>
> That does not sound right to me. A fixed-partitions node should only be
> defining partitions with address ranges. I would expect a partition node
> could be nvmem-layout, but not the whole address range. If you wanted
> the latter, then just do:
>
> partitions {
>   ...
> };
>
> nvmem-layout {
>   ...
> };

In our case, the nvmem-layout needs to be associated with a specific
eMMC hardware partition, nvmem cells can be a simple sub-range within
the global eMMC, each hardware partition (boot0, boot1, user...)
having its own address spaces.

That said, your point about not abusing fixed-partitions is valid. I
initially dropped the compatible =3D "fixed-partitions" from the
partitions-boot1 node when it only carries an nvmem-layout and no
actual partition entries, making it a plain named container node. But
it's a bit fragile if we want to support both nvmem-layout and
fixed-partitions.

Regarding your expectation of a partition node being a nvmem-layout,
do you mean that the nvmem-layout should live under a fixed-partitions
node? Something along these lines:

partitions-boot1 {
      compatible =3D "fixed-partitions";
      #address-cells =3D <1>;
      #size-cells =3D <1>;

      nvmem@4400 {
          reg =3D <0x4400 0x1000>;

          nvmem-layout {
              compatible =3D "fixed-layout";
              #address-cells =3D <1>;
              #size-cells =3D <1>;

              wifi_mac_addr: mac-addr@0 {
                  compatible =3D "mac-base";
                  reg =3D <0x0 0x6>;
                  #nvmem-cell-cells =3D <1>;
              };
      [...]

That makes some sense, this would require extra work for the
emmc/block layer to also associate fwnodes with logical partitions,
not just the whole disk/hw (hw part), Is that the direction you'd like
us to go?

Also, Note that regardless of which approach we settle on, this
specific fix/patch remains necessary to validate the partition node
and prevent NULL-deref.

Regards,
Loic

