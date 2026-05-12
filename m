Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45F1CD4F25
	for <ath10k@archiver.kernel.org>; Tue, 12 May 2026 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVIPrR0dky89V+VLYJhc151VZ75vhVXCOk5HK0StCLQ=; b=DjeZKOlaY331+RWPCoUZMJ2LfV
	GBBKc1whivhJTFgT9Cjye5xhro5nUOBFSJKcLsLWwIHjF6ubhZmux1KGwJTxjIeiP3zfa+Yml0TIM
	AeYPwgsGrCy8oKjfj4T/xeLOMzpwteYmr4bgNOx/Vd+nS69a1I5upHwUtg8sZSEOd9NSE+XTmo4Lz
	fyol+uShNqmwwTWezZBpABqapapXN3ogFNMGrWHJwbSp/2w3ENeZQW/jAIR7WfC97PKTP1dfIqqHF
	4aE0fBbXtGX0BMflKZgZlTfZ+Xr0cPEQWvWnVzAWPOfTbG7j+EltXxb1U+YvljWbMwLNBSmtiJZhm
	mFH0AuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMo6S-0000000H287-2juZ;
	Tue, 12 May 2026 14:28:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMo6Q-0000000H26O-2Iwb
	for ath10k@lists.infradead.org;
	Tue, 12 May 2026 14:28:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5MXR591824
	for <ath10k@lists.infradead.org>; Tue, 12 May 2026 14:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BVIPrR0dky89V+VLYJhc15
	1VZ75vhVXCOk5HK0StCLQ=; b=UtpwTOfiZJjZXE6+Dqj0PcunZYS7Nt7qzPbzsC
	FA9jCcu1pE5sboc/6GQf+IIF3wtMVfNl3qXuMYreRQDwdmvLs8zxswZN9iqmMYDC
	IabEJ4RHKSWkxEg0zLfJ2bM8C3Y5131i9TP1lP4/EM1M+S76Kv8IC3HYY2YT/Lck
	ZXWbqKjTRCXoOkYRz+N6ZZYu0zvDbI9NZHZmQb4riT5dmyN2ET55TUXZ9gFNV23o
	t+iw1znWZEBYmBE5hVPvDZ9x6mBHm4nMNCnToeiyMh9ooG20UDW7RNr+eE7BQE6K
	6Ra3KnrQ38sTKzARYZqwVmspMw+F+6MsqV5J6w3UgobruGCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319rtmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 12 May 2026 14:28:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef37c3f773so6698260eec.1
        for <ath10k@lists.infradead.org>; Tue, 12 May 2026 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778596132; x=1779200932; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVIPrR0dky89V+VLYJhc151VZ75vhVXCOk5HK0StCLQ=;
        b=fOM6EIqY1H+UxkzVDOqldf2fxXjujj5FctOeodjoTaZgOAG4vpkoH2/roYEJmgAGd+
         TvkF3tw50BKhc7OPRVW7GsY1Vh2I/yBEL5JrefnnTTQ16OQFEMuEVEmc8+r1kKSgCo91
         Eo/19jhq63sXKTG1Duc8cethqKhNagBHKqOrsP6+UJHRsBLeLTV9JaFZLmwO/c+2dEdd
         eXlPoRYVpBqJWt9ZT+L6bSbQDVCRKrsSTUcse3OvgkEWqYstIW8jsI+Wm0mRrqKxj9/B
         QXEMND84IIpQdtWpVByJDT/TdP4iXKRLkyDfsGtF9Kt0ufgnFyeMC/4q0geecZus5U62
         9iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596132; x=1779200932;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVIPrR0dky89V+VLYJhc151VZ75vhVXCOk5HK0StCLQ=;
        b=bSj+Rf9c1Tvrt7HzBFYhSv8We7uBsaDBaamrJYnaWcRrnS26Memm5SpDMjVABEWFtC
         FxXFku5TGwnhDXEr/bYpENbPmsYw9GJDV0Gf619RLQBXmlbARVtN67D48F//gbFSMIWu
         NL979LNqYZJNkyCjEDMBQsqCXUNlONSqwGoFKKTFr9CBcFZNF0+2UERgiTcEmSb/cTUy
         ziWfVQNeGzJ1rw7/Tgn4S2JYNMxQA2u3K/S8bj3hwfyUZfGmv50bQ/XQ8QGh84/U80HJ
         GzEQYzy3GuM3MSOrTK9WuE/iSQJjS+/VMa21QSgT7Fecd2TB743HdftOCUbKqcQV8Ae3
         k9WQ==
