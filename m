Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38225C87FD3
	for <ath10k@archiver.kernel.org>; Wed,  6 Aug 2025 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaPV/AZfNgwCFIWFD6wxN7pO1VLtWRJoYaxtb6nyD8A=; b=EOvbcoPFEUGczSFPqDSNLkYU0s
	jUfkBZd2tHw34ma0ih0oW+hT+dJ1sMPaZq6XW/MujIkSYXDsl7a79NsK0Sl1056GAeoIKnQq7YID9
	uEuI0bwg60e3ByrkZlGAAioNrnsHdYhPywacoAEq0QimQDzRt6C9NXiebYw6MNUmtCHmpx1nDsHU/
	4SMHgafVcexe9DmrjzEBDS1k+2Uor3KFJsz/DOe2l5yp1+ut/Wh4Ohz+LgWj6WlV3Yt39lOQeTAw+
	bG6bkn7pi7QHF8ErzOSg08UgG3gqLY/7+NVU64uypMJqs8F2uj3lAw7WMOtCscPX3cUHa6lY8fOxp
	Mj/mHOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujf84-0000000FRfN-0ds0;
	Wed, 06 Aug 2025 14:28:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujf3d-0000000FRGL-2GMh
	for ath10k@lists.infradead.org;
	Wed, 06 Aug 2025 14:23:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AMhuS017305
	for <ath10k@lists.infradead.org>; Wed, 6 Aug 2025 14:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaPV/AZfNgwCFIWFD6wxN7pO1VLtWRJoYaxtb6nyD8A=; b=Wd6ICaGbjqFSkgZW
	UvGOTFboPSqVVAJyEzmx8AmjApiOBZieY6GyDDQlCKHt4xWblakSCwfuOVXLj+38
	oLue6Lz3tz434yMG8NEcZpNfCM5S4hny88PivQvojrnmaz7r0Gn0J3Qw49qMzjfI
	RH0v7Ns+cjqihP1J/0efGp0EkgUyuFfCkCN3hjBD4XA9/AswFB2mezjBuRFFcYjZ
	PTMUtWlkdpkf3/SaN23UB3VIKzbbU9jPq92Zep6Q0LEe+D8w1v0cYe4/5MSKc4l2
	V7BKyPIKCO0wEYsfgGp7v61Fk3vFC1D6EPtEHcX1bxOGa3b687HLH2i+cJtoi3J4
	IekmAQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c5868jyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 14:23:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b421892319cso4194859a12.1
        for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 07:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754490235; x=1755095035;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uaPV/AZfNgwCFIWFD6wxN7pO1VLtWRJoYaxtb6nyD8A=;
        b=Kh+lhNSY1UOjGY6AhJxNH21SjEVe7HmMBy1edleYC/NX8WAx7eAwpJzolH4JQCSXT0
         OWRCSJMtkp8vC9b2LfbiD/PYef9QU3h4zJUtq0PnfZrRffgNLEKWczimHSGjlwx2C1+I
         q/sVuqFh3e5BnqclluGYPAIdv+gT36V28pE/tSCj5WSZfY8KvtmPjmngEhKhBBkAZz3Q
         XeIbS2hRq6GuIm/7g4YtGGD0eSxMZt/bG9hnpCVw+AlA/o5ug5W5Ui5XlWy8Whd4E1Az
         TZKrdKaCSOTY+gMA9B8oIvUmT+9ZSUhnh2Vq1UJ8Z7/ApDd8NgRnFlrtVUNr0tPE2RCw
         jKsA==
X-Forwarded-Encrypted: i=1; AJvYcCVnDNblvWMnf7WDT+lq7no2W/C3ux3gmnsBHVbF8xFWiFtb8O+iw6gh7FSn2N0bHvwF5mvl16U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoNftOrws2j+zCtnQBBXspFNox5bmX4QnHSsOL9TO17bwWc/Bh
	hrRPrXeKst8rwcm+SIIZsKxC4NSsHv/5EeT2uQMRudhBeOJc2xbDgJyVtbQIE/JcXw652XQDHJx
	dv+qD7tDBzbXHSUXd2Su/z01pmsr1fG+2264+ONQvk8dx1kNXPHqUbiJzK9saA27d
