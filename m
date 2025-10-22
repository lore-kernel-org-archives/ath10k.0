Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D6CCCD1BB
	for <ath10k@archiver.kernel.org>; Wed, 22 Oct 2025 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nFCN9pLEfI7dNTPvL0mUSRHrfYXPoZtHDehAzFK4eA=; b=ooeuJ4ciFzMb0tkN1uQFdJRBAA
	xDXIfC5FBrBQziTv/uDeUqp56T2CyRuUEKblnNhpyTzztnapY+NDxvSu0slMWVmf+ThHlnUJRQT3K
	EBpoLLODhdSRbnp1aQz4irDAzd2M0OEyae3u0reedYFPluaWz5dsmKNy+8hj9ilFXiB899uLcIWZm
	5yujFkrPKIIVrjD1n5883Gpl74rZ4J5E+U63ZIkyedToZuvswfo/f/xVqr36ZXrYbjGfKaA/tWxYd
	hUcLQ4mGYQwKZx+wdLXkGQmhYZ0TzVnzF5BgwRiibP+4tl/QIJoCHo0yyeG3J9VbTWxyQG4LHjxaE
	UkCnHVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcfc-00000003nIe-1F8z;
	Wed, 22 Oct 2025 17:30:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcfZ-00000003nI5-2nYo
	for ath10k@lists.infradead.org;
	Wed, 22 Oct 2025 17:30:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-427091cd4fdso3541067f8f.1
        for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761154239; x=1761759039; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1nFCN9pLEfI7dNTPvL0mUSRHrfYXPoZtHDehAzFK4eA=;
        b=GO6n2O6VWBKEyGYpdzNUHHKVJRG/3qReK7FwvHDmfgwNpO5zzrB5s2PQQS/EDp6WmF
         NfxbOMRApR257+qymxWYEbokmoaGDXVLwqgmNw620KmyTrOfERvNSXcc8ypaRPYkkKVg
         N3ofCMFWMNsDQjTmM5CKy0YYXLazZsCKw2iw5O/IXkBGXXKp3SNfOlGeLp0wzws/EzbA
         RyEj38uQhqE8emIORrQDSmqQpCVBBKgDrdnTk4ICF3tlRXCYuPDv80Wa5HXYd0ANXFzM
         YTlpXV/8GyAa/70Q8Xx3kJ9vSVDM1FpLA0DlYPB7TkaYd95Is353Sa5qPEgclzj2i1G7
         FcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154239; x=1761759039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nFCN9pLEfI7dNTPvL0mUSRHrfYXPoZtHDehAzFK4eA=;
        b=QCJVVng4sL5W8OIcdeLZG8Z6mfFVp/BcBJsY9EflM9T+nXdlNGFtobmGc95BNUfnO1
         wXlX7+Q9mehkL0S67TxhIc/tFDUU7Dg3PEEizLQE6EEzVTrRfsiiDOBaYJLpOIJ2c8LS
         M1mlAvfZDdqq/3vxodN2sVIcaVaP56IAQ+hFgWFHr9CB41r5/p9X4bvV67Doc1UvtpwW
         Lm6vqHKL8VMZnSDPCGMSyN3qMIdq0tqIGmjHtfcIXRYcwKQt+SNoMi54XgEcJMcPSLb0
         jm+s1HEXGId9wmWAqr93S4WnCyhrNPYt/JWvAgcnKVyGp1gojQxn3ZyJE/Y7p7v9b2iA
         qRdA==
X-Forwarded-Encrypted: i=1; AJvYcCWKB8IzhAM/INIcDUWTIkJGzI9yb6YxunkRc6b4AuyEretmSAXqLPx+u2FulexK12EO+T4uxv4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx57amo+41YHRJXO2SjVZ7xYlKv5KzIorNcfbFC9tMjBPzi8jZn
	j93mHUw5E1Oa6vcdqcFgZ0mhaSArr1PxpVhdtKe71qp9Z78iH9XB/s9T
X-Gm-Gg: ASbGncv19tcvcS0GwnlUyRgJqTejfLi6CpoDBjJ607xqyy10MkEvO/EVt+aYmF5LyYX
	4HfCNYkizKicI/ANM52CGR+PvcM9smEfQx4gCbK1NQ94tauTeHjxMBxLVeoq82deZBlA34haJCe
	RUxB07DRaUo8A53VC4YZKc5CK9fz2QE92AwlGmVFYRgldqtWpmAtbiCqU87O1ZZLLFJ1QTSGM6k
	vKNChKIuzNc2DrEwMH5212nDPB6B6e7cVU53z5h9Plqm17m1eTups4hhfxR+Nv4xdJbJWw8d+LA
	g9XMi0UeX9CFqe0kExvqcbUvgqyM8XjFY4yDGJ5ahGrYeeiKQ2x16CJzpj1IDVJr/MXUnN1ci+L
	tr8FblhNsS/E4RGQahNkQVsyr4zSM2iB69LgDL2Ra8ITpzGyWT8gbQU6PED5QfR22GwUfioAZOS
	BLnWS51+qEZ44sxQq818YjRjXwFhAyrKGiP2B19nP+iwZsOhLuFRGqwSeSwQ==
