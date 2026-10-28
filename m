Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13745606A31C
	for <ath10k@archiver.kernel.org>; Wed, 28 Oct 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hWog2vC5;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DKb2lrtV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XiDzQ/1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k5R7KHnBeicCpo5W1E+rh+UMdXZhhILADcMQn+NQmFw=; b=hWog2vC5OL8Xlq
	7H7vZeu1SaS55P7rlzethhZ/sN3Z5aMdoo0d6uQOrclc+Nw1unbc2eF3O2XnaRwc3IZvahDUcB43U
	hvEiZjHAIwnUgwl/CspUFv6LjeCuZlhLgeOy17IN+BY/M7ruOhIsWCNTinYpDuaflgmKsfCWjo7aV
	XP3WFVeXCbilahTbIjNdXP+SUdwTGws8bdrW+v9LbB+z43A+xrmSVt8qTvZ8KvOIsVM6X/Xv3YQSC
	dHnU7uhwgrxp7WThHenxFeZVts1xPqwqvf97Bs2er44E8hNcNJnxD63oFAgse35uWUTPmaycV0HjK
	b+rCaccve81ZWza2eYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6HP-00000007W6w-2vsN;
	Wed, 28 Oct 2026 16:13:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6HM-00000007W6U-2fuq
	for ath10k@lists.infradead.org;
	Wed, 28 Oct 2026 16:13:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA9cJ1471935
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 16:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5R7KHnBeicCpo5W1E+rh+UMdXZhhILADcMQn+NQmFw=; b=DKb2lrtVAdVqBLC5
	E6MuHuLugpu9KbhdzAmdzFQaN8VhqAAKWGOGEwkNZS61aCcglzdbu0sc9ZSJkf22
	eb+ldR1oGZdCqWSluHfygY033P8C/i0xS+fMWXc3l3JkR7kPYSOLHOS/c/YTCf29
	a55KEnchOSUR/KQDArD6MjZTlERRKDjP4MnOT5F3STGG/8eXnJ/ViKGBxhpFZ1L6
	7Jj7Q5F1PrZNbkDOdYLnaNoTCutcuGcfyBxKWNW2nXd5qhcRSib2tB3G4Pj6WA2M
	dQpCKWtK9FxB8aAUsaNLTh8FOD2cKvzh9Xm/kBGBfXtOhOxhDQKz3x/dnW2gt/ex
	xxFfRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehhd6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 16:13:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1866116eec.0
        for <ath10k@lists.infradead.org>; Wed, 28 Oct 2026 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793204011; x=1793808811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5R7KHnBeicCpo5W1E+rh+UMdXZhhILADcMQn+NQmFw=;
        b=XiDzQ/1fxMJQMhGTDWUIcGC51fVrabKV2EAALScgeDgEPHKz9cmH4Y7heRhpl03h1z
         h3cGWAWENDtKys242H/GvWLbosadjLrXuFRttiTU0sWYs9yR5/L/8qp+9SDn9GbGJ+43
         5KSPkh/BTnIirhZcJjxEmey4wPdCXi46Yb4leO8c07CfCdROozSVYYsb+GxzKgSZpg21
         7ivYlF9emeWfKtU254KNAYs4zCKCV/3TZn/d9785WUTOC95ElIecR7bBlE6t+SW/nyJ8
         ko5YFuEJtOOsBDeAH/U3pGsTdXTSaIlw6MU7JKjmBsYnxYDCakYAQuPzofrgj2RMlBBH
         icig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204011; x=1793808811;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5R7KHnBeicCpo5W1E+rh+UMdXZhhILADcMQn+NQmFw=;
        b=NUmJw9VhSie0Vqd/vsY1h42KX3EmDqz3a8q+ZXm20H/xuTfycCUtvU5Rf2BLLklZGO
         uRvcE5jc52dKOYyJhTx6gmsojYboMXlYTNxMC1vjygp8R1Gjb9CoPaFIZO6XBsw5rNWd
         BuxvawC7PSdByUYX5hkFAccfCvjMPwomdl+lktk1RacnWmeQI28n3vhB7VPTWLDj3+oT
         +rJXiVDl98STxtQZ0Tyjd3rChIBU11fqD+bYx1Jz7gJCnY/iBCU+A68cEIXye6JuwpMP
         oEfr3DkaPlYJ78lGrusa3lHKZGIkPpZ70VVhZToV6V4wVkFI/VW9ekEjqREAugg13Tz4
         rpYg==
X-Forwarded-Encrypted: i=1; AKwUvByIhKo0kbKme+0ZPTJE7al4FhQVF3hPaeSdNLyID3CLm2jfhJT2ltLMwM0BHw3qYTNlEjwTh/M=@lists.infradead.org
X-Gm-Message-State: AFq9FYK8FRB7vowqzzoa4PAdKQFpXsX0x5UcRaYPy4rqDDyNmlPtcE2i
	YqWQFCcY5cl6zORzTIiP8AiqFsCYPVHNf8iIgpOqwJwnDWx+pazi7htX9e1qWw316yXKX7PDKsU
	2GYIOlFGeod8OtSrnL2rbkaUjOXK5P6c3BJ37fVqWEBP0G1tGHLyZWQOEYm9Zbp20
