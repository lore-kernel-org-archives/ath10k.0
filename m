Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7406CCA464
	for <ath10k@archiver.kernel.org>; Fri, 16 Oct 2026 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R92Hgshg0R8xysfps3KhIh1Ju04mP4QjU7m2262gaOc=; b=aFa87tEQLpAf1N2r2pr3wQYYL3
	SwQMmFQBICKblylFD5VXFa4OAYnZq+SJ3kc8PfEFSpVnf+eZk3/JnYqwIuLDotLRAA1OoVV5DAh1r
	IJld716NCPjwFiIr+zVtwbFhmQSRRpa2bTBGPM9Cg8cPsZ3Lq0TxaKHhluVAJQneRbnOYeeZyo+mA
	rYwuZKgFOxQtDQNusfocG2L+sAj36QB4R8ihjDt+TCKDRUtCx66AAjJQlUqfhpoAvJXD0fYPg+VcK
	E48gMVNqe6AwIu6E7aan5PJb171lq7H+fDQTzkwppHoJIeLX9Dtoqq3Fm8RmKNd60ilFcR+wKK5jv
	AXptnGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdYo-00000002MVi-0Zl8;
	Fri, 16 Oct 2026 08:45:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdYm-00000002MV0-16kn
	for ath10k@lists.infradead.org;
	Fri, 16 Oct 2026 08:45:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7HEgn1635430
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 08:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R92Hgshg0R8xysfps3KhIh1Ju04mP4QjU7m2262gaOc=; b=jA4GxnUtkr5VlKEw
	Z9HgNWJb7ihY86KYDcbXu90722ThYb8uPSiBLcUXDdf91UKXDS5iSxfQdErQMyYW
	GlS6tBMT9bl108KAo57kxJvAWiiQ1s+fPf2d/MlU2fbOPlui3dnGVuoQFZW6XqxO
	Pgn2VriCxhqL7jAYka3/0HPal/5Qu5N0kGInBnMch8fDaSSj+aRB3zitbsFui9G/
	XR+ryinq6R9dOgLhQCKAPYsw5ybcU/raJNnrX+aPqacu7uUXQGD5ohWA5FzGP+q/
	7+6P8dunKmwb9W79IwS4dcMJ3XRczuIS31DOlvm+B+ouAWYrVNCKrkiFw+um1stZ
	mvaT3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11qn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 08:45:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4211857a12.1
        for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140303; x=1792745103; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R92Hgshg0R8xysfps3KhIh1Ju04mP4QjU7m2262gaOc=;
        b=COtJqTyXL5BX0kf/XsWe5KPTtCZO199bL4hrl+0H98ADfUQI4R7HBesVtDawSArK4j
         FPAINsVOpzfGOXfrvkt38ejqT09jVzZ4ZtAwso+qWvYSHQPf/Gzm44zUXY0BEtJBEh1A
         LjxHcsRn8K5czXUJoTE+KfVJTW6zIpSYGPy+O6HrSfk4ZSmOm591TYKMNadCHOR9gTD6
         AjpUXNz7M9h7Kig7e0u0XZRxCg5r+H6MI93NPqPP49jc5YEi9timkktR54ekeno9xZ4z
         bf8lSRxB+SDnfPK4J7/jUl+E4U+Gz7ATkdo3g8TM2J8wr43T0/Tb2o993RQhO4km5wI1
         78cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140303; x=1792745103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R92Hgshg0R8xysfps3KhIh1Ju04mP4QjU7m2262gaOc=;
        b=pE+C+ET0PM6pOW11R2crNJTPYk/MsjQuS49jIGPL8cF0ww8+OyVYpTGqkT/+ZlbVDc
         x+dxqhjmF/vaqxrKfkagoe+B4eozRaxSzyY2clYtOaSzw9KGqKmVeuWy1KvqfO01tNWL
         VuUGbeLIfqyANccnUfg6/nCgpJQnk4rX5txd4zgORE0FIYB9iztjuVLZ0Ze/BLMYQgms
         1hUs+OSVljUrKlf5FlV1f6BQQQh+K4kB8KCUzSqkejPhjubXWpMZ7vl/1RYu8Eo/4HI9
         F5vLJCFeFaZK0rHu5vZJQbqZsyf/Z05Xi7kkiXGtzKJYVqgY79y7MWxSRlzHVsTKq8zZ
         6PxA==
X-Forwarded-Encrypted: i=1; AKwUvBw1hFevjMFOyX+Z3zXQEd5BnegIW5H/lToBF+uKDAvV4w7uJJdQY6l731ARu1eTcPMm+GmrXRc=@lists.infradead.org
X-Gm-Message-State: AFq9FYJI5kyotbFz8rUxXxqgJGOdo5JjjmM0QtNpKk6TFnuipNKxpkgc
	pI3HvIfrM9/JFPpZdE9Pd8ARrxV+604dUKQFrXbvp5aFEhFyBKupSz+tnHsL4yU/nbGS/wLSlfV
	OdE5+vt6tfL2G+5TfpKAOZP9Iflf9iMe6tzzVHOcygi8PIqgO2uAlR9WtF/73XQj+
