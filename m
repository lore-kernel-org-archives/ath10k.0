Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC8E606A332
	for <ath10k@archiver.kernel.org>; Tue,  3 Nov 2026 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nCUia5SJ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h1Jv4ui4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJVl0IL+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=; b=nCUia5SJxdW7/3
	jS1fBRU6wJyQUWUnQ/X06+WKhjcRDzhCeroSA+9Kh13r2Ah9j8lRBZ244DBGIhveMuTL9kNtIeuoQ
	ab5abZkr73Ravic6o+ITuwVZ57tFbGcq3ADNfj1eQPpLGYepd+LoDqFg/1kc5ZNvldFY6PnxASaOw
	ctW3MqyUpPosD2Xs2sBGdZl3IFNVFq+AhlTL+DWq2td8phSZ91jYsx6XklF6qWlEuJS9I8rdw4Yp9
	jPHhtFxPjtjDHdzUolIraFLFDn452zlOlkfYY4+V14VB+fQBwXQ3eROp8YqLtl82+PHeG46TnMKCS
	gCCokej1ckdqD4PJvsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEqS-00000002ctP-0aAV;
	Tue, 03 Nov 2026 13:46:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEqK-00000002cpL-10EU
	for ath10k@lists.infradead.org;
	Tue, 03 Nov 2026 13:46:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZ7CG3973630
	for <ath10k@lists.infradead.org>; Tue, 3 Nov 2026 13:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=; b=h1Jv4ui4Ibpunnlu
	Xa6MRwMo+OyxB0XfHc79Qh0SzewPZqao2xoNac9BAALDZ4ZxhQnUiFj76Y8qQuNd
	BAtwg6nYytGrU+MCWkd36KO9NW0tJ44cLM6HsDn5h596ZYycAPyRx7sE1ryywO4m
	YRLrKirI+MMxky6AQJnR8iwDSG5SZOEIJ9WOUCixuM6O2vWc4Y8y8CdCIT59LZam
	j33VeRFWPYxZnN5OpA74vSxtvEtKDRxkVeV84nK66AJIfoSKC3TmMkRZAJXGljbB
	L8J6HZETo3mMn0a7ZqnlZdCfn/W6WYOGlNNLKom/Yc+YUhOFrIl9fc/3SkbuHBSa
	6QOwow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy33wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 03 Nov 2026 13:46:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so828198985a.0
        for <ath10k@lists.infradead.org>; Tue, 03 Nov 2026 05:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793713586; cv=none;
        d=google.com; s=arc-20260327;
        b=l5h7c6/Pc+KbnQT5h1znStJKYqMRBXuoZE2ZCmn3iw9QMJhA/bKSEUE+YHq0q1Qfbf
         gU/CQicwdXhLzbVGP/eETgUuOM+1f22e/nsYb5nJgkiR5vNtAv0G0qsvg5ozyLeZ4GIQ
         Q/mD8BastNjDYboMlub3rjxCceIwYkE3dg2KOPFa6WBdohEOoMMtcB9vLmjEmQ+c/lNT
         /qBoPeavZpykTCBpq3NwdUGRulS2955HXevJi0Vsrm8w3vCvYiE43bFPVQfuslGODIOu
         YHMIyTebXJDXJu6Bt3u0QUsZATGfjpIlHiIMuQi/iuWuhEL/ORdyfZK10nKxWrK68Rkl
         Tiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=;
        fh=zbPd3mKeXwKATiUeb8wZRdiG+I4W2lA3gvbhn+7t9Ok=;
        b=klmSXRwPjUfilWdq5u8kxfbg/8MhYJRe2Wy8YHjMQZfDYQWwOTUfdv54HDbj+N59l8
         f+QM4Gx+rKpYFUwiz/yyid6EqiObvxytpH3o+7DmbTPs68nfDxAvZ3E/HbjzaYi4bqJg
         2f8JvEGRrmcvivhnJvo2Dn84pvPzjYg4TogYZJLkhIafTnDmiKpMQ8T4Hxgy8wmyo1Hb
         Mwc1bRMwSKpM1CvILvlF97ZenM15LwQBhJFxL5jjm01l602kuwtfKJdjpIrQIrpqaKry
         1e6JspnfI2x2EGflGjh8sA7cDmI7DzmdUUwsx9PT+n+MzR+XSxb4g0jXf+phED8WX+uc
         p5Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713586; x=1794318386; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=;
        b=OJVl0IL+zzJncXlUTAQcNuwEKcnCAOFcSrRLwQekZ8zkyNFmUYqKcQSAIccwZAltnR
         wc71QPFQf/Q2TQWC14L8hXXgs4C/vv0+mG+RPp0I2VjUakdDwkEIvBtNRfaUUXeWEPdV
         bYvnCANf3L/6xTuGkE5LrQb0+iTzewyr0k8tgD8e8V1fu+XKwPe29yG4rQNRU6mivsg3
         k7QTh4dwl9nos0fPIp9P1Q8RJZecLMh6PgN7vV+frhN1KdDa/8gAwEJ5+pKifcdq9eDb
         afW8w4+TIycUXs6A+Ijcrh443IX5BzM5uHDZGc49ZzNXqkwQUvq59+LICigPGQNOzqoZ
         6cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713586; x=1794318386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ayd/2eGfX8QHFtK5sKYYyWXFC5l+b5DtixNjCpkkylE=;
        b=ylJbafF6Kt9du484Cz+sfjH03VGqbKESXj924C94RIhI7BTJktMv4RreWHX5Ai/xs/
         foSHIB51Tc3ykZ+xo9PMQp88GErjBc+kmx617m7BVqUimJVk5W/xrS+e3+9wvl4PcEDE
         Cbx/qcxqqWVGnhVJowERjDlQPYkTKUEEXFovUPw/jUTRM7CM1YqSsC2DLdvqPH0wGD/A
         Lr8un9ocWb1z86b8tT+aFGYvBTnH39VeXW9JMM3d2/KQj4VAtE0P6rsMf9gkmIRf0/oi
         gpK5vkUT4nR3Aaq/GyuOetRF0tMjp0+zzYxHI2zQtMyKxRvNc8Ps6kSuEeArhZM0/i0e
         i25w==
