Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A39CCD195
	for <ath10k@archiver.kernel.org>; Sat, 18 Oct 2025 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4XC02jwzmIvWBlWZFVlD8AYAXuXdd+oXv6dBP/Y7Fw=; b=mr+0JSpuaLXKswiKSzWaYoizYk
	HqxQuYwJdVeiH5ueNhnTCi117QecjGpjIsEXJXG2fYfaKD0/Bq1hlEvCHvxLVTleZ+AJsb+xmKFec
	kAr9/MkNLT2kShyBZWoaI2QTo3WtWM6cKqoKgON2NDuJENmizdhYzcSbgbrt5eBYXJhvBDK8TrgrE
	2sQrfjSgDP2wRPhWMm2KciUWIapCzx/sHw8vq+CpaoNErW+smJrB5KRybOm9fR+jjzAg9iB1vwGjO
	Ai24nxJyv7cUIQXgnl1YWzTyU4Kq6JlJWuEnIyaaVzTlJP6D615jCZxfOC6x6I3oNI4fnJPXvsVF8
	Eus7QJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA7Ko-00000009zAt-40Vy;
	Sat, 18 Oct 2025 13:51:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA7Km-00000009zAV-24Lf
	for ath10k@lists.infradead.org;
	Sat, 18 Oct 2025 13:51:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so3468506f8f.3
        for <ath10k@lists.infradead.org>; Sat, 18 Oct 2025 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760795459; x=1761400259; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4XC02jwzmIvWBlWZFVlD8AYAXuXdd+oXv6dBP/Y7Fw=;
        b=km57OygYs5ARcTJxreaKRwHa3upi4iWwMAmLU+/ve8mx+z+p5qzEcxYlJ/U8gZbir5
         2lG4+qQpvF/fN+vG/Lzr1i6PtYNmrSULfSkEyMl3DpGkTuymBx97YE7QfHD7yXbtQhpn
         /CP16WjqURyWAMPw4OD9kr+sHgL+YPbVbBHOhW0Qo/OdmEkJdZav56O50q+h+irH1H/Y
         xSbFFVbpFwKDSapDyDqd2PXUxQn5nXsLtC49Vpdm8VCX9FMZCWYw6zNjFp414a/T2oWg
         zxUH7l5PE0RGoC69cHSFXNwiphCsIC9u9DX7aDmX0WM9o9L3YPc8Auhfza7lr/GdfVzb
         GFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760795459; x=1761400259;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4XC02jwzmIvWBlWZFVlD8AYAXuXdd+oXv6dBP/Y7Fw=;
        b=EF+DRyYJ7oHJZa4IuwtrL4VQ5Fbtbjby5rXUKck81XPfq61APOqooKyqJ3KfuEvR+j
         ui0llLvG8nGWHjFy5lH5v4Qz3JyeOwhq4/wznfwBgzn5EO0hyPNZrayPVmj7VOQHgU/H
         joFr55igmWJ/BO9ep801amYPqpD7M4sV8NI8n1GtHZ+yMK/bksIYyCzle49nwX83bYzx
         XB64mh+CZt/7rD3tBjplSZRF44UBrXXNKfULLiRmVuZPPKeISs9FLq98NpPCJ7jUDb9r
         5AuOFk3nomaGe8TymoEW3vSMH2i+KuK8YyzDolC64el+edPoJX40fhuEjNqPfWuU6Rji
         O48Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpK/WXJDujtrZZ7gUP5dwtrzoF1SpqYJGXeLW2kcb6Y0jFL3NFA8cBsLvlocUdMn20dC/M6Cs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGoDWI4qq2pU/yMi1Dij8bU5RlQlWqze/MurkpEp3ruwu+FWtX
	etoCc0E5+6gkgwwAmbb5E/SXP5fsc9vGcFFFb6xUG36tM4C/Ri+s0PW0Xb5JAt6V
X-Gm-Gg: ASbGncvHkBcxLPk9tiLaKFrorOP1GNWiPRi3g7Vmpz8QCvXpafvYctWpRQXvEumubK/
	GqLwwuczwCZGyLU7t7Iry4ac/WYIR2W8QL/mLOOSSGSf0KBzEqWrtzN+IcHMQdzWtYeHZbAriSh
	yHGTld+i9u6bBvg0joAuVGmJDzfNlCZE1rDlpUJbGk81VqRiAQhIudkbqjnYBQxszzTmQNV7Wb6
	97L/IMgGHCfguzijGV7SV7n427C6GpJYMnz5NFYFEYwwPnefIXAMx9J2qH0aeW9crm6paYYQQuT
	L1mPXnUqyR8FsP5ElevPOYN5SJgBFUAaJRhYRU1fxD6gwa6Yq4y7/Wj9QdOwVE03ZR9/X15oPK0
	UC5Vsfvn3r9mfvqqVbe3QOd+jYze6bUaWBDBfVWbUz3DX9DpP93abXw0TflaZgzzhmqrWnNp0MA
	mdAGCa//2y6lmtLin6cr8R7C4TVfuoWv9mJ6mzdDHPeOq4QpaKv57gJZQ=
X-Google-Smtp-Source: AGHT+IGCXXxrQgd1EYgtv5VJuy0v1uJ9qqFR/wWr3wDngmDs1z9Yq8rUTLutJ5vzlAyNORMZR7xTyQ==
X-Received: by 2002:a05:600c:4715:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-4711791c8c3mr54887815e9.31.1760795458332;
        Sat, 18 Oct 2025 06:50:58 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:a776:5e51:5cb5:418? ([2a02:168:6806:0:a776:5e51:5cb5:418])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47154d382d8sm48677685e9.12.2025.10.18.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 06:50:57 -0700 (PDT)
Message-ID: <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Jeff Johnson
	 <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, Baochen Qiang
	 <quic_bqiang@quicinc.com>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	regressions@lists.linux.dev
Date: Sat, 18 Oct 2025 15:50:57 +0200
In-Reply-To: <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
	 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
	 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
	 <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_065100_576527_2B48970E 
X-CRM114-Status: UNSURE (   8.95  )
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

On Fri, 2025-10-17 at 08:57 -0700, Jeff Johnson wrote:
> On 10/17/2025 8:37 AM, Klaus Kudielka wrote:
> > Unfortunately, this particular commit completely breaks the ath10k driv=
er in my setup.
> >=20
> >=20
> > Hardware:
> > - Turris Omnia (arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts)
> > - Wifi card (output from lspci): Network controller: Qualcomm Atheros Q=
CA986x/988x 802.11ac Wireless Network Adapter
>=20
> This issue was previously reported with that particular chipset.
> This is currently being tracked at:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220671
>=20
> It may be useful to supply your information as a separate record to that =
bug.
>=20
> /jeff

Some more observations on that topic with the hardware shown above.

ath10k_core_start() calls ath10k_wmi_wait_for_service_ready(), and later at=
h10k_wmi_wait_for_unified_ready().

The now *unconditional* call to ath10k_hif_send_complete_check() inside ath=
10k_wmi_wait_for_service_ready()
makes the later call to ath10k_wmi_wait_for_unified_ready() fail.

If I call and handle wait_for_completion_timeout()=C2=A0first (as it was be=
fore the patch),
ath10k_hif_send_complete_check() is *not* called, and both ath10k_wmi_wait_=
for_service_ready() and
ath10k_wmi_wait_for_unified_ready() succeed. Everything is back to normal.

Side note:
ath10k_wmi_wait_for_service_ready() succeeds in both cases with time_left =
=3D=3D WMI_SERVICE_READY_TIMEOUT_HZ.


#regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=3D220671

