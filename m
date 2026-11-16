Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7633606A330
	for <ath10k@archiver.kernel.org>; Mon, 16 Nov 2026 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYqq21mc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hd6XboY8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJd2gO8+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=; b=vYqq21mc1xBAZy
	NutCwVaD4OoHvHf/6UqmH/kno6ZqhOeIuA/ti8VYlCvAszgyJ3LCuga+t3JDLNYffShsLDI3yGqN5
	ehuSKQmSlMMf6dSjGFSbflXPBgV0YbY3sCAmogn0qLepB2g3lCPpxsbiUKEHX2/14arCxnN0I45Co
	0JPS0/BxHfF/vBFRSUuS9GNMvKoVlUtIOuLzTQizclpJeao/JsRwWSdLu1OyLMzbvbNjDEETV+k4j
	GLjnxcNpFMY92Z8aMZrG/1tNbHjY6D5eUHhZkmIZm525FOIn5cvbkE9QefbbB6HwypuwX5XVQPT8h
	i53BN7fR7LQeS5E2HPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxyM-00000002vjL-2mBh;
	Mon, 16 Nov 2026 14:46:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxyJ-00000002viJ-2oLc
	for ath10k@lists.infradead.org;
	Mon, 16 Nov 2026 14:46:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrb5g1347438
	for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 14:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=; b=hd6XboY8GrHfN+W8
	1R6YTv14o2lXNY/6r8RsIzVsezjRtNaA2JQetf+xrxp5zQT7Up5CbvoWxQFL4N8X
	rp6kzGDfF6q3OBcWGDmYdYY0yITaSzX73+8OEaDwdCg45VBv7F2jE44R5JZYoUHz
	+Co0Y9w4aYawO5JRZ6KQtYR5+z8ruVm7HcgjhgzbOhuBCx9yqB43TUVDLwPZ9G9W
	1ZEgJl/vYdcSD+hMxGsB4nsucRvSRC8YVpBXuhFai5ugjtcF4CdBZe0UDmNze3Zq
	ZtRUiPvbWUY982FFXfNXkGRggGs0XslKqc+jnvwg07EoMGjV1NcXYOhAvBIDs61T
	dv1imQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003gx8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 14:46:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-945b0154705so211162785a.3
        for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 06:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794840373; cv=none;
        d=google.com; s=arc-20260327;
        b=TOWir4ZpOZ0Uncz6ril6ZpeoI2k7OK+uUEvmhSxd0p+ID7Hm7E6eDbSvU57++gB7yV
         slM0NYSQOdxOakDh4xvq5qu2gkpjUMwe8GXG1Uggp50bCyrAGmS7rp1N40EQXsRAOMFY
         mvkK8huSQFnhWeOmDrOE03BfScjyeNve+zyK7CFnS9U63L3FxdYoKFEXHAnpIxNRLG4O
         bECEt4BKR/a3kZAWzGqYMGUzpRaOpCu0gS8Aby/IkUW9EIA8hQ08YbAusmzF3CkFyF7F
         bvbzrcvngQ2ORxfRzRofaQ2o48WfaSnTu//5b0ChbU3raJ3IJ56oIbm0VxCVxxHN5I6h
         L3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=;
        fh=h7+PBknbAmlz9oBhnGcYSW3e33zxa2hXtNDxaIf8dsk=;
        b=EQli4f+U5vVic7mCYVAId/T4n27/TgiQoXf6PyxlpWmEKG4+JgsWzT7I9/tyHvqyLX
         /nJxRssqwV9PdB8ZKoGP4CG07fLO9clCR4H+7nBznQL7U1Y+HqdbKNLojpv1vXZTjSIe
         R+62MRGEwmpJzOfbGjK+zeveVJSrGC/HnJkydFo17HBaKMP8dVmjFRCfPHHFzqRqWd0Y
         VB1FmvO1FVONjrPXjq+f44zgDcoOzEZKTV7yME2SZW6PltZ9X6y4RmWKZ5u0Ol07u0oo
         l7fEwi93aWYG62UnNVfb8RclitZ2rmJg+98ZAQXDjHSdKJOhIF9Fi5qaOcpiJOTBH00b
         NKvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794840373; x=1795445173; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=;
        b=AJd2gO8+I9IKJZAJsiRyT3s3K36qIG2egvJ2inZo6InGk98VB1/+AzWukr8ECTqkD1
         ecRJqIPMxzclP9257HDIb4LSv+gHaRaNcqsHCyKonGx15kMhL1NKvsz/Rbip/+093bG6
         JYFA+1hgj3z+j8dvuAS66OENca4XFr9iFIVWfxdfdKS68mBFOr7ydDh/xHipvV8592Xl
         RSYrKsf7Zo9EV8e7GxBiRX0dvTzWJU6bTLT24MBpM53hzP9N7GDeo/WDhmIBEH8eZYHC
         M1vYR62zDbPy3s2Yyzn71GXlIsIvjltabCmuPFXK8BCXWaPLxdlv8T6grWBC9hh4YD++
         +gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840373; x=1795445173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=;
        b=T0kJt8gwE/cs0q6WJW5Fmb4EGRzOiguHELKRBQ1z1AqM1ZcEj/WPaJuHc0tAL3sJZ+
         sS1yK+CnHlQkfQlunwXkGlJrS8/LpQabjTSbcjHqIpVQtplSYs/losdhWNEpQzWngp2G
         txC19GYBANQzYGASLPX4QZWEQC8oPveupzYkUPp58rzU4MD6ReJR2y05bTy476CwWTvs
         7B57NMdGtMbXyyTO7L1FLdhfED3lOibnCWmnwQW6lSinBIqK8pOYaNJEh7SjXSSdYG9p
         j8lPdWn7tjQ1ReAPzDds5O/w9D96a8xyaGa8DWtMc95KJNx4/yI1rzqZBnvX0NcBQput
         JKMQ==
