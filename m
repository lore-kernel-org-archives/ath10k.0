Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB6BFCC9A2
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=; b=1odfds2rIjH14yTLwn7IPxBGU9
	zNH9E9wO5LV6Y4aoVzRZYawL5RgPGZ1Jt8IB+32MxV9aSfjjEveQk0LhEbEyLEPAOJVZlCQGBHvmm
	eybXB5S42ahWAuqt6npsYPSfcZib0morcAQLR+uQ3odhBnz+Fs+i5YPG1VW55ilFUZzRAsxfNQIPu
	RuiehX2YzrEn0rA49eQaDvKn8eKbYImUlm2BkmpiOcAMNfLDjfJ+SqX1MTThsOelxKS+5vcT85gAp
	+bgTtd4AuVmzWvNUlV3yMOGNkJvlaG3Zqgn6495V7rJsVyXPSLo/rCdEeFWiKs2xhnWKqFwu8N5fi
	PQowLoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkhI-00000008ObT-3rvZ;
	Tue, 10 Mar 2026 00:11:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkhG-00000008OaW-2Nj0
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:11:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JGH4w2873091
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pkr/1ETbWQejqwBM4qtLfTAa
	AxiiLLi9EmI3z7gEzag=; b=WqxwLbmWApf+MP0scmsGweu9kRuuQzlAxKa4xDS0
	me8bCEsYRkKs0UqWwp4R59vPcDuVB+sUvSjJYiktF0Pg+GoksF/Yb9wLMbKTsSy6
	eEvNwkXDKNb2s5O8Q9n7PJaB1PwXlA41ErXyFErlqYexgIloTKVfQBgaWmjJG5qY
	vZkjvoz4Gc9Hw2a0R2lMbYCxaWXF0jiwiNDghAdbIFS/l/57J33Cfq5PJC0QFLDz
	V83A0oMU9E0jnBSSPOM7pcI20Df55lyB4rTvvcc/Le0Q7hATER62nsGQGoDz1Ql6
	a6NqXFKxHRyQRVayozXJPrejWDjiCtYw3AzN/Slg69jV0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477grf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:11:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so1700956785a.0
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101497; x=1773706297; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=VVF92TN4r5Q7ds2ey5puKD9dkMXJyjwl2+MpDrlVZH81suM8zN817y4ksbdl8blaM+
         g4YMuKq+ttyEeZudBMCo1FUFdnPuW8UqVIw1EtHTil28eD5YWRC1O01FoWcvgmEU0R/C
         yfgM4UkYFbfYJS19FDQcN3wt5cU9zLLzxATxNmokJtzi1DP/FifcP5uCGSa8x8bBpvpr
         eGePsLptUVOGY08rGSP/LvWM6xcKFyW75J1/ObbDW57tEdmpA9PU/tAt+MLI/YaJcCrg
         Ili3PX1KsbrgQVLlAqQR7SYONk1AYCxR4r4rirWlsuGsOcBzlxr1dsENw/6NbAtBJ7Kb
         lcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101497; x=1773706297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=viuVdkzUUjy25LsuN/j8TjhpLwapH13CpQKOKo8ii7QJ5hoKnmwvvlEuZyM8VWB+Oz
         xnNIaaUre14LlfSy3APl2oWBTYfhrFAYSZBAeeWm0dgRVNF/2ZS9V0Gm6L26VSz34oHr
         nixko4cVaP6hzkjGsjrLQyAPrj2lQ2nJLHGv+qI4h3iDHTdVaG4cs8G0ycc+CQaKfNxO
         Im5lSdv7wZ0j5/N9MxXr0ftQINO+krGexPxIhhFaEtvXuEFPOPYguxa7ZAMoYWYeax+K
         +9q9SMY42wHom43ixE/J9Pqn+t9qdnkmF/gNF4/I45ck4xynytUSJ2ceGA3dulHccC09
         OjEw==
