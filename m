Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E9606A334
	for <ath10k@archiver.kernel.org>; Mon, 16 Nov 2026 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2NkYIvko;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbUtLH7O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YNxm7op8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=; b=2NkYIvkoN1PX0W
	sHyFR4/S6/29IUelT81eJW2jz2Z3Dagf7L2hjFSZka26twM6hPamvdoVtRvBXZ3hzVaTo//CD/lSb
	BK4MDSShTZfcegbWl2+YgRDUlkwS7h8CJV+ppWUIRYjGGytgDzqn5C1fhaNJMxRk/nTV4PdXc7H0m
	G4GXVFEH7o8EU15MIWms5/3qXPHUZ31wyJNO2/Oe4H8Gkj5GOKBuLlalmnD5eLJIe4nyoK9g+flO9
	bUgXs39UMcnIKGXnNXTQ4ib9ByQRFTfXtBDMWyoRB2Hq7k7i9c/TyHYB6WRkDm61T9OYf58GQpNk0
	Kkz4DRX4KcYRg8ei8Iow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyai-0000000333R-3o5e;
	Mon, 16 Nov 2026 15:25:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyag-0000000330Q-1IUq
	for ath10k@lists.infradead.org;
	Mon, 16 Nov 2026 15:25:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrxoW3360871
	for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=; b=dbUtLH7ODDImv+Bw
	dAblIO9ciBFvJM01OilRUZIJwj70ECzP4mQgRv8DE8gw0HL7dce33Uh1HvO3bmyT
	oLF06MErMam++wMysOBBuKiQC11f4tx7TdWY7uEIdUd0eMgT2uOc5ScpCvc83GkG
	w76XSAXFTEJzj+MD/MyHWe02QkLQiahz3fMTM+CRbEy6ifV7GHp6syBng4AwrXwG
	PjuXitasCYy1OPk7e1bfUTPHP1N6VboMyxRdUPeBaAMCMqydw+QN2KcMwSXB3yDM
	k5az4nruvYU/NIY8WNVVeYt06VYHcaMNoszsKlfqEt4CuV4ShuXiD6RGMf80ZJn8
	fu5meQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f80r68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 15:25:53 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46dade0d7cdso3056551fac.1
        for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 07:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794842752; cv=none;
        d=google.com; s=arc-20260327;
        b=e5TucFKmk/z0fMwhByD011pkVHstTZNQgZJUXwvpCWudLfXtFRCYSDX8Lbjpt/ueQ6
         vVmfv6H9IDBy6DCWsAFszq+YQZwK64idNNfjNAtX2HZ2ZQYm7Y35uSO49rrBu1wjdZCW
         qw/o1pLEchY6tBNJE1TrCXaGggpcNAq20RH7DFzYiIsmicI1Q3qzqeIV7zBCkN839YRF
         BBT76BCrgSzvMp4dP1vrOGPCz9eKCTmjt637eUYbz+vWv+JUpIYxrvkEbTwO5FhpPPqK
         0XFZl4xMx9KT1gULoFAl7uG1Os+ht3VNqzvMP0XNFfIkbaX9xk2Qh2rwybfxfj3gNCyi
         7QxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        fh=O5Qj83taQo7U5wxzWgPwM8B0qCGNKBF6QomaT1LQor0=;
        b=RHXTrzs3dNRg6GyVIVTpBbx7I2HGv4RZnDF4NrHVBBCu/vg0RmAHwpLUuI6wkvftT+
         JgQa29aj4dUNG/BGQf5D2FCa1Kf60rEdhm8JU0zWzVgduYqiVKZai4iGjyNA5vqji3mc
         1+u6sbm5cSnPhyNHshbDjN8nenIWN7nhyP7XWHIFKMUXdDKmij8W0rAfFtmp1vPr0TBZ
         BD7eqHYi4i5VABHaA/NBFcJEpM+Vox6KdqAk5Q1Vw6Lq230o5z1CVpxTN9O2S4CIV4b6
         D8PfV0bnn0beNHORQg5OvsUj4K2aMcKpjfeTmtMIQ9eoFqMna4hiqkAfw4g8/XYqF8C2
         /Cyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794842752; x=1795447552; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        b=YNxm7op86ZfqY1XXyG5rXM6U8VIih2MpO2YsRCI4TnKv9RjvgCMXDYIOJFtHMW8Fxm
         Sy1sAqIRpSQb1Y3YxyNIlU6lzLb+Ix1yvl3wKpK18dZuRHBcHw7fykBh/8deth/okQC/
         viEs6Dk9CDOH5z39XAjkQQFmnxgbRpkI5agYuXT3UKks8MlNQgZTv2GPVpDhBrT5zGUY
         7DS7rmKBf63BhaRFTLTwSqRpyuIV8Fxlksf5PRS4nraFh4DzYN8Gm+5tonXrVa8KceTv
         HLv4fauTUOqrm52ZMofJQ4v2niBBG9ZAZrwlkvaK5lgTVhcDFXlzGZ53cFVgHWJwsVGw
         umFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794842752; x=1795447552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        b=oG8HKMl1dfGwkQfxP2kkHV6DEQjHi/Ed41+1tBK/uVC2L1EDGQQdcThJw8Co4xaL/5
         UOhwguAOE6pVeaMF05VLuM+KXR4DrOiQE7n54j8E88L8i9tkL8gRy3aSIeLbtERdtqF5
         Y6ER2qwzOc2sOAAWYHksa3PeR0uwyb2xV2aY3cXMWkR6MYeCI9wnfr7vgV9RWCOk+04x
         oJjwSa3NDHqkmMSMxIH/V/9fBGdHcAtd8iUvOPzx6p01dMBF/dAfVdReICsH37Mh/5S2
         c5gODNGdXWAxiLvqaMlU9XQrMrjxc+LdBjhLmyAK/qVsu3pLMlCeUkqGXpMcWQjdLzHR
         md2A==