X-Gm-Gg: ASbGncuDqvsfeYRmOCKbIjm5sUox6YKZ287IthEOt8O5orHubWmB+ICYDZkBoGlDDNX
	vgkEF/JK76jUu4myiOwv1mYGRrH0eNaSrJqHHtpxGHlpTsUGp1FBk1C19P+s+1WNRZE0UVbiAku
	L7Bwlo4BrsNwKPzU4DpfdH/NkFbzfvq648sdwUXP/S1YAAeLFYAbXBPGgjdxht88Bzd4Va24ZJk
	0eo17yFXr/1mNr8Qb32nETe1UDzoLH8/DlMA1FSINKuTD+IctU3B+ko86CefuSaRcizhrRoUc5e
	EuMThgIw5wY4r+5X+apGBPxTuevUMltBWJgodNX3kHqIFoxacgMUMNiKH6N3GUzBQQ2Lh7RQVFN
	DtHON9IMuNdcZpJR8vKk=
X-Received: by 2002:a17:902:d4c9:b0:23f:dc56:66e2 with SMTP id d9443c01a7336-242a0b60289mr37054205ad.38.1754490235127;
        Wed, 06 Aug 2025 07:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq/swoMhIdNOjXdIXnOXzyW6K59WDzzzrR4ReGp34jAMiAKMy+WZB/S/0f/j3QY0gpdGOqjw==
X-Received: by 2002:a17:902:d4c9:b0:23f:dc56:66e2 with SMTP id d9443c01a7336-242a0b60289mr37053735ad.38.1754490234627;
        Wed, 06 Aug 2025 07:23:54 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm160476135ad.34.2025.08.06.07.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:23:54 -0700 (PDT)
Message-ID: <29ef8aab-06a3-48e2-a370-86b1b2107143@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 07:23:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] wifi: ath10k: support flush_sta method
To: Zhi-Jun You <hujy652@gmail.com>, jjohnson@kernel.org,
        Remi Pommarel <repk@triplefau.lt>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20250806070005.1429-1-hujy652@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250806070005.1429-1-hujy652@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ytehNcxzCznNdyppC6gS70VIOLK-CFuW
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6893657c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=00e0whw43lWyotVrT1oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ytehNcxzCznNdyppC6gS70VIOLK-CFuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX4vz/kke+az/5
 kuWkD6Ti9OGjJJVon0gKJ5kOWWL0m0VHaKjEiUNQT/7pv3Ub5Dzggggh98Sbj42ct1rt3iA6OnH
 JA/h+/WveDos+mwtcnUK/vrcaA49fuaWjFSuuE7oW2xh/1s8lnaVWWb0+bDwowgh1HgwHe+a5cQ
 Yxy2cTN4UsLpFQ39FJXWu8NwDF5r2yAS/dAv2qJy4n9gfWbUJevTodDUF9Ug/8KVESDY+BzE2gf
 XvAcG+6nflJRTZuQdZtjiftZ2FL/fH7lql3Lyi+ZruetvfmmuefpI+gZO09o4+z0syzOtK4yj7Y
 lCpZmwX5s2/KAyqV23VMwldQfI1FDePCyRFAvt0a/6lTJGt0mvkPithfEIarYzp+yIkeuPUHA/i
 pG6tVx3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_072357_703773_8ABABE9C 
X-CRM114-Status: GOOD (  15.77  )
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

On 8/6/2025 12:00 AM, Zhi-Jun You wrote:
> When a STA is marked as no longer authorized, if the driver doesn't
> implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
> flush hardware queues to avoid sending unencrypted frames.
> 
> This has became a problem for ath10k because ieee80211_flush_queues()
> will stop all traffic and call ath10k_flush, which waits until the
> whole HW queue is empty. In a busy environment this will trigger a
> timeout warning and stalls other STAs.
> 
> Fix this by implementing flush_sta method using WMI command to flush
> frames of a specific STA.
> Flushed frames will be marked as discard in tx complete indication.
> 
> ops->flush_sta will be set to NULL if htt.disable_tx_comp is set to
> true.
> 
> Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00157
> 
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> ---

There is already a patch from Remi pending for this, see:
https://msgid.link/cover.1732293922.git.repk@triplefau.lt

Please see if that series addresses your needs.

First Kalle, and then I, held this back due to lack of internal validation
across supported platforms, but it is actually still on my TODO list:
https://patchwork.kernel.org/project/linux-wireless/list/?series=911851

Let me make one more validation request internally since I know there is at
least one ath10k-based project with active development.

/jeff

