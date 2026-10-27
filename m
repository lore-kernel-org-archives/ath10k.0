Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB79606A31D
	for <ath10k@archiver.kernel.org>; Tue, 27 Oct 2026 18:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZlDLSYko;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2eILnp8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCSKNyev
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8XFT85wuLsnAuZ+7nctOOH8ib1XLKOpS422jcqy89iI=; b=ZlDLSYkoMbaldk
	FLjfRZLmtwQRaHwlFbieVYJMjYK49DIKusUjYEPrHlmth/PImAuTa5DGWz9v4OG9d+tzCl9uVWXLF
	oHu5o2dTlEo0OHg5HY3OuPCw/WNpTBtwezvk4S0hZeUEbwzI+JpslePQKiPz/n3qkEkWuZfwp/LwZ
	jhQfzngu5yiP2RZDNnb/OP8K2bQTt0+awUUIZp9b0Ptr+m/xHhSx0hpwbX/W/4gmvg6FCf6B6REJk
	MVH7w8rapoWJVRo+8Ivx2avNjc216Qc0lKALd3w4j3wvJB92eS3e9TwPbpSzZ5zfZOXunFt61gaN6
	LpIpA8pvzwlsCS+q00AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmJM-00000005bVb-2p6p;
	Tue, 27 Oct 2026 18:54:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmJJ-00000005bUv-311L
	for ath10k@lists.infradead.org;
	Tue, 27 Oct 2026 18:54:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHSf42945866
	for <ath10k@lists.infradead.org>; Tue, 27 Oct 2026 18:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XFT85wuLsnAuZ+7nctOOH8ib1XLKOpS422jcqy89iI=; b=Z2eILnp82PpsJedw
	LIGYWdssU9J4SVaJex+vYYcWPc9VbKiP4ckgSu+WWkAKtxIjTTLEAutqdlx+wnTy
	t718FnjwwSXqE8eJCNYpB+qFpoPPDu9+L7GVDnIVfrRoHP9r6+075AwQpevxuHkp
	RDKCQswSL31nC/LrZSL3oLxmKYLqv8l+viESGA8UsWB5ODSIQXi9KefsFV8zqX9v
	feqF4kmp0e7VaA0g53ksm4xDpS4FVgvaqiNO1pmRUOV9Jwvu+wFTQmWJIJUb12BN
	qceWNW8e4T7PariUool8tKdA67rlpkJFnNgFtrebYeMf/DfcacWhYfZARcbn/gYv
	0KffqQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6ajnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 27 Oct 2026 18:54:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so435111c88.0
        for <ath10k@lists.infradead.org>; Tue, 27 Oct 2026 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793127251; x=1793732051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XFT85wuLsnAuZ+7nctOOH8ib1XLKOpS422jcqy89iI=;
        b=UCSKNyevorv/tFjh+lr7sAV0zXbhiS1ovn9DshFefMfvLEMB6vakSOPRh9YnJxD6AD
         dh+pb+gc97pPmcqggg0RVa9AIJHzApxFC7qqCU4uFN42Tm5FxIDaL6smVwKtQYH31zvD
         /jliOBG8GRGDc86fssn7JtBHk0Nkg/VmU20JPIKTwXBcQxCo+igVi1r/kn8lKHdUFLYd
         bRbknOARk7bRHMEjzFrnKvv9P82l4GmDa1FKW41C7NOF9d1kdxJQuAXO5WtIIJMms6UI
         KHaTnQpdKBqOPstTcgEsylb73enCWk4RQnhvh0y8wUs1IFl5TX3mkvf23l0xvYcnnusQ
         OG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793127251; x=1793732051;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XFT85wuLsnAuZ+7nctOOH8ib1XLKOpS422jcqy89iI=;
        b=R+Eq3AmoufC+fI+CkxhmtmNQMeAz96lQyHnNBn5xpx+GGV3eZncxbX91l0A0vOQvc1
         uGpvNMRSUK/aYXN/uRnCVFEkhkhZ6AWPxRwUn1/nq+62QDZQzMh8XIdUutzGYr8sQCow
         NEc364mWVDXBfzcENJCoVnvSNuEw31nSj97796CyfH17RrfqFppzDfYyr7cIk1NiXFo9
         G5LkjZGGjEyS6g9VHqJCUasdorYWhgWbuKkztiSjPHaKZMcG1Z2qjlxtaZgKZGBnLMua
         JeYTTQKu2ii3HBznOBlHsFI5fFSW2TspH83Jyx9Wb80pZVxAHeiT1meckNJa4x0nPLfq
         LgqA==
