Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10588C61DC2
	for <ath10k@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJXQT0c6OYFN2aHcq1lc8qaGVj0md3a70HDIO/2Fy+0=; b=oRYuWhdq8t2sr1rfKdn29BEvoJ
	jrzK713nkXj9tDR9Hr7RTl6j8CK2Z+Zui9J6ImaEkl8i83JPj+HUaHScMECEvcIt1HBH+99R7zIbX
	PSlpraf5OplAsyQJxxovU7F7Vebosyy9/te7OxsL29Gl/VX5ia9cEyblcWNlpGZQaBZUZ9iINpgFD
	RyrF+AQeh8v+V+o65hNBQBQ0dRi6Q6BHur3fkJWfnI44wdbJf+2uJ+md1EvteGNYIfHQsdQwmuAjR
	C0AB4SxajKkEL51mNTjfFeDyATBYUqogxDC/lLK0+XCrHunqVwAWiYCfMHsILKtmLLfpbylGjx0cv
	0Pe6Hpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8hP-000000023Qi-0aA4;
	Wed, 26 Aug 2026 08:09:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8hM-000000023QM-0y4r
	for ath10k@lists.infradead.org;
	Wed, 26 Aug 2026 08:09:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RnD4683749
	for <ath10k@lists.infradead.org>; Wed, 26 Aug 2026 08:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJXQT0c6OYFN2aHcq1lc8qaGVj0md3a70HDIO/2Fy+0=; b=YuQ1hN9NkB+j/f2K
	jM4IdS4G+UxnMIRU84VU68/00IK/Or+kzo4uaBrPFYs+NqjhdZ3MONsOrl1mXxAV
	Dwj/k1yXeXte7091lspDKCgublXsw+jOBMltcaZFLiUxA+xJ9cghEBkD6925xiAw
	N01RVw4hEZlasO1juIDloEqq5SAL1aC0P2DqultRwCzLNHDq0UH+IKYpsxjfgT2L
	BHGYYkD58l2QL0GpcEDWFPz0giEt7t4wAXs23Ej/tn6kfPB2Y7Ngp+Volbb1PHl4
	bI0WpaxoBUjUO4+HrOIgYSZKTC9LERCexEGDfXVwjKm4JelbNEFSrSYxdjkaFRzM
	HmuAjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxjv9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 26 Aug 2026 08:09:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so16037061cf.1
        for <ath10k@lists.infradead.org>; Wed, 26 Aug 2026 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787731766; x=1788336566; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJXQT0c6OYFN2aHcq1lc8qaGVj0md3a70HDIO/2Fy+0=;
        b=MFp91CZZRR1Hp5l0TmovjXTV+6tHTIJnPg4q4ratPsgh4N86dDnnyzqB5N59bnHm3U
         3lCVfIuX3vUI1P+GuWt0zyC4fCDJISob6mPuzxqHs6i05Dbaq8XXdGnjDHRehDjwJdF9
         4i/+ezJol6K5uNZfNLwRzxKo/eCMtk3EqPryEvsq1gQSc0ReaKoAdMdy0xle59n5vcIK
         HsZwSza+k3DfzVvVJIItlyTYq+6L9vpgoigmhE6d9bqoP2YYI8/npbnRfFzbmPWoHx1z
         aRA/4v2mjr6RaAsNR4M5IW9GEf2nAttF/lRSZH05lF3CMzSoOTnnGgd5Av8SILZQkbQV
         MPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731766; x=1788336566;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJXQT0c6OYFN2aHcq1lc8qaGVj0md3a70HDIO/2Fy+0=;
        b=Xq9HVfK9oVp4DSEoFWY6NzZKr947MQ8+20iMzoStVcVsUs2SvVaKltkbAEnnnfW3we
         fKotjjxb9xpFagQefM4zZZlI6d0RpfTBI+y5HQvXjUj+2RYsgEjZnH27HZpCpiurrr5P
         AYO54QvSVRRSIjqpPIz0hx8GraA/hJXinSf6jep7OiTR8r4KGwPHuFaPQpCNG4mxc5Nq
         bIjnonbU5YiJMIMbA6BJ0cdeD8s1lpyJtV/LbzonmY6WuRiVQy2FjyUi59BR26WlaoVF
         jcuVcBPAeeTrjaVML3qn+IwS4rPL7bxrW9yhZdRNJp4FO3OQUBU9IFdHsnaUZcj/FpkX
         R9Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+HC51qzZo/IyblOi/3Ltgqn7n7PbS8rqTyXItBFrU7BnsrUQnWsh4OeKPvxu2R7ZqrYVPxTk=@lists.infradead.org
