Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F2606A32D
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 21:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SyXs8QJT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZZjtMmd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=; b=SyXs8QJTU5RoZ4
	1rGakHzI1ILPiVtIa2u8LXf+HSk1pS/cJuDwjKcp/jr+aVWhSZxZD/HB1D8IwTEC7f1Rc11mUvwEA
	we0RXG+SqHgLGYQawszFaGoG13q61cvm6KtEfY8EX7NaVEUiQihnKsimSp1doAhOpQgmw+SwpKNNt
	t4HlQKeNGZuolZp0HlwPecj70ljhYAEFslVos+BWrA49yHtMDdEClCRWhO6gf4lmDi3Av8XoBROgx
	8bQWo1tA5Akx0feGAi+3r0lmDje5O5siK6Q+5xrQsV/SZbawM8keTcXxxfcTlM9s4jzrogtm9gxru
	BXZpXLlyEaqyxdV77aWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyun-0000000EbI9-048y;
	Fri, 13 Nov 2026 21:34:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyuk-0000000EbHR-3kUl
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 21:34:32 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so2937458a12.1
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 13:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794605668; cv=none;
        d=google.com; s=arc-20260327;
        b=ilG1ORLN8q2OOcbT5+UP0zjFxv6vfdVJINavcC9b5mjFrSOQoDP0QYs7DqnaUW7xoH
         aRQY2OoXK9t9hFT5lQOXZT1Z8FFOMwdu0OkOv4uB++Zq9LCKOXo+JQ73sWyaYrFP605D
         HXWUuz+xOd2l3oAgm0jm4zXNlVmL9Z7gDQqDJlXWi0Mcd9Oz6BQBuHvLzFIib9h/QdOi
         /qzgrB378jTor3Q/id9tjCJAeo0QxoLxT3s9/bYv1CYQCOGfG6GX+VyMJZA9opCjEljf
         F6Zg6dckollGWWARYfp1Q/qYD7eK3PKadvFZQ0O0fc4EkmsHn+ydKysYSgP/tKdMdK6c
         Mj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        fh=nGca5hMuBchidimqkLLI6hFb2V5WsVkf4rA9d59hR3s=;
        b=IdXfsJmf/SRFiPiKFJnX1oz6+JqKIAnxUitRQ+WVjqQGrnpeNn6qRHa434e7ZT3B9Z
         eHiNEB5TG/vlIx6bY0FqblTg0D4AOd7ZAWhb9nx0OUtwuZu+55wNYK7Uru1VnIrbz2LL
         oU+f1f26/JRphv4LGtUUWAVZfBLI1FjRuyQSZM/Z5a/Hln009bSclVsGxtVYF1/6YoLh
         HMfXk5LVwNqMt3WJ2i4RdRbfHgYNXVXeiMtPJ3i3+0m7xSgY1GVbjyiv3G73wfxYRCz6
         hDrvOoDzoTHqUPsdar3ocum7H3yfR6GZH9le7cNG/psCevwY0ywmw8UK0Qx/DLq1NK3P
         NzDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605668; x=1795210468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=nZZjtMmd4TMN+45jiUavK5RC85I/0/xehS+7vGRiehjqmcU2UOxWKFmNmfyrXiv8Eh
         yJHW4Zczv/310d4EJKwEHRKdbs8nsvoGoHWNsJrWMxdScRBZCA1kEcPA1nbgxKo554uz
         097r2KLLEaytXcdKg7ryaLJRC+MHlWjqTBUGQF+pbxrUfsn5T41p0DJ8sIoybjG1u89u
         Wz7Kn8kHNWbpY7lVwuyOULzKX80Z3F4tisojC4RkPVvtX6Ifm8lke4hmJ1ThKXVAKYhr
         ikwMgV5jFEFAYC3+KQAo2JVaCcfaqbAVpOqyr8HBAjhDINwde4oBk8DFdvrPqyXdYIWN
         AIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605668; x=1795210468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=AIIA3ZLBk46Wyyn0duQvwWJ/tgGIscLj2uk06e639kG8yef1qdd9ynRwitNY0oRDTJ
         xjyJjNg8nHj3lOY84qn4NY/C2ghfyEPQ+AtJWd/VvaVeK9JQ4FlB9TsB9NsTJlazSWiz
         UTHDe7MjC7xwZnDx49aGmf9cPOGPXlB4Dg9i11fHwtlL40P/ipRW/XWzPNLjsU0GBOA9
         k68RhJXpytNe0bZD7Fjf5VZx9DanArsNOf5h6nKWBR9B9J7cKT6uM8vGPD1wPPTlQ9F8
         0wmrio0+BLciI2z+RVxzq9xEEzLWSX0m1MbUqfJoSZ2sUtylryBb2I7JcS6JvUeygkAi
         hmOg==
