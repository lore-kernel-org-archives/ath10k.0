Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C892F54AC5
	for <ath10k@archiver.kernel.org>; Tue, 24 Mar 2026 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zFfpdhBbsrdk8VoedMBkImKgB4/G1LamNSITgtRYBVw=; b=jshUse4zEyMoTLRrC64tiiUGo7
	erq4fqBF2W4uGR02Swwzxd8j9Z8VoBu5N9XJePclZoWIGAMjIAQtEtF6oHtJUdOmYd0A3Ks/kY8um
	ZdkMAWNxideqQXcf6S1E9toQ0trg6WW2o5FqsJB3AO/Djq6VKnX43n8cQhdr3Gb5PYbzWcAjuQKWS
	xIopQgJhVwspr7yKsDar0VatOK5tGAtNerVxprGeUyLDl/BQDEDXEEocMK4RJfzCWyZjwI3AMgidX
	2iWKGkkkSHd7BlofE9lQ7ms8hWmMzgFnKptYy+24o5PsyCMSMp2vDlD6Ga1w4rb5nYpU04DarV6bL
	NwOX6kkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52i9-00000001df0-3pxw;
	Tue, 24 Mar 2026 14:26:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52i7-00000001ddC-13IU
	for ath10k@lists.infradead.org;
	Tue, 24 Mar 2026 14:26:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9eBuZ4059876
	for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 14:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zFfpdhBbsrdk8VoedMBkIm
	KgB4/G1LamNSITgtRYBVw=; b=lx+RkNfO9S5pfauFJwNbAf+vhR3/y4Y/rrvv8s
	UuwGfafxjzIYcFIE2tc+aItnHxIiFaAXatokxH9slC/4xMZoEaaO3rJIEz45Hg5R
	Z5x1irMyRou/cWGXvpwfivl54NgM8qBN6HsNgViOV5h+WHCdAJOo/jgJgF5ymKCq
	Z0tlr5WrIySWH5Wi0weFQnBKfTZHcp/WO5HGHb+6LC3OUciZyD2YO+rRVhcQivoA
	7cOr6/KxwsY8eLPfCcEnaAsyP9V4w+AsAmwcTjOUXkrdpKfD8AY0dX7xjldITi6P
	3dsb6lwg4mN9uFg9qhRmhuVgVdkSuW92SYv8TjsO/GwPbwfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsktacx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 14:26:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso1174650eec.0
        for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774362382; x=1774967182; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFfpdhBbsrdk8VoedMBkImKgB4/G1LamNSITgtRYBVw=;
        b=DUtlk1bN3+gt2DLr/uPFE79nLH5RaP1CRiZvebYsj/OgH0VVmpLWXivbnT0AGXrSN6
         f2Nn3a/qqhkjI38Rsn482+ffoxzYRnBnXXQErJzGYByNyqZWxlbpCPK0Wz8QhyTx1MoB
         aNZhVAceEouOptiB6URtMI47O9Su4r3zhyZPdPuGXkmb3Ju6eDVLQKA4+5cXv8MbdvJB
         XR1TnURAnYQ8j2sGaRUSRbXnlOlpJlueXR9XNEwkshsNYlH2zVrT1nxzrG+js7rivfX1
         2cbZ1r369z2K+4hcHSxYI7kur3dCjDCfjANzIOQoLSx1fg2OfWla2dNzUBK1kwKWvXFn
         uckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362382; x=1774967182;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFfpdhBbsrdk8VoedMBkImKgB4/G1LamNSITgtRYBVw=;
        b=B8GmsdT7ha3gkCZ+R0ZWKjKXIGJ0E6akVCKQ/rjqoRxuW8PkhdeZwvx1NNkSt7z++D
         S0M0Qnj+baW56iI2wRn9fgxDZM06uEVOXzpp/O3pYR25mOpOiChD//sajyMkR89o2Yb4
         yc5ubxUFk+5cAvVgYSnVnWaFReB6Qk0PekzZYqxpXrCdB0GhyTtUX10PqWzIsFIswuvv
         Y2LT+cdPgJCqXNjFqmNDrH2qaKyH8dbsuoama+E+o+nWBElz+acKv3XS/SxeNsbDdBy8
         +AKSs1TIKTfj6Q5mqTQ7/iU/QljlTiyViGdv4ifQ6EWswsCWJmN9Z8lHbDaRCcA6BGhE
         p+Jw==
X-Gm-Message-State: AOJu0Yx8SCjK57ItITVUfo7jcp025fudTlsxnlTMIWM6yCN12yeiZ1Or
	qYgZAwn/XYKdOsFcWAHwC5PfLmFsDp38q/OO3KxlR+AVLJLI77Ynic2jHcpXwN2BYlrlsU1a6a1
	RZ5FjsNYRvZLV4oV6FsEtF8GF7vNGwuWeaQoLkH1DWp3y1dXOMQcyEMY7khrWbVzD
