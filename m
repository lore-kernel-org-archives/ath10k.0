Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CD5CA5FED
	for <ath10k@archiver.kernel.org>; Tue,  6 Oct 2026 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=; b=tsecypwm6KAzHscVNvAZuAgMtp
	F79rhe0OZt9WQ+RKlaZc7HfLFJk9V6Q57rNNb5s9k+LKXe8XbqKuSJUsxSfgogBGa4OofexoMJgqL
	sYSGxgXhpK0qNnDT64FnIwH6p8tqtnV4mEBtbnzJmlnxX029stiwaIIXuyFvkiNp1f/ImSfiM+7xh
	tbTSF0jnR2dA5D8kUVvxf52RROi8lgfuCExkc1f2tXeUZ8akR3f/A4tpl9m02F5PVrkwEtpQwWOXv
	9KhvB3lk4deUfHOfu9mLxDSzh490aycIF6rqqY+6h8ZWLmTPLDfHR1jbf1PYKUJ1ZsqR2wIUgM04L
	dBgR2WSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5xC-00000000wEF-1Hdt;
	Tue, 06 Oct 2026 14:15:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5x7-00000000wD5-13Rz
	for ath10k@lists.infradead.org;
	Tue, 06 Oct 2026 14:15:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696EB0gp1530674
	for <ath10k@lists.infradead.org>; Tue, 6 Oct 2026 14:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9VpjXu4u++QS3E8EyJb2g7
	cB91QeLt7IH+hYNOWUP9A=; b=jXgiq5syPqWR17xoDARptpVKQuXWkUINiWZ72i
	Lze+1gDJRFXKWKPJMktJRwN1R/lIWfOomxkU1w8FcAo4gJOh/jpdJdk64sg0Uvzm
	3J0CeX7Cf6RENPiRCunFFYIfX3ipxUo1pS9fgM/Dff86kW0rpAvIAe1bOrBYkYFw
	NUh4JMBpDlNV6pAM3EF14O0VkOAs5QM1kgOWj5fG44dG9EgdWSUghlsvMAqBbDAF
	3BhenvodscstAiaew/DEfm03CB7XTfY2AyUx20dxrZrVCIcWznzmr7wkbkHFWTYA
	aYAC19u3vvpwXiNXyHS9Ez+51YOoJNlgEZ2z8RsaLXNqsY7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwru9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Oct 2026 14:15:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8883dcc671eso2168645b3a.0
        for <ath10k@lists.infradead.org>; Tue, 06 Oct 2026 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791296131; x=1791900931; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=;
        b=H5BfqlpHozRDSDB2bt5E/ZcbkWcHRAtT6JvxweVf8QrvocgqKDnYErOF6wDChhd/3b
         ziwV/WQ48OQnJTnCmaWnlbX8ssdXxVmyJdFRIEn8c9sSKZQ/Us2784T+khH9iF5OdCB+
         rJdnIqqUMj/7IG4sk6NH4bo46bgdtCYQqrb2aJ8xPBXSvmmrnXyZ7PZlMAjOmurfC55i
         IdM33Tvi270bvtrVXGJQvJTuTG7AXJhCYJZUW6zpPFPnmas626cmby9fwmn+As/zBlYL
         3xdHNPvW+eVLeKRQmunHMoalTo5LFr5yIG8VtcKD+PqB5CRxASKp663leT1VSAKkswXu
         Ns+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296131; x=1791900931;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=;
        b=V31X0PaWoyE8MZt5D9R8rWp/sujgVBt+CLj7vFDemqABQglplujQzr4spvuMqHq8P7
         sYOy7rnNATT6b4xnDgCIKKIzeGAQ5inBSMne1Bb4onp+bsLgdZpT0J+zLraAYO3mPeYl
         x2+yv5pJ6ZEZ54770+BgMrE0u67bhRe0tjKk4CF1RhQDpHLinImPbDdA5VpPVrzd7Fdy
         WIR9PG3pxpmaZHKsabgf3t8O9kCY2AboP3Fph90kiJxiab8bwLA3AMw+tBRUePBw05f5
         Asu7NHUdSQRdhrx9EY/J0+ohSfAj4Xw/15X9ASGxb6laVE1j9l2LIMPOxEL3VRhncX6Z
         3tdg==
X-Gm-Message-State: AFuF++ngXw0Vo6zcASOTccKaayi8Xok+SZftUlcSahBC9GtoL8YtGsxg
	P+s+UiW1aRE1bjRvuf6pCIen5ahQvKi+q0lx0xypoYbMhXk7eIPvp2rofdpQdaCkjMUUhXUzpty
	AY3yLs17t0ZuaiPNL18UZPbPOVepZ1e2/Kz0K6t7iA//aFwQOOGjNriPVoMcBn/w5FRVDZxc+
