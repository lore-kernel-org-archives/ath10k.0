Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F6CC4450C
	for <ath10k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdHNN/+NVJdFSnlG4WATmfl0i1xgtBf3W3af+KkRuOw=; b=1YZkVRQMDvpmBDXBcva0sVpz5F
	L1Pq+8BIis/G4aGlMocDt06N/AQbX+RyO1Feea8iADGDV6RwY+m6l/sXTr9N8jnftidEd70kQk7Hq
	yXZ+OziemIpnr82zmEoeuDfQYjIndSt8wHsH06qjuwj2PPUnrdsxwmUv6O0lNanj6V/fucmJpPg5A
	QUri1o++qe4Sx46nMbuHnhSfE6NXw3QaE3akdhsKyT7lZOqc7SlXV7B1WAWwnt8MgJKH1zxVBN0D5
	/eb/TGYIAhU53uuNkDN1mEkvjZFsLCm5shL2KDQaaTlOfeye7+OlOJfEHe/o6g9xW5T3ssBKN9VHV
	wQaqDBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY9-0000000CqCr-124q;
	Tue, 14 Jul 2026 18:08:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY5-0000000Cq9U-0Plp
	for ath10k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6qXd1003075
	for <ath10k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdHNN/+NVJdFSnlG4WATmfl0i1xgtBf3W3af+KkRuOw=; b=HAXImbDce0BPaW11
	NbW0yL/adewYd9/9qEbHUec3/3unyi7kDA4MyIj7mvSDU2Lcq/Dw5ESO5S/dZjpM
	ruBh/cbSbuj9VyolIu3eRQWsqwcBeomO4iGRJHTl26ZYNnKA2GOycw6zCiDyEmGI
	OUqIAOiJ02U0+LGDru/Dpj9xt27I08B8820T3kq5ofI65zusRUp/yciMHWkl906W
	pijnCA4FhZUfG+DIigflhrRqpos0JIfjU9cWZO3Expa8j3+7jJXpZZp8HX3v+BnQ
	BMy4PijaieLO4U03e6TGVI8v/q1EXtUUZvGtcW9xfZFZkMGORSksYB06CstYcCtd
	U7QGPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr192d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so130045885a.3
        for <ath10k@lists.infradead.org>; Tue, 14 Jul 2026 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052483; x=1784657283; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdHNN/+NVJdFSnlG4WATmfl0i1xgtBf3W3af+KkRuOw=;
        b=Gx//u1zedKNFPyqfElAyoURhQ73IpQMWr5FRqRzjtKVrD4zeR9Odo63jj7lzLDk15D
         WXF68eFl0p/h3iPW9igMJa4nvcXRK0I3fYGZE8ilyXpA1zwjeDwOE/Z/zNQGL099Sl9y
         BSgiLXtcaH8/1HJyNYsDAN2vdi8BmLIKItJFuaeJxq87dTWCnifZf8ibKJctRldMbRUL
         3nsGjMUXM74Ql0gfTaNNzDvR01EKlv49KdHOPp/A+o+GB9PDzsDy0ThPkMakvGdJhb50
         0p1N4N6YvvHsxCbfffZ1jcYAK2sNpCSVCq+hlBh9BuB69FyPBvYAj2KMQ/hHoyYcRFh+
         mjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052483; x=1784657283;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdHNN/+NVJdFSnlG4WATmfl0i1xgtBf3W3af+KkRuOw=;
        b=UXEQGkCCtiPGmHcj30v3ZpS1J7vGYxboxcLdqbTJ5ItKBZqF+WJoqMZHexTO6Hu+fg
         1eqwjU1EccklMuF+/vPb4JHjp6vG5eqhLbZ8guFFkFmMVs4HfDwGgGpgNN5YWj4T4FVj
         Y6qQmFGReQIfT8/s5jKnwPP8ZdimJ/PzyfZLCh4jetE8OyqnSt4cSkeqEg3ZM7sVNBcO
         JdKI2MU6Z4YZAljKHFKGRio9MQf7ponr2dv8O2aQAF9gbzWGUNgwRSPkTtlTkItpC+Pj
         Tcklq2SlPo41x8y2OWtDBjx3mbskkEIvSP4W83y/VcsEPhYs1hqSUjKEr/0RYwz1CRiV
         P4eg==
X-Gm-Message-State: AOJu0YxgYEdI9XtW1h2rlOCTfbKtZHSvB3VHGuLD/2dr2hOvCDm3nAyo
	jI3rK9/P6IhlyLARvot/FC/NsZgETadyX922H7Hz/LaiD5fNI+AkSdMq9G9YJhX3Rm7Ul/48n7I
	ZJc+MtqGBWb9LE9yNdqmwaQ4bBf5wi92+bUMj/+SXGAZjE6oIsuw82EO9TQYbKZRT