X-Gm-Gg: ATEYQzwRyrwfN+Xa6OLmBBaJ0qL5YZhaf/MrsXuyMnKQ+O0qJfsspu0jKr0rUnmroCX
	PxqvGMKU8+XUGcc5Do9fqfKqbDWVPV+3+3QNia9NCJHXBuMkbSiHfANzpXldY8eqsaqp60YBBTb
	9WOgSErajDlDcPyDmGtnBvCyw77nLS4+3kQYHTY9Ae9+hjooiQFfKuJKtYtK9hWdG2GZ8lyEiuf
	UUHvKU8fL0ZtWHFoDbUPDmpNqiJlO0LKQ5F7aulPbCJdtb44yBn8ceoVsMkxYY8QTiMNPm2q00x
	4olayCKfFLieP1ptaB3haP63+HHCSv8AqoLD4kOrCnBUAVpdbLsyIyWFBNrDmdVbiYB1xA6+GgO
	SgJUXtAXRaUyVMAzf+s729opDDyjseQ2AHg3LkPA9MXvj18vdb0lN/td2ig==
X-Received: by 2002:a05:7300:d706:b0:2c0:c5e4:6057 with SMTP id 5a478bee46e88-2c109711608mr7572338eec.19.1774362381743;
        Tue, 24 Mar 2026 07:26:21 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2c0:c5e4:6057 with SMTP id 5a478bee46e88-2c109711608mr7572309eec.19.1774362381155;
        Tue, 24 Mar 2026 07:26:21 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm15307555eec.6.2026.03.24.07.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 07:26:20 -0700 (PDT)
Message-ID: <652ea26a-dcac-4491-b3d1-8344b2969750@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 07:26:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260324
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExNCBTYWx0ZWRfX8q+DZi6PBNcN
 dRPcKH0drsqeetuygxnvmldskhyPd49dxgcnhCP1NHinwt5wDk+v9kGj9ihetx4BQDclyiHt9hY
 O1wrsvh4+Zyt/pws1zndy3WuuDg9FNwriO5Who3jzbzdbvZpkPI6Rh6/GIg+oH9BYJ/+JSzDK1z
 TEJ9mgKp9QvWG1NQRQNyhaAK/5/SQR8bcRrGnyCBH7NPgJYhYoMwLs9NrmeOOHuQojvBIVqaXwl
 gQqp6SIh66XgRRicPDS/8VCXdVufCo/V+q8ULot/6uuA+FapcBA+ziy/U/mzUHxouc0GFmMQVpf
 oPEN9Ji/qay9sqGoroiNzx19NjfQ6SDllXlztGaOso2vuw+20kzrug55gWTs6Imd4vH9BCE/sGS
 RrR8lAg/gbrwV428qIw6kudPJl44v5moFnilUuAejrWcmelorbTsrboofxcvHuXlXUcGBsfdaJ4
 XgORgFcKrCo4kkLQbNg==
X-Proofpoint-GUID: nPqhYHzrhgalLJAt98uRbLislhff7YPe
X-Proofpoint-ORIG-GUID: nPqhYHzrhgalLJAt98uRbLislhff7YPe
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c29f0e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=9AVruJRcYE4s2g_FswIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_072623_302039_A42934DB 
X-CRM114-Status: UNSURE (   9.67  )
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

The following changes since commit 44d93cf1abb6a85d65c3b4b027c82d44263de6a5:

  wifi: UHR: define DPS/DBE/P-EDCA elements and fix size parsing (2026-03-04 11:50:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260324

for you to fetch changes up to 7bbb578fc43e7dcb8690cfc98844bd67bc311e8a:

  wifi: ath12k: Remove unused DFS Unit Test definitions (2026-03-16 08:34:23 -0700)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #2)

A few small cleanups and bug fixes across ath drivers.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: Use .mbn firmware for AHB devices

Gustavo A. R. Silva (1):
      wifi: ath6kl: wmi: Avoid -Wflex-array-member-not-at-end warning

Jeff Johnson (2):
      wifi: ath12k: Clean up the WMI Unit Test command interface
      wifi: ath12k: Remove unused DFS Unit Test definitions

Johan Hovold (5):
      wifi: ath6kl: drop redundant device reference
      wifi: ath6kl: rename disconnect callback
      wifi: ath9k: drop redundant device reference
      wifi: ath10k: drop redundant device reference
      wifi: ath10k: rename disconnect callback

Manish Dharanenthiran (1):
      wifi: ath12k: Fix the assignment of logical link index

P Praneesh (1):
      wifi: ath12k: Fix legacy rate mapping for monitor mode capture

Sarika Sharma (1):
      wifi: ath12k: account TX stats only when ACK/BA status is present

 drivers/net/wireless/ath/ath10k/usb.c          |  8 +--
 drivers/net/wireless/ath/ath12k/ahb.h          |  4 +-
 drivers/net/wireless/ath/ath12k/core.h         |  2 +-
 drivers/net/wireless/ath/ath12k/dp_htt.c       | 24 ++++----
 drivers/net/wireless/ath/ath12k/hal.h          | 31 +++++++----
 drivers/net/wireless/ath/ath12k/mac.c          | 67 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 76 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.c          | 58 +++++++++-----------
 drivers/net/wireless/ath/ath12k/wmi.h          | 14 +++--
 drivers/net/wireless/ath/ath6kl/usb.c          | 16 ++----
 drivers/net/wireless/ath/ath6kl/wmi.h          | 11 ----
 drivers/net/wireless/ath/ath9k/hif_usb.c       |  4 --
 12 files changed, 180 insertions(+), 135 deletions(-)

