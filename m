Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C954606A31C
	for <ath10k@archiver.kernel.org>; Thu, 26 Nov 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3LGEvEaY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH+xYPwB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W3Ui/yOK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=; b=3LGEvEaYkUyMCh
	73jXuEy7YQMVZD4FFDR0gX96739w4sb0bntN9anXvLxJlasfBQmNoNCCQCV5t/wArozjTVSwFp0hn
	ZpnQuI+l3/uw/B2Oo7xnnXI7tBUun+ZZSYwj4ugCWYljTH/Ull89A4R1W1NW1aO+s8rPjytN3ycSx
	N6JrXVSxD9uTRqtoot91u1C4nK8B4dmvfHpCKwRPaMDbAWRBrsEblbYfYUn9W6Janbd8R2zwJOGoV
	W4iOROVBNI1Lxbp3/pZQ0GVFX2SXnZpRusvJ8lmvRTbwyW51mrLPaIgKpoEeXgZdmZ7qgcN97HOXq
	W+JdZPVe9/RLwqqMUQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvH-0000000Dq2S-00Bj;
	Thu, 26 Nov 2026 16:02:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvE-0000000Dq23-0cy7
	for ath10k@lists.infradead.org;
	Thu, 26 Nov 2026 16:02:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu9DQ275277
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 16:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=; b=MH+xYPwBCG/SjU3j
	2NdNOS8uSO+nbNsKGh88+fn5vGTMLM1MBqpM/d5H8Rqfx0fp0kcF0+N0rgr7m3Cz
	qrPqiI8kTp0pZkZ4gwkxHjV2zuB0BTU+hdXa1XfrgyBmK3crnI+t82/3Pn3AFjGE
	K2J/Wp2VzT98l2yimS+DNUuJ3xzPn7k4R8lNg3VcniRAxgkPwqSANTf74zXa4dxh
	ibkM1GPOf2/+QQA5irEaIeMi3FVmdd9Pkf1V09pzXsHrjNyWETiUCvNx36C8SMTw
	lhKwhxHy3dWWiPbNTQd7EaOcEo2kefEPt1FDdMEGKiYhYvlaXt6kvgBlRBfQdj4+
	0T5+RA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm81h8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 16:02:06 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4d1e90b9eso56901377b3.3
        for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 08:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708926; cv=none;
        d=google.com; s=arc-20260327;
        b=oJ662dn47KogP4Y3bQ5o42EDidyoV2V5KGRYoH7B1ygiLf3GgT4Xpmk5zT21IxP+2I
         ee1ap1l4wdt/jLXbz2PA4wpLeiZ8rdHYhGMgoJ/DPGJluMdjJJsZqnIE/vXRAxmI2ImY
         nhJ+0MKeROgUR0+01p7bLr3dhNDLFUoFhvXS8y6e9PuZ2FbjFVgPpQexB0ObAjTFzYx4
         Wto7qLxqx+fuowTBaZLE4FzTSN5pswz2Ar+wEyyqWOjPt0sn1anwWamOXFB7nwC9k5I7
         8yKdb3omOCYsRY2rUCjErOmSvXMXLGPpSg7z09xCy0RIkCc0K6dQl9D6vMlGRcS5+Tpt
         Vl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        fh=uw1qROH97l9oRTJQeCElJu8aOW7B+gEygVnm6DDCMTY=;
        b=k84EhxDtVx0gU0UKzoWjnSLNN+b0miN9mbjTMX11PmwIQ0EFzCCqju1hBGju/EVRWD
         5yCCUXrFETk7EVLofyLsPm6sQiP8iAjfNyGWgg71n3Yo8YJiC/uUXYOR36BWUSZ3c72A
         ysChclSjoPKNbXNuThcFqxpIHKoSGrV8Jtg00PBat51zhKbROtHspAcN3JD+hwJ3HWNL
         1/zY3ggFk2/E/sC+aVkkenOvLAWJ1Mz1F1AEp5/bEY6QEuPDr9ddP38uaTv3k8SSSWxh
         qshP5mIALYJEi9Vgwe/Fle0sRKsClcMrb+vwo5/4aCpZbzAL8pgVVlvEMXZ9d89XaThN
         kSLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795708926; x=1796313726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        b=W3Ui/yOK9L/mCGnXuhOfHx92grjw5+2Dnu21cyojOF3zMssPe4AYc6SCy9qkssyQh0
         FRDbkrw4dYUEh0x/oI3bF6cYJV3A8HFqqjCfNbxpbPgE/zkoyiwwhloBnQKUndpOf/Zw
         Xn6yXAyX5bGDjTf/ZXmKFVzZuzCCJpYdEuo5zxHsbxG4jXi/GPtQwEM0ImozX5/Qzj+t
         Br+vuX/07eYsfi/wBBZKCyUAb3j2vhqPKRnMipS27pp/av85mf9bpQF/7/QPFLz/i/Ga
         b3Q1mQdrh0mDxhHVtzr4Y0yMb+i7T/FbItbDRJYKhBoJHUqGpt0972B6TY9xpU3Wdg0h
         Itow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708926; x=1796313726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        b=KZHq7hpGIxFhQSvnqMPaL12GUCklqnfyu6yf3qTaVQUVW3/QL/InkRgFYTK/qnoeqB
         5057htfgtAn2kZ3BjJEizBv1FdUT8F9Gp/am6CvDwecRQB2DPAJVhnIL7gffj2436ihH
         E+cqF5I2No4ZkADmpoLL0Jvja7avdwBhTYwbzABT8wWayUk5lNMYg94szFR214WNZaYf
         Z8bFDCG9mRQ4enrWYzPDtgsA5OVz3JvkwQvZZdf6TUDKRoqpt6MOYx2Mh2iL0IKJZyaX
         jlAXNH4EHBmW+jHIkQiI152HgBwXfqWJPj1X78VNOwThZUPX0ksuOl9w/u/eqMZsBbwE
         XP3A==