X-Forwarded-Encrypted: i=1; AKwUvBwzmplTTObMlKXdLUBQlNBa2KFClLK+/ppvkhyJtOyImNkZFfZWXIpHltgwtVhZSN5fJ3OHwOE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/NwprwCnJ/jCcpye7FOHSC88wsC/d7EKe0WTCcmxExyjhWSpVK
	mt0MTQWkR0Ov3dbP1iTsYcU+6GAksZ7uCLpx+Ot1OQPVrJEjU5zXSy7xwxfgOYK48UJFAx3qL5D
	dqEabQnSA7gwFL9aeBEvVCiJEIM/9IwjpbjbknuUlPwxtTkVfWTqb9WFJgYsz6s5WaTiHdRlSs7
	/RPa21dPJy1FkO/Mb/0raZiJpHz4cSXaWybiIzdhM=
X-Gm-Gg: AYBFou0JYQbWuEWm7eimXv92epVYFcXk1zFyEGRABO9xm2QtBsRIKjA7/zMEgN+bOgt
	kbv1yyjs3+KhANtKTqtCl9AD2sWpiqVv+PrXvt1Oe4jmF+KQkoCEUoaemkCiXWD4EkyxWLHWTTH
	Sl1va7t/KtNu7JqK/xuW5Z/ibVNNriJSDQms6w0HM3TmYixzNJo/ED25mogpuAdid5R3nk8O4Gc
	bS7TdnsVw0TI7Iakl56LSMZWnINAKzZ2SWu7iqRDvmnGsURt/H42WKp9PJcpjRrW5Yo7EjkYX+I
	2pCvs9mgqUXFuUnR3GsBBnzWRrCG
