Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B95C5AD4E
	for <ath10k@archiver.kernel.org>; Sun,  9 Aug 2026 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=; b=HCvbrwNy+GH0kd1RAHO5ZO60R5
	x7+pC1lORHnvVZlmdaGEepCVs/6NqRDXHcBC3kkJRq7Zv7Yqdypl85OB98QtRz3/xDbW5ckdJJdEN
	NEmvAs0godYUSw4ixl4TXdWbete15PK1AAcVLM2RVMG4g9J5qYhuzBKF5sIn9fv2Gh+sGWYFGdYKx
	h0bp6XNyRsCgiZEQ7bATURZIT9meG0GIBHmM1dFmIJ8Qccu0fbynjl44pe6cMquOZo6SBb0gpK4pw
	8JPE6VEsHd3WJoeQBiCbMlGw5JBbl81h66utbKY5AtSUFjy/mPdyLhg2gGkkqt0APMSEXvVy37WFD
	gMX2UqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtCxl-0000000ApTI-0pr8;
	Sun, 09 Aug 2026 23:29:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtCxh-0000000ApRv-0VPf
	for ath10k@lists.infradead.org;
	Sun, 09 Aug 2026 23:29:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679Me2sN326170
	for <ath10k@lists.infradead.org>; Sun, 9 Aug 2026 23:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MgifLTeWoPs7xR+NoGmw3cPD
	yJjBTZUCzAC0a9BDorI=; b=pg3axF+Hfg/EcnBJkRW7KwIiDyxAwk8LUfQjgKPP
	egMjGONOwsURlCbnafIb1A3SLZMngJxWpEly9lvrnFWRQwtAL02CDxQLDYETMmu0
	2LCKQrg8s+wq/+P6pDGQv7D8fGhk6/+IpgJm/omRqFID4jq9UKrHh2Scz+cvXfkn
	hlYjVdJ1yofirNpuz5DcNfekL5ICEe8AZ1uNsNgpTQbjNpw3jGvkxh+7ns2FAAGj
	aFBdQd8ph+Xa3niJiw8IlWlBrbXJOh+c1iKvkuXyMZIMwHeeXwxCOBg8WhkfTbYM
	ikXaJpf06Nx3MuZLuKzeWbPaROmi/XBUpLDjQzthBonGVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqkt9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 09 Aug 2026 23:29:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d28f8737eso26535871cf.2
        for <ath10k@lists.infradead.org>; Sun, 09 Aug 2026 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786318187; x=1786922987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=DnBAbsHSkmSmHVYm0B4xQ9RFAW0mJLO0/+N9UPQ9AOFJdRIGwnWuDudzJgebFamKRA
         HRSKbfHro6bb7lB8qNY4/SSmW68k1PzCdyfFlAgEe2r74sWbVrfEpBGk3XBkaoGiUYx4
         hpFZtLi5alUfTeFd9gC90zYibV32XsTKPiPXUtoTaSJr/rla0gRTXUUx5cJdAcgOcDGT
         vmVgLxRUAGkLxgnKxgs7Uo8VS/xO7pgb95bamjpARRzPX52Q5phrO4jjFTjd0iL+g+/i
         HDrgav+wvDYld/Ah0yrccRNC6YP1LqDe9BGOwMEN9sENLxoCdgo317f+gFPT/iwgNlVh
         +SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786318187; x=1786922987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=CDb19RrzR4iCXTsPRjisebXXCaNNp8cpv03jwi2Ls2joRJnyknwrLVXFfpXThCG9DR
         WMeTfQfGcAJLVfUuM5KBty82eA4lN35f8cMT39Qw9OsLntTCIfZcAf6Pq6Wsut+Gesh9
         S6cYfWuDxgU1MquEUml1VX0vrY/9aWaMW0hqZ4IAdqzpNEZOFeNaEA+f84JYQOeWnvss
         EmLdw2EyVeHGBq7BvPObaxAu5/q2VNtjxPC8URJ7EiEBfeuD1AZDpB8DEF5KlDvFKpzD
         RnJ0AmfbpJywDabSp7dWJkTSUYirJe4GGEav8/koCj2RAREDM7Ncoj7ERYVRIb4NjWRW
         w36Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpajg254KzfiWr9LwA6SOq98fCbVlp8ePGxnxIBaPsRTv9j8Toz+QL3NjGKFLM3MI1klvbjHgI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+WlbW9TCk21tKcWahUjxPWzXTznrsgu1FprzPDxr+aRuBUAgv
	l/MePkWSnfZ+9QLhK1RUGK9JoukWQvP8Fo8m03PeYP/NT+dOAGXB7Llzv1MV5teSEhW2d7bdWcK
	vODmjt+61zXmyh90RR0iesSe+TXjUmI5ANXx4tf8Q5qw7+TWOGPlIkckOT8oNUBaR
