Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E879DCA9ED0
	for <ath10k@archiver.kernel.org>; Tue, 13 Oct 2026 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=KUxKhJqQ+3BZKRVnaJFhqOO+V4
	+lmKGuxFVvV0rUdK2KHWa3bpgF7I0soL6Ft7WMBb4sAHfhCAldqwCQh4N8qf3jA1fbVE/gUv9kiXU
	Mbf152Ssi/wymiZa4CnwUxEEH2d+/piKlJ0kfbOTwqx9LtN5hdqMlPD7FQjyZhNSfjZbK38A5EHwT
	96VkW71JE9SPRFEa9YG8NXBM59NEkKw5UawtBVeFzVudZonHIOr2s5p1cM6xl39optYZzrOm2j+A7
	wSri0QIWXaPtM/Q2oM0XovU3QRhfFJOgjm28v4QLs93EU1/h4lMweLuACxeFFI2HZcuO+Z7e0+UMY
	qjw+YREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQxu-0000000BjNb-3N4u;
	Tue, 13 Oct 2026 01:06:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQxs-0000000BjMM-3LNc
	for ath10k@lists.infradead.org;
	Tue, 13 Oct 2026 01:06:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJNiNN2386178
	for <ath10k@lists.infradead.org>; Tue, 13 Oct 2026 01:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=gVvlj4Iyu3w+P5Os
	Qzcj/4L0CUPcGh9gLziBe6aVEphPNK/yHDFPlzFEZW69sz8GRgQu0NaDa8/jrGIL
	2Hzqrd9OOSXctD6DH45CCRkXsk1ZfdGHtfzTIOrQhirjA5/hMtbkRwAxbPBIlXhk
	n1Axv4SFNL/0jD6wyBhQyruqVWaDzf6YWfmmfgAwwzOi8APkGlrJQOVwyc5GUrDD
	gVh14VSoarMFlMdHt53+PbzVMeLxHrZGg05uB3kbzFMBfd76uW7NO+m7ZRqm3HLs
	+fj1C8Jo6IgqR4ulYuHS6Hev8xNWu+i4JHNpeLvyavcDLxvDRRDTgswP5ru3UWbT
	GSV8ag==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kuuxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 13 Oct 2026 01:05:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so3390868c88.0
        for <ath10k@lists.infradead.org>; Mon, 12 Oct 2026 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791853559; x=1792458359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=dK+wopQQ/h8joSrqJgS4hOWoYmbc7/wbco6cYVzu/E9ldmCNMvrojRjA3Ei8qlhVfy
         mXEL3WdF5XgjCdqhdAsOLubDb1XZJdxK8PPQK7ksWdg114uQnWt6cZJ4BVagK3F8hoiR
         5wDGkdtbeCljUhzUMFO9NMJPwxNzWTrA7AV/Wef36M3PyL5/iMf6Mmsq6m9yzBIgSrDJ
         /abBnCyMglYlgc9ERHK6JUBlGrPhnJJkFxcivfOQLeP2Tf6+jatZX1EUeDIKz8ji8Poe
         PBF8y/dbNLPg+Rj4y3KL9FKd9OsFeD5VBgJfi0yA1Cs5DdkMNeuReR3enTMmVoixTUK6
         LbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853559; x=1792458359;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=dbVRY0k6SBIGaQPMK1cpYX5QgyAT7X4ZT/lJBHcMgCUjbPz3ozFBpLqHpYjfJiGUxT
         Vvx7r+jR+RCb5SsI0+MW5NenKR0xp+9rRl9PoMVzRScKgt3xyogtI9mx43ljaucKas6g
         6KXglCjgj61KKLGplDhbW/bNkkgggTMS5oGC2mqI6+fd1F+nS13H2HQx4Zckf2gnV44j
         BbPDF+1XFvM+OesY9x+rSUB83uHLlsELzaTPS8vayPb22LonMZilqGdS24Kzt1uWmUPQ
         gG05Z77jOTjMPnUvc8iaT9OVK9sO8FtU6IaC21SEHpJSYd3sjVsjfrUEdTUTTRErNyB8
         1qQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO9wO8jzoyGeBYT+44ybPACyJyhBkVz7V6t5b/HEQ4vk0sRdzB3FZN7AgbJB/R0Zl1mYSGTIk=@lists.infradead.org