X-Forwarded-Encrypted: i=1; AL+hErF8aPWTtZIFkNAlEhGFj2y7NVMnQ+jreaMZ2cGZqSx5oSADrgggRbglsRB4E1R/Dul+2dU3wyk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9LAc+YH3B1IEFPRluL2pUwASPsTfExUSNhq/oE/+dEeYxSIdT4
	ZwC+IL35SEKczJM3SHISnkYO/4hHWY/TsPfsE0DVF2BFAp6Ela0CtSDJVF5HY4++gBlWd0VyBgR
	XFX8L4O6f9umLY0QDM3bQJVC/pymXT4rzR6/EyWp/wN0FUXlswzzbIBbBr+2l3fEaOHvPENwfAa
	o17SF16feC2Q6fOzKvjtx3q4rTrH66PYIdjkWsw419kIW7V/eWwA==
X-Gm-Gg: AZFdTZdx7n3QzY6ilKi+Rk/8VT5rtv++HUj+5xnp0Kakz/9HdP3QBF82TrauLg47eRd
	b+YiW4PWTZv4V6PEJPwIXTQbPkqv2X0VbCwgttHgNvkfev/ijIvbuiX3vAvAEsoPP4XPV8ByJ/e
	KdzgHX5C4/PZEeflDi6uPa8zOlzmMIqXAxxK2+GLd+N+mBOq7Pc57suKTkJ7wzFX0BZSh/MK4yU
	YhRKbGcvpAjgruMxiOvYzOwRZr4x5EiqISyjPoy5vEPu4YEp4wHUXVF5cFk3GSjRyqhlq7MCFHY
X-Received: by 2002:a05:690c:7348:b0:8b4:cba5:fd6c with SMTP id 00721157ae682-8b52044065amr97501117b3.22.1795708925846;
        Thu, 26 Nov 2026 08:02:05 -0800 (PST)
X-Received: by 2002:a05:690c:7348:b0:8b4:cba5:fd6c with SMTP id
 00721157ae682-8b52044065amr97500147b3.22.1795708925311; Thu, 26 Nov 2026
 08:02:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com> <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
In-Reply-To: <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:01:54 +0100
X-Gm-Features: Aa3M54ozjhMAAIRiMG-A1E2xZ-DmwTbX9lpZ7R2j6rBAFsZAM3Zkf6dIszSnsmo
Message-ID: <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nCq2G9bn19bWscJvH7FikE_Hz1O5_hhV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfX7Amahl/KnLOq
 u2EF4l659ZEXTV/wPlZC0rtCzaxBW+DHR61RSKfX1GLnKOjEy0EUB2bIi+b1JHcAMnv5+Hy2+Kf
 GsXJxCpf/pNBoq68zdM61OytU2+glk8=
X-Proofpoint-GUID: nCq2G9bn19bWscJvH7FikE_Hz1O5_hhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfXzKQeCyRDoDEZ
 KC3W+LWlgyMeEbP4679CY0khnOsEql7vQur8D1llp5fba8PRQh6Eysjz2+j+MXPlxx0vwKYr2UX
 urKjpNixjoRsBhy8i7LXtrY4rRzHldpQXjaNKamBtk+wB4Np6Pto/8oYJVM1sUMXVqeNDHbsaNA
 eUS+YbehDHq83dGTAVXxhe1lyiaviMLZ7EpT+MGhkwf5iuXwNCNC5zOn3oNjJywam6BFfuL4mmk
 Ndwf/2ys6AXNp595CK+Io01awiewTPg5wpadBalZET0pfRwoL417yQ07z2nJBEpv0+QfbTEXrDt
 lYKSdgM7toQhtuYK4DUDYaYQK28okHyCZx8Pbo5VbX1gWCa5hzVGP60m+pSEOJqoGJW8tbPa33i
 PCAvRXxcq/nSchI2cfujVofmABRL3XroT9puVdkZ262AFBx7uMDRlFuWIyP+ePJIbCcAg6LiKNH
 kj/zHdaxrX7A0ehNgCA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b0857fe cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=1cAfef3_83k28a0CgYwA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_080208_325814_BA7D8291 
X-CRM114-Status: GOOD (  18.97  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 9:16=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 11/20/2026 4:41 PM, Kang Yang wrote:
>
> > @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee=
80211_hw *hw,
> >               ar->state =3D ATH10K_STATE_ON;
> >               ieee80211_wake_queues(ar->hw);
> >
> > +             /* Cancel the deadline monitor first so it cannot declare=
 the
> > +              * device wedged after recovery has completed.
> > +              */
> > +             cancel_delayed_work_sync(&ar->recovery_check_work);
>
> If recovery monitor runs between "state =3D ON" and the cancel. It then w=
edges a device that
> has just recovered. The sync cancel only waits for it to finish, after wh=
ich
> pending_recovery is cleared while the state stays WEDGED.
>
> would be better to move cancel_delayed_work_sync() and the pending_recove=
ry reset in front
> of the `ar->state =3D=3D ATH10K_STATE_RESTARTED` check? Then either the m=
onitor has already
> run and the check fails, or it is cancelled and can no longer race with t=
he transition to ON.

Alternatively, disable_delayed_work_sync() could be used, but it needs
to be balanced.

>
> > +
> >               /* Clear recovery state. */
> >               complete(&ar->driver_recovery);
> > -             atomic_set(&ar->fail_cont_count, 0);
> >               atomic_set(&ar->pending_recovery, 0);
> >
> >               if (ar->hw_params.hw_restart_disconnect) {
> >
>

