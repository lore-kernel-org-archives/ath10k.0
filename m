Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AE2E7718B
	for <ath10k@archiver.kernel.org>; Wed,  1 Jan 2025 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:To:From:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yMFX/DTuo34fz3DYcIqeXd6vbFQDacV11MkJEjJSk5U=; b=Zfm1iPnF59nQsrSC3dx0G6XXHI
	wg+h0LuKUOLT2b+axdzzLXGpsIAgl63BdRASvK4VN+xsKrmUxR6QS8q+OW7wWnhbxzkNXSoU94tDY
	8c9D3/yMK+wnmmfhXvGXQ/Tsk4zDJG4kc3knjYVl/m8yv6u59eJZxe08tCK6Kjd7MUCgeuRSOtBtE
	/dMObRwqPP2b4iXkdjme+rCC6uEW1o53wsRa/fTmIxN+JQtJOUrVMRx8cgVdRmQTCluDXdOxOTm56
	RrfgKQvofyyjLEo1Bekhv8iWB8s3rk/O6HJMUzxUvegRYBW2tRuM0kzGcphYWyAXc//6fmHqMr42+
	KhR53WEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tT5kF-00000009Ldb-2ieD;
	Wed, 01 Jan 2025 20:55:11 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tT5kD-00000009Ld9-1SES
	for ath10k@lists.infradead.org;
	Wed, 01 Jan 2025 20:55:10 +0000
Received: by mail-oi1-x242.google.com with SMTP id 5614622812f47-3eb3c143727so6038119b6e.1
        for <ath10k@lists.infradead.org>; Wed, 01 Jan 2025 12:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ilivingde.okinawa; s=google; t=1735764908; x=1736369708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yMFX/DTuo34fz3DYcIqeXd6vbFQDacV11MkJEjJSk5U=;
        b=WRq27GjbVFrPPBhnGASJC1KckXl2CdM3Wpnp7UHyV+elwubPWEU+1Lw/5tFasXVPTY
         WgtT2/PSjDeWXMxQiVYqCOfQmaDgRJZ0nHbHCSEyhvlNv+Ao5G3T7C1vx37W303mHwPs
         CBfPMLvQK02opcBbL/0A9Yqdu763GEkMAshS8K9RBKaDv36O6FDtneFwnkKOUFgLHczn
         +Y3kEpJnfVnjiks/evy8wqBnkoiBcIlnd2mWVYprSmeXQQDkuIEz9dw1Uzhqo4YvsMeD
         b/7B7srQW9zW2pkFRTgQg7QIj8aZZFGTNRVuE43jDXd09cQIwAj8EuUssBZKYB7b9Iap
         xfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735764908; x=1736369708;
        h=content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMFX/DTuo34fz3DYcIqeXd6vbFQDacV11MkJEjJSk5U=;
        b=Zo7XXb3njdzqq7KWyDwlOrtU7+9IemPnsOiL6rztuLJrM+g3VhshLunnKtvdavEH60
         GUDyz5k5jsjkxQYzXfDesBKbzlWQz3BDJ96uZ1B7Lj/M92iN+ZIMlhZajatJOiO9HmKt
         kd2P2XK52WHlELpckOQlNwSFxx0tK7rvTQ6ru1qMb/niD0aC6gjjpT3GbtoXbooVVReW
         sLu49jsv7mZ1obWuWGondI3SGQs5/MmU78x4yWpZpgRkkKRvRvintnyzmOabRSmvN1B4
         KbhUsxsB92lBf/VVuSQ4fSO2hyZAYjZZSItgMs/byQu0mwiNaEMeJg9GvjAoFzcxhi1v
         nccQ==
X-Gm-Message-State: AOJu0YzlpDqIes4UiLo+HUX5z4zFR4dQhLEpgG/i9WdWM12llRSO/Kzl
	ln3w9rt8fNP9Esp5IZqr+2cbjrJaBa9bmOJc1zOeiqF0ecLunJThrHMibNXhiPkxpFl9leeiv0k
	QBgU=
