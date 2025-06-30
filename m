Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A8AC8302B
	for <ath10k@archiver.kernel.org>; Mon, 30 Jun 2025 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9ouCzDY/WuWEbj4mNDqbb1KZNAy+OKQpnGLkm2sttw=; b=hF4WubD1KdMaPpY0CDT+UzUa97
	WUP5yaGR6uTVkA+CzTHY5iqltRbdQybTv7plIhJXCUR8yyrTRQGzn7ntTZ+YeJM4BJz4m3m49zFu9
	TZowUkydon4M//Xj7xyvoYJd0Z9AAbvJ5O3Ac4v7qpNLw2L0OevjpjrBQJxlEEPWhw8EGp3CSC+fN
	YZVFnAdLo8Aln+ojSl/OysJrK0RcO5jYCi68HviFdvhBoqmtMKbAXU2aXgzgzbJC8XuTFmRWRWZCY
	5RjJdDO/m093b94dOZOoUljf07pzrXcIEiYomqbMNAO+3KrN+yvsY5Wnqg0a/K3+5R8SZeWT5p4ux
	JLI5DLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAm-00000002rrK-1Z1B;
	Mon, 30 Jun 2025 16:16:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGj4-00000002nQG-2mcY
	for ath10k@lists.infradead.org;
	Mon, 30 Jun 2025 15:47:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFkbCC028431
	for <ath10k@lists.infradead.org>; Mon, 30 Jun 2025 15:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9ouCzDY/WuWEbj4mNDqbb1KZNAy+OKQpnGLkm2sttw=; b=DZdEV6c1JrYWjwK9
	txac6mlwMKdb4nAl9Jod4ma9XO+HkKHYG/mqhkxTUjFH8mwXbjxrXxavF7bHukz3
	2XP2nIWo9qpU1wc4G4WNPvN0AP5IwIZtXt3PHXOW7VZhsL1SqJh0KB2tGchiUZL1
	WevNo01RUMjhPFDP3vcFtpPmiTKlVa0VitrYkaL2udtWX+bbVI5jBHh6Ww+UbC2g
	Apio5Wql3Hhj+6wCdx9R/6oWp34E2pEEgAA6hWjWz7gA/SKKOC525nXWLOwVlMh7
	ZTKHACa0gi7KhwlZWqaYqsC2os+Qo5LAL4tNPTbrIHEhdfyJm9jVUEVFx2xQ+Tqw
	RK8EEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvnaw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 30 Jun 2025 15:47:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31ff607527so1937234a12.0
        for <ath10k@lists.infradead.org>; Mon, 30 Jun 2025 08:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298439; x=1751903239;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9ouCzDY/WuWEbj4mNDqbb1KZNAy+OKQpnGLkm2sttw=;
        b=dfX+ALXJfU71VOEkH4T2EhXeM25k+GwEwDAx9PejJC4G6MRcyIPmDU5spfYlp8+lVC
         lLaJoQrIoYvEhaGjC5SYdgZRR/iLKU2hR5SxILEt1mtYU7SpUTYsJgJ8QVgJgnmLRejV
         ilYqHUn0fY4yOz7haj72lGM7NvRKnMmwMeUT1EMuMphVNN3yOq643lycGt2AF7jNSEmF
         901Ti+xs4mNCkFWqi1RxeYOpeslCWfY/iDAchTWcBKEFado70yRu87/oEV7g96l+xQhE
         VXXuSdCkFHP1T6sG/gtDLeX7bo9TafibgKTj/tuRjYZUzIx8JcEgTFxs9dJBnSpNqQOw
         RchA==
X-Gm-Message-State: AOJu0Yz+KJ3M+JwQeYUfn15XHpBszeWKb/5W1t/OBG9KfJf7tfu7b931
	vRbD+dDS5uNTZ1wp1yof2Ob4xlnzpuXWGRsy13mu27v6knhsuL3o9KByu9exVylcCkHYJ4Eswj7
	ZpUq5PwDGewz2RdKG5GOgc4BgK5tYKEv4IM95YzevkhzKjMNXxteavNJsXBQKKYeCfMxXGGQM
