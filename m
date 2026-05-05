Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80543CD3427
	for <ath10k@archiver.kernel.org>; Tue,  5 May 2026 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=; b=ASpC3Dg20nEl8ignvrFLLikYmg
	1toK/MvdCPt5qfk3BuvgoqK4dfq5o3BPQ1uBtiybU4hbpre59ZM/z7aYCeVLjQ6tDyDKd1+NXM/Qc
	amfvRcVe+WPo3vAMu79rETNdnzdCcCShunxJVlmMKjcSjSRMDNplEeIglxnnDgprZRIEcMTAZ9KVR
	rzCu5WfvCUoSpwBou10KsPiRH0J1iHh3Is+A6o1EheHO8EYq2k17X08CwEWI10UlHtSSF0g4jdBUB
	4NJhxXd9yYujvqC/ma79fBAYBidxA4CUMlT8oxleBlp1+TaDsaaaojx7PUbjJeAwWFNQPL9VRSQtO
	R1Tt7M4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGME-0000000GQBL-29i5;
	Tue, 05 May 2026 14:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGMC-0000000GQAh-16mx
	for ath10k@bombadil.infradead.org;
	Tue, 05 May 2026 14:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=; b=OufU+7hSAsihknst3TLnsEVPZx
	8oLVislrrdHLY8RsOt6sEExDleGw6WV+vdGC3w3dBsx2i4PxcClYfRQRuZ/QhZoKR0tnT7+68h3tc
	U+OqXdTpo7pT6FIEdJ2MuT7/qIWL/RQfO6NlSxrBoYPsFYbGrJ4GGS4DelkffKO9PnjEdM4/h/whB
	IKbzKBsOGN9jkkdPz344tNsZ/CERUkz+ny/fUlYuAzNwdZnmwFVxK1Ia4hrkyUgQUf9wtgVj/fpGk
	/1OT8uB9RdESO81qCAZ3Y/FKkCUBMYHJgseRXzH1+wD8n6mziDnPVe7ectYyRcJ6sW0f6QsRQ6atN
	TKkV+P6w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGM8-0000000DiBc-34We
	for ath10k@lists.infradead.org;
	Tue, 05 May 2026 14:02:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Djcda3501560
	for <ath10k@lists.infradead.org>; Tue, 5 May 2026 14:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NX2GqVOMLwVw8Cryw7SY8Q
	QJe69k3Ra4iwriZpqn3SU=; b=CCQc0WFp7xQXWugeo64R2XJr94jSLF1YAvgDNm
	yTRys/qkD3xKviO47iGpe2h4ekOkNlhwkozr4XcFTCGIanp3x+YegqC5PUsiXYJO
	NrEnl+cRRfxC9r7XR0gEk7fWMVB68/3p1tT6/hUms0rZgcwdFM8dGC8abZQfSe4z
	pC63Pmp5olLFX9Lrn9Bx3EHu92osJhnESfUPZkSgLlfcW5xgc/3eDe0MHfVM3e2C
	uVT/iBPaKSzBa96EaVmavR1gRB5HdbkO9gEgrSjavO/+Ra1pJ0lovNsIXug3/uay
	CFBUJrsXvQT1dFW1agxe1G2PirwBepIT4ElliPmMWTeuJ+PQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqf82an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 05 May 2026 14:02:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-130aab787bcso3252116c88.1
        for <ath10k@lists.infradead.org>; Tue, 05 May 2026 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777989752; x=1778594552; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=;
        b=kHyJEMLFJoYoHpmiX+m4LfQNUxmp4KxGvMBzHzcSuqJ8YxRyMIHb1o3YVNG3qx+O4+
         IxnO8xuqOy00HWCB+MLQpggryh6jMXQKv0dNdgB0/2IwZVisTmzwzEawH+0Ptq2N4Q5P
         r+LmZb6+SNXcyO8DzQvdlK8Pgf2T3Zj96LlUxIxb/oOW01+iNR3osB8rzsJF0wgvxpR5
         tGHeTaXvZZA2Bo8ZeQR4ZKO9dcORuz5DD+2gwN2dGjf/aYs8Fk8MHljjEWsJ12Wu3gqm
         YQaVYEsYDL0TsorrYaS7ly8kSptgQm5YPBlFP5qq+5n6jZxL0kkDxMcNzA45TWq6KrOQ
         song==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989752; x=1778594552;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=;
        b=O8LFK7VBF0JpzwQUGuED2oYDTr0OzVtSdfmi6QPhTMOdLqr+hVqAIJwJ/lVRLeNcZ8
         cqeCH4hNhkZ9lKH/FGGZ/rcqtOI3uV+eMcI/n40Iium/qSx4oyGIgIqmTc3hOatyA1sf
         E/ItvMZNx5Ta3GJzwhZH9mcuIfmRiuIwEh+iYwSFtLW/ALCk0njNSmTmIcLqzXDDA9H8
         GOOfaUwzv46cwLj6AkgWFXmKPmHg2eLXWD7yS5SOK7opSrdHccsKjfrvo/SieE3m9J0f
         W1iylqTqNQTFqRnCjjSljIhv06k+wtSRkM/JYsEjceAdv+fxveR3ArpXiJ2/jRWxlIYT
         gTXg==
