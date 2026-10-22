Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B54E606A319
	for <ath10k@archiver.kernel.org>; Thu, 22 Oct 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AEoNR7P8;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoNqwJo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVzmHwaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=; b=AEoNR7P8jsLp8/+gIp67R5zS16
	R3RfwC+kZfH/4nuOQTFYoq35EvonzVe2c67wqL45Ob0vF3ojFy/fblMthVXxqFkh+rSvPomRREK76
	/jPQPpFOJf/WV2zpdvTKLRAMaWLE5manmQEhkC0bl3hTz3AnDApCak0J/H3Art9DLCuPM/LgOXrpC
	KsEp7akW6n/0WYIu8Js7w1Qgw/Gy34WRrju21hi94sdkFmrC4jQRHgv487k8zu4Bb/LBXvYdieq4p
	rnw9wMEIcmj8dmbW2Wv1MAp9rTZ+zALLVdzE6MKyohXTCa9S+qjZD7e5j7OijXqmZTNLHE+ql4EAO
	RAqORGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy7v-0000000Empf-1gyY;
	Thu, 22 Oct 2026 19:06:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy7s-0000000Emod-2egD
	for ath10k@lists.infradead.org;
	Thu, 22 Oct 2026 19:06:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHtWaC3078114
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 19:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WP1RCtA53459OEDtUvLHcE9m
	HWBQjuh3IU+rXf+WXSk=; b=BIoNqwJo+9cHw/AmG/yoh2Nuki7TD+lTLAXEY8DU
	yqVhor774k3lFGuWtN2mJZkBFd1iDm09qQlX3EFldoIGWgUvY7vBvCXtLil2PWn5
	Wjk5LYrhD+59pwSlKUNqRz5FF1UPTbLZuYJVEL7RrZjPEisHOZW8TY2ems8ZxAVc
	Z9YkyY7YQxybQG1DUqAViNSM9Nb8dUMid2Z5p3LSKZmMZ+/cqqLkXEdcKvYl+kcf
	egrlF4OqlYtMf0XUl2CkZ6aSmMG8Tz5/iKLjn5ZXm2/7mxwn0cznuuWJDkeQy1sT
	Pj55wKPqvU432hIrIXn9ZZj+onlLGXmXzUT+mQd/PM2EYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93an41c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 19:06:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso22493485a.1
        for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792696015; x=1793300815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=dVzmHwaT3mMV+ufp/Zn1syTvOYfM7O4tlGiYbbyegl/EusyX16PRek7rQQWH5qO9oq
         vKMzOKNCXMqRUv536tMri/67MUw+QWdK0iYRFVpgKxBvJpMyrXR3xKO/1wSgW0qR1/hp
         uTCLCvXD2SB6/wf83tPTjDKsL0W+79LN/nl72vuByAVBh+dv1+H70ghxKUs5Lpl8vxnF
         9KC2dUijpFCkFlPiNyAMKTrBm8s1G9Uh2gSi/TZeli19Bv7D8VVqUPTByjEOmWckP1aT
         tS6vptXQFFvQHdv7fyIGR9c+BzkmsOFZTzzXuibGyrOXO1I5jr8PBHtmwejBr/hT0oFV
         GPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696015; x=1793300815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=jGwu3Pj4a2LygUNGUDiiBICuYjgzypzkav2HUazKpdnElDRR0cFVQWEWYHOhrqltvN
         lnFnsaQNbNzNdepepN/8keMgPUqZv0g7MBBcAsRQsqPIh4WLUyH2m9BxSzGJGLgLVnFK
         w7eMoXB4ys9Q41eXmyfTWGMsDorq8UIFHQUP3X2ly9W5syPhlO252wKPGHaWH8TB6QAN
         kMSp+ZqE//YCjGq8JM4QAZtbwwJN0C+R3WdeCQYeFzdS54B3oa+qPBH8CV21AHkOO2VG
         l6GdavXhotAyLDpG1AfDAFKKSb+66DJSurEMHl9cyoo8d8ItrLizZIPlN6yEGt58tbRY
         Mt5A==
