Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC9DCCF9E5
	for <ath10k@archiver.kernel.org>; Mon, 27 Oct 2025 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJ2kKGhDsXRxoSktfJs/yjQlW1TNVJkOf8QNj2m7qgw=; b=N36OQuLDX1uPpgzhp10Hq+JrYz
	Pz2U8BYlQPOCwESWG4rn8OwGtds15uwznYtCVZbJZR0ZmTJ258x8cTqADsrD5IHo4hZq1nykaadVZ
	k4uarEZoFy5YoxGEv8d8WjRPG5uAGuq/LIwb0n0tkw2QbcaTpo5za7AYN1ilNY3EsffOXOLdmRMZr
	El0gaaWbGpb5TOwP6HKBHdQqWyGa4gYUlRtG8tWEh0TKAxF3zyLDWmFJdHs/wV2dZCp1vrGFzM1hM
	/iZqKm4b4e5PWcGKQM7Fww2ILuks3CCczUDFSz71bveMYGHi9cpFSK0DWWMmOUGuFkCzW0Q5ds0EQ
	KpCZ7PiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDO2k-0000000E7yr-0fpH;
	Mon, 27 Oct 2025 14:17:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDO2g-0000000E7xb-1TJO
	for ath10k@lists.infradead.org;
	Mon, 27 Oct 2025 14:17:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84ulJ2232337
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 14:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJ2kKGhDsXRxoSktfJs/yjQlW1TNVJkOf8QNj2m7qgw=; b=IbxCOOrfwhvCxibv
	bmp7+tCrWaA4AMHoZUvAOiUHsVDkU+eOQopiQOteSfq0o0eXof9VUIe7jzC0gfRm
	rnMjtWADZjQziKv8BRXwsX2xY8wlaurUh/6vuWTLoQmi3Yh4VzqACQ/ccz2CH5cA
	yi7s00wKo8N1Tpu7W1Yb8nVRzfk7yq0pPudjxA+ysBRV2wUuMf4lDxzTKbfxFihj
	t+GhVREJw33Ok5rlpPrn0FfrZM/UoekR19MO/qbasECXOVqLygtrwXslWwTVBsfX
	wGiXaLSIt6CyBYnWRP1X+y6JujHpsV9ctuucuGDnUJnnWhekCaeDoF/XxgAN+kWV
	5jGQIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn91y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 14:17:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33d75897745so11092351a91.0
        for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 07:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574668; x=1762179468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ2kKGhDsXRxoSktfJs/yjQlW1TNVJkOf8QNj2m7qgw=;
        b=QK5OBG1Fh52g1ciVDBp0bOWHA9fSY+Zm073YhCH5PB1QzSrKDC7+m2mC6InHV6S2c0
         bQPaFSUgV9OF8Pq12PH/z/DthFAA5BzHKBwyFGUE+Y8mfT+aRpqSPGuGPbGe1dtizOlw
         oOumTyP+8RcS7gVljSUrQ5ZLuRu22WbFBuDYLQ3/46I+xCkndfz3uvSZD61MyaIkf/6t
         Bd/7Al9xzGbzmqOhqK0AEefB5kjKRD8a4FSxN3ewgv823rrlrISK/oy7xXwY2SPyVSrb
         PdxjQ1LMi+kL6l5cU59SW8TM98C512s6ymq5JQvMY4qqP0a5PwxxVnwaNeHpXh9NZ/Sx
         plPA==
X-Forwarded-Encrypted: i=1; AJvYcCWKFbDgJUBqcVKyI/9FBT/L1ML7gBuhyfzmq8Odzb7HhV9N7RG6yo8j8qYeCYE11L6QmhQONB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOY46+vO2m925t7lGd89uR0e+RHIukR8eIIK33zpiHaUyhpkzH
	uXtpQE5mo2mebglWjA3rLIITaZuEaLQR9ejgpIDpWRp5wjLe5L4HPukU2dVmAVNwP1FFi0pbxnN
	W1u0YtYie24d+vdHH35ztak1Bk+SJGrgP/inJUX1nFHYJEYWZ3ap4xnx5guBjoAZ+