X-Forwarded-Encrypted: i=1; AL+hErGpTQFu/qoVHezo8zLPYZbd+N6Cd1or/b3vZw6N9mw12hJv96d7R+2eB1Jjaf/4ER6CX4HgFLA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/6wC1OfQC2p0d9n67CGrDGbyHgaqlI2bCId+aqDWNYG8hPI+XF
	o3T3DU1BNsB8iR+3iZ0f5sLAObt0x0NaWHJ0amtg3WOLANBAnxIYygLs5KVS5M7P0CyaN2hHSVX
	qd0hQevof7tNc2SIJUFCKuKpmnw8gVgc=
X-Gm-Gg: AYBFou3n4qmuUfQGoUlKzAI7HwW8CBefXmVVCdUFN2lAuvQ9Bsv6Zht/x0TtI361Hi5
	LUwn7vD7WB7fBHqXzjTnJsqZA17zcelT2BA3oRx9pHi7zATjSOS0M2+aH3DBRmc02vtRThx0MeK
	ePyX+4g1bI8QRDoZJqJ46ZD+h7xjhQdg1YQWhMRHddvwGta4M8N08yctxrwpXgaxhMBUFMafSrN
	l5QruXO6ey2D6qhM2RAW6fbg+zNCCIRWTevPs4Gh11fZG3O+0G9aoKn7RFpKfqphcCgA5lShKT8
	rCByV/HjcGBZK3uPmZRVZG0XLSn+3JoSh+GpZojHhMXlg0dB4qteSQkv5pJgBlKehDjVZaL/t8q
	Y/hSiSdDTVLUT7Z/TkY2QmaBzZ5cAqKd3S7tTfXVkhWKHXDa7w6QM/3RXW/63lcgHbWiC0MJAGN
	Ej1KllFowMiDHd+CvC91DrErbDlvWSqb+RJmcVAlrA4zCOlbAp85CtsqjbYz62u+Nss7926rH30
	nmtAg28mBWGkWwHkyidjtytqbI+wuniI0zp2Jcdt3U+Rj023A==
X-Received: by 2002:a05:6402:2422:b0:6b4:2960:d38e with SMTP id
 4fb4d7f45d1cf-6b7c0c6c168mr3184743a12.26.1794605668245; Fri, 13 Nov 2026
 13:34:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111034418.194610-1-rosenp@gmail.com> <20261113-gabby-vigorous-dragon-6a2fed@quoll>
In-Reply-To: <20261113-gabby-vigorous-dragon-6a2fed@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 13 Nov 2026 13:34:17 -0800
X-Gm-Features: AclHuK860Je_aBBSmUpm949DigIPgWY0YZ3IdWomRfLhm8LCUntc7TDGkYsdgmQ
Message-ID: <CAKxU2N846Ebd50z8adJsNcy-kJBSNDSKU8_ZLf68fJzoc+r+xA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_133430_971339_B0DEF33D 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 3:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 10, 2026 at 07:44:18PM -0800, Rosen Penev wrote:
> > ath10k PCI devices can be described as children of their PCI host
> > bridge, for example to supply the MAC address and calibration data
> > through nvmem cells. The only compatible for that was "qcom,ath10k",
> > but the generic PCI device schema requires a node under a PCI bus to
> > carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
> > validation.
> >
> > Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
> > ath9k and ath11k PCI bindings already do.
>
> We do not need to least all PCI devices here. Were is any actual DTS
> user of these?
I have some WIP patches that include the QCA988X. Reason for it is
nvram calibration and MAC lookup.

This is basically copy/paste of what's already present in ath9k.yaml.

AFAIK this came up because of dtbs_check
>
> Best regards,
> Krzysztof
>

