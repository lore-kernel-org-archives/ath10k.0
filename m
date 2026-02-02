Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE1E7316F
	for <ath10k@archiver.kernel.org>; Mon,  2 Feb 2026 19:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ8y5+PVjay3aBmGZp6XfLHQUAIFjaNa51s0u+O6XUQ=; b=vCZRgWWL8ClZU3HMoDvryUyYQC
	2kNo0nlG8RfYn18lmp0I4uylgnIIa6Ck9s8OMt/MUEABg/hCpjwBWgB4vuNZexZsNU+ZZWsdV2h2P
	xPX9tklIMQ2w6NvNzTs3Eicuw1eO2bQDprW83y8IFB5istVaJpL2MytO/E73h4Wm235My0VEHcZuV
	EJVkW08MOOs9LMRuNWFnLqpbKNrA1tA234DBaVMXGdTCBp/CxKLeDYQSax/V/EP4S1od8QCoFz/zo
	i+OPGN8NNgJ34EQwD1/L0qiogw8ot+ic+4ebSMcoe33pTSDFCOhRezSS9SfKXalgp9sOPcaElduGO
	bcdJmZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzWS-00000005Vji-3Q33;
	Mon, 02 Feb 2026 19:23:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzWQ-00000005Vj9-1jeQ
	for ath10k@lists.infradead.org;
	Mon, 02 Feb 2026 19:23:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612BAMk03082894
	for <ath10k@lists.infradead.org>; Mon, 2 Feb 2026 19:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQ8y5+PVjay3aBmGZp6XfLHQUAIFjaNa51s0u+O6XUQ=; b=HIfwsHAX/y+UpLPq
	XwYbczIpdWnfMFH3Rdm6EEwjHjAJLrsuiwR+5n+hXNQeKtfavTOWLx/X69BRbhws
	G6nLjMDw0nGGprHaqS3ohvlye+M43z5Td25qAF7Stpa+IQqkXMzdACntVGIk+DU+
	hBCYf+lOhWs/ZmRXfcquodgSibQJRkcwOTsYMWb1DXCxUBogCKPuUHbXDs9/l8pz
	+cNs38LPI+MPjltpdMCmbkIjVzM4NW7eWswRjxqjmz2nUEbcUSJzJfiBFSe2RHEJ
	d+/a3ObLS+6doR7WkgfPCUtxvFthuV8rdK5VW+ibI5yDGcXKgIiMZ9U1g8yL2Hbn
	gwi3/w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2ttn1j6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 19:23:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b7ef896edcso8174394eec.0
        for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 11:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770060221; x=1770665021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQ8y5+PVjay3aBmGZp6XfLHQUAIFjaNa51s0u+O6XUQ=;
        b=FXfHidH8PSedKmQiRTSxrOguuMFtnRPHXnYzmJCNu53yU0leRFJAyYx9X3mL0UEdKV
         +MpmjAzn7RhbvdjnnyVNwrCvBWQWJs3KUsIeFStjto3zweITWlAtZDBM42Wrog75aeMb
         PAcANRfveXrsIwp5UFl4cRh9jVrC8akEII3ymVYVNR4sIge2dSgtD8DqhU6JhY+eBAXh
         c590RjBN606Oyet5jRk8eo5dx5Ho3CATJ4GayBXhixQnNEgTUP4kTu+DLHwAlcXeGcIr
         rX5irQeCZY+KU7SRqDEF+a2gbCAyyTEXh7IA3jLK7a6RNdC3+MZ5eNadaHyp2s1VRVLN
         29kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060221; x=1770665021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQ8y5+PVjay3aBmGZp6XfLHQUAIFjaNa51s0u+O6XUQ=;
        b=xNiwDRvDFofMiYAcW7sc2UsU++YjrQZezDWFsOP8JL44pJ4KRvLwEkRw0xedLOAysy
         vM8zXmn1pK/voNrpyZbVqP+sSWH9xx2N2fcCp0lsvqPK7XfZPKD++GyjLeblAVdEzUyN
         U0Q6pfX+KWrytRaRpgfFjxlWsJpTopsoEprFZbBQhNej7nKXepUWU3cyGcWOlQM/u+FB
         3sW0BpYbqwQ8chFM22bIgCof8bJWXqosrsa7ht6dtVwNDeJkvY57ZxchN0wi98zbLkjt
         7VX5j1Ux+MNFyATQeJU+GmYpKclepd23a5Njd3Q2RD60Wz3XaCV99jV7wCVgVWf1YNLg
         zA6A==
X-Forwarded-Encrypted: i=1; AJvYcCWH9f2GXW4b3QwIlEjfg2LC1Dl4b/BZcbMHKeWaNfrwIeDOnw85cx2J0RTSjd/AMz3ggq5kB98=@lists.infradead.org
X-Gm-Message-State: AOJu0YybCG6N6RT6grrEtqTyIskRNEYTWqdFU4yz2wm8Aw4BPsHIk94/
	rvjE8Sb63yc/XlrdA+OdGAlt4YSMOci6TZ5oi8cT1UyyTfXXEB1JL9m3YmdYUQYXpYG7rlAebWN
	I3NozGRgxtO9KqeuDuPBkbHyaWBz1hkNzSIOk+VneAdEwnC3c6h8XF5oKIswglwOB
