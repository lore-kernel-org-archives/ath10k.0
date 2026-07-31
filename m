Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4E2C55162
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 01:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvsrvQy2V404Co0+jbZbMTjawqixijfS7FDoOdJXilw=; b=FNrrYyA1lPQ5xKxskh26g9wA83
	FAdcpUdfD7xtjXI+RtiWVGzxByVG6rXAeU5KOBx/UynC8h7ShEQtX7aRQJ8dHz7F5119wYs2SzKXD
	Ug2o6OSCRr4RUHVc0TYxVxOvzdWzwKzhlHYn7sguav8FWlYFe6ExuWOL3Og6W+wVGPDYI/Xvjdq4J
	oUBWuRTMv/eBp6x3JFmkqlSbePqRVf1MpARtw82NdR2sZ5sHpDLkrkmRg9BmzvIYMgKabL+bJBbFh
	LR9A2dagwBJkYPRJpB3cmMhmmvj1e6askAO292gUDSBTKvkAi2bMJokvL1qSZlQlpREEfZ4JS2gI6
	FYiboxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcGa-0000000BaxI-3QWK;
	Fri, 31 Jul 2026 01:42:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcGZ-0000000BaxB-2WfO
	for ath10k@bombadil.infradead.org;
	Fri, 31 Jul 2026 01:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TvsrvQy2V404Co0+jbZbMTjawqixijfS7FDoOdJXilw=; b=Oj2agOR0jWO8H0YEwJmdQmTRqJ
	vHXS2FyN21X4oa889b8pMNjWHajxi0yNrfnFMK7hplFxv9o0560/ICoMkg99ApXd2HfKKn6/r1hu9
	zHXEaU6P9vDrMiVwhRDWONyfAUKLwj8oIcmvF3EliTdwKUg4nMDyUTjaHGAqCGGhp7BHMRm4r9ZWx
	gWXKk2XQhI+RDeloWVXm88JEjuCROapaTYebySHpZmXqMfnwbqxYDcKHupMEPRBFKintLQnjU9Gbb
	FFOoX/3GQufWmauTn4irRaCg0cnDPaQnyAE2sFkSYhwFkUWjPiCLTxEu7O+uTiTXXKf+k8ySemEBw
	17hOEemA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpcFm-000000078d4-3ZMz
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 01:42:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V1KfJk2320026
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 01:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvsrvQy2V404Co0+jbZbMTjawqixijfS7FDoOdJXilw=; b=axctEDfJyDPPXp6H
	00S2/ZOi997mHr9xDi967jEVbDvky74eUGwgZbTnKdp9iecdsMqR4mDkSdBDruEu
	fAfHxtYZQXacWNphtUHK7hsfXp6u4mbx1rFjkRUItbBx9QkOyVIbXI4YxWQmUbwI
	r3rFUXb+czpu92PbCwP58guJOL+wKgdAD/2L7Vd02d7B3qnNim90kytDEz61uz5g
	6YQs5ikhr3wio51RFfdKokZNfWbAzuMhnlUFg1BATa3IyUwR+8WfEYLnFOcmQhHN
	kTSh1kSIYA5fHGXuCLFc3hBiFwcVb5wx2x9IOM5guNGmVDcuD5EH59nH7e9Mlvr2
	yjcBog==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frhy801sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 01:41:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8488ac68185so1409682b3a.2
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 18:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785462091; x=1786066891; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TvsrvQy2V404Co0+jbZbMTjawqixijfS7FDoOdJXilw=;
        b=BHMohq+lBE5pdzE2vKIKe0MeL0MWBBbFSlKOL8PACCLgWQhb11wbULiazg1mFQ8wKH
         hAXf2LW50cFlb4uk1EWdE9/0DQ0thEDr+t153/22/PBhuoYwft6CWGb+f8nV1DHkM+Tf
         UVCmLsOohecgS7PzgawTr88+8T//OM/l8yPAp1zLZnRW8qEeazQHdc3UvtAbHX3PEJHh
         Qo3Roy+vVUNU9eD3wvg9hTtDkfMkGPSXWH9O5E2UXA7aNfjGQ258i/fzFPesNGUY9ioT
         KQ0zp2CDI64ymr8R0Jtd6r4+x5nNGatFL0CvXWKwPUpHhHNFZveIeKr+urzNHZZ0d24x
         Dwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785462091; x=1786066891;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvsrvQy2V404Co0+jbZbMTjawqixijfS7FDoOdJXilw=;
        b=BpQ9FvtiNekr9oNAX+/VJatd/SGfDR064ffngEdQKgdro+eCOoe7nRiJKvnmwwuyKp
         VbO1FyZF7Na+fcOfjdmDuKgqjFhXVj1czLIKkhCxSVSaigCDiaWoMwTNfCGueO/LTpTY
         yBCurUQB0ZEBTB5+BLB00mVpejbjlUKdP7GOASKqo4H7LwAavjDgnVK0ZNwxr3lFi5C2
         jiPhWfPVtXeFOHjPCbjLnyKMZjWJW7JCR/ik9amqrH8ZiilpJhuSX9gfhh68GoagRYgP
         xIxePW0UJbB2E+NUlOA1qZ413HfRcVQ8iknW8LHsFb5Lgse/S79zkRAlTtxCfKn/1Idj
         l2uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSDcFe9NfPysWUNC+3juxPJ8z3ajMHfLwuD3tBQIyIYAvnG+rJIdWmlIzK3mXURfaRgV5Yrcc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNrBqdsMR1mo13LswQxGXpZ3hmLwM5RAGl6Vc+dSaMreGwHW3A
	qbO/H1/Nwt4FvrJhhZo3CcBnk1toZvdhyTZ2Eav5ugnXrGBDO2s4GqDMOC27NnnYJ+N7CAd0h0k
	SMK5+LZVIv76UYKUtmNBAb9vE34ms2P66IUXkaGPFowToQdQqGaTTmKXn507ll5wp