X-Forwarded-Encrypted: i=1; AKwUvBxNFCDJ9BQS04SLjjODOFWfJZEpLd/LXckTxMJsTJFBuSwIpKdXsevEpifkifnK1QPraGtlclI=@lists.infradead.org
X-Gm-Message-State: AFq9FYLSGScEK3qZPISuENrDMHRXHTFvqoAAUVR4+5z9J5wsjR74wp0v
	1F+IqsWOsb7BY4LVGGz6BBjw1roirKEJK4nidennzdDXFq4frOmiddWGjzu/3hQZJq5dfGPC3vg
	jgIlmEPbR4BbrYkuhfXjJwz5/XV6aAutDZkz8zDQzBFXsfH0v7wHMUkH3pVThgAyCtNn6Y9Pg
X-Gm-Gg: AYBFou2BkK1HXbA7ZwMp6JTC9Kuv042WHXJBzpLNrqDhryi32DU+obywwNiEQxxfOK+
	3QNpnl4v793Qn0lC4ucW5Qr88CFVCPwrrRkajQDyPAg/jGAjQ1i1nXSMe1IJDJ761qiJrUNXl1v
	oWEJxe3KIcz+ImvmNyANnnCZC8nL3g9mkipYhpB+nySoFaqMa6rsEy1aivgBl4qgacfK04QxOOy
	m+8X3FIqucH0ztmK2aKRV7wNmXtnXZqqbx9TnwJlE2jCbd6Gs9YGyaCpaDab4Ce/SbZRv5cJhXs
	iT7mRAPfVwSTkqSPbz3tOBQXK86OVrqpDHVCWc0MhVwE3gB7WuIL/9J/PuaMvjFlbKYPWYokamO
	rd3rTfriUXNHxiCk+5Z38qCmtRpDWxxF045MioMG0YD5MFBOxbtKCxg==
X-Received: by 2002:a05:7022:258f:b0:172:c87c:2c46 with SMTP id a92af1059eb24-1a6cc34d4a9mr190079c88.9.1793127251304;
        Tue, 27 Oct 2026 11:54:11 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:172:c87c:2c46 with SMTP id a92af1059eb24-1a6cc34d4a9mr190046c88.9.1793127250560;
        Tue, 27 Oct 2026 11:54:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm8989983eec.14.2026.10.27.11.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:54:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20251219173217.768713-2-u.kleine-koenig@baylibre.com>
References: <20251219173217.768713-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2] wifi: ath10k: sdio: Use pm_sleep_ptr instead of
 #ifdef CONFIG_PM_SLEEP
Message-Id: <179312724971.435197.4267734363881376863.b4-ty@b4>
Date: Tue, 27 Oct 2026 11:54:09 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0f354 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RqDgkBQ7Q9aaOx4vuq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: Cv3-zbSrbYuCd0A8eA-ehKHJl7dLOQCf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX/VUV7nZKfmH3
 OfYtc61j7WICkPRHvQU6muVvzwSH5CKZi+YOuPpZ3NDKY7VMznfS51/5i96s9wec6gbzmiIJn7h
 HmHObRskPMs/8qEfcfEXKpgFDGw2Kc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX6zoWvdUczvbj
 fk16S11wjUuE/uKsMsJVWt4WTR+S4Sn36x7uyeFAE8DRx6fRS8S/KBeRgLRypzHka3eVLFUITgF
 tDlCaintINHPzM2gsRC5RqK9R6zA5f7ENtfMrrx/USEsjOieDiPudGISvuRXcKM6PXxdw18eIuR
 eHGXn2drSr/rSFMYCJnYWlRh6Gkng/chDx/WK22v2tiPig31EVQQvfUetsO4VFEuN2X+I5zOwbM
 XJXxnMw3ms2+YKj/jmvAinoxVCKuAaJQgxUZkvnOCMKyUbxQY4yA4qq3D1Oby3O/T3sgGxQkb5L
 i/4nxfLDE1sNwdZknEn1H61nYt+eRLTsOk/sqvVmbqNQYkyA7KvC4FWSU0Ux76XGQm30StcZpt3
 Ofz42ddHz21gUSJ3fgqX1mYubJMrLnFRYO0bLEtCZ76H216gxNOlO552R4ZZMOKzQNnZecY49RF
 bAqXmgfnl7biVmPutzA==
X-Proofpoint-ORIG-GUID: Cv3-zbSrbYuCd0A8eA-ehKHJl7dLOQCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_115413_870871_5EE9FC1A 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 19 Dec 2025 18:32:18 +0100, Uwe Kleine-König wrote:
> This increases build coverage and removes an ugly #ifdef block.
> 
> To prevent "defined but not used" warnings use
> DEFINE_SIMPLE_DEV_PM_OPS() instead of the deprecated
> SIMPLE_DEV_PM_OPS().
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: sdio: Use pm_sleep_ptr instead of #ifdef CONFIG_PM_SLEEP
      commit: 48166d60f0c7f874196a5a02d9b13f2f07193f7c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


