Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33215606A337
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ODSK6FZ4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai2JN6Wg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AloMBa+v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=; b=ODSK6FZ4hkbj2n
	J4r80kZc6/TZ1etShXfzDgkPOHkDLAF7YTFgMI4XR4Bbv9SwUWDwfeLthIht4WSPROzsGGWdq0LTW
	CnPFc6Pp5Sr7ak9LgAin1wT5XdjlllEDpfHdXRQx9C2R+9iPsCHIqedmobmfi8pVoe57/WQy0ZLax
	Qcpw/0Qkxb65zWcOl8jXoX744vMFGBe7eWsf5lO8kfaKfnh830EvDluE7lR2ryggnNGxuZUcuC4xN
	YCAYCWYMmJxQ4dA7lofFenX45IU0x74oIbdP3kaJdqudZ4ZyOLTczebaPEZ90MKDY2JaSQ7oBQYi0
	hcexmgJ7lc6RgNQXpTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRspu-0000000DIXh-14nE;
	Fri, 13 Nov 2026 15:05:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRspo-0000000DIW1-1mff
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 15:05:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJTxD033897
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 15:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=; b=Ai2JN6Wg6D5WPmv8
	r/3AltXCMnS5XmB7sVjWFHvOwG7pnZoQTJxCBDln5vN7b8MglhD4UKxxGJY62WGM
	mXPlYWwoBJbqSQplVl4aJdQuGnXubcQBjuRzxsEKOxRrpUTWfv0LBdixd2YpAp7Z
	b03GM1lOze/nnzt6IqDSiNHyUrxM02ynp7EmWqx9ECgmAvFluOec52+W3FctGrcz
	LBDSYX+ufXfhJ7jxuiGCy3Hu20O7fzUbAeY0q5ZkCcPaTlx17OnWHoMCjeYgPVnO
	EWCkuK4g7Al79PUND7wIYXkq3mZRjzL8S7gNiSJrJy7EW4pi5h715PyeOjZuDQSf
	Lfe6pw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9wmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 15:04:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so862364b3a.0
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 07:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794582299; x=1795187099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
        b=AloMBa+vmKiGF5/H2dq6uOwKQTEE9A2zOoiBqyDddVSnfsu0y3Us82oYKrRwfCkZ60
         ZdTZmChDYphwkLYsdiejiPGIRFrRAxGh4Zsq2I+b1ZkPOni2EXMuPKpOPA90zXx25pT8
         aGFbk8l6e8Kxy0KT3zFrnAFJTQG5gVTFRugQGZ0zczdzWGC3ep6IWdd06292IwVHiuYL
         WpLphO4ul51qY3k0dq879lxB33o7TwvPBVxpB1hi6nfmA3zmSpMQPQu+MYOEwGs8qFrE
         IOenQgPHi5GVgICcM0Gox4CEFmvFMy35/fygWxufqaPBIjWGuyPwBSGD1El646XFVjIT
         FWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582299; x=1795187099;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
        b=GYdZjnznTDe12t9h74JEqAKOAmg2CEGXsc7fltMSKjo7WPHVACTQdwlVrNcHdC6blq
         Jh8uad2iv3nJm79IZpDtzhFQ2sDs9yEuDZlIcX1mldV8GAuzI/Acev17C4Dxw9Lx8JII
         2aI9Q5eFtIf1m9S391PAJtRACBh0vt1uMAH/DdBzAc+mh1L4mU1ALlRTFCw9/hCw8c9Y
         X6hnW8ndS4Tg1CFKRpE3UsafHOGGP3Q8fpy2C5WPUxZSmfNDyAcXuPRXF7nwJl3N3txM
         nlrde2JvSfyc2+XZlOIAH9UYUPTNeUhP3ek4UkatWjhvWCc/xxW/QB6Oc2tKteRxB6iY
         2h0A==
X-Forwarded-Encrypted: i=1; AL+hErGfPqjip0PsbZG903GTvDpdXlSoIsIluyAkeryVFv5nMP7Xmn9QOv0w+drcyW7ePnkUWvkhPfE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+e1q37v3xYQ84yMmjGaizS2BnnPpBLz2Z1WDB5aUisxWFk0Nhz
	GfNUOqTdq2RpGo78D+FA0M/p9273rLYJjvh4GyX0YFAT6RFO9ZynKP2T1E2og063pa09sPB/ZiY
	nxbSYYwpU/koucW89moswckWGs1uA+D8eCVEXps291Hcf6x7vSY6qLW9oA12WDzoE