X-Gm-Gg: AYBFou2i0Cu5JX5BUmGEC5r8IJI4qKGqgtScw5vj8dYQ+GErvTAq32Wir3r1TFzGVdw
	bl7yXkhUcjQR6BK92YnQXJAitr71iig6qSJeZnMo0hPnY8yuQVjS3HieIbzGoQ/FYnuOpkPKw0Y
	3Mj44e12NOZA27exj+Vj6hxdJbLwX9orw4qy+//YM/TNxanPosh+z0KGtPWlXkfZCfED0G1RSB+
	4bAYRzZStZkPYd22+ppvkgnXt8OS9Bon+kCSnVSuLK1NiDBWW7/MncoXa0oPNefJNW7f8Wz89yG
	RmWjJ5b5gWKokvjLUUgIbLN3ATHKsTCcG8XOg2X6qvD69Ungmq+E8EQ8ovyzrQKbcm6o/PYO+TT
	PTP7HBbTyJ0TIhRMPwpBBiJ1lmae9P44Tb0hYfDyr528UVhb5elu+TPJiiVYN1gEhebXpyOh8m8
	xX0qRQw90PZ64cRXWj5PMfSRqvCMLQxaHicQ==
X-Received: by 2002:a05:701b:458c:b0:17f:7280:134e with SMTP id a92af1059eb24-1a6cef7a368mr3118584c88.32.1793204010309;
        Wed, 28 Oct 2026 09:13:30 -0700 (PDT)
X-Received: by 2002:a05:701b:458c:b0:17f:7280:134e with SMTP id a92af1059eb24-1a6cef7a368mr3118558c88.32.1793204009664;
        Wed, 28 Oct 2026 09:13:29 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d4887easm6892717c88.9.2026.10.28.09.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:13:29 -0700 (PDT)
Message-ID: <265c9666-df95-4c81-b617-f92d95d1e8c5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 09:13:27 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Filippo Falezza <effeffe99@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NCBTYWx0ZWRfX5BVYM+Sm+0OY
 qW2L6rY6xRG65yJl8URqp2q61c/eJjj4018PpnXIXr708prjOC478Xn5ZrEu5DtamZPf4QPKT4h
 FYtpEzM5RVuyrspsXjqE2xuDZOxIpdZnUyqwFNje+72lTK24MgpupMC2xG5/lE/Y4724dSWRXW8
 4Yes+R5P6J9ga4lKSKJZipGS0FoLilDXg5ytUTrJk7upvQn9KAZivYDJ+K4LBuSUKvTTKi91BdC
 1JZnc5w2WYlWs6/PYqBXDI75YIxvXb8+wevDvrkxs3DiAlTnj4wY0CxYZAo8GsC12Cb6hBbbU2s
 C6As76Puxh9vOr3ilePERpAtOQeys/PiGdiIkxxm2X3/k+E2TTz6958btJhk1TxnKvk5D4+PLoN
 ThRYTZB/P6ZLUEh5cu9Q2i/l80H5MIhysk7uR2GVYInfSVe56B5UvnT5/6V5oxiMQ6FzZtOD65I
 Ge1bhytRl44wOxeoBZg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae21f2b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=XdfyhqwnpIJiiuEY1KwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: CEdzcnyaL9Pmh9ZcVOKi3H0LC8q_n6tb
X-Proofpoint-GUID: CEdzcnyaL9Pmh9ZcVOKi3H0LC8q_n6tb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NCBTYWx0ZWRfX1d4QaHdadgNI
 Ww584i+VP5u3Jmyj7+umPfxJwpu5yNUo2mBKp7gkgEybVJXSDoe+LpmSAsdlmy7oDNxIUFzw5IS
 aYEYA8SQWb+q/Dd+7tWFRBxEDispn6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_091332_796689_6BBE6DBC 
X-CRM114-Status: GOOD (  17.53  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/26/2026 6:56 PM, Filippo Falezza wrote:
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
> 
>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
> 
> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> lm-sensors, hang for 5 s on every run, and configuration changes of the
> interface wait for conf_mutex in the meantime.
> 
> Whether the firmware answers cannot be told from the chip: firmware that
> answers and firmware that does not both advertise
> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> Instead, remember that the running firmware did not answer, and return
> -EOPNOTSUPP right away on later reads. Forget it when the firmware
> starts, so that a restarted or updated firmware is asked again.
> 
> The first read after each firmware start still takes 5 s when the
> firmware does not answer. Reads on firmware that answers are unchanged.
> 
> This change was written with the help of an AI coding assistant; see
> the notes below.

I've dropped this paragraph from the commit text since it doesn't add value to
the git history. The final commit will have a link to the e-mail thread which 
will still document the LLM usage.

pending patch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=407f3916cca45de3720a93703d28b047920e6230

> 
> Fixes: e98199a8c27f ("ath10k: enable QCA6174/QCA9377 to read the chip temperature")
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>