X-Gm-Gg: AZuq6aKK9spe9dtuzVkDHVrXTNtO4coD8D+AB4Sq45VnmwIxsb8MLHgBTvIFQyglknb
	393+s1P7Go7trKR7HHuoNU4xwq4ZXNroG006tJe6YWuU4L+LQThswytUdSlekhryI6kXlVuTBCx
	TZi6yognEI9DKRCIvdrX+hv9p6T/9KxXl0GEK4zRrB7LxSLswfL/xqLu4DTgqroV9FUFZU1YZo5
	kM2jx7/ZXPxlxGsfkkNmyqj64CHhQYoVMon7jZHwMhadmKm1PEo9iuHeNactkaNwvyL0K4MoLw1
	sXEl89hDa9+d2oadrUzLxbz4YC4aDi0LrzMTn32Ucx5w+w2emXxHP1mdg4+MnkAiPD0sbOpE6kv
	YEnZRVl1PeUHN9BgPjfwlqqolqpNM+QUWy9wb1PXEqb8o21wtJvZB+/bfUUBoCMz4lhZV+MTKyu
	z1pQ==
X-Received: by 2002:a05:693c:2d82:b0:2b0:52ac:92fe with SMTP id 5a478bee46e88-2b7c88e3353mr6358373eec.21.1770060220959;
        Mon, 02 Feb 2026 11:23:40 -0800 (PST)
X-Received: by 2002:a05:693c:2d82:b0:2b0:52ac:92fe with SMTP id 5a478bee46e88-2b7c88e3353mr6358359eec.21.1770060220201;
        Mon, 02 Feb 2026 11:23:40 -0800 (PST)
Received: from [192.168.1.40] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9e06d14sm21765607c88.15.2026.02.02.11.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:23:39 -0800 (PST)
Message-ID: <00f7ae05-27da-4417-8d0b-afb14240ffc5@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:23:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: WCN3990 hw1.0: Qualcomm SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ath10k@lists.infradead.org
References: <aXn1gGi5VLMaWTDd@umbar.lan>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <aXn1gGi5VLMaWTDd@umbar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ANnNY0ku c=1 sm=1 tr=0 ts=6980f9bd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=dbFc3IUozLNkgXpyOYIA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MiBTYWx0ZWRfX7OnxSavhLQK/
 3vQDHlFsZ5Uo7EyzVDmTM68u/U49zL/lB73pYE/920BcyNLSpGCiklZ0CqEKoS9beSki2bfrnbv
 2cffiyMbMJNE+ZfUpNWmTE/r0sVL7lnZzV+bchM/UdXVqmoqciXSAdRMYRR5m98gZmbxf8SiXQ6
 QIqK2BcEB47uNtoBTGXT5VUGCHHnqU49ywbCvoVczDKgV3mLe/jg/aAk9VMMMDpNNOZcrxVP2YX
 gOWZjlxByZKImngS9VJmgvnS6JBs+JionluWnhAw7SdGSPsruWbuExKpmY8XUMlB5qCcqUaTEA5
 INyCjf8UwiChVaw3dWseMGF7zcrL4OnBrS4sHsBf1ZaUKHyl28VIM7OZsu3WZc4glkAVXW02zi0
 Ejlpcab09kNsAGXnIap3pCDH6L5GQFRF2R+Fw3Tr5B9rjXt3MJiAWoYxssihVHz+S6JSEHhmB3E
 uArmemth9RKVNqnMRkA==
X-Proofpoint-GUID: fR4RUAnpWRI2kih58HNkPQkb503dkJZc
X-Proofpoint-ORIG-GUID: fR4RUAnpWRI2kih58HNkPQkb503dkJZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_112342_481516_4493D207 
X-CRM114-Status: GOOD (  14.20  )
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

On 1/28/2026 3:39 AM, Dmitry Baryshkov wrote:
> Hello,
> 
> This is the board file to be used with the Qualcomm / Lantronix SDM845
> mobile Hardware Development Kit. The DT will be submitted for upstream
> inclusion shortly.
> 
> * description for what hardware this is
> 
>  - development kit for Qualcomm SDM845 platforms.
> 
> * origin of the board file
> 
>  - extracted from the firmware partition on the device
> 
> * ids to be used with the board file
> 
>   - WCN3990 hw 1.0
> 
>     + bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk
>       md5sum 8587c755730f08fbc816c9664c0ca6e5
>       sha256sum 67e9fad4c9959a7d5562b04c9f9f450de93ae22b835e14f697353507fdd1bbf7
> 

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk

Changed:

Deleted:

1 board image(s) added, 0 changed, 0 deleted, 34 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/2647fea84d7451b42b95dc379391e773c1cdae3b