X-Received: by 2002:a05:620a:2603:b0:944:941:c060 with SMTP id af79cd13be357-9442171b0c0mr1946383285a.15.1793713585563;
        Tue, 03 Nov 2026 05:46:25 -0800 (PST)
X-Received: by 2002:a05:620a:2603:b0:944:941:c060 with SMTP id
 af79cd13be357-9442171b0c0mr1946378985a.15.1793713585046; Tue, 03 Nov 2026
 05:46:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
 <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
In-Reply-To: <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 14:46:12 +0100
X-Gm-Features: AclHuK_Qok4zfLvdDBhNRvQdZHg66IXQjOtvRHYqHIttkcHvB_4seu749GvrFIY
Message-ID: <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: rkrAL1CUSsphn_FfX-_DvK4XFkbdtKJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX/9WG64vQZQk/
 ridaYtBwm2l/xe+9uXgQbviMnt3XLnvBQN+xf4NPnhlAymKKm46Kamur6dBf1x0WQ3Dz0ywvN1p
 dnHkgTwi0JqNj2TUdNN2Za76gTgBQUXGHM/2GLnP6WDXAsXeSFpf3Kc7ad0yeCxJ71PH9lHla7f
 O4UHQUg8mZcvvDkPHaxpW/OoJj//cpO2EOQ9fyHdDauVJ2Inri6NuXIvTMEetqO8UrdIkFvSP7p
 ZF5IoOL531R9yheZbO/8iMbnAOPR1pLoc4Cs5Sq7zCAGoIiyoAGxRgK7fBvEMvsHe6cKTWHnslj
 RndWbLQfw5RDdo7KmpQDU2Hq5Yg1QuzZYvYFwGLRnO6ddLb4zefURLnuRlYfqzhP7CI8yQqR91Q
 wRkobqKIm0FU5TwEcfbwQOOUrgTFYr4zgdEQ7LjDkp1xllp+lRG48UXwuuj2qo7fJhy+Rb5e+a1
 z8vNVgn2H3NsCkHturA==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9e5b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=ogAJat6By1jEvbFUSnIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rkrAL1CUSsphn_FfX-_DvK4XFkbdtKJU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX59b9qRbsl/lx
 K/xsZu3+XHpkqIEq1xjWE1k2NEIKibovGJDFf7hCnT5yixu4/dOSWypGUf71LgBXrALI17QfdW+
 tGrIuGsG5YM0qxc244y2lnVOvL/zypM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054628_325079_3162BE8E 
X-CRM114-Status: GOOD (  20.73  )
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

Hi Shunsuke,

On Tue, Nov 3, 2026 at 12:08=E2=80=AFPM Nagashima, Shunsuke <shunsuke@nagas=
hi.ma> wrote:
>
> Hi Loic,
>
> On Tue, Nov 3, 2026 at 10:20 AM Loic Poulain wrote:
> > For change request I think the best for this is probably to follow
> > board like change:
> > https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boar=
dfiles.html
> >
> > Please, keep me in CC.
>
> Thanks. I'll send it to the ath10k list in that format, with you in CC.
>
> One question first, about which file to change. In linux-firmware, the
> shared WCN3990/hw1.0/firmware-5.bin goes with wlanmdsp.mbn
> WLAN.HL.2.0-01387 (sdm845 boards such as db845c and SHIFT axolotl).
> qcm2290 and shikra have their own firmware-5.bin, picked through the
> firmware-name DT property.
>
> My comma four runs WLAN.HL.2.0.c10-00459, which comma ships itself. It
> is not in linux-firmware, and the comma four device tree is not
> upstream, so a per-board file would not help anyone else. But I have
> only tested the bit with c10-00459, not with 01387, and I don't have a
> db845c.
>
> Is that enough to change the shared file, or should someone test 01387
> first?

If Linux-firmware ships 01387, someone will need to confirm that the
MFP capability addition works with that specific firmware version. For
QCM2290, I can probably test it myself and provide a Tested-by tag if
you can describe the expected testing procedure.

> Also, the page says Kalle adds the files. Should I address the mail to
> Jeff now?

Yes, to Jeff.