X-Gm-Gg: ASbGncvo2lWDtxd5lfAFtRYpxYVyvOY34hFfl3ddu4hKqpmXRTQUxot8i4Q4AIgrY9E
	pT7FtyjaucX5v22kSE/009bG/bb21GatV0VsERBVGFdJfLMH1vEMXrwOF4A6C+2qZ+/CbAnxrJm
	j4OKEKUyqu3CQVZ/S38LAL6y63Azpr1ID0duYrlItNibAYBKmKqStmPgJv2lDlnFs4+BtqpIggK
	VLa9MjOuh9XC8L/SFL3mBiyZnYREOuuB2LLFGOdl//yWr5fJrPHZ9DkYx4puqHwaxPij/KMcRp6
	0mEyF6P/e3PT0KDCTGTPw6xDNP39N9MMrc/omA05RQ7sHDmHqACdXKgYkoY=
X-Received: by 2002:a05:6a20:9153:b0:21f:eec5:85d2 with SMTP id adf61e73a8af0-220a1594f52mr24352791637.19.1751298439226;
        Mon, 30 Jun 2025 08:47:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd2/Pr5WKrBLCW5Yvo00/DpfozlXkrS+yG88v9l2RbAF2vIqcxdAV5hFsOB1uFLKXnFntQBw==
X-Received: by 2002:a05:6a20:9153:b0:21f:eec5:85d2 with SMTP id adf61e73a8af0-220a1594f52mr24352744637.19.1751298438845;
        Mon, 30 Jun 2025 08:47:18 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57dda03sm9726575b3a.147.2025.06.30.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:47:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250623022731.509-1-kang.yang@oss.qualcomm.com>
References: <20250623022731.509-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath10k: shutdown driver when
 hardware is unreliable
Message-Id: <175129843814.1367731.13156897136860121984.b4-ty@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 08:47:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: JqDbszAvz4B8iUMNAxlD93wgFDxfAbYC
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6862b188 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GDNJGlGECHCYOLTRVjEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: JqDbszAvz4B8iUMNAxlD93wgFDxfAbYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEyOSBTYWx0ZWRfX3DexBywnbb7u
 MPHHt7KRjB+zFfmEc2TF6OY3GZIAglckaigyULH5j0rd8lJ/zrP01NtNYCSpjjdSbVriTH6B1hL
 jiLOkFcRtgVRLK48QulIsHMfXVWv3q/Jh2PoPVVMup0ZI+3VGLekNC9cyh4ZB9raSqe8sfGG65F
 SK186lLlgQbnvAoGGCelZHFjKKwjDocqQFHXjIjYQYqbWZTorFKyfCBNDRyA99vpFb5NnbxkZqY
 CwloBwxBoRzSlD1rLtAEQ131yJDt95V7XAqcCFA4d7viCabQm6TmiAlhNNOjHyoakXINgcUoxVf
 x5T6ZJv2n0pQCR8CyktE9iQC9+rbZRRgE8C+N5XxjD4mpyHYchmle7mGXaFQ75+KIBK+qnNjmNJ
 GUMr9vbzzEuw5Sv1ZNSs2zS8X1DbLLgsuyEiXm+mQrxDNzIrc4XSK2rNRsi4XT/+eS4C2K+E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=768 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_084722_712872_971F8C0E 
X-CRM114-Status: UNSURE (   9.61  )
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


On Mon, 23 Jun 2025 10:27:31 +0800, Kang Yang wrote:
> In rare cases, ath10k may lose connection with the PCIe bus due to
> some unknown reasons, which could further lead to system crashes during
> resuming due to watchdog timeout:
> 
> ath10k_pci 0000:01:00.0: wmi command 20486 timeout, restarting hardware
> ath10k_pci 0000:01:00.0: already restarting
> ath10k_pci 0000:01:00.0: failed to stop WMI vdev 0: -11
> ath10k_pci 0000:01:00.0: failed to stop vdev 0: -11
> ieee80211 phy0: PM: **** DPM device timeout ****
> Call Trace:
>  panic+0x125/0x315
>  dpm_watchdog_set+0x54/0x54
>  dpm_watchdog_handler+0x57/0x57
>  call_timer_fn+0x31/0x13c
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: shutdown driver when hardware is unreliable
      commit: c256a94d1b1b15109740306f7f2a7c2173e12072

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