X-Gm-Gg: ASbGnctJXCpcU+wM5MguPx3mFD9oCh87huboVd1KWI2JVGOXxYbCyKaIYgxnUvw+zxv
	aEAz3YpYEHeyl1dnmfx8GOZL+Q5d1Z3RvhA3QmXpSeYt281M4ftslkay0AH8//723XaPY41CdKH
	T0z0bjn5IWDIgPNoiFzkc2rc7X6TP6FAFl6NJlWwslrYjBOj+6K4H/xROqXAFKyZkSfrutZFQfp
	/eZVOnBZVBVjh1HKEnQJwjbVjmRYFazQe46T3TvFa1WNdW/8UJkQ68Zfyg=
X-Google-Smtp-Source: AGHT+IEyRwkscLsIfhjjAuj3kJDjfbBY9lvg0Q292IwpF/v6oDDbgRPKl3AAl8jhS03wzS54X+4tWA==
X-Received: by 2002:a05:6808:1452:b0:3eb:52e6:1b3e with SMTP id 5614622812f47-3ed88eb673cmr21563861b6e.1.1735764907694;
        Wed, 01 Jan 2025 12:55:07 -0800 (PST)
Received: from eidqo.ru ([75.1.7.105])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece25014a7sm7354257b6e.28.2025.01.01.12.55.07
        for <ath10k@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jan 2025 12:55:07 -0800 (PST)
Message-ID: <b97539a4ca575f09087bf7881fac2100@ilivingde.okinawa>
From: =?utf-8?B?SkHjg43jg4Pjg4jjg5Djg7Pjgq8=?= <sendonly119@ilivingde.okinawa>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: =?utf-8?B?44CQ44GK5Y+W5byV55uu55qE562J44Gu44GU56K66KqN44Gu?=
	=?utf-8?B?44GK6aGY44GE44CR?=
Date: Wed, 01 Jan 2025 20:55:06 +0000
X-Priority: 3
X-Mailer: Coremail2.0 Copyright Tebie Ltd 2153
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_125509_390834_5916F6DF 
X-CRM114-Status: UNSURE (   2.21  )
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