X-Gm-Gg: AR+sD12O7Y62eZELh0i2GTs0qsYsEzjAD0WEV/PYI9wvZkMib+e69FU3VXocvQvum2Y
	odaXzipagTRM5pn9TP0SVaeMK4fNE2dV8pa23Rf2UbhJDR/Up8MCJ8fat2YKOG4V+tEPW7rzhEy
	/VLWrNMr/kJHBlfeydxDu+rZqncM1aEyj0DRa3dIv2yryEuWv51JYbtE4VLXlxmcT2qu7wR93B0
	dt0erMQeytVHuiPrlnyGyGr0fhB5G6uR1VBPnVaxjy42AhNY7u5T9sx4FkV4vBf5bACX4WRcsCU
	n4K1myadmQttyN9AJLNaCKt2rigDUh6cgt00Y66ta60mlDUY0pZhPrXsKYqQ5s9hik3+81XrjE9
	PAekqhMv2JRh7Ot1897MCM7ZWTIWC1qLZvea8gq1tVMA3B/wE8bznRL1kV2n9t144aVWRBf0lqT
	iKxYkQyIkjHK9Cyw==
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180714041cf.43.1786318187225;
        Sun, 09 Aug 2026 16:29:47 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180713581cf.43.1786318186682;
        Sun, 09 Aug 2026 16:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050d011asm1631111e87.32.2026.08.09.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:29:44 -0700 (PDT)
Date: Mon, 10 Aug 2026 02:29:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260809
Message-ID: <fj7srjlprwhlbgjkk42uafcjysulte5lbw342tnultbhyijx4x@yxsgw6awrsnw>
References: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfX+E4Qj8y8P2h9
 jHWmh2aLofpE/yKeU9GbKi2EG8zpkFJdGouoJ643eJnZ1QdMDqYWVhdSbAYfd+5bP8YCDQAQR9s
 DeNLT8vVIu1l7WOOz9lES66HbU6uJ7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfX4Xug3Bbkt7z/
 Qxhy1ceil84KU8WXv0lalojTa8IXqPea1rM8dXqZxHZhj2ec3IJmMslE/DUsWTV9b1pnacH9MxL
 yIC7Kq5ylEDdcShdukE//oEaiivFGiyCeHpc3ffICcHpXAVH4j5Zuvp5o1qLLPt72FotOArQUdb
 0EIKfNOhZWNPCz0cHnnbUTQ3JD5X/dPH/JL0kbkOVnBOrS0/tal/J5UuiSkcO4MOpNspWZvBQJh
 N45PDIO+4wOHJn1PEwbPc8mkRx+RR+MM9PGW04wUGZOn2qWMkpN/bk+MARflNF0TgeqLdY+SoCo
 3kBYW0v5bRfXKKk585k6C2VrDFZeTnB5NAsPQLIWa52pfRDgZ62lfKh5jxjwl3GKAD7A7ntHvcH
 mzJJKoFxWVkNpRu9e9LqhNC5oOsZXFkY24juHixqMNsDPKFkR8L5LLbDUHyzJ5/ISUlo/VlJyJR
 Otk4O8FGo+W3k9kjfNQ==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a790d6c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sgycOA3r3iSsy4NO036xRUCYsXaCxkBP
X-Proofpoint-GUID: sgycOA3r3iSsy4NO036xRUCYsXaCxkBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_162949_255132_22E59C89 
X-CRM114-Status: GOOD (  12.33  )
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

On Sun, Aug 09, 2026 at 09:56:35AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k, add board file for WCN3990 variant Shikra_EVK

Thanks! Merged and pushed out (for some reason it was ignored by robot):

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1171

For the future pull requests please consider including a change log in
the commit message (so they get recorded in the git history).

-- 
With best wishes
Dmitry

