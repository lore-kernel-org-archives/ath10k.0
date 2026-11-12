Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18261606A31C
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 00:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hnHscUZU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcvPpPlO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pwj3HvN6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=; b=hnHscUZUH769H/
	hT+hv60UsFNw+8SPoGo6PgqR6LxbLia/paydWnzWDH9NtkbspEYLs7l88BM3zhQvVDW485EVbmGy1
	NRNcwD1I9P+BvrKLRH6Md096HQ1/6GrXYxSrca0FYighR8z70XZnGRv91Oe9VgFuEFh5OjaWdk+pz
	Y8487TdP7dweQm3aDX1ycksWJy+oymPaiyLuPwWoDVFKNceZ3/363Sj5y/DoQrAXnGkbHViZUavPB
	Avfl0khN/98l97tqxpSwyAnwSK9/wiJzye2TQWnG7A2j18zZ5Q1zg5Trxb/O2FUsqaNxl2VQIDL+m
	8eWjGcsDSMMf5ONNg1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIR1-00000008DAc-47HZ;
	Thu, 12 Nov 2026 00:12:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIQz-00000008DAD-1uOF
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 00:12:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMb1ke2006208
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 00:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=; b=UcvPpPlO9M/ol0+T
	kncthZ3En4oLcc2+0p0AYm6rI81Q2JHmoRB+xAtAaDzmf89euB3TeNGu7/fftvex
	FnHZJPpl5O8wrAMJsbjdeWtSQUfyWvfFlNjAEy6kRd684Pq8zOg1i64vCSrWLd8k
	uApbF3dwbShM7d1knLGTMJecQik7JUqPzcqbs/sDP+49IUWpDz3k9hhJrfZxzVrK
	qitkdz74unzR5GSsceckRNV/jKEnqEeYEgi5UaVBgbw12PDMmwu05cFef/jY9txI
	D4jR0wXX6kpGnbG66AzFzkGJa0gnB/mGlNwzn5KiusWSCPytHm5OB82kZM4VsoyT
	2fsMvA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1s3ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 00:12:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5817920c88.0
        for <ath10k@lists.infradead.org>; Wed, 11 Nov 2026 16:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794442375; x=1795047175; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=;
        b=Pwj3HvN69WikduM/WGShyZuLiGvoBaRWAkL+EKnOUTk88/O0VIGQOg33iNtKzw6O0t
         05lqR0hd/VyMSZF07goicL/6eg8IxbYLSuMCoFreGrvT+Hf1+aqIMoMLkw6e2xaSmZFG
         5n6eKQNq8G9R/opXXMzScNqEF/szW4T3Fxt2OSoG9Bt18QVHR+cohfMgMPs/iPRYi/hs
         QSCvDyYdD5mQ3wqMeALtHmAlqJALWowPsTNQxLWkYoX6Nmj0F114tt5xFkTVtI7m95At
         chEVtH/cSnSK+MN9KcQwU1T5tzbd+t9IyiSqkgIvYJF3Vv+E8NxNMAapCBv0dbmYbmrS
         B0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442375; x=1795047175;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=;
        b=SpBSjDzaCQZiYF3OeOmg23UNjGutzVZ9vIhYO3w+X4hNO0PLVXEh8yUwlHvjc8Sts3
         6oyT6ubmcyVEjmKe7rt+doD1YIW+jkORArRUfJW0EXE+XqGi0KsUHMu8sPGy/B2cnVAn
         WjvXb8/uVD6QHY25+6vduex7cV01A6+8AKlCu3U4abSxfT+/gQ+E8P8RXOjdn397rua6
         iQyysm0LkHuh+JFyrxONM8oJ5vYC/aki28+t25727gjq7pqemgnEgL2Bh2OvejuYzAnn
         3dX8SBpjkgBkZyjV3wLqMEN0chijK0HGsL6zaMFzJopfNkOOoPuGwouIuTnUIJPvJQ2o
         o5jw==
X-Forwarded-Encrypted: i=1; AL+hErHPpb7mCg8+6SHJjz2qnEQZNH9p5zIm6+5FtgEPkCnDLiGsgE+Trebwk3EVbmeOwnqLEDJIV+0=@lists.infradead.org
X-Gm-Message-State: APuU4Z+xCovp1fXjyxEZWlOo1XHpiUmhWgVzyin6HAuTCEva+atwY2bg
	dv7xqk4T8pmypVBter8j4CCGKj45ouhGiT+QokYCjIGiU3uYEZ92GIVgret3PjBL3we+PYvbvoa
	o95HF/et/xRH+JiDSiLjJsn+oC3MvQPL+I00GLR0GQm4vz+Not1GB4VQ7l/rCZ2QhNHQI+nWl