X-Gm-Gg: AYBFou3po5TZzXXQFGWstS5bWb9zaBgufUs9eOFBOBTyg5NEU2QeOTlBq40mOi6ZA+Q
	wg+ezLWldVo/uMMwRsP/MvhusbX86r1RWcRF4REKCq9t02+CCGurPnz5ehlAjd/5RVs9lhpMV3I
	8y37QwhTFgjgJ6YRgTR3U9B2bufAtvDTfChhWUfpjwweCNb2wDonsZRcPaN6hRvib2K2ip0eBAt
	gGQLGQh9wIMeJPN9VJOBRVPripcD5as2N1OAEiUWg5/+SDpT8sjIzcmNNjQQq0/cnrUrtumM3Qb
	tePvQysMP0yur9CutIeq4RR2CBeU9UDfvLXvj4eSUV9Jo2mhhe8gP+zDfKTXpeYutq94FmkDa1p
	rKVBgqQrzhXfy6ehzJhX4M3JT3CuNWQ3DlPG8
X-Received: by 2002:a05:6a00:c50f:b0:891:3e34:e07e with SMTP id d2e1a72fcca58-8913e34e55bmr360941b3a.34.1791296131176;
        Tue, 06 Oct 2026 07:15:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:c50f:b0:891:3e34:e07e with SMTP id d2e1a72fcca58-8913e34e55bmr360919b3a.34.1791296130606;
        Tue, 06 Oct 2026 07:15:30 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c1b1dfbsm5131184b3a.26.2026.10.06.07.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 07:15:30 -0700 (PDT)
Message-ID: <dfb5d597-f2cd-4ce1-8eac-2c2b74dc25f7@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 07:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261006
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NiBTYWx0ZWRfXwjaTx7I23ihv
 HgaSzcXANmYKA8Nwp6CAiAy3RYfVb6TObiVLKuS1MSscT4jTHlC2QFTYmKNq5xOI4P3F2tEkYdB
 wCR+j8py2EN5W7sBu2oM2LwZJwFt0S7liB2EyHylHOlRFtypeVSVES5MUn0ggcXAkK9mce1q4AH
 fwAf0+9J19xyJY1lnfIeM7v/WRYa8xjEg+77eyCC/RKif2pga51DIR0EJUjovvyecWzt2v4nSeR
 F8QfNLgP75os8sKLWyEFo2YdxeehNyzWLno+Q9prDYJWLHp0bG3YW1jpNVMx8vC8K3mGN2buwvR
 C44b4xSDoLLr45tPyEosjerIsDEogWPNrhT0cDzDoYPWfj8VtOoIKkdWawbLxgz5QR0il5BftKQ
 qKlR1O6Da0zgo9A0DSK4/7808XmEbum89Qgc5xCtwITN1v/Yf+h8pg/r9zDlge/avfDncLTWQiF
 teeE2tgfJN+CvJzI40w==
X-Proofpoint-ORIG-GUID: ogJ7TZnnBUbkyiYBPmACCwLyRAH0LXKn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NiBTYWx0ZWRfX/hNURE7vxuhX
 1uLVIOueDV+RcqTjpyHXDR9b6TYxmMmSAaJBoiVcJwRN15rIo8fY88NcOZ6YVVXh3eU9h8jwqZD
 JmNvP+8yNlLb1tdQ6eOptR1jnYOh1xs=
X-Proofpoint-GUID: ogJ7TZnnBUbkyiYBPmACCwLyRAH0LXKn
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac50284 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6eATFoqnGXLanKaFIDIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_071533_930083_071F04BF 
X-CRM114-Status: UNSURE (   8.18  )
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

The following changes since commit d24e8ac715de2e16a53c144005b1863660a5fbea:

  Merge tag 'net-7.3-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-10-01 06:41:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261006

for you to fetch changes up to 05165f7b3b9ab6817fe216c24f90755b7c5e15f3:

  Revert "wifi: ath12k: add panic handler" (2026-10-06 06:42:17 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc7

In ath12k, revert the panic handler that landed in v6.11 since it can
perform a voluntary context switch within an RCU read-side critical
section.

----------------------------------------------------------------
Yingying Tang (1):
      Revert "wifi: ath12k: add panic handler"

 drivers/net/wireless/ath/ath12k/core.c | 33 +--------------------------------
 drivers/net/wireless/ath/ath12k/core.h |  3 ---
 drivers/net/wireless/ath/ath12k/hif.h  |  9 ---------
 drivers/net/wireless/ath/ath12k/pci.c  |  8 --------
 4 files changed, 1 insertion(+), 52 deletions(-)