X-Forwarded-Encrypted: i=1; AL+hErE9HnNB2FlNnfmCsTXieqfIwjReKAqpSQmQMspAncR0AmwgxWfuJO6KV/SqI6tlXW+MX8i42VI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/rjomPEVcx8PSxaqqqFLyUQf8ghAhAJdexpr4c3U42Fu+giZ0W
	tMA4apqgOp5U8dk7xG4k/oUEyCwetYkQDQAAfH+uXqSm0POAp1reFTN8HeYhvgkmkQg57UvDQW5
	CwoWV6BLmuqD+fNUwWbRYcNlcVQum2yfBVLe12XRCq2CD+71u2dxgR6sxP3YkgR5hwA5ll2oZTJ
	ePrk6EbMuhIHxTB8W44sbwdM+TUQkrwdbZqXvSMfU=
X-Gm-Gg: AYBFou2XINJRFZswMHaQoTjMmvEhCJAzmFmKISqbHaZJQAnVnTccme5XNzPEnQvxt78
	hGgW77lPcruMQmMzW8YFefgJpEcXbnHh097j27PNLSl7bdQzCZl+upLkU3OrezulbGKa4mLxd+N
	EkeqhqBuagPqI1Kwe6RVuzWYIauph/nU9hBH+egWAKEVgDYFTReCqnGH6z6PBHo11KYwFJi4Rt6
	CknxwY9d4a1rwyFg+2nUzHUEajUAXa6ZVSSSET/wn94xZi7yA3VreFmBA6f2Lj9rRtKsH3iLVA=
X-Received: by 2002:a05:6808:4f4f:b0:573:4e8b:1f5c with SMTP id 5614622812f47-5734e8b3fb1mr5344811b6e.35.1794842752498;
        Mon, 16 Nov 2026 07:25:52 -0800 (PST)
X-Received: by 2002:a05:6808:4f4f:b0:573:4e8b:1f5c with SMTP id
 5614622812f47-5734e8b3fb1mr5344784b6e.35.1794842752120; Mon, 16 Nov 2026
 07:25:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101164247.258200-1-julius@bairaktaris.de>
 <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com> <20261114210506.787342-1-julius@bairaktaris.de>