X-Gm-Message-State: AFq9FYIMpvb+2+yWtaouxES5+1f8JK9cqkYK0JBgUm/D7Ci22PI+Eisp
	tgs0hUkUsj8veycSvrGJaW7Gw2w4iC4AkE/9zg1/w2fsVKN+pjFoWQ8bcQzgdEbuLB69YQgWhUY
	rvHPm24WqGTp5MebK0fiP+OQ95Z14yB3XSeMlmwajPZLk6isQ8clp9OvuCl+Gs+WZ+wnrNTGv
X-Gm-Gg: AYBFou12ZnKE6daWVG7prhizheBLoLtuaTBdh/LXJ8ykcPXtAFT97kLt7PXcTCDLBA+
	p2sq5yq+uaGQg9DGI5ufHngyNwMP8MKt1UugYCXsCfg6DXUnkc+Bz+K4v9VbbWDssxEGjKasnYa
	NJy4URtvudtLBm+OnmbYniY+wIKXokwp2c3925o6AIa1GXBOtvoffrfFiAkrAbKgmif0ix/ksAL
	3TbbsR97EVJu1zT0ePIsrQ+Dpdml8MJWf2x4nTl6NkHr2oQy1fnL69CTk4JOQ8OmDENY1AN51d1
	4TOjF7JwE2T0o2jnqNAO60UVw3eNMlCfQ1GeZRbZwdB3gF+Hz/ERIhLpkYcPg9ZwZWHyEjhdYWi
	LhlManNTljEJTLT8lRIuwyOUs/xsno0/+nRDy8hYXCGZMVtOwS2sQaDw=
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320892c88.0.1791853558832;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320852c88.0.1791853558074;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm32904080c88.21.2026.10.12.18.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
References: <20261003092104.520135-1-yaojiale02@163.com>
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
Message-Id: <179185355715.3481009.13105817063716132761.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:05:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX+EPr15qIMwjw
 me3Y1/yVdsE5ImRgh7gmTeyCeOio7bDmxQ2nCpHOcUE1aBHdOUFRJtqdZNm2vQFp4nJvEMH+OBB
 cfGGjWAt/gblw2DTAxXN4DJiKZSe0BQi24Zj0GgVwKG2e1gIW6PbgGrEmyCge88+2dlFMhwurTd
 oUjGqT1ryPKcwKbHezl6OqfBrDB76NCjPkUKNxnXlFBOLlIE30HPlXv0tV4YPfuLK8I0mI+BW87
 GB4TvuSHEipi6+Sp9xJuY/8y6he0P5GWqO3E05VLw7WvqMpTI3hXiKJMyfLI/IKW2GAlYWxJOBO
 Di38qBH76V1Qt7wB45To6v4H1wJSVsEPw4SRd34s1s4ZFoVS4O0Ksdxw2zSEgpHUn2QAf4LnDW6
 XFDN2G5oDGUhwWqalba7lc+UcS413tOJvJQifzvcJHu1OCXxmhs58cXtsrsjgKno7ejFnlQln/4
 itB6XU/P8iRGTIJrg7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfXxXyQou2a1jVV
 JU1JbpROnO/Gvut9hyXJlmpG4lvhikI8bhwet9QHho7KKXzVenFnFQ83Ym4PUPBhMZXpDcP7t+W
 C0J/ShnxMRWCpHo9gGDjo4OwMF8xftA=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd83f7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Op5QjlldpLrGc0l9b0wA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: NHm0RzULRyXC-OnQk1j2OC3UrromvZ8r
X-Proofpoint-ORIG-GUID: NHm0RzULRyXC-OnQk1j2OC3UrromvZ8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_180600_849871_C512638F 
X-CRM114-Status: GOOD (  10.28  )
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


On Sat, 03 Oct 2026 17:20:57 +0800, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath10k: avoid IDR mutation during TX cleanup
      commit: 1c1a208e65a08191901cfded3bbccc4a54e4a75c
[2/5] wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 3e7f5d362b2b3a21b3adb4b860aad14b69a896ad
[3/5] wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
      commit: dc29226dada34a6d19af77b4b51e90f8a3a8de34
[4/5] wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 94c7b50351fd30e1dfe1b4051197a1445d8547e1
[5/5] wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
      commit: 4aa45334eb23d40bf31c43405daea9b73469f2a6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