X-Gm-Gg: ASbGncuC259WSa1XUNxJph99ggKMjJBGlN+iLUGhjSFZFmvI4EW/smNXJlzUPMjNpHq
	+sdeVMtDS1Qt+/Dl+rU7tecGFmeCMydrHcQ7Kb31uttQMkFKClx0RHEZWE+/WwDTE7j1YPlungS
	/K6kvdDFKi4pAsZtKdT2cspwgLNfZM2SgGZ16ruxkSZmM4TyV9PNgr+Kd2A8x4KljjivDc9HsmC
	Q5YgJUFcBjJcnG9IsRKjknb5zqs4RERuwqbQJXL5w4F1Q7jIJJNw8EvlB6j+wl8i0BkJYO2ExAn
	csWxqKCLl2ll9iIDFWnuB3f36f71dfx6kISqZ43+scomoZ66qOi6s43JpQdyo5nID9JybI+KtVF
	EDzN8MLzwOUGIV8K43pE6hjmzPPdllOMfk4t/Ip3lCYb7fXUuG1I=
X-Received: by 2002:a17:90b:2fd0:b0:33b:ab6a:87d7 with SMTP id 98e67ed59e1d1-33bcf8fd36amr51679064a91.26.1761574668181;
        Mon, 27 Oct 2025 07:17:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6NLUUnhhcm8QZSzKECdU2YISlOCjBFk6QtuFursTSt/wHazRqtdyXVSrd3nowHBnE3Umk9Q==
X-Received: by 2002:a17:90b:2fd0:b0:33b:ab6a:87d7 with SMTP id 98e67ed59e1d1-33bcf8fd36amr51679021a91.26.1761574667590;
        Mon, 27 Oct 2025 07:17:47 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.193.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f3aeesm8658471a91.14.2025.10.27.07.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 07:17:47 -0700 (PDT)
Message-ID: <419c5d98-f54e-2956-b78f-c597fbb7603f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 19:47:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-current] Revert "wifi: ath10k: avoid unnecessary wait
 for service ready message"
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: klaus.kudielka@gmail.com, yannick.martin@okazoo.eu,
        andreas.tobler@onway.ch, mathias.kretschmer@fit.fraunhofer.de,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20251027-ath10k-revert-polling-first-change-v1-1-89aaf3bcbfa1@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251027-ath10k-revert-polling-first-change-v1-1-89aaf3bcbfa1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff7f0d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=HVeQatgKw7Z0Li/6oOn8eA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=luumQYm6HDKSWQkYg1gA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZaP0N6YdG8gbkA8nZ-Qt8wA6GMGt6Ygk
X-Proofpoint-ORIG-GUID: ZaP0N6YdG8gbkA8nZ-Qt8wA6GMGt6Ygk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzMyBTYWx0ZWRfXxtGc6QvXXP4Y
 fXOCGUlyvYiWk/CjNrN5jAvhrDWaEoB/Bb11DX/yTbfq/St87hcA9UTQ0bNQqvZMdnf2JSIqJwb
 Jd6fvI57Vv7Mhchv3Sy0zHQ9W/b+nrEq60tJPFMf4pHGbQ1xnFL7HEN22EcV42FOi2NxrCXAskd
 N2rkTot6myZbTgMl3OfXlsLloaHA8WQcLkDKrP9c/pRSFXuzeN4uaGW8+HdTBXA7kseWXaWaUsn
 R3xIvcftij8o/zSVdBMgvUXCNIeiJDFnqQ51mWJcMhumg6SGObbkrEr/kN4B+cocgVj9/Oml1E4
 2yLeSSXEdkfGgvPteav6JjTS+HGZ+BkHG3sHNAX6/YnASvvmPC0J3nvGNe+/9AZxXIm4K4ZM+/w
 hCfpiAlJbzYbAY0+3ksSvB4Zj+EPgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_071750_516075_7572D180 
X-CRM114-Status: UNSURE (   7.98  )
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



On 10/27/2025 7:19 AM, Baochen Qiang wrote:
> This reverts commit 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a.
> 
> Although this commit benefits QCA6174, it breaks QCA988x and
> QCA9984 [1][2]. Since it is not likely to root cause/fix this
> issue in a short time, revert it to get those chips back.
> 
> Compile tested only.
> 
> Fixes: 51a73f1b2e56 ("wifi: ath10k: avoid unnecessary wait for service ready message")
> Link: https://lore.kernel.org/ath10k/6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com # [1]
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220671 # [2]
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