X-Gm-Gg: AYBFou0QAlccrZzv+QGyTD3PD0umUnzNHS2aFlyoafGjIfAAwESXJ2R8wciYsnvJY4o
	2V7obCe1vesoPcBoPVw5eh3soGztQWi1JO+eEDkN5TSADk6VdTW+RzcSqbPR8e6bwGE8PITNieG
	nNRCHRZyz8sLt2EV7YwSl7+SNxEiwWqPFE4aJH0T0ZSq95lPCgR2FSFxRjCBU8lb5CHDqpnqRHV
	ZhoU2BciPAuztNIoskT25Gh4KUb4X0QDVKBXysl3jZ/oH7CTCDTH5515mmZbmD3I/d58O0nHpvL
	KMfKgtKxR2ucPOWHCZ1Dwobx+gqGa3szg63xweeaH6Lrgj61la1UftiXgaVkop1DPIeDc2rLYFk
	g+I7CfTUuodZklp01ARklp057LTIibURkz9S5HOmIj3A23mvAjfpJrcDmbKDMRnph7bFxsL+1A0
	QWbbjUrMlxHbL2qbpSHDDheO9qLSg=
X-Received: by 2002:a05:6a00:94e3:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-8beb1dea1fdmr2808145b3a.5.1794582299120;
        Fri, 13 Nov 2026 07:04:59 -0800 (PST)
X-Received: by 2002:a05:6a00:94e3:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-8beb1dea1fdmr2808105b3a.5.1794582298485;
        Fri, 13 Nov 2026 07:04:58 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243ffb6sm1252199b3a.43.2026.11.13.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:04:57 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Shunsuke Nagashima <shunsuke@nagashi.ma>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
References: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
Subject: Re: [PATCH ath-next] wifi: ath10k: fix status of bundled mgmt tx
 completions
Message-Id: <179458229712.913702.1338158233604985110.b4-ty@b4>
Date: Fri, 13 Nov 2026 07:04:57 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: ngCmzz2h96g18xuR2FvfBr5sXfkBpnRI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX5yYVSTSDR/rR
 4ZgPZkftHmHIIrf4IkoF68LNEUQMfCqi0dUFTUy46LXDOYVmM1HtfWZIehYYYMpCq7YDXny9JTg
 eM67Uw9C4Ksmhyk3c4y+M9BMy8v8BGQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX9gcWA1SkD+CO
 SRxs+8zm5qzB4URxvdPSOsw7K6rw1NS/NTWAc7y07eD694a60FFvvQx+/uJzzOjbbPnPSbqOGP7
 D6jk6T25SS700hseTp/DKSEUyr/aCRDEPW4zf0J964Mwd83UGfl3LS+vqHsTO+cerVHoOPaSW5S
 ll1mcCol7c7xxs4hJJv17xBY8mpV+lX4ZNYiyyoOsx9/ElcNltyi6TlbSFZIE8LQW4BblZy+Z8r
 eip7ObOIepGYVtBZk3gEN3Me/MsF9gggEJWYI35XGve2Ioxe/F99GAlJ1wPorjpR4FcdRITDwYn
 BsFbPLfKYQfnERPF6XZufLtdZYGo9FNOyyfabRX3ZG4YVKP6s3+Wh56CEsqyewJ5wG4MU0O2xKX
 aNfK7y60ZmkEd78BBFfLE9NVqeE0zfXHAFSdt7kMrPwA1pVJNpWsSCmM7gtPf6REKrPNiq96pev
 7M4x/uqELMkyNDxx3tA==
X-Proofpoint-ORIG-GUID: ngCmzz2h96g18xuR2FvfBr5sXfkBpnRI
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af7271b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ALV8Qg0lGWWfAH_4w1oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_070500_479661_CDA34148 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 27 Sep 2026 21:10:53 +0900, Shunsuke Nagashima wrote:
> ath10k_wmi_event_mgmt_tx_bundle_compl() takes the completion status of
> each report from desc_ids[i] instead of status[i]. Any non-zero status
> is handled as "not acked", so a bundled report is marked as acked if
> and only if its descriptor id is 0, whatever status the firmware
> returned.
> 
> The bundle handler read status[i] when it was added in
> commit cc123fac978f ("ath10k: Handle bundled tx completion for
> management frames"). The commit named in the Fixes tag replaced it
> with desc_ids[i].
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: fix status of bundled mgmt tx completions
      commit: 51222df62c7af2f0f11ec25c9fa8bcaa0f87fac8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