X-Forwarded-Encrypted: i=1; AKwUvBwIsXeOI1fVFsQ6jCoD3ld/KJy6icogSYU28LvqIlBEOGlV8fvoIo07kAsS1pKF9KavPUtfSj4=@lists.infradead.org
X-Gm-Message-State: AFq9FYL69l5c/aID0bptLulxA92SOFtOM3PR0rNQfQ+BfasE40DJ6xqs
	rpCyGxEmx/sRGMDZjoQRSxP1CMie93F7udOD2cQInBQh0l3Mooo6WCBTnCp7yQ7RFXeM1olBZv5
	IOqAsL8BcQejLgAXBpZ7JI9K38FfgfcuDatkPGnX/pmRrhcy4FSO6mE2+RU8ZU5LW
X-Gm-Gg: AYBFou2L4m19h4K2ayDvm4YCIHk0qw62R3hp1L2A9X0iSsVh1oalG2UOkFJSgHr5RBg
	0wJUuNwfbNURqVUoUxvn2ZulIrQ4R5nBiKNjXkM4pFJqO7lZiIOeeSrib8cl4kKPG5ZyagEkZk3
	5StKs6HMywx7rzZ/u+Da+sQPrObePO45wkHvuCAVJHzuzrMLtwBB6yNxNcP1jR0cGmRD3KzY0Lp
	JfDiludg+VpsCd/z3o8kuldlt+wLdFIuCTtM3v2GLQaiNaYmoZNYxdB4k1Q0QtN9aG+pTFNKiRC
	P7PsCvuldQuuxnhWFrGn8V1K19D6Ircbi0YTUenfv9CEY2wYC8HenG/q1Vk3eoeMQnJ58jN+EYF
	LDjR+fvzmvzgOOHtFsJavFAgiPtLS7grGF0q8NvF8ZkjeprHvys6sI6lLDEakqnkgUNV6q+04Os
	CeMajgswEn5vxF
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64323185a.39.1792696014912;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64317785a.39.1792696014437;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a31acsm14215e87.81.2026.10.22.12.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:06:53 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261022
Message-ID: <vicvgdgj3hc72mj7q2bp6mdskwajufdexr3gz63v2ixrmua36b@ojvj3wo2j4q4>
References: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfXy8UC2tJTd5m2
 pAKrwmCoq8S9LDiwFz/+PfeC+f4IdgidFkk401quy+RtE8toLUMUlkA4hrVXcrGfOERTF4QVC9B
 l9ytwiAuyc5SKzOWTgPbO0kQiitA/mbwG0O+NOpAyzp1EA5PdXb8/qXdiUYN2cu5zHx4mhCJpr5
 27s5Ufz6RU3o+hFUejqHgANF0pmSXHPfDQpFSY8IzAfduuNplEhR0DaZP1ateOy5c7x/4uG6G7U
 DZcecIVUbLYUQd5q4HjBBYkw7Blv7jljizmcj5hlr26NRs6aVCky7p9GMnudzgavttzfJj062NV
 AU8gmWjuXGoSSbVX3dX989DcZHYhexSZmxpALLVMQIn+yfHyCOSVLddEdGoPGitGGQUGOXANRvP
 yX0rhuxffkrTbKVJJr6n5Pt3MoZKYPeLPEC3dLu5HANIULq2P9Z5QCnYL5vV+PdK8emqZTRrTT0
 cWL12cqTwf7IeI2fjxA==
X-Proofpoint-GUID: -DkMdmYPTbDoYexV9AXNUoNKEOPWMbjK
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada5ecf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=u3i0YCyx4Cyti68HAGEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -DkMdmYPTbDoYexV9AXNUoNKEOPWMbjK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX8ZJeVm+fhT/S
 meLw6mMk8K+HKoy9pGr50eNXaCZS/yDOCoaUdBy/yYy5E5kfYsFRI8CAST8tQ0WfyhYqL/hY3Cz
 PDJvIWt/hhlRb7wydl84RSPNnWh/2oA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_120656_752838_31DD6E96 
X-CRM114-Status: GOOD (  13.44  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:50:15AM -0700, Jeff Johnson wrote:
> Hi,
> Here's an updated pull request for ath10k, ath11k and ath12k firmware.
> This supersedes the request for ath-20261021.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1319


-- 
With best wishes
Dmitry