X-Gm-Gg: AYBFou0TT1gpO/1pNz+fDG5YLQLSDZHccmc9YEofpmgZWqirzWdw7c8RLyjpreoOEY1
	mxXQhXV88sbD/YvnuLvpq51K488Da66qfiuK88R4N8PHxKHsvp44WHZqrvPlqcP0C8Dy6y5qfSv
	umZQV85qbf3oeQ0pDatokznqBfzJCnGHH7mHnInKpeQF+64gBLoDF+ZWEe4ZzmXcXGNE06HF3Nj
	FQF4rq6AcZzhL/ZLnla8A2ES7JjfLMO719AbqhXbgOrwPWFpUYWvOWM47qdtreYzoZJKE6qzXvQ
	Jzk0opnhys0O9RefLHc2dT+TwT13eMY613WE+y13EH41pFIq9t1ygA5mruDo/MQoZGdAY/zJ9km
	zriF/z8WbH1tpRPVhMCv+lb5UPvwSwj+ljkjL1OyTqf3OPb9Bz+eXPIw5oMuHLdivG45rXAp+YC
	NC1ziI4uA69I7j7AbaAaxDb6GJplwk
X-Received: by 2002:a05:7022:5f05:b0:1b2:558a:d777 with SMTP id a92af1059eb24-1b3c024f962mr3088785c88.2.1794442375238;
        Wed, 11 Nov 2026 16:12:55 -0800 (PST)
X-Received: by 2002:a05:7022:5f05:b0:1b2:558a:d777 with SMTP id a92af1059eb24-1b3c024f962mr3088768c88.2.1794442374490;
        Wed, 11 Nov 2026 16:12:54 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm18282294c88.0.2026.11.11.16.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 16:12:53 -0800 (PST)
Message-ID: <547f063d-0ce7-4a7e-9e1d-5fd587421cbb@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 16:12:52 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Nicolas Escande <nico.escande@gmail.com>,
        Filippo Falezza <effeffe99@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af50488 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=C5z_tJQPRfujv5IdwTUA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: K5jM8lFlmiho5xgQ4qUSnd5ZAk1APJfn
X-Proofpoint-ORIG-GUID: K5jM8lFlmiho5xgQ4qUSnd5ZAk1APJfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX1J4fZF3Icm4G
 D6YIBpTjmJ8xP/fcuJTsJW8r3ejTmzYDR1EbdepqLx+XOLR6yHEhg0TZgHrUQEzVKHSKyLrBrxO
 uX9opugQYfYH+ZnAYwuci2MIqv8TqtfrzkhVILXb0QFFg+mTM8go8fkjxtAze5AvnyyswFkhMmN
 NkhdkJGY4wPo5RbdUg89540/Xowzn41ob4G55t4jlDWC0Kn+G8M0UV5oiCnxNXWWn/JECjJ81+8
 G1g0qzGr1GAfNu4WnXQjE3HWNi6s9Nwmsq0bRpVMtPVPZ2OLu27wUU+zFD55bJ2ZCYeQI9oHv/b
 NFGnnB5+Ih90gYdpmvVdy3m9PJkRDtmy5Gldcq7nsZ3gr44m5EqsBb7WJ2izDNNTqU1lr5RI8Xp
 WfsIf071GSULY2ru9lphWZGJ5Z1Y30lS86FWyC4MKnhMewWAmkrXGde8y6mwZlzI3xcQOOtMHSX
 3kZdk537SPXKH9Q7Taw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX5Jcsg7cLMIgO
 eW36+isxZnEIpc8XLLI8mV8iMd5xkg6AA5svs/KmZ1V6kulBdZQCDzz0GlJ8H/cxk3w9GJ4+inM
 MSQzPerJQvsYAeuk9Jf/Dk+/xDUuw/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_161257_510744_1159E471 
X-CRM114-Status: GOOD (  22.26  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 9:20 AM, Nicolas Escande wrote:
> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
>> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
>> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
>> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
>> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
>> codename nairo (SM7250) never sends the event, so every read of
>> temp1_input stalls for 5 s, logs
>>
>>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>>
>> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
>> lm-sensors, hang for 5 s on every run, and configuration changes of the
>> interface wait for conf_mutex in the meantime.
>>
>> Whether the firmware answers cannot be told from the chip: firmware that
>> answers and firmware that does not both advertise
>> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
>> Instead, remember that the running firmware did not answer, and return
>> -EOPNOTSUPP right away on later reads. Forget it when the firmware
>> starts, so that a restarted or updated firmware is asked again.
>>
>> The first read after each firmware start still takes 5 s when the
>> firmware does not answer. Reads on firmware that answers are unchanged.
>>
> [...]
> 
> Hello,
> 
> I've just now seen this and it will break some setups. It seems that some ath10k
> devices that usually respond to the thermal WMI messages sometimes do not.
> This is from a QCA9888 that does not have your patch yet:
> 
> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> 
> Like you I have a daemon that reads the sensor periodically and it seldom
> fails to read the sensor value for whatever reason. Most of the time it works.
> With your patch once I've hit this, I will never have a valid reading anymore.
> 
> So how about I post a new patch that only fully disable sending when we have
> like 3 consecutive read fails, and in the mean time I can also lower
> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too long ?
> 
> Jeff / Loic is that ok or do you have any other suggestion ?
My thinking is that based upon your logs we should never disable the logic if
the firmware ever replied.

I'm also in favor of tuning the timeout based upon whatever empirical data is
available.

/jeff

