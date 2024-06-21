Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD93C2BBCA
	for <ath10k@archiver.kernel.org>; Fri, 21 Jun 2024 14:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1BMwmoqzLXEHo06KRjFqu9IWHMhsUsIxjoQ1LQTyLM=; b=X2M4BpZRKSHie4qehvmsbmnfVC
	CUlWvbj2mgm92x2ARbuc6qGTqmPNizpc/mvm2HChjP85ZQ8834DgbQbA9YGCOztqzK9owEfA2XMYv
	wHCZlQxvp/rL2OJU7Z4OJboOWfkladhtDSFlMVBunpApQ0nVm2kaaG8EBJvQlSeZZhYZlX1mv2lUR
	rnhY3kfJx1E6bDm4fXnZTMiVV95lfW7HHHBOVYiutsPZ3yiXvHx3Igw5bP/cF8YcSb31/1girA7nN
	DSQ+2M+sZA/oLUkpsR8dNQNjXw9JIL90rA6vyGsQ2r5kI7hwRBjy0l8MU1Er84exSF30IMDKd91K2
	cQy2ercA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfCd-00000009UXP-0rzn;
	Fri, 21 Jun 2024 14:25:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfCX-00000009UQV-3xJ7
	for ath10k@lists.infradead.org;
	Fri, 21 Jun 2024 14:25:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L69Gb7017857;
	Fri, 21 Jun 2024 14:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1BMwmoqzLXEHo06KRjFqu9IWHMhsUsIxjoQ1LQTyLM=; b=F9euOEBlLQ2nLuwk
	55co7xkoOPyTiMt2NP9im2E7H9WvTJ0JesspeVcvyaA/SVDLJKCJmuh8uli/0fNZ
	z+E38Ub2Hkyk46RK2jwc0VvQwFJVshPBPLCXBawCzq0odyCKc1G6RgGfiLzJOHO9
	ljcGni2DbdWSfg7QyiY3OwhMMMqOM40WJL4/2uiaIZ12nLzDN6rcEDNqJDMRBPpk
	2DB21LIda6vUBLQUpzilxH7xassrVgTsqeiD3m1ytFFJnpwRd+bZHXY0rlFO4Qry
	qMJ+N5psZ8NoVUmI3UzqfZtdd76gcJqw/biX1zKNGLfqtIDl7V4ov26z6+Cky0mb
	bRh1pw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrm0as82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 14:25:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LEPAJt008624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 14:25:10 GMT
Received: from [10.48.244.93] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 07:25:09 -0700
Message-ID: <d834ff59-f331-4eb4-91c6-e76eb48780d8@quicinc.com>
Date: Fri, 21 Jun 2024 07:25:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ieee80211.h virtual_map splat
Content-Language: en-US
To: Koen Vandeputte <koen.vandeputte@citymesh.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        Kees Cook <keescook@chromium.org>
CC: <ath10k@lists.infradead.org>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
 <efc8cdc0853a921ce4dad1a36b084608fe0b01a8.camel@sipsolutions.net>
 <CAPh3n834eg1_+gmh_LMTQnc95aLBWNVOANjZsMap=_szOY2nHQ@mail.gmail.com>
 <83fcb33e3fadb457466126255297899fbc4186f8.camel@sipsolutions.net>
 <CAPh3n80PF4NULjKJVVMEiGuuJZhLQszYSTCv+f6e9LfVJbKesw@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAPh3n80PF4NULjKJVVMEiGuuJZhLQszYSTCv+f6e9LfVJbKesw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WhCeEoPq9amMvIylEq0S7fLbQf1MY4JM
X-Proofpoint-GUID: WhCeEoPq9amMvIylEq0S7fLbQf1MY4JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_06,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=580 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_072518_302405_F9B1ADD5 
X-CRM114-Status: UNSURE (   8.41  )
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

On 6/21/2024 3:31 AM, Koen Vandeputte wrote:
> On Fri, Jun 21, 2024 at 11:30 AM Johannes Berg
> <johannes@sipsolutions.net> wrote:
>>
>>
>>> will this one get backported also?
>>
>> Why? It's not even a bug.
>>
>> johannes
> 
> Because without this patch, it produces a splat on kernel 6.6 (which
> is an LTS) at least ? :-)

@Kees, have you been backporting all your flexible array changes?
Or are you suggesting folks disable FORTIFY_SOURCE (is that the controlling
config?)

thread starts with:
https://lore.kernel.org/all/CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com/

/jeff

