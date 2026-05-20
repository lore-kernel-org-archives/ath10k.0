Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064B7CD4F3D
	for <ath10k@archiver.kernel.org>; Wed, 20 May 2026 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP3qqhRX1+ugS4wszXTSoaDwa6KVjfZp9av5crBKnTw=; b=Gy2f6wET0URWKKnPXohHn5lOoz
	bJ5OMu4b+xFiVvlBrO62rxrP0oqAPCaNLu4heNEkM0D1QnRdwUlVtmSp0b5pi7PDDBjly03XFn0S7
	m3NNGj0l4l5ma0IEdc8+vF7PkfDwxGvZBYhyzY7AdPEHBWPrMCepAG1aMrnSLPULktmGjoFnFmwqd
	E5BO4tnOb9lBdqbNIq/ka/Ni9t0oDhvIH4LR13sCNZppIrfTA7v2G8jKjUonftMmqvLIo2aBZfyxg
	lV75FUjwTWhlIRx9EqM4yx5Zt4ql0L6FE0pjfhpPCJxvpjiuQH6IsX6SzuEFkt0xaE+kuHZn5QRzl
	gGSjxtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkG9-00000005EZH-2NtL;
	Wed, 20 May 2026 16:59:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkG7-00000005EYP-0mfo
	for ath10k@lists.infradead.org;
	Wed, 20 May 2026 16:59:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6dKA119200
	for <ath10k@lists.infradead.org>; Wed, 20 May 2026 16:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QP3qqhRX1+ugS4wszXTSoaDwa6KVjfZp9av5crBKnTw=; b=WaiPV4HEtROTXZ6W
	VORklX7BAmWkEdNhuSA/7jedUSZmrjDrUD6gziUSc5Y900MU79YQNd01VJzlNsho
	gi/Lz1I5l4joH5t14S3C64k7+1hH7Wq6tINAJQVVBTPHFNW+V7WGTXy5pZxZ7AsK
	N1VvYwP0Ub0eksQNS9l9w/Xntpx31ML+wJpAYo2ZsQL46GugNGGmY05UwLb6qGvm
	GWD96yg3TM0ANgwLvxHUSxu85S3lZWSkBsjG58bjMpqzHFlb/3PEV88SenIqw1di
	EuD3KdQ+24f4iVCduBOYHU2NV0BNqOmFPhRZipfVSn4nMz928SUYlJ55z6Rh1XKe
	o+tmng==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee88v21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 20 May 2026 16:59:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3041ab826ddso1431542eec.0
        for <ath10k@lists.infradead.org>; Wed, 20 May 2026 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779296342; x=1779901142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP3qqhRX1+ugS4wszXTSoaDwa6KVjfZp9av5crBKnTw=;
        b=AxVhyFy8JELKbAfrYpP4J6FZ9/RlMvIcKA8AsK3g2XiU3v5kkqLxrqP4N3c3m8nL3w
         9iDSDaeyNeJwDnwNrlA5uewW0LfQsxhFDwsY7++bG2o16az4IYLF6TaH7pK5qQK8q7Kn
         IMAg2DBw8DkSBqm5SytfSMkb95GA6AeHDys5h3MIDmFtN+opyqtittf5rMZP5KMCFC3j
         lUh0ZhXSYcrsorYykNYmG7+hBnV2N1hYQfc2KlvPyxWxpK2KYML0u2Evp3/2oHf20hvY
         TLs18ZYrM/OzHTzXuTQqjZ8dyNbwXUWdoZYZkaP6u8EbL5yg6NFba8DeTk82I5DbIU8O
         vuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779296342; x=1779901142;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QP3qqhRX1+ugS4wszXTSoaDwa6KVjfZp9av5crBKnTw=;
        b=UH0QJyzLQDrluejJYYF0KRKDmvTmxZ0qrymt7/7xanWH7lw3zj1Kh2cXwUX8Lk5VJS
         EGkfJQWfXbH9sj5wJUnEUQ3L5bDKLTyawEfntguh2nWvO1jK8qCfw5cI89yMc+h7tBx8
         0jKqcx4cntLhS7ZhmRqi6ia6vnswhLx9bspGsiOLz27iUH74u0hSMPPCVq5LASIADdQY
         6+Q1Rsy0scXc/fBSZA/kvmEybrqWs9M+qhz0ua+fJybHJDnzlXmuAE8DEfoILIOtm6rg
         RAbNnHgVrjikILf4cVf9QasvggwOWYOc4s6hVeVB1H5cDfsZJQzgdp+ln8nLYxL5drrG
         CyEw==