X-Gm-Gg: AR+sD12zWgV7LdO+BlqBDxbhSvSccKUaxAHsSrLTSknSgxyBnpJDNjsHdwFENomc4Vn
	cBdsVjz6n0JmADEuMqQ73suoaaCyTMWlc4zDEZds5QlFeCqwuIeL986L52FNjXtIM1OsPgwwmqv
	J+x2hydCMcE/Jlkd09r5YLADft81Hj8nkaXc3nu49dhO3/A2uZMrAgRMLozG2+PYTtTRHXwylUE
	wB89oHWUgk7yWMYzcwPYFrxGdRgnn5fA8qxpHTCL0M1cPYrzEAbyoJsapXIUPf7GUQ4rDAoDUSl
	AbI6XY4Y0Cp5GbUT1kNTzYxMN3FOCfej/dbwiOAncLdEg5ZENeo9TMwy3wXMLG3xLbNCFrbHwG9
	kmlc0CsRiStf/RcYiwfIJFZGOEP1n39BMwOVlaW7lGaePiyVLrJJAUCB98GBmLMx5LoqDnbd8bg
	==
X-Received: by 2002:a05:6a00:2d02:b0:845:dbdc:8652 with SMTP id d2e1a72fcca58-84ed6d29e9bmr48093b3a.2.1785462090858;
        Thu, 30 Jul 2026 18:41:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d02:b0:845:dbdc:8652 with SMTP id d2e1a72fcca58-84ed6d29e9bmr48077b3a.2.1785462090446;
        Thu, 30 Jul 2026 18:41:30 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5db8d36sm51110b3a.35.2026.07.30.18.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 18:41:30 -0700 (PDT)
Message-ID: <ca84a4d7-ee3e-46d5-8727-6e412e3e7416@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:41:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: filter non-UTF testmode events
To: Linghui Wu <linghui.wu@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730023226.707008-1-linghui.wu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730023226.707008-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ST261ieIGpNvNvW_g29KwenKjMd92rfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwOCBTYWx0ZWRfX61uI1MaxsLdr
 56ka6djUhZCYcNTenuekKINM1Cm7lhB4sb7EnAIksIdGGR8kHhfR0hPmaZnInTsAKAhDf1svDBK
 aVFuOgKVhxWKBm8kHZG6+C4vluBbzGgMV24u3L5BT7RP56/y3usqzAAg5kMTw2sGiFZAXEPewZV
 nzs7dAks2c+CaFNorQalAyLL236K/SA98F6pCckw/0I88uPJld4P1wVX9HIfIP1ZMOLv2t+lbcF
 lid7UTv7dMJK0HZJM5ZKxsWrE5TmDihD4VR4W3kyFYinI5zVk2uonGTb2TVXOUGGo4rV1xRB++/
 X74e6gxbZabd9ozLc7FCJa8HSuI7nWDhO4MbbkHxBwO90fewHRu8fxUP9PCpLeQEdh6PWVrltMd
 oTTKu7AEtBb1buaOxrJ3IbuPXOVFeli7CkOnATVDr9zzMmcd25ChqKaEIZ2Ecw1ricC2G+dXEtG
 wUdFPOzoGFzp4j+zASQ==
X-Proofpoint-ORIG-GUID: ST261ieIGpNvNvW_g29KwenKjMd92rfa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwOCBTYWx0ZWRfX0ckcAT2CUaYz
 qk9B+aPjhTpIrtK5CjopZw/3X/7XR3FAWc+LY5hNwfWqoo0xeqtXDCwn7C+U2Un6ofRosxVvtXJ
 dWpswakqmuZfdrF8YT4r/Wws17kZIAg=
X-Authority-Analysis: v=2.4 cv=FvU1OWrq c=1 sm=1 tr=0 ts=6a6bfd4b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=J8ee_osQro5uhysJbSQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_024143_382910_F1E920BD 
X-CRM114-Status: UNSURE (   8.84  )
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



On 7/30/2026 10:32 AM, Linghui Wu wrote:
> When UTF monitor is enabled, ath10k forwards WMI events to nl80211
> testmode. Non-UTF events can therefore be delivered to userspace and
> confuse FTM tools which expect only UTF responses.
> 
> Only forward known UTF event IDs from WMI event namespaces that route
> events through ath10k_tm_event_wmi(), and drop other WMI events while UTF
> monitor is active. READY events are still handled by the normal WMI
> receive path.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.3.7.c5-00093.2-QCAHLSWMTPL-1
> 
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

