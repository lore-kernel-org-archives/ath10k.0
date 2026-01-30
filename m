Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F091E6BF11
	for <ath10k@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvR+veMNXUN9kD5s1VOKjCZx6VF0YVbXKpl5oiQlJqU=; b=NU0Z/9dOoXLjkftaQO7fBsUSnm
	NNIFaTQ5/w16MfrQfSaF6E46ykr99FnzIEr27NuFUmslfGOuzahT0ZCA9YcloOd2SZJ7z9RpdTCmL
	AP7ZYx/M4OAWu7JoZAuVyBCatPa7U15yajP7ZlyQed4hqwJjYU3U3Lc/Lxz0bYRreMqrXNXRnhp5t
	v8MNmrIknl9OfUnSyFapeQ2BoPwQlKYsiC6/00rGXONJS4bFb3hchQCCTYiF/slrdZHPDS7hQ9gBu
	WVnZawwpaQze8biBuw2e3BmoChKl/h7yeiiYImNIM5Liq7yJv/0ECRwKV10MGTZV4+O5j3xId5gHE
	/OZfpVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDl-00000001cs1-2WUb;
	Fri, 30 Jan 2026 15:15:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDj-00000001cqv-17Qs
	for ath10k@lists.infradead.org;
	Fri, 30 Jan 2026 15:15:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UB4eLn485896
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvR+veMNXUN9kD5s1VOKjCZx6VF0YVbXKpl5oiQlJqU=; b=XEnPMAAhFkGB9oau
	aRnjV3x10vn2TpqZ7rJHykFaWXzSDf+1h6QZfeFSbVhZiVwbdAnr95f2NGlX9rpm
	8rUVMU+vFqYKyOK35fCBIwgu+dm+NWyoxuNEFbHfca14i9bXMS04Mabef8dD89sk
	4qYJ3f5d8Bf65KIIgUf5lAh5/HqBpxGr8Me0cDVBUfPIj3UhgyRUsFb98ZkdoXap
	sXr2Lk+T/APvmbFGIofq3JNMLFW7siUJnr+9gc0Y+zgENee2UsfRrVtsSLXaS3Ci
	TlZv7NJwUG5HWyrYIV+c4CnzYHdsRsPf/tyQknP4Se+BL3i0zcI8eD+4SwLKp/8m
	hEdMJg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtnjkwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b71041d135so2244155eec.1
        for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786137; x=1770390937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvR+veMNXUN9kD5s1VOKjCZx6VF0YVbXKpl5oiQlJqU=;
        b=M82CSP+//M0gSFY7A009x1EX+05rl85UpcSOxbuYo4HWggN9YCimgIenADRH8aOWnC
         5j155Kh5lKnZENRSgpfkq87lkmT1zIHjue1RN6mylA/nuTMxTDu8kSKuRXgQU6aSBEsn
         iPHEcX3R8GltIEP7trW+0B8E2Z7pGx+Rmh0LrHXF8C3QtUD7ir6/vONbYgKMapOvr/NZ
         P4zENljy2IjePtzbMEJD9FVQoh1oIKZlfiDeUwvugpllnTqUPLxXYMUiMOBGvDLC201S
         scduk1qycoOsbMn5Bs3U27alwi35qNEXUltvDif4hcPeg1Vim1vIdHrlBtJNWeTvNqhO
         DXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786137; x=1770390937;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AvR+veMNXUN9kD5s1VOKjCZx6VF0YVbXKpl5oiQlJqU=;
        b=e6+eZghuuvvKHDd9MpH4mESxuP+iNwfUYHoymRlNIJwUb+OrJCrQ914pyNr2cC7YW1
         krkCBdslvQNMyIw+0CGe4ntjM7LUUIXOKw7qwq5Yp6VKnSBgmpB5lITJ48b3jYzbbpee
         1wfiQjP782Kj+tMXOHEwKv38NoFF4Pv6xM/pD5a1Me4P5t3i25gbu5pM5/jVUDDAs7V0
         cKal9QB/10kMINZCEHPpUoSIaMT/IZaJ1GS2sIofeREyRYNnbzMd+3M6wiLAGwihJhZV
         KSWgbBH+P77b6sUtp7rxiYaJjdGRCtdBrlQnMgUSPFbEhwY1kmv101C+ySAWraxjnrkS
         Ex+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9Nlhwy22e91CB9VssfwYXPrbGpaJKXI41RpQXi0oT/gk7w9v9UK/bUiJ9HuiOBzGZeMm6d0s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHkMBUeHSlgunXkBExctYbKCkb3cLlVFht5/3Vinj81H5PHUma
	IMG2eslA8ZvX0dMDNoXAF5QWeyGHVkAdMadPWx/G0HhRoh4CC+0Hcw9/4Yc1GeEF9vUjypr3ifp
	KG0L4VWtyh9Spr8W1eDLQ5ne278zFriv1PzOlYuAlXelkk6Bo5YzSaIGoMeDKBGjJ
