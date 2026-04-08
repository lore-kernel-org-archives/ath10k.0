Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ACE10F9964
	for <ath10k@archiver.kernel.org>; Wed,  8 Apr 2026 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=; b=XxbKC/LvWuIn/iwd0CxCRZWQ2m
	3ef5r7V33WdX2KfitDP3a9KpTUowNvda47IPemtJTP+eC30GiTBgGCv8giEV28js2oPahO5z2k0l8
	K9bDHGDTe5uC4+XQmtUWSeP6Zcx8DhrU69V9vs1m48tYyLB0Xg7Lbfb6jRfEVBAjt2m/WRdyR9PQt
	0hSmDzx9lUBCPJZnUnB0O+CEmglO7A04N63vgZ9nH50yFKvM8Eu+LzrZNtrgikqtovrbBHRp3k3Z1
	uLfH41pizQhWtqwIqajI4s0gEAy0MvBEuQmUTzGbZqcllWbEoI0Ik5jvNLJ/raK0UDZiJ4pDgzPWj
	ND3wzTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtJ-00000009CXI-2v34;
	Wed, 08 Apr 2026 17:40:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtF-00000009CVr-3QXD
	for ath10k@lists.infradead.org;
	Wed, 08 Apr 2026 17:40:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638FrXAv1923825
	for <ath10k@lists.infradead.org>; Wed, 8 Apr 2026 17:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gofqv9WBuYyuN9VxKxGkKG
	wTp+Gy1foUOIiV/v+fJvI=; b=pgCTKpW2pon0Z3JntM2ZX2JLNgSxCciidnvJn+
	wFvMIwNQLvhzjZUo+6YypRjYmu3yx8T9VTT2+Cu43mIyPkip09EwlRR4w7cix9Pa
	IdadODgN5Uo6nFX2CBjv1/LBELqktsPnP8XvA75TTWniXW3Q7nhgL02uajHkoQf3
	c68Jp6xt/lq89qA9Nn8BhuB2aZAwZzFuM4v+G6Qo537gBbr/EvfAf10Dx/Kp9EHR
	3RlzrviX3W76Qrm6z6vx4Z6JIc2Hy+0HdkBcN8vKmTMyYKqMWSgKzkUv9rgNdh1p
	9SX+ZiU627VXLGM991nf35yWWuUKGZsR6IhCVwAPcFOcjDkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28rd4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 17:40:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so146965a91.1
        for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775670032; x=1776274832; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=;
        b=SfrsztqxYVW/j4+WwdCWGAt7Zrr9wKiyYmeyC0SbPFtPnjwJ3S1bZrrIVadfmLWRrp
         pX9Fv5tDWk+tB2T6V6I+Gx7cLYt6dCJ88Afo1AT7btBcT97vvuHdQUYo98VKroFcgiI7
         ZX3MrroTh8VhhpBcSSgFgjAf/xvA7u4tpMM8iV9CHjUa6V6ih31uVVGYq7OJyd+9nOoq
         dKzbuBU/FqXLx/x8XqLOalJ+03FrfG50MNS+37gqYtUzUFxZ2LW9/KHcfQFBj8RG0BNN
         LV4wWA2R1NzQoZ0jJ1/j2zT+rojEpMGB/V26JyRHFfPpCwQDEIl6/soDsVY1fTaozYDQ
         Uj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670032; x=1776274832;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=;
        b=cuDABEdB8Tdcccj+pnxsa3SkHddb1oGfgN29drPYzrNqqBBEiEs/NTjKsgFEAYguZg
         NDsRD4CaLR5TWje1RsxcPInxg2hJC2IpeJ5afc0yLn2UO2pylRFAKZqt/6mkXeoqXEMD
         nW0yV6Y+rwyop8SDxMEw9GqhYEVYrAX71bitjlvKyL2r6/q7I/IHy+CkbRTrVnc7byv7
         hf7UaalsLoTVVg1u5da2mQvj6/Ko6k60rKV+dqtfcbk2Y+NbkBsSZ0C0CfHKX1ZRuIrx
         +9XoL7pEH4J6ZM7c5CL4upeIV9+y8l6nzxr315WV2b6DU+tJ93nvKyG7uLPvbZT3rn0S
         7RRw==
X-Gm-Message-State: AOJu0YzlDpIRPe5xbfIMY7/s1NBe3ik0GeiZPWhTuToGrVpREt31bFJq
	di8FJrRhNz2ghcuJaW7DhEqSs+Tzogj+OCpdI5uwC1kxE1HG3jUjsZs/HkgNg5qa6eAIS4iHuWO
	BHK2hTqZD8ytcUYi7FoV4+VPJFj0Rki0xEXX8Bd60tRkq2TGum0fxTLzd0A8LyFjX4/i9VOPG