X-Google-Smtp-Source: AGHT+IGpzLyeFOtu3WGWo07Zjf+OlCN6M5eusYAHPhvOlsQ5WxNrnoYQLWAS9/q733puojsFm3TO7g==
X-Received: by 2002:adf:e19a:0:b0:427:613:7772 with SMTP id ffacd0b85a97d-42706137842mr12906996f8f.32.1761154239253;
        Wed, 22 Oct 2025 10:30:39 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:5a8f:8582:c21f:f389? ([2a02:168:6806:0:5a8f:8582:c21f:f389])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c56sm26280266f8f.18.2025.10.22.10.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:30:38 -0700 (PDT)
Message-ID: <68dd3d93509b627dbdf907332a703443f46aff6c.camel@gmail.com>
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson	
 <jeff.johnson@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, Kalle
 Valo	 <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	regressions@lists.linux.dev
Date: Wed, 22 Oct 2025 19:30:38 +0200
In-Reply-To: <5466e122-9143-482e-a9ab-7f956e19bf86@oss.qualcomm.com>
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
	 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
	 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
	 <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
	 <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
	 <5466e122-9143-482e-a9ab-7f956e19bf86@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_103041_734107_BB014BEA 
X-CRM114-Status: GOOD (  12.51  )
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

On Wed, 2025-10-22 at 16:00 +0800, Baochen Qiang wrote:
> Thank you Klaus, can you please try if below diff can fix this regression=
?
>=20
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/=
ath/ath10k/ce.c
> index 7bbda46cfd93..1a981d333b5c 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -1256,6 +1256,19 @@ void ath10k_ce_per_engine_service(struct ath10k *a=
r, unsigned int
> ce_id)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(ath10k_ce_per_engine_service);
>=20
> +void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ath10k_ce *ce =3D ath10k_ce_=
priv(ar);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ath10k_ce_pipe *ce_state =3D=
 &ce->ce_states[ce_id];
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ce_state->recv_cb)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ce_state->recv_cb(ce_state);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ce_state->send_cb)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ce_state->send_cb(ce_state);
> +}
> +EXPORT_SYMBOL(ath10k_ce_per_engine_check);
> +
> =C2=A0/*
> =C2=A0 * Handler for per-engine interrupts on ALL active CEs.
> =C2=A0 * This is used in cases where the system is sharing a
> diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/=
ath/ath10k/ce.h
> index 27367bd64e95..9923530e51eb 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.h
> +++ b/drivers/net/wireless/ath/ath10k/ce.h
> @@ -255,6 +255,7 @@ int ath10k_ce_cancel_send_next(struct ath10k_ce_pipe =
*ce_state,
> =C2=A0/*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DCE Interrup=
t Handlers=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D*/
> =C2=A0void ath10k_ce_per_engine_service_any(struct ath10k *ar);
> =C2=A0void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int c=
e_id);
> +void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id);
> =C2=A0void ath10k_ce_disable_interrupt(struct ath10k *ar, int ce_id);
> =C2=A0void ath10k_ce_disable_interrupts(struct ath10k *ar);
> =C2=A0void ath10k_ce_enable_interrupt(struct ath10k *ar, int ce_id);
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 97b49bf4ad80..ce8e0c2fb975 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -1812,7 +1812,7 @@ void ath10k_pci_hif_send_complete_check(struct ath1=
0k *ar, u8 pipe,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (resources > (ar_pci->attr[pipe].src_nentries >> 1))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath10k_ce_per_engine_service(ar, pi=
pe);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath10k_ce_per_engine_check(ar, pipe=
);
> =C2=A0}
>=20
> =C2=A0static void ath10k_pci_rx_retry_sync(struct ath10k *ar)
>=20
>=20

Thanks for looking into this.
I applied that patch on top of current mainline, but unfortunately the resu=
lt is still the same:

[    6.094149] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mod=
e 0 reset_mode 0
[    6.241457] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043202ff sub 0000:0000
[    6.241476] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0=
 dfs 1 testmode 0
[    6.242901] ath10k_pci 0000:02:00.0: firmware ver 10.2.4-1.0-00047 api 5=
 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 35bd9258
[    6.309202] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[   12.509266] ath10k_pci 0000:02:00.0: wmi unified ready event not receive=
d
[   12.581057] ath10k_pci 0000:02:00.0: could not init core (-110)
[   12.587057] ath10k_pci 0000:02:00.0: could not probe fw (-110)


