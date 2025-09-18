Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83186CAC59A
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbWfmH/pC1nkCgbZSoU/uA31VLtZW7O3InnzSnNVGIE=; b=m5vOeIkJdpr/nx81PCtvcfHTx+
	+RelwrhKZYHm59adBvmE795Oc2q9ArPTeukvIHaWZtDofQjs7MlwVmYY5rAy9+BUcOl/swGmYDABb
	XuFfuI8Qqu0SvaW+Q0/9PR8arWZbgZVCMS5qNulHiNtBNSdVTg5VQIBGXkG5629ij/p0pkwPeEpOC
	DG8/RW9Nk6b0+ml1mrCtLZQpwCZtluAjN3FiOKxWb8HbXUeGmBz0clxmqIqjllQmpkkicKe9BUgVZ
	hKBVKWL0kG3Q5MfoQ9RNLniZ5WuB9zphSgmEtr76gtxj80sX5Ej6JUSxM9cNzSUwQSJS0hTsm6uzr
	xRb7I5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8ch-0000000GUGd-3c94;
	Thu, 18 Sep 2025 07:00:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8cf-0000000GUE6-08wf
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 07:00:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HMaG4q011110
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 07:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbWfmH/pC1nkCgbZSoU/uA31VLtZW7O3InnzSnNVGIE=; b=FD0ZzwnZ9FI5tSH5
	60sE1dFrl1ZPrFfJ5uI7jRgaHHl0uWXeRIY+wI0MxAVQ66fP4cGwJKZjyFeMFRtN
	xB3CDjO6ztTxOWvhK91CiNK9sq0Xtmo0VxWIfJ0Wg194uTKKZsPlXUqtBQUo4GdM
	dcRuMVQGJmySLA1vQvDdrFcFzvJQ+xUFQaubCSCTxF8sMiQsi0zGXuZdMMPgeFyr
	ETj4ZRllZguijOkmDS13EQIgYqeI8EB1NbRVA0EiZKntcIGv3KYF8aqaVqK64wmG
	MyeW2srrKdt7Kc/sKP04VmubzDI7zgCN7AXalJx1vgLW6Btj0Wzx3iKjdHi+2Nv6
	0QE3EA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx17jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 07:00:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4dfb96c99dso355789a12.0
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 00:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758178801; x=1758783601;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kbWfmH/pC1nkCgbZSoU/uA31VLtZW7O3InnzSnNVGIE=;
        b=SCUJxDahBHULC6MX6vV4jHrwMJlktA8yqPMAZPZLtTlSBrlkV5MLP5NN/tKhbtlzlo
         qf85fl7XbPNt90zY7jPqpsxzs033vKdpiXND/rk86jQaA6ahCn+QgWl/r7yAlZM+t07U
         Ym0ZMiABpJGOAZTiDTb97yqflS1TUkTd/mC9JpbpeVULydVl6WLg/NvogioBE6v+GrCx
         R0J/GfCUIxpoKopdzBqmAW/1pjM3KRC3Unpi8lKQBdkLsvKVDW2+jVEWU2ULvM1BCwbX
         jya4QM24uLnaB0evCXbBjkPsF2PddOtMSxZpBg0pkYW6hPCDeibHKNRM0IaWggMCkk5U
         h1ew==
X-Forwarded-Encrypted: i=1; AJvYcCVW59kxrr7f+bFWb4HOm/fZG7yxCxWOo/m1yQYeWHEjx6maN/SIoZgNtnlqvwoLGbH9Lx5nMd0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwY7DM1mIY254xSXOybMWWSBuUMLoQyDGaA4tXCGgXjyj4PCD6y
	hNY6G47MvebHgIwSaC8TrmoZwMxJoGr/tC2TL5Gxjty+PgfJwcnIU7cFAdS5x4rqq3d5jdqO90P
	KsRYyj9fcaACcpKfdt07xyRcYChL5VKyaIETDxQPZiklXhETlL57IPyjOQooGrN5F
X-Gm-Gg: ASbGncsw/kcHDKbCE8nHK9ITuk8JuODC6FEIpFd5YZvKonPR6OPQAuB3ZGpWLFCGdL8
	Ibnd0IyTx9FNa7MiW/L1r0vVwZb1SD06Nfg0TJVaRAmmtkdcld9SlU9O7oljJGWLFVceX8kEE79
	gmvr3D8G+PmkO/f8gNtbyrvBoRAsWq1i67Kgai4iguApR8bEUkJVHC++SflYZgfv1yN2w3MTklM
	DMbCGT3S0o4mD/egB1YdfZm8SA2RTMawIZTo1ljsWrK66YAv+hb8o1v60IYgkr2K0ZmMtkO52Gj
	S/5xTshhBKeOSvz1AZl4xXwApbGXGgpsyZUEy8MDad0py58rZ9A8Om2DmZM5t5ozuzkL/250AY5
	OLwZkzywdEIHK0o7HuQbsO+kHYEIUwmYwLOOm