X-Forwarded-Encrypted: i=1; AFNElJ8nKgrgia7tDDDWylULQ7rIvdAEb0A8lKgWH1WIPXGBzoZsyIF0RJ7Lu017CPQryMwcr5QWEM0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSCkjDqaNSd93qsfQS8l1vY/bFv07+/w86/y+/JzV2Nl7+NIYY
	TxLIf7W0mD7ZnC6wj5RiZgZRfX/EIFU6FVlZQU5ugIewMvQd+sQsaB3K17k2nE8ytiVSj2W0CEv
	VJIDfdVbCwgszsp42LA1YRGbae+DNZVBLeH8D1FkutALEyrty2ICgQzLcYEyVEhqE
X-Gm-Gg: Acq92OGoZ5o7yLZ40wMD/fF1Rlz+zvNyqxbdAaPZ9aEVueUgZgr1p4LidArqQc0o7Oi
	zMRKtzSPukQiCZrUzobmvhdOt1FvGB6Mu26wMmwFGsKT50wfNsEiIcP55ZyDPAdTES43DqWUsa2
	5BbsuJMG5LFXw6eoTIr7wtifKApOE3Fd4XDI+yfk2Bno4uFoh+SPeH2cj2fy237mguFdWMXSt+1
	7oyzrMuK4Z7NgFh3AVFP7Ola/JNq0IHCgGjDX3mu4kNLk02/fHz38EpPi9hDWiiRiS8SocUXkFh
	9lHBr6C+63PWfIwK/fZypM42/JMl1Ah+xuzNh9aiUg+pt6GOFLAVtT7x6YOQ9WHK5VWP31Bn7nO
	ZPH8+lzykUfMu+ak7brs5ehNAauZ2ng15Gk8IOisDcj5L+TSZ5QAQpootGBwLJXzeuNgEAjbjNa
	iE
X-Received: by 2002:a05:7301:1001:b0:2d2:129a:1694 with SMTP id 5a478bee46e88-3039868ca59mr11063278eec.18.1779296341833;
        Wed, 20 May 2026 09:59:01 -0700 (PDT)
X-Received: by 2002:a05:7301:1001:b0:2d2:129a:1694 with SMTP id 5a478bee46e88-3039868ca59mr11063252eec.18.1779296341276;
        Wed, 20 May 2026 09:59:01 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm19371442eec.29.2026.05.20.09.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:59:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
        ratnadiraw@smu.edu.sg
In-Reply-To: <20260321110011.8556-1-kexinsun@smail.nju.edu.cn>
References: <20260321110011.8556-1-kexinsun@smail.nju.edu.cn>
Subject: Re: [PATCH] wifi: ath10k: update outdated comment for renamed
 ieee80211_tx_status()
Message-Id: <177929633992.2491273.4266077586938597005.b4-ty@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:58:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: kwchxpMVtlV65bGKFRVDvOOUi39_HJ7v
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0de856 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=E0N25sYAu2rxJyge_XQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2NCBTYWx0ZWRfXyIzclP5enPvv
 721xU3pyoroapz6tSEtw6XsAT7a1dUXSP4z5QBK26Wuk4b1mMyMDpiWcAlJe6hKgKonQsm1Z99l
 oopk6HUKen2vpJ26g9aEx2ybqTnU7xcen2IXgLCLhjjLuDYdDGddGoD0O5GgPwnlTDnNk4IEVss
 vwFJJh0KzafphWm6s3zSxQ7p3vkYWxZIXtfHqir1tfX6qMGZDsUEzO+AUOD6SyaoD3tlg5lzOYi
 l3maVJDHDYEkZqnsi+KVC7CyaMQBpjQt3XFs20/d1Ks/NRCkWg6xwRUcMCPV2EeHRizYkjdRvBX
 ap2wjMcWTMBBC0o/HLLmkOvcolh6QrbQoMhylb7MlixxCill4/VQB0NvRxW1LxiQL9vVR6Hz9Az
 EVW1CsFz6AB8qp7Xf9BLkQdIifneJoUQSMjzaO5U6AHz3iD6f0au1ghtC4pAr+x1TJyr83/6DSu
 mJqvQETX0w2YsWd9gXQ==
X-Proofpoint-GUID: kwchxpMVtlV65bGKFRVDvOOUi39_HJ7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_095903_232321_D27A8AA9 
X-CRM114-Status: UNSURE (   8.98  )
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


On Sat, 21 Mar 2026 19:00:11 +0800, Kexin Sun wrote:
> The function ieee80211_tx_status() was renamed to
> ieee80211_tx_status_skb() by commit 2703bc851399
> ("wifi: mac80211: rename ieee80211_tx_status() to
> ieee80211_tx_status_skb()").  Update the stale reference
> in ath10k_htt_tx_hl().
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: update outdated comment for renamed ieee80211_tx_status()
      commit: 30d516006fa1f72f957c18c6171f5680dcdebfb0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