In-Reply-To: <20261114210506.787342-1-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:25:41 +0100
X-Gm-Features: AclHuK99qyYiTBn1w_wsKGa0k7udgWCX78Nskst2jWzL_EErZ3zuCac4Z_wS87c
Message-ID: <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: jjohnson@kernel.org, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MSBTYWx0ZWRfXz+K1ntztkim1
 k75f3qhQdCIq08e8N+e3TT0LzAZaUPFV+sZELEBW0zWAgclX5Uz9duRvMKiaT9SLPmcdgqbQv+5
 UiZR4QgLSSvKJ/FiC2aDgWODdCkvQrV9lKpBRj57n9WjXo93SJgjs/o+SOqBdPEcpfQe37O8wT1
 WyxtOfBa2faysID4Rrds9H6usrNtnqcNCOJwKRPzwINjYeWhJKo3deyluQ74rM363+7Us1cNpPI
 MqC4MIYUBqMXHxAWpaRSWzwhwA5LPtQAK9YrmipEEify7QNBvClggoAFIURq+Ou0QUtQtfrBE6I
 IC+IpeQdfQQJi17Y9mWNIV0AQdGRn+8voGMNkfHnARBDaCf+FdvoBT3KUCT4lWoaL8zgA0TBCvg
 GxYdt3O/mgjrtpLPiribBMbHPClUSfXhlrJEXbtDo2GpV4T/ECkbu3kJ+qfKjf8KCdFpY3UWTWv
 FzcfaGm0cY8j1BKtk+w==
X-Proofpoint-GUID: O5k1vYEtK0WkVGcHdFCwnoPTUC-iPlVq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MSBTYWx0ZWRfX7L+0pWMNRaUl
 T2mzN3/P9uVu6pukBc9BhJyh+P6aH1aRQe3DqQqDCoFUyMjnJ0Ueu+sgK42UUtxgnYwUmgKlOp2
 tM/7D3nXrZ56jFtLNxzi6aLGYbkhY40=
X-Proofpoint-ORIG-GUID: O5k1vYEtK0WkVGcHdFCwnoPTUC-iPlVq
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb2081 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EBsIc212XWC_7v4aTzkA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_072554_467065_6341ECD1 
X-CRM114-Status: GOOD (  15.38  )
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

On Sat, Nov 14, 2026 at 10:05=E2=80=AFPM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> On Mon, Nov 2, 2026 at 1:13 PM Loic Poulain wrote:
> > > -           ret =3D pci_enable_msi(ar_pci->pdev);
> > > -           if (ret =3D=3D 0)
> > > +           ret =3D pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_M=
AX + 1,
> > > +                                       PCI_IRQ_MSI);
> >
> > Why not simply using pci_alloc_irq_vectors_affinity()?
>
> irq_calc_affinity_vectors() sizes the block by the possible CPUs: 5
> vectors on the 4-CPU IPQ8074 with the firmware vector as pre_vector.
> msi_setup_msi_desc() rounds that up and enables 8 in the device, so the
> HTT copy engine's vector 6 has no handler: 226 interrupts in 14 s (one
> run) against 36891-37590 with the hints (three runs). A calc_sets
> callback allocates all 8, but group_cpus_evenly() makes at most one
> group per CPU and the rest get irq_default_affinity. v2 takes the whole
> block or one vector, and keeps the hints.

So, from what you say I understand pci_alloc_irq_vectors_affinity() is
the wrong API here because it sizes the allocation around CPUs,
whereas your goal is to size the allocation around device
CE/capability (8 vectors).

Can you mention cfe9011a05a8 ("ath10k: remove MSI range support").
And why we re-introduce MIS support and how is it different from
previous implementation?

Also, you should update the comment/kdoc for
ath10k_pci_per_engine_handler() which says MSI interrupts are not
handled there.

Regards,
Loic