X-Gm-Gg: AeBDiet0rL2mTqte38yigJCbCPZVNwiz/djtWfUACw/XYgqEzVCavAuedS4RFrNf9wg
	KKEeuZKqlva+egn/aU464EGQglVxTfitt5U1x0JycLPM0wVBgM3wOUDO21fXYy44WhYb/ZSstIp
	I4WSc/gv6G6iufe+uorzD0Up/N71O48qZ6Tcon0tRhoMeDxGQweLzCCa3uKBJfG9V7QjqOXcQnX
	0c7eJ17oge8MUHCMpXhmQjX2aYR84MPhMJjWAXZSzKDB5HLETEtVELVSRXsO5cPbvY6Zkz/HC82
	UXMYgO46rszZ3gQHA1Frk43jeum5/39IzuBkef/8Q7vIBSMi9FUmoPktJLZ+5ljrKkKCLHikgLQ
	6PNysCIa40Oj3YRQaatJ1mLLYsMRBSXA7m5uFo4HIC0GRM0d+SiE3ECeArw==
X-Received: by 2002:a05:7300:a907:b0:2d1:93b8:bc81 with SMTP id 5a478bee46e88-2d40eecfdb4mr267765eec.31.1775670032049;
        Wed, 08 Apr 2026 10:40:32 -0700 (PDT)
X-Received: by 2002:a05:7300:a907:b0:2d1:93b8:bc81 with SMTP id 5a478bee46e88-2d40eecfdb4mr267742eec.31.1775670031453;
        Wed, 08 Apr 2026 10:40:31 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cef60a435dsm13465207eec.10.2026.04.08.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 10:40:30 -0700 (PDT)
Message-ID: <aa4cecc7-d5fc-41dc-ad36-80f010e5f426@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:40:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: pull-request: ath-next-20260408
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xXQgKxCoD_Y1Wu_VqHdZJrLyg1QIm_o7
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d69311 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=WLBL4ONXHNtVtiLGnawA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2NCBTYWx0ZWRfXxqbQ7fyt3JCd
 Bl1InPmxruppDTWpKz8Bps+ycTTngdWDmIEJF1P2GkNC2vxNzIzUrLpLjqns8S1mMKv1jyEYeHn
 TDfaJhlz7OPFM3IqMIDCNCjeO1NZIoYFD0fRsriEJV4K3Lqo/aYuzZacoYTV8UYt3pdqX7jUPm/
 s3bNKh3Gwjsi5KK2OUcZitn7ZjJp1DE2ALMvKloD3hDhmmR+gO/c+E7ard9QaHHrhyRAltOnA31
 HBp3bMFfMEC+pN5RAAEZ5fJ4ywpHMe7zpBYhFQDt+jzHFKMhOBcSndtZQ0ApBNPx6v0OLYvPrN6
 Shq0js+FY/TyCxGcI1JQy7GBeZu0CfTwTTs453O+OYbaDxsvyk9o2kfSj9ASVIv+27crCX4wZA2
 SE65gQjvq7aCL8WBoa5fZWinCtvdWW+MwkWnzRClD+euV6aIGzvjyy5QeCHxJmUZH54573A0Zc0
 +2Yf8h7tJJmRr2mQngQ==
X-Proofpoint-GUID: xXQgKxCoD_Y1Wu_VqHdZJrLyg1QIm_o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_104033_862273_93CBCD1D 
X-CRM114-Status: UNSURE (   9.73  )
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

This was missing a DT review when I sent my v7.1 PR #3.
Hope to get this in the merge windows since there is an in-flight patch
that would leverage it:
https://lore.kernel.org/all/20260331-judyln-dts-v7-11-87217b15fefb@postmarketos.org/

---

The following changes since commit 8c6d03b7a249ffe85ba2bda09a2a7614c0ff03db:

  crypto: Remove michael_mic from crypto_shash API (2026-04-08 10:11:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260408

for you to fetch changes up to 6a7693873b20680a3c33bae0c9f9cb3185f64ade:

  wifi: ath10k: Add device-tree quirk to skip host cap QMI requests (2026-04-08 10:13:09 -0700)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #4)

Add support for an ath10k device-tree quirk to skip host cap QMI requests.

----------------------------------------------------------------
Amit Pundir (2):
      dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      wifi: ath10k: Add device-tree quirk to skip host cap QMI requests

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
 4 files changed, 25 insertions(+), 3 deletions(-)