X-Received: by 2002:a17:90b:3c8c:b0:32e:3f93:69e2 with SMTP id 98e67ed59e1d1-32ee3ef0806mr5833894a91.13.1758178801459;
        Thu, 18 Sep 2025 00:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqOU3X6jq0DY1ti5vQYDwFxJTrFdx2WWG+GVUcFRyYIyCcd6DpTKmCSc0wqBeP9DA1iegvZA==
X-Received: by 2002:a17:90b:3c8c:b0:32e:3f93:69e2 with SMTP id 98e67ed59e1d1-32ee3ef0806mr5833868a91.13.1758178800933;
        Thu, 18 Sep 2025 00:00:00 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607f0deasm1526418a91.23.2025.09.17.23.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:00:00 -0700 (PDT)
Message-ID: <e01fd1ed-0b7e-442c-9524-3248a9cb32cf@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:59:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] ath10k: remove gpio number assignment
To: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-17-arnd@kernel.org>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250808151822.536879-17-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k38P-Pg77A7gSVUh-LOgUpB3iH-ajYCy
X-Proofpoint-GUID: k38P-Pg77A7gSVUh-LOgUpB3iH-ajYCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfX4EdARTr+v7qk
 ltEoH+HmD0jTlFWuqmBYnXTmxnG7pF0Y8SYfa5WOI0/sJJyijj9EER710P7w1vGYjpluz6MWnjQ
 Eobm5pksPtVskKNwgdzi4zDxDt2IINy7BYC8eatEUavfbjjfXoHM109RwxM7ALHwWByeHWE2HTX
 7joQuhrfKEoe3Xh9tg+A8VKDub5co+rPjox0Ck137hj7iOMuPDjM0K2zRgEN/bg3Dp5rqr3N6Ac
 2UYoRCrwrKi6mWESphYIcfHdLmsLBcXgv27eqErM+JKFC3SwgQccSpWe/eDtdmQ3fxpQoSaO+QB
 yStFoG1zYzeDXG43sp3llJJQcHB8vocZvCGGG8EawdRX5/cWhdvwrTVWiWGbOfBzL7P+YcllBRT
 v9qHVhP6
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cbadf2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uLrbQztoRsBK_tCdPC4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_000005_215113_9481F8D3 
X-CRM114-Status: GOOD (  19.23  )
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



On 8/8/2025 11:18 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The leds-gpio traditionally takes a global gpio number in its platform
> data, but the number assigned here is not actually such a number but
> only meant to be used internally to this driver.
> 
> As part of the kernel-wide cleanup of the old gpiolib interfaces, the
> 'gpio' number field is going away, so to keep ath10k building, move
> the assignment into a private structure instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/ath/ath10k/leds.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/leds.c b/drivers/net/wireless/ath/ath10k/leds.c
> index 9b1d04eb4265..3a6c8111e7c6 100644
> --- a/drivers/net/wireless/ath/ath10k/leds.c
> +++ b/drivers/net/wireless/ath/ath10k/leds.c
> @@ -27,7 +27,7 @@ static int ath10k_leds_set_brightness_blocking(struct led_classdev *led_cdev,
>  		goto out;
>  
>  	ar->leds.gpio_state_pin = (brightness != LED_OFF) ^ led->active_low;
> -	ath10k_wmi_gpio_output(ar, led->gpio, ar->leds.gpio_state_pin);
> +	ath10k_wmi_gpio_output(ar, ar->hw_params.led_pin, ar->leds.gpio_state_pin);
>  
>  out:
>  	mutex_unlock(&ar->conf_mutex);
> @@ -64,7 +64,6 @@ int ath10k_leds_register(struct ath10k *ar)
>  	snprintf(ar->leds.label, sizeof(ar->leds.label), "ath10k-%s",
>  		 wiphy_name(ar->hw->wiphy));
>  	ar->leds.wifi_led.active_low = 1;
> -	ar->leds.wifi_led.gpio = ar->hw_params.led_pin;
>  	ar->leds.wifi_led.name = ar->leds.label;
>  	ar->leds.wifi_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
>  

With 'wifi:' tag added ...

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