X-Gm-Gg: AfdE7cl/vQ5cgW4OGeDHiNSOuQH0FNy/wEmKGgLPMYXq6yJO3Vz9/06tgJJE51CWdrA
	8x5hgJQuO3WTOMWRtTaq+jYj97rFLKO7fz+Dc/InvcktzTJ74ZtwSRDODACLRgYruad7Zi90oIC
	6yxV/Zi+e9hxSmbLzrAi9MjHIabb/trBCMg/YxeM9e8aeN5J3OtR2QXJYTVTaxuBod0u+nDdd4d
	dOiyNEyKQaTzA3NzD//IzNFcreBD6Obt4XfFsG4Mz3Xl26TX/KYyB8aCs5VNn03HSmX4wUoaRy6
	vL2K3ymHquQO95P83z/vPldJGIBnphKv7+qVEWkKH5/QGOC9hX4eEyXK2uCo3y18C84G6jw9aQe
	f+OCBradLpOBGB1x/F1WGMx2jP/mxDF83Q7fZi7WuvZ1mPGhRyQCAK0crKGMwkWh57A==
X-Received: by 2002:a05:620a:4141:b0:92e:e250:f15e with SMTP id af79cd13be357-92ef2f675c4mr1438082485a.85.1784052483416;
        Tue, 14 Jul 2026 11:08:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:92e:e250:f15e with SMTP id af79cd13be357-92ef2f675c4mr1438079685a.85.1784052482962;
        Tue, 14 Jul 2026 11:08:02 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:08:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260710060406.3323260-1-manikanta.pubbisetty@oss.qualcomm.com>
References: <20260710060406.3323260-1-manikanta.pubbisetty@oss.qualcomm.com>
Subject: Re: [ath-next] wifi: ath10k: trigger hardware recovery upon rx
 failures
Message-Id: <178405248163.4102418.1966503659201070953.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:08:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfXzEltVcqbHslm
 3UlQUKsgnM8XaQqhYNrcQucuAzDtW6ZVx1U+E+aoASJsg0wDLRe4pVJW15hTIZo6tTlDjJQVLpE
 W8pP/T7F0LX4/1cyasRiHZgtAJkCEN4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX15wAXKl9ml2L
 yMPpRsqCik0y8Vb0MK/6bqnXyh/Tc/zH6kmyE1sFswXcrtnNqrim5W5i6nc0VpKbyNi3Nn2w8Ny
 KmJD+PZB9gF3CKbq4w20aLGJjKfDhJ6Damn/1lwZhYbd4Hf6PS2m3f8VNPS9B91/vJoN/96md1w
 D5IRDICtMl6GrNNEt38IVMWhcN1q6rmEPNbXGdw4Pu/d4Sjosg1yVpUIL9FnPKUsCdlTU55hMhK
 ZBOrpJ9AdwRGmpFXptMOZpF7iazNMeQ238VnuA/+cE4f5kiaGrYyyvfxIjQncLSalugMN0pIIjW
 0FX3aXjNq3EpyqBO71xbEgMpWC9UhqvolUzkIhyhiy8okzQIB2S+wBKbYAyMRNJfC6XhQByFdxr
 wmjiY8xfOrMH8XwyInOis+nKuxE/7WUaoi/NOywdDi9dSMBjMW6x9K4Sap2H3BTWuB9ChN7uuVk
 4ZUxz/swshLusleDT9Q==
X-Proofpoint-ORIG-GUID: t48DKl8MgyvErAa5XYjtfjtHjYa_jSy_
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a567b04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=D6bBqopfn0aMulu9HN0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t48DKl8MgyvErAa5XYjtfjtHjYa_jSy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110805_274074_59705A6E 
X-CRM114-Status: GOOD (  10.79  )
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


On Fri, 10 Jul 2026 11:34:06 +0530, Manikanta Pubbisetty wrote:
> When an error occurs during RX packet processing (e.g., MSDU done
> failure), the driver sets rx_confused and drops all subsequent RX
> packets until a Wi-Fi ON/OFF cycle clears the flag. This can leave
> the device in a bad state where it cannot process RX data traffic.
> 
> Instead of leaving the device in such a state, trigger hardware
> recovery so that such an error state can be reset and the device
> can function again normally.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: trigger hardware recovery upon rx failures
      commit: da5d73e12af2bc517d5972186a87e7d297d6d0c1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