X-Forwarded-Encrypted: i=1; AL+hErE8pLwoi8lz7qCUzC6t3PrxdjEmyaRPfmeF3Sbt8K4HZQQcrrzQLm1HkgYsBFlE2uHJHqhCIPk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9JSOfWMtYMN1jIgwBXV/QAqR9NJV4PHc9iPwgCMfXQbWjgbuqG
	9vf4aernDJpaLVMXt/s69Bm/J3IB44uAPNinp5kWD5/A7suNuRi2iHrhYfrvKB8u71IZCCAbKSA
	m2BXpj/9G5nHbxxNhNAeYu5UBES7pWuW33t60/dh5QyW06UGdDQTWLOdnKlnametgM9lRUrVmK+
	VrTBl/+gHX6vFLCetP9p49pLuJk6YwtNh48znb+BdqpmZ/XzLQuw==
X-Gm-Gg: AYBFou1tBQesJiLxAUHlrFzJ/JTJbhhq7dMEq29dgqsg2SkKkJMC5s6CiqidE7UDU99
	eEw3BZJOrNiBzXSR2hhTX/QZDOBS1fa2UMuif6Q+gwprXDj96J/iLDbbXnDtCOKleqXVz4wkXQo
	maGeNOir4rUfvAFCDynZncWC2mvF8qIMWTcAaOwYyXXoRSaQFGMy/kt8GrNojNdbtGiQcFCXThx
	qsp5YgAxgwIWc8Ly5K3M/x4mieqp4B77o+JES9R10nOqT/jfDNpJaJ6n9npJ8lo9b0+gyQEfo0=
X-Received: by 2002:a05:620a:1a13:b0:93f:2ba5:1704 with SMTP id af79cd13be357-9494ba7e346mr1832091985a.18.1794840372671;
        Mon, 16 Nov 2026 06:46:12 -0800 (PST)
X-Received: by 2002:a05:620a:1a13:b0:93f:2ba5:1704 with SMTP id
 af79cd13be357-9494ba7e346mr1832087385a.18.1794840372056; Mon, 16 Nov 2026
 06:46:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com> <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com> <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
 <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
In-Reply-To: <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:46:01 +0100
X-Gm-Features: AclHuK9AXwhceuz5CpVpwtm5hqf07xKgpRDq2FyVkMqagy0x7kOAlsgw0DMOrRs
Message-ID: <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Nicolas Escande <nico.escande@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ZFX4TumR1CB_wrV4k9kDvng8oeIdwIjj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfX3F9CkRrfdmT0
 Tvw5MbbCwE15YbKnF0Yl4cXsvvrk370Cduo/XCOFBN2lLfhef93LlZ8qrnnhO8QI1cM9AdzHk2u
 QR5Wqy7EjFSabNm4PVflsPUKsLIlVT0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfXzcQqREWgj7+p
 OYDhtLmiZhu6brlXEburfBsXYxXOfs4o2HnqYeJ+eLm/clbiG20+921t/zRpZGE1S9Z85UreRKc
 qWIvDIiYIILr9yPRyN1+4I5eSXeNDE2142Aj3030th1EMRaYtv86xJvQa6pnsBbuzjJ9sl+4AF+
 1l/0JQV8fw+6a2jweXcEdp1aja17DVbdmpdriRqShx8Ctod8ffeLVw5h9gJlyp4bOuUTHarfG7d
 C010iDikSbI5cb+kIN3fI7at2Nh1Lzwcv6RX83PxK5TX2S9HYq4kIFqbTLx/6SszFhQ4C5LTwTP
 JoLlIPv8gXdO+ns6oJA/2C1rXKhaN8F4VXAAcVjlxr006N+Qj5LDBzYXWsYtaumUmNh2IGdUBjt
 wFjjA0N8JL/qsOlKGTwg+J2ctv4sdzSd8Dr0gTSt8i2FJRYgkk25t2Y6GAhMvrQxB+QGIdzLjkx
 IZ99ttlk+92iIqybFtA==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afb1735 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=l_ARHrBAzVvinj3qGIMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZFX4TumR1CB_wrV4k9kDvng8oeIdwIjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_064615_826375_08D74F13 
X-CRM114-Status: GOOD (  17.76  )
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

On Mon, Nov 16, 2026 at 12:00=E2=80=AFPM Nicolas Escande <nico.escande@gmai=
l.com> wrote:
>
> On Thu Nov 12, 2026 at 5:56 PM CET, Loic Poulain wrote:
> [...]
> >
> > The 100 ms timeout seems reasonable. However, will it actually help in
> > your case? You mentioned that the failures are sporadic. If we happen
> > to read the temperature at the "wrong" moment, is it likely that all
> > three retry attempts will fail as well, or would it be better to wait
> > a little longer before retrying the read?
> >
> > In other words, do we expect a short retry loop to be sufficient, or
> > is the failure window long enough that spacing out the retries would
> > improve the chances of success?
>
> So from my POV I believe the driver should not do any kind ok retry by it=
self.
> No need to add complexity. We (ath10k thermal users) already had to cope =
with
> read failures.
>
> So what I would do would is something along the lines:
>   - if we fail the first 3 times we read the temperature, disable it perm=
anently
>   - past the first success, don't disable and report errors like before
>   - lower timeout value as this holds a lock for a longtime to no gain

Sounds good.

> >
> > Regards,
> > Loic
>
>