X-Forwarded-Encrypted: i=1; AJvYcCWIJSgxVowm+1KxQaOUaGq74O7LhxzNnbV1IapeH+B2/5uG70M6jrUlN/HTNMexINXOCI7wnzw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMxYI56UdW1iFEuYxzSTZ9ectvjyxjZfRfzLne4zlqTzsy/Jd
	SLYNldu3vR7eO6ND+/u1a3cJQe14muYFJf/sH9x2x0Mhaq80VhyOWLLWW3Qxn09fJGYuzE1OLBp
	k+naWFovkUTMnlND+Pd+vHsLA+ymcz5A/0G2eVQt3hnYxMXdoOGYeqCaKqqDCDzA5
X-Gm-Gg: ATEYQzw7tXP+51219x5kU1YParO15I0vFSDc0JyLL0Phd+DTDE23NFDOaa1N4ScRBnS
	l/qKoFlw6BRGViRvWLW1yLy8F/YISmJ/JuD8zYYBALFRalWFV0QR3wpl4vTrLhPZc5XDmUBE6Lv
	Rmc24ujCytKA6X60bzp4VS1NzBPzXKKEwAKYczFu7Wzwz0Bk0CoPqDf8QLskRgS80WPCRRsvJLK
	sZxKy//SlAUa5UAT6hOM2tMRGeDnycwd0b/pNzzYtmZMCOsrDMt+cJRGcuuvgHUA+br7s02FCp/
	aYogrUGM93O9PB3ubGKx+08xE2fr8+Qdkl7hTqTRjDnVK0yLrb6jmAN0vDDBSoFcVQnivWLp2Vh
	gsyxY3BI6lE65A9WYpwUyoFb3M3FNQwNRQXoQeVkxByLi8zQwfjJgzGgl2WsIpoywUpdP7t0YaG
	kma9jBs/u47OGn4WDauKonb2WyGqN/pMJz8Sk=
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698514185a.20.1773101492219;
        Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698510485a.20.1773101491691;
        Mon, 09 Mar 2026 17:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfcb1d5sm1692581fa.16.2026.03.09.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:11:29 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Message-ID: <ce5hwbo75dr4e7tt27bcprhpch6fx47omhn22ni6v3uzwfb2f2@fa2bebk7foct>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4Iav8nOx7Q76
 VkK4LJU523weiaIghvNE6oFj3+FxWipEZIpxXSGqCbNtAcv9/8megjKYRuorjKm41PC+j6URsGG
 MiOt+d+TTU4FKyZ1gVvULQ2UlOJCJl/u3vDdnwwpcxPX9y+D96kecOuI/lv03WJedeyKatbwRLw
 B/Fph7fmMEWYUKlli80ID4wfd6/zb55TYhrXEwVUHXd6kSews1K0j4xVVZenVdo1+y7ucmAfFSb
 nDQyd54Mcm551y+PdQkZIKcjPHdUnRlZtQp60AiUlKH3+XKlbZacoC71D1cpSbmvCk4JFTYKld2
 ndF3m6C5llPq3JGnrRxw+XEnn2ddW6FT2HoqLdcCE5l91q8YaMHG7nRnKMiQoIvMVu4J+LWEyWp
 oKYvGv8HZiSJ7xICwonsKvKY4H0FjJMhba/5hj0YeE6ZztTL7SSXYm/LplnDSVhUnkHhDlJnxEW
 K82dwlw+5ggWHzf3tZA==
X-Proofpoint-GUID: kpnSJlQaS3INi2SjBwYVrKjwM2uu7Q9M
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af61b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pNJNIoqo8oUBudG6fy8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kpnSJlQaS3INi2SjBwYVrKjwM2uu7Q9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_171138_721875_087D447B 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, Mar 10, 2026 at 12:03:29AM +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.

Also this looks like a first step towards providing qrtr service debugfs
in the kernel.

> 

-- 
With best wishes
Dmitry