X-Gm-Gg: AYBFou2FybBvZJPUW41rxTTweME/wobfjlpV9u6SsbyejyMHrj5GIuIJlZsQFGbb5Bi
	bryMI2bZsb+WM2wi/zCphQfx9Yc3UUOZwnRJ+f7EgSv3xgKqNxd+ilrNnG/3Hk9tdB4T3BWUjVY
	Qg5j2ymvRuMqVa+UeckX9nhQceYYLU87Q6yCOi5N8zOHJ7Bh/JfR3cwWbCPORZqZBnkWyhheY1n
	lwYU40KasKHFkbBWQs5TcZ0TG2CPUcfe8FHs2WE0dYDZOZqxJiVWYx8/1w/7b1cCMu8t52ViOjR
	84UyXAb3iLPFjd4ULJzsbeeFQcpp0khv4TOfZO+vFLSw75Y6zGMU5D0YfeWZinOYN4rTsmSH8dp
	mo8xO/VMbQnqroPeT5Pr5imS0aG7Jh2w/JYc/7OVi/jPcYOMeDQp6xuj+sl8xJJoWr3M=
X-Received: by 2002:a17:90b:5343:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3ab3a94f288mr17450778a91.13.1792140303023;
        Fri, 16 Oct 2026 01:45:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3ab3a94f288mr17450767a91.13.1792140302515;
        Fri, 16 Oct 2026 01:45:02 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd9c4b4eesm1029557a91.2.2026.10.16.01.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:45:02 -0700 (PDT)
Message-ID: <b8554d8b-6671-4fcd-a455-b5f92cd31300@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:44:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-1-14baf913df94@oss.qualcomm.com>
 <b0f4fc0b-3c42-4fde-a4a6-9263695b0325@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <b0f4fc0b-3c42-4fde-a4a6-9263695b0325@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _q54v3eNxZXfkkUIo_uVcDTQUxiRX-Yh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX/nEfK3tCMYyv
 ij83IsIfLnGk+eFwTGMyKXTUsKv83LyX+L21YezQv3p1ZFCv+O9VxrI1eiueWP9/6QQMVbjqolb
 YzezDmVwLdbDuonnsbbSTevkJuOdvuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX2V4r6gqHYFFP
 3AisHJd4GJeqpDBY6rHGlY0Tx8ce6SUMaDaBwBT2UefHoaQupUyEY0ULci8nmO8nPyyH4UtWsfE
 myDAHjxkcyp+rI6ZPIBW1cl3QPQ3JRSUw79xu9PbQwR/Yi1q8bx9Uu7yfE50VQQHf8IQcehSvqc
 X/dJJZELiTSmYi7IbYMl+ExpUkHzlsidWRi/97Pwm5nbz7fYhOoxwVfjIH31JIXX1tZXA8nhpSd
 nPy90khc2LWRRprLj2c4mnoUFmiRDFeFEkeXfOAcRI5s1z8xSSOPZC+dx9+ibybSp7xkpTovubA
 Ob6bfw0R92UxgEvhtvqQFeS26aVjaTx2+gWQGFUsb3Z4iXb3fSFC7e9vi4H4YjUxwnvaJd44fjG
 Ku/2fn++/lNsZlRknYZslwI5hSqVe6s1pAj6q2+bqk/RwZNKQu1NV/v1PCghz1h7Ur34ELcXZ/l
 Bi6a7SAFEE6jzlIxJDQ==
X-Proofpoint-GUID: _q54v3eNxZXfkkUIo_uVcDTQUxiRX-Yh
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1e40f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=0p70_H8JvZq-mLLo2zkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_014504_302376_CD3A736E 
X-CRM114-Status: GOOD (  11.09  )
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



On 10/16/2026 3:34 PM, Vasanthakumar Thiagarajan wrote:
> 
> On 25-09-2026 17:56, Kang Yang wrote:
>> Recovery monitoring runs on workqueue_aux, which is also
>> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>>
>> A single firmware crash may generate multiple recovery
>> triggers. Recovery detection currently handles each one by
>> waiting for recovery completion on workqueue_aux. On SDIO,
>> this blocks the same workqueue needed to deliver recovery
>> traffic, preventing recovery from completing.
>>
>> As a result, otherwise recoverable firmware crashes fail
>> with:
>>    ctl_resp never came in (-110)
>>
>> Treat duplicate recovery triggers as part of a single
>> recovery attempt by gating recovery startup in
>> ath10k_core_start_recovery() with an atomic_cmpxchg() on
>> pending_recovery, and by making the monitor path check the
>> elapsed time since the attempt started instead of blocking
>> on a completion.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> 
> Since the issue is described from SDIO point-of-view, it makes sense to add
> SDIO hardware details as well in the Tested-on tag?


Google is doing detail test on all platforms, will add test on tag after 
that.


> 
> Vasanth