=E5=B9=B3=E7=B4=A0=E3=82=88=E3=82=8A=E3=80=81=EF=BC=AA=EF=BC=A1=E3=83=8D=E3=
=83=83=E3=83=88=E3=83=90=E3=83=B3=E3=82=AF=E3=82=92=E3=81=94=E5=88=A9=E7=94=
=A8=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8D=E3=81=82=E3=82=8A=E3=81=8C=E3=81=A8=
=E3=81=86=E3=81=94=E3=81=96=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=0D=0A=0D=0A=
=EF=BC=AA=EF=BC=A1=E3=83=8D=E3=83=83=E3=83=88=E3=83=90=E3=83=B3=E3=82=AF=E3=
=81=A7=E3=81=AF2019=E5=B9=B46=E6=9C=88=E3=82=88=E3=82=8A=E9=87=91=E8=9E=8D=
=E5=BA=81=E3=81=AE =E3=80=8C =E3=83=9E=E3=83=8D=E3=83=BC=E3=83=BB=E3=83=AD=
=E3=83=BC=E3=83=B3=E3=83=80=E3=83=AA=E3=83=B3=E3=82=B0=E5=8F=8A=E3=81=B3=E3=
=83=86=E3=83=AD=E8=B3=87=E9=87=91=E4=BE=9B=E4=B8=8E=E5=AF=BE=E7=AD=96=E3=81=
=AB=E9=96=A2=E3=81=99=E3=82=8B=E3=82=AC=E3=82=A4=E3=83=89=E3=83=A9=E3=82=A4=
=E3=83=B3 =E3=80=8D =E3=81=AB=E5=9F=BA=E3=81=A5=E3=81=8D=E3=80=81=E3=81=8A=
=E5=AE=A2=E3=81=95=E3=81=BE=E6=83=85=E5=A0=B1=E3=82=84=E3=81=8A=E5=8F=96=E5=
=BC=95=E3=81=AE=E7=9B=AE=E7=9A=84=E7=AD=89=E3=82=92=E5=AE=9A=E6=9C=9F=E7=9A=
=84=E3=81=AB=E7=A2=BA=E8=AA=8D=E3=81=95=E3=81=9B=E3=81=A6=E3=81=84=E3=81=9F=
=E3=81=A0=E3=81=84=E3=81=A6=E3=81=8A=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=E3=
=81=8A=E5=AE=A2=E3=81=95=E3=81=BE=E3=81=AB=E3=81=AF=E3=81=8A=E6=89=8B=E6=95=
=B0=E3=82=92=E3=81=8A=E3=81=8B=E3=81=91=E3=81=84=E3=81=9F=E3=81=97=E3=81=BE=
=E3=81=99=E3=81=8C=E3=80=81=E4=BD=95=E5=8D=92=E3=81=94=E7=90=86=E8=A7=A3=E3=
=81=A8=E3=81=94=E5=8D=94=E5=8A=9B=E3=82=92=E3=81=8A=E9=A1=98=E3=81=84=E7=94=
=B3=E3=81=97=E3=81=82=E3=81=92=E3=81=BE=E3=81=99=E3=80=82=0D=0A=0D=0A=E2=80=
=BB=E3=81=AA=E3=81=8A=E3=80=81=E7=A2=BA=E8=AA=8D=E3=81=95=E3=81=9B=E3=81=A6=
=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8F=E6=99=82=E6=9C=9F=E3=81=AF=E3=81=8A=E5=
=AE=A2=E3=81=95=E3=81=BE=E3=81=94=E3=81=A8=E3=81=AB=E7=95=B0=E3=81=AA=E3=82=
=8A=E3=81=BE=E3=81=99=E3=80=82=0D=0A=E2=80=BB2025=E5=B9=B41=E6=9C=882=E6=97=
=A5=E3=81=BE=E3=81=A7=E3=81=AB =E3=80=8C =E3=81=8A=E5=8F=96=E5=BC=95=E7=9B=
=AE=E7=9A=84=E7=AD=89=E3=81=AE=E7=A2=BA=E8=AA=8D =E3=80=8D =E3=82=88=E3=82=
=8A=E3=80=81=E3=81=8A=E5=8F=96=E5=BC=95=E3=81=AE=E7=9B=AE=E7=9A=84=E7=AD=89=
=E3=81=AE=E3=81=94=E7=A2=BA=E8=AA=8D=E3=82=92=E3=81=8A=E9=A1=98=E3=81=84=E3=
=81=84=E3=81=9F=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=0D=0A=0D=0A =E2=96=BC=
=E3=81=8A=E5=8F=96=E5=BC=95=E7=9B=AE=E7=9A=84=E7=AD=89=E3=81=AE=E7=A2=BA=E8=
=AA=8D=0D=0Ahttps://quotepr.com/stewari.html=0D=0A=0D=0A=E2=80=BB=E5=9B=9E=
=E7=AD=94=E3=81=8C=E5=AE=8C=E4=BA=86=E3=81=97=E3=81=BE=E3=81=99=E3=81=A8=E3=
=80=81=E9=80=9A=E5=B8=B8=E3=81=A9=E3=81=8A=E3=82=8A=E3=83=AD=E3=82=B0=E3=82=
=A4=E3=83=B3=E5=BE=8C=E3=81=AE=E3=81=8A=E6=89=8B=E7=B6=9A=E3=81=8D=E3=81=8C=
=E5=8F=AF=E8=83=BD=E3=81=AB=E3=81=AA=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=0D=
=0A=E2=80=BB=E4=B8=80=E5=AE=9A=E6=9C=9F=E9=96=93=E3=81=94=E7=A2=BA=E8=AA=8D=
=E3=81=84=E3=81=9F=E3=81=A0=E3=81=91=E3=81=AA=E3=81=84=E5=A0=B4=E5=90=88=E3=
=80=81=E5=8F=A3=E5=BA=A7=E5=8F=96=E5=BC=95=E3=82=92=E5=88=B6=E9=99=90=E3=81=
=95=E3=81=9B=E3=81=A6=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8D=E3=81=BE=E3=81=99=
=E3=80=82=0D=0A=0D=0A=E3=81=8A=E5=AE=A2=E3=81=95=E3=81=BE=E6=83=85=E5=A0=B1=
=E7=AD=89=E3=81=AE=E5=AE=9A=E6=9C=9F=E7=9A=84=E3=81=AA=E3=81=94=E7=A2=BA=E8=
=AA=8D=E3=81=AB=E3=81=94=E5=8D=94=E5=8A=9B=E3=81=8F=E3=81=A0=E3=81=95=E3=81=
=84=0D=0A=0D=0A=E3=80=90=E3=81=94=E6=B3=A8=E6=84=8F=E3=80=91=0D=0A=E3=83=BB=
=E3=81=8A=E5=AE=A2=E3=81=95=E3=81=BE=E5=80=8B=E5=88=A5=E3=81=AE=E4=BA=8B=E7=
=94=B1=E3=81=A7=E5=8F=A3=E5=BA=A7=E3=81=AE=E3=81=8A=E5=8F=96=E5=BC=95=E3=81=
=8C=E5=88=B6=E9=99=90=E3=81=95=E3=82=8C=E3=81=A6=E3=81=84=E3=82=8B=E5=A0=B4=
=E5=90=88=E3=80=81=E6=9C=AC=E4=BB=B6=E3=81=AE=E3=81=8A=E6=89=8B=E7=B6=9A=E3=
=81=8D=E3=82=92=E5=AE=8C=E4=BA=86=E3=81=97=E3=81=A6=E3=82=82=E5=88=B6=E9=99=
=90=E3=81=AF=E8=A7=A3=E9=99=A4=E3=81=95=E3=82=8C=E3=81=BE=E3=81=9B=E3=82=93=
=E3=80=82=0D=0A=E3=83=BB=E3=81=9D=E3=81=AE=E4=BB=96=E9=87=8D=E8=A6=81=E3=81=
=AA=E3=81=8A=E6=89=8B=E7=B6=9A=E3=81=8D=E3=81=AE=E3=81=94=E6=A1=88=E5=86=85=
=E3=81=8C=E8=A1=A8=E7=A4=BA=E3=81=95=E3=82=8C=E3=82=8B=E5=A0=B4=E5=90=88=E3=
=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=E3=81=94=E6=A1=88=E5=86=
=85=E3=82=92=E7=A2=BA=E8=AA=8D=E5=BE=8C=E3=80=81=E5=9B=9E=E7=AD=94=E7=94=BB=
=E9=9D=A2=E3=81=8C=E8=A1=A8=E7=A4=BA=E3=81=95=E3=82=8C=E3=81=BE=E3=81=99=E3=
=80=82=0D=0A=0D=0A=E3=81=8A=E5=AE=A2=E3=81=95=E3=81=BE=E3=81=AB=E3=81=AF=E3=
=81=8A=E6=89=8B=E6=95=B0=E3=82=92=E3=81=8A=E3=81=8B=E3=81=91=E3=81=84=E3=81=
=9F=E3=81=97=E3=81=BE=E3=81=99=E3=81=8C=E3=80=81=E4=BD=95=E3=81=A8=E3=81=9E=
=E3=81=94=E7=90=86=E8=A7=A3=E3=80=81=E3=81=94=E5=8D=94=E5=8A=9B=E3=81=AE=E3=
=81=BB=E3=81=A9=E3=81=8A=E9=A1=98=E3=81=84=E3=81=84=E3=81=9F=E3=81=97=E3=81=
=BE=E3=81=99=E3=80=82=0D=0A=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=0D=0A=E3=81=8A=E5=95=8F=E3=81=84=E5=90=88=E3=
=82=8F=E3=81=9B=E3=81=AF=E4=B8=8B=E8=A8=98=E3=81=BE=E3=81=A7=0D=0A=E3=83=95=
=E3=83=AA=E3=83=BC=E3=83=80=E3=82=A4=E3=83=A4=E3=83=AB=EF=BC=9A 0120-058-09=
8=0D=0A=E2=80=BB=E6=9C=88=E6=9B=9C=E6=97=A5=E3=80=9C=E9=87=91=E6=9B=9C=E6=
=97=A59=E6=99=8200=E5=88=86=E3=80=9C21=E6=99=8200=E5=88=86=0D=0A=E2=80=BB=
=E5=9C=9F=E3=83=BB=E6=97=A5=E6=9B=9C=E6=97=A5=E3=80=81=E7=A5=9D=E6=97=A5=E3=
=83=BB=E6=8C=AF=E6=9B=BF=E4=BC=91=E6=97=A59=E6=99=8200=E5=88=86=E3=80=9C17=
=E6=99=8200=E5=88=86=0D=0A=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=0D=0A=E3=80=90=E7=99=BA=E8=A1=8C=E3=83=BB=E7=
=B7=A8=E9=9B=86=E3=80=91=EF=BC=AA=EF=BC=A1=E3=83=8D=E3=83=83=E3=83=88=E3=83=
=90=E3=83=B3=E3=82=AF


