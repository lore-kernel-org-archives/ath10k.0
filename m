Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3160FC7EE30
	for <ath10k@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMqjvdqjYjwE3uE3p4fOORmN3YUCuI69v1hvsEPa/as=; b=RRuCKcDcbdrslrapHFX3+LDLdZ
	ARVfj6j5BX+jLhqbV85ulFE7dbINBcP4oVsmmOoUA0ezun/bPJ1V0jqUwblkBclJGUmn2MmWvedVw
	4WtcHNO53l+zkucb2ev0p9txB08AS06/X3SgRDp3J1lDVKwUOkbZzOlYQUA7aYrfQCdCZmdROXkQ2
	kDwuixXL4Vs1A8Uh3VR0jOCuqMOW0sik/LP8k4TdgL9YSm1k0rziTEt7Gxg8F0NKNvuCtz5b2X6GH
	zbeenDcHmYZ4VRI5XlIcBtUkpO2msDMK3hJGmZKokSeoDlqg2Ij0evfFFppM5oj1AQmWh7uZKgzbd
	Q9isi1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscV-00000004Nwm-412L;
	Tue, 24 Jun 2025 01:38:43 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTplz-0000000470Q-3jDA
	for ath10k@lists.infradead.org;
	Mon, 23 Jun 2025 22:36:21 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-236377f00easo54884755ad.1
        for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750718179; x=1751322979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VMqjvdqjYjwE3uE3p4fOORmN3YUCuI69v1hvsEPa/as=;
        b=Ax+wrxJSnkvYvcM+U0RU69KvpkcM9A+Z4tvO5YJShvoDyUP9pq9BHSYwRb/f6Nvh/t
         WJ+mFhj9Q6f6+BFFD/rdjhG44m8lTPKokg2agsGfBtqsDf5XHUBSsT7WmGo9bnvSTmf6
         A99pmVqEBzCLa9xZVZtxQ/dppbVmZobYOyygkao5HRhk5grV8965cG473hEglQyj9j0O
         qyK5K6QFlpIso/gVSvl3DOHYiMRFwfsbk6Gy3EdM+MP5GGOv0npYZ0sYvMX604u/MSRG
         mJzrDRaJw+Ro9KkJA6Dt/b3TtA487x7NCXG3bESbOIkLDWpKEa3KpeJZVM5wz1Dh9P2I
         gpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750718179; x=1751322979;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMqjvdqjYjwE3uE3p4fOORmN3YUCuI69v1hvsEPa/as=;
        b=pR437Y2/b1Os94FrtcZ+j1ND+0Kh+ZBldyL9YYGrL7N/g+/JXWzsCKVaIIJlpH7KNb
         Mr7VumXdcqFbDOT7WgKeTNdsjO/Pn7tTVyZ5lIcsxw+8OKTiCuJ23qKzmUVTsOj0Xqt8
         b1EKuCfKF0YCVN+m5zSJ+mQzYos/6FsqwQcdyV9N9SyfcGVJUFfDDd+qRLreNMPqIIJO
         8vxOwGvowevreXO9E3ldEUekqatYt4+OOiNjYPLjXmWnCE5qPAu7zkJCNQyUZcLXhlzd
         e16WnWzxFyqJyF+2VrKlWswizsv8Y7VGvyBW41MpjAM/DOb9ZJC6ospgkDxJ92gSzIoE
         DfqQ==
X-Gm-Message-State: AOJu0Yxpe5iINWP1wRGakuG7bnWvYssI1R5Kf9K2vVQdi6mRPEN1TGH8
	MSGyHffvJQ0gr5hVt/o6PVGAQISJeP3AQPcRoh4Qr1HoDwrOfWaA/lD1KKWkbWNybG9nkQ==
X-Gm-Gg: ASbGncv1zgFeOrS+QLrEsaMwD5tihLK4NWnEtwxyr1es94XCfD916at6O6iyHjMgp+r
	6zUDTif5VAPbg/LThzzg5tpqMwfTcOxBpU5ybrHearRtUbmkWFO2XH7tmHY5+Lx93fkFvJzO6pe
	AqL85x97+dWilNUapbpP0q7wXyxKbdhsc4CamukWJETiv+P6hatEb7YlLuWOrL/tscP96D7ttYU
	JGiEngnN707qC5GYSeZMjZqfWE+epa3l+NLyWyro/1RCBfWBqmCpHA06lWoIQY7mXC0W474U4fp
	LsZ5YWnOfLHV837HKBqZRCCgi/xB8Ok8k5qdb6JHF1Wyly87A5v6MCH1EjlvHxVv7GZC+Cnf/Uq
	fAA==
X-Google-Smtp-Source: AGHT+IGiVCAqyMHQ0aUFxGZw6AWg0MqiQazeu7JnOPflkRiJ+eMoHJV1tXkOWbhWH0g+7MB4gsek8w==
X-Received: by 2002:a17:903:8cb:b0:234:de0a:b36e with SMTP id d9443c01a7336-237d9bd9bc3mr218762735ad.49.1750718178827;
        Mon, 23 Jun 2025 15:36:18 -0700 (PDT)
Received: from [127.0.0.1] ([115.187.48.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86d77b4sm93201365ad.205.2025.06.23.15.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 15:36:18 -0700 (PDT)
Date: Tue, 24 Jun 2025 04:06:13 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
CC: stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Bath10k=5D=5BQCA9377=5D_Firmware_crashes_on_Dell_I?=
 =?US-ASCII?Q?nspiron_5567_=28IRQ_=2316=2C_all_modern_distro_kernels=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <2DC25FD4-0EA4-41CE-BA17-BFF84C1C5F7E@gmail.com>
References: <CAEmM+Qh=8tm55Ypa2w3ZtOFFrGXTpKqxue59mVAo_5TVy0RJ6g@mail.gmail.com> <CD81F065-CDDD-41F6-AECD-167B509F57C6@gmail.com> <2DC25FD4-0EA4-41CE-BA17-BFF84C1C5F7E@gmail.com>
Message-ID: <690B1DB2-C9DC-4FAD-8063-4CED659B1701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_153619_925167_FD8C539C 
X-CRM114-Status: UNSURE (   6.28  )
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

Resending this as it appears that the original message did not reach the at=
h10k mailing list=2E

On 24 June 2025 1:09:54=E2=80=AFam IST, Bandhan Pramanik <bandhanpramanik0=
6=2Efoss@gmail=2Ecom> wrote:
> For some reason, the Reddit link on troubleshooting the firmware leads t=
o nowhere=2E
>=20
> Here is the Reddit link yet again (let's see if it works): https://www=
=2Ereddit=2Ecom/r/linux/s/egXvRBYhYp
>=20
> Apologies for interrupting more than once=2E