X-Gm-Gg: AZuq6aLBCPmL3KiwGE7K0vOo3KAccpu06wtovhgQFxVJD42y24ru3CHIIngMZvWd8CT
	QA3+IJd2A2+vznLbkpKQ3rUKN+t6EJockNnXeDke0aE9e5XAamb93oG1Q3iL6S5x8zt55RBklWt
	YHPO/tNioVJj2Y5JkRge9zXTKcowHoh2ag9Wkf9KwFMt8laaR0fjkfhAr/Z24PUgUmRhPadmRsY
	VgcYAx7gaP24oP66unJetXsgRj3Z1lkB/rZZc9SgYXIa0HrcWRawID/ovAcZzVuqhSiuaOZwlpH
	5bAv2dS7lz+zHKNqopKftED1gAeBgApH0TZA/QLEIdaJ4PAfNlfDVNZcrwLDuudyMhrfu+m5DLk
	LxotuRXdC9jSIrF9xwSzUpAVUsAFyavS7+6/N5s49ozXDB9GsQq2YCJDAyQ8nQdUe
X-Received: by 2002:a05:7022:1285:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-125c19cd9fcmr1148392c88.12.1769786137208;
        Fri, 30 Jan 2026 07:15:37 -0800 (PST)
X-Received: by 2002:a05:7022:1285:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-125c19cd9fcmr1148376c88.12.1769786136559;
        Fri, 30 Jan 2026 07:15:36 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm10252849c88.7.2026.01.30.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:15:36 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260123175611.767731-1-n7l8m4@u.northwestern.edu>
References: <20260123175611.767731-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH v2] wifi: ath10k: fix lock protection in
 ath10k_wmi_event_peer_sta_ps_state_chg()
Message-Id: <176978613592.3951544.9728416314683408699.b4-ty@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 07:15:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: yNb4OmswwYhb4RbnM9gaXuHmUgV2xiN1
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697ccb1a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ng9WqdB7omV95QdvlpsA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: yNb4OmswwYhb4RbnM9gaXuHmUgV2xiN1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfX6aMQ+klXlXrL
 Rp93MOIroP78XQk/xgoIn8Se4QZnccPRiJiN3PWI27t+eooKMMmpYYyJaJ+AZpB867Pxy3KyrgC
 /MOTtzQaDNZKs9Zcosl5HA26pqq/8bzf+v+mczcwJet7OOjSYOqwE8ou1VE/+yqLxbFEm1Hp2p4
 a7B9i4e75avE7WfMVbtBUhOU2kspRHYXWQ+39EaZpWxIU2kh3bpFodDNuiWXac4F0M6zvm2mgev
 4dvrGjbItSZQ9ge3rlBrMFo8oemaHTHUXtVFpcLicvVKXrwWBoxrZUHp84te9bnwQc4NFmtUErQ
 hGAAlqUTvKY7X64BLju0m5dyjrWruwYSX7hXbu1sXReWD8kJd6kuArrLTlOpHgiGfliRbtkMDTb
 667P7XHeOV67eKD7iLPpV0YcyfsW9Xe/NQDhSuaKVfrZJmaG3vGn/SdzteeJneXahC7n76j7AMl
 gGMJir8cHWMTPRdYP0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071539_425727_62E27EEE 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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


On Fri, 23 Jan 2026 17:56:11 +0000, Ziyi Guo wrote:
> ath10k_wmi_event_peer_sta_ps_state_chg() uses lockdep_assert_held() to
> assert that ar->data_lock should be held by the caller, but neither
> ath10k_wmi_10_2_op_rx() nor ath10k_wmi_10_4_op_rx() acquire this lock
> before calling this function.
> 
> The field arsta->peer_ps_state is documented as protected by
> ar->data_lock in core.h, and other accessors (ath10k_peer_ps_state_disable,
> ath10k_dbg_sta_read_peer_ps_state) properly acquire this lock.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
      commit: 820ba7dd6859ef8b1eaf6014897e7aa4756fc65d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