X-Gm-Message-State: AOJu0YzIrvCLq089WijF/BYxyJmBRLWpj+zdvjH1BGXJ3puRvFOJ3nIR
	veW2KFfz6NOV5g/l3RXZMWm5xDBfEM/C/PtM8gRKhEjFSndAB1sIyu+rsqDxLdy8rbrX8JolIjE
	4uo8kQpkygP6AMnkTlmvXs1IVHp42z5DaLLmNX44voJ2GLy5tURitsnNiiNH88eismVJYVGA1
X-Gm-Gg: Acq92OGFECTxOHX6gCmYASwTk2N6rAV9AVtPapfjhiOPtQP22jh7mBrW04Ii3XFO+py
	4bs87JeDpOnYQ9JtMf6necxhaqS1f+SmMFQOe5y7nj189x0aUUMOIE6O4n1lFmap4JN2YjxZUA9
	hi8w74Rg0go0SX0owJ8vyBkBjXfkIedNlgMh6t9OYu3AIizP7MGJWk5gFkMNN382IkqSFgi7TE1
	Ih22tE7diCB8krO7+FymCT9qulseoHE2bc6hkcLIEW74ziu6Gvwuk4ybSEEGKc5NgTTowKh7qCG
	nluok2uNPAHmVNlgEeBHPk6tKoGVRBtPOhiQBrsAVDW9824DxiRmRAC6tREPadLFPKj7A+S38nw
	xlmCrrFy0igsWrCtynXlVreSmAKO7quWF06w3CZE6xWzyoYiy2i1UXvLGHg==
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr1711475eec.13.1778596132186;
        Tue, 12 May 2026 07:28:52 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr1711447eec.13.1778596131568;
        Tue, 12 May 2026 07:28:51 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8884752a9sm17776009eec.16.2026.05.12.07.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 07:28:51 -0700 (PDT)
Message-ID: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
Date: Tue, 12 May 2026 07:28:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260512
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1MSBTYWx0ZWRfXxVk85TIgrp/u
 QEw16BtBMQ9QY5ooENmOEMmjsnF3rs2XGuWczcVWqncOytKxS23v9yDlJTr3zR3047Egchu80NZ
 ouJOp+jbw1vaWRUIcHFuhxbTJd+1QFrdB2JaUk4M4uK4MCnRWDW/SIDP/eUBGQA89mTEfEnYi/D
 VZeNlVAgT5rBQEor3XWW/qEFohmEAINABSu0PvkATiyM6CrMtOcY7wZvaGTMlzmxaYFHzun0fGA
 Y1fdsX6ZLwx9GnWWG6z03VTsC3Wy4jFrN6+u5bcza88e6tyOOjmusJDd7UD2gmJ8Xri5bYB047M
 gV9iyrlBsmUDdvcE1ULA4/utdSjIrrDnUZempR8bPzpwtL6WXQ2mNrUr/dRL+z1OFK+0tjaDM7W
 rV/MVH7SNO8fGE0mwlbDM0HsHkU1+lxak6oosCD5FAO+pGTb2eHMFRYp4QRIifQn8h8hY2onZqk
 lxvhmrMTkmS0Avqkg7g==
X-Proofpoint-GUID: y4ERevG3sFPlyd5JO_Di3IEJRZDtwF2J
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a033925 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=HDnrh3WxrgwM_mXiSj8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: y4ERevG3sFPlyd5JO_Di3IEJRZDtwF2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_072854_705855_657FDF42 
X-CRM114-Status: UNSURE (   7.62  )
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

The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d16e1:

  wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-05-08 09:20:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260512

for you to fetch changes up to 54a5b38e4396530e5b2f12b54d3844e860ab6784:

  wifi: ath10k: skip WMI and beacon transmission when device is wedged (2026-05-12 07:00:00 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc5

In ath10k, avoid sending any commands to firmware when it is wedged.
In ath11k, fix WMI buffer leaks on error conditions.

----------------------------------------------------------------
Kang Yang (1):
      wifi: ath10k: skip WMI and beacon transmission when device is wedged

Nicolas Escande (3):
      wifi: ath11k: fix error path leaks in some WMI WOW calls
      wifi: ath11k: fix error path leaks in some WMI calls
      wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()

 drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
 drivers/net/wireless/ath/ath11k/testmode.c |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++++++++-----
 3 files changed, 120 insertions(+), 27 deletions(-)