X-Gm-Message-State: AOJu0Yyp+gLKW8QBObw+Rf+fC7BjmMPofzRlKtLao7owQASUGxWGGyZi
	6F8mYKHMLmUpB1oBewE9NFsTXL/z38I/3ok2rO2V0aq1wiWkS3+E7YDGYht7yM9GEvF4X+ztsee
	vZfRG5HEnsSBBfOl5k9zIEBmgj8OkiKdrwjHfg/9oE37LZNPaqV8k98zGNhWe0hpN
X-Gm-Gg: AeBDievovXbw4YKpRh+b7K6bfIsKFcmN2NQiGSluJzPT/VwOBGzZfOaQ1b42jrpt51J
	H3n13D66ruymlmP8BQq/CjpSFqjLr8BbEAx2SZo9WL5eQHxTWmW0UrJUrXzX4+sLszcEcISzkOe
	aAA931TBPbx74tEDxcrSYX192ljp4vlJ+U/mgSp3e22JqsFBGRuwHBiOMVsTtrU2ynWy/DlUN9Y
	3H51lWLNYZxUtU4mBkTZ6b/a/VbFSpfvpgCeOu1yvfEAoCBNuHOs0sCLw85PIbGNbyc/QILXscp
	flK5kdMOo++XtPu26erlGfKZSQ8/9slEqRLOezh9UbOIdzQaWk/HPagDuJdGDVsbMENdaomIca5
	mBGD83UNyCpzFHgYafzQJw7I2HI+9squkwMNUCwAGW4SPZLnHAYQbEbAp6ya+rZphMkBL
X-Received: by 2002:a05:7022:660c:b0:12a:6ab7:3f73 with SMTP id a92af1059eb24-12dfd6ef2ecmr7329905c88.0.1777989751681;
        Tue, 05 May 2026 07:02:31 -0700 (PDT)
X-Received: by 2002:a05:7022:660c:b0:12a:6ab7:3f73 with SMTP id a92af1059eb24-12dfd6ef2ecmr7329781c88.0.1777989750591;
        Tue, 05 May 2026 07:02:30 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df843f04esm17828716c88.13.2026.05.05.07.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:02:30 -0700 (PDT)
Message-ID: <1078e0dd-4d30-4cc1-8ca8-426099127efb@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:02:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260505
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzNCBTYWx0ZWRfXxp1AcCAb67Sd
 u21zoVmHkVMm2ds4ekjOJMeujLSM/RDhrbnYahMz7qBdZgl5uRrA0zApqGvr8b0utBtNhcu+C3t
 xpiIaey1znk4jeiap+mdPfJB4c64fyagiJZqxnbm5n2LaTRYqfG62bTYF5LeKxkYOMJjjKX5IO8
 BK5+I0QU3t3hmUaxmgszf8Rrtbb2w34hV2QabQ05N1fObFLyM0Z+qPorn8LpmywhYwX+qeZFGF1
 6u1FBfAa7KdPRWJlvVdQFBjV8c62fbXp9JVJm5ogbPdwJwqLK/7V/85+5pCHownIf4QKlBusoz7
 xKfhbMKDubgLp6eds9NNlsWn/8ky2RL+eS/SjbGqqfbtMzMgWzny9sjIegbmFxNMrZEzKdJnX92
 DFbfFMJGZ5t1C0Id3Jqk67V+F6PLy0Wo2OQ4r3IvH+OARYgMHnyyYb+6Gakjjfgpt25UwPb3lck
 KwqsVpGtEiMw/BB2e7Q==
X-Proofpoint-ORIG-GUID: OopvDyQC4iMM4CYPG_u0UcHem4MHGQzW
X-Proofpoint-GUID: OopvDyQC4iMM4CYPG_u0UcHem4MHGQzW
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69f9f879 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=gN_giuKsPDD6efEbj5cA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_150237_224546_783D1702 
X-CRM114-Status: UNSURE (   7.76  )
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

The following changes since commit d997c32157d2ca06e9f3f00ba6c4bf06593b49e7:

  Merge tag 'ath-current-20260427' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2026-04-28 10:41:51 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260505

for you to fetch changes up to d748603f12baff112caa3ab7d39f50100f010dbd:

  wifi: ath5k: do not access array OOB (2026-05-04 07:15:20 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc3

Fix an ath5k potential stack buffer overwrite.
Fix several issues in ath12k:
- WMI buffer leaks on error conditions
- use of uninitialized stack data when processing RSSI events
- incorrect logic for determining the peer ID in the RX path

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: fix peer_id usage in normal RX path

Jiri Slaby (SUSE) (1):
      wifi: ath5k: do not access array OOB

Nicolas Escande (1):
      wifi: ath12k: fix leak in some ath12k_wmi_xxx() functions

Rameshkumar Sundaram (1):
      wifi: ath12k: initialize RSSI dBm conversion event state

 drivers/net/wireless/ath/ath12k/dp_rx.c |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.c   | 105 +++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath5k/base.c   |   3 +-
 3 files changed, 92 insertions(+), 18 deletions(-)