X-Gm-Message-State: AFuF++nqKMDmfTj+NJPWwOboe/HeXFOsqmX+c4gQSm7VVcuudFMbgsfA
	WyfFcZd9/w+LD8NgZKLDiesqqeo/T97cUS3Z/E13N6zv3vwF8tGksrb4D8jeQApCyRzNfruRz7T
	z4q78OEf8XxWxCkXltXxMl8XFZhwlZOofdyjoncgBrVCq9AbZUghn2AqJC2fVW7r1
X-Gm-Gg: AR+sD13RJKeBjLo+qQ1bazBIBXB8LZNhd96QdfG3Y0e2Oc5DThW4ToTq8SEgnjOybXL
	ewvZ12t01I9kon10RmvsqkrQ02G7rLVjXfS6Oy2R4PYnYszj6xK6xHenf4m0FlZs3bBdF0ogW5S
	kuX15tXRmgGXlM/WoSwWF+toFEJ1lO7LotZ/ntY4uHji1bSEkLOnfxD10Iv6gG2lZyXXqi60kz3
	9kA/qHeA5UwszSB6XNgGWpk8rda8J/KYkQVe83pq7izfjr14nFobTS1vb0BG/deqck9WaV5jpvZ
	QYixKDwjQW7YirWy9YzNslUOoTJFsGf7+UozWfPEAko51hbM3r6RET8kYetMSU27OPy9ighBzeF
	lL9cE+W6cfoR1NZIZwC+WoadvRhMg
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr116721451cf.1.1787731766307;
        Wed, 26 Aug 2026 01:09:26 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr116721221cf.1.1787731765865;
        Wed, 26 Aug 2026 01:09:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc96bff9sm18773245e9.5.2026.08.26.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:09:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, imagination@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pci@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v3] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
Date: Wed, 26 Aug 2026 10:09:22 +0200
Message-ID: <178773176015.26343.5524450275043262993.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-pwrseq-vote-rename-v3-1-44e60b8be053@oss.qualcomm.com>
References: <20260731-pwrseq-vote-rename-v3-1-44e60b8be053@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e9f37 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_EivlD1RsPJwtJxW0JgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Jr87uhnDnyFxaCgP16EH3QYPNmpfrDgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX49jBnX2HNr4F
 Tl7Wx7Lk2w9892KeFm6TqLc4EoEZZ1YMCuLlZLIkdqvZCnjzss9yGBeGwUXRHNjp9gcVLnaPR5D
 JAhXhGJiB/nJm2NwqG6htIhXrOa69371X/719yYUlGWu7zPTzLKCojydc0794VTswffuLVxav3g
 h1M0oku9UXhMP0iionsOmLNWfQEN/2+EBTVVOYUI/oHsZJW1gq47Qw18mJKPl9jZC1yH1eaG8AK
 mqTKdCSyaiMYISIav1jc8+tPsPHHK+w8EHw1CPN2/+cbRwqEFX4h/JFJabuGfzZ9HrAEnMh/bDy
 Xa3nhLuMxG+fzVqbYu1sosj/39haKieClMUAJ6QW8I3THWgiQcV3gJIODSJoxUKOCxcOjEkQcJU
 3SpmeMKfUSHLfaTAuafSXJlRe8kp3VDE0mLfl9J4+fon+TR0R2P7ght4x6lSBMyTFLNJtaZXNh1
 Vq2CvTeDJ6Vn5nx0h9g==
X-Proofpoint-GUID: Jr87uhnDnyFxaCgP16EH3QYPNmpfrDgj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX1JAaU8l9NrxU
 T5dxS07S2SH4xSSF3quufY7uXPVBKobKTQfT2W4HAlroNkTBwWSxSmzEXdvLz506MU4hYFZxsjt
 x2wIE6gleCtJ28fg39dcJjC53StWNrg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_010928_317725_BF607B81 
X-CRM114-Status: GOOD (  12.06  )
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


On Fri, 31 Jul 2026 15:42:18 +0200, Bartosz Golaszewski wrote:
> The way power sequencing works means that a call to pwrseq_power_on()
> does not necessarily result in the pwrseq target being powered-on at
> that time: it may have already been powered on before. Similarly: a call
> to pwrseq_power_off() does not have to result in an actual powering off
> of resources: there may still be other users that requested a power-on
> before.
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
      https://git.kernel.org/brgl/c/d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

