Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB611606A326
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUhZovPt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kl3xvaB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7jRS+HEkcaytN3nc9pnUZ9I9MCe24w4aiJu9/xx2cww=; b=bUhZovPtVpznxg
	XpVdmK192wQicAWGTkHaydAasWdqJ++wUCBxYO4MWCxtAGO3mLBDZi5foYssLykI7tI4zRbqQLmSc
	J8gnJDxbI3MvYabKYf4X1nH8kv9arVAQku1BpWhPytE1OZnXsgx5bSj7tLkbEThagwFf/y/FKsbcJ
	yAdiFkdb+KBfPesdZiLEffxs0iuUypbJWiA6uooxvrXANPixvW/yco6zIwfwCUpW7ya7+iDD7m5dE
	9C2zloiHeXNZpW3FxcBFN7NVLoQJOrhRGoMAViufbawJPN/9Mv/vkjxA+Rjgo1wcw3Ww2Vy6N0d35
	yq5W3+l8Y0u41A2kfIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKIu-0000000EOB8-2oW9;
	Fri, 20 Nov 2026 08:49:08 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKIr-0000000EOAd-3WQb
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:49:07 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1b3b4944abeso574553c88.1
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164544; x=1795769344; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7jRS+HEkcaytN3nc9pnUZ9I9MCe24w4aiJu9/xx2cww=;
        b=kl3xvaB+pCCgbZadv53KGz6jJZRO8lTlORKiVhrBA4lt5eE++ZVjCVlAxUzWqg0GJ0
         TiAuGCPtngR3ym+Kj80O4Ms5uohGXoKi9ab9grJoj0u3DgOqRWyYu/cyjT+jQmnrOCrZ
         L+RbdVSMix3hUaKn6yS0q/VkgQERfZD64qJ5kP2FuN6toydWv77sTkcXNbRmufiUktOt
         sXYglFcPGjCSCtFkZTq0z/2Tz4v8mDHOYQpIQPSQFw8I6qfl9Yb+c6lLgALswWtbkJ/E
         0zUMmEmC2nFmomLfkNX9H3dp4sPysMvtAdqggb4lEG4pzdg/Pnktvoy2UfRUOdlmckHF
         ZBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164544; x=1795769344;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jRS+HEkcaytN3nc9pnUZ9I9MCe24w4aiJu9/xx2cww=;
        b=WzmTXAFSA9egvVBgbJ1qeWA3/vhVwe/98AOAbB3l0TqIjfy6KQ2WLU867ZDQrPH89x
         WT9TBlLFpSGiZvAjSsyM9Y/tRPwJVL1j2jzxJXA08lzmxbY44Co6aLS2MhLYLojD/bMM
         X50EUeGofZFlzTPWyXCBrqgmkrHNpBhO3S98AToJ6u6QUrBVxlzOghT5AgoVurl4BT+/
         WyNZ8hxvr6pt7/N+ioSuU9uSdDiSSVRLQ/uo4BEELvbk4oEL1vVQSMYg90YeVDigEsdn
         sp27Cb/sG2tXG/ExQcOrIEoZYDuFHbeBwhhhijsFc3nzmievoTJvKQIGYQZ+oPY20rRH
         gbDw==
X-Forwarded-Encrypted: i=1; AL+hErEcyJA/Z5TcmPB68cav0rAKJW939SCBKOO/yk2SivLZXGqP+OIPB2KoOve6LrDbQHAcBlj+paM=@lists.infradead.org
X-Gm-Message-State: APuU4Z8SlyvnrhAGzrCjb3Gz0hgbFgCHHjq3nSxt3KheRNglhvCaY4DE
	JAxR8LsjCXdx2xQTdBKHTOA7KtmN4oi6OlmGv6CqxfJVxbdBw91khqOU
X-Gm-Gg: AYBFou3ruI3H/LYF1rkqfoC9ewhHHi4Fc8C6Fm7J65d2hNmhWVWU22E1KuE9+zdtpWI
	mZIe5WLfn3FM9e+kL8QI4o3YAi+++I7E3/PfFsQ8ebBCxj3YX2JRCaF7gL+7PpaOpWOdop8PX9t
	MlNe26j8McdliiAOZuqOvPd3bcC/3+dwVI2PRSmWEWalBxEM2u73WpBLBo8bju50MuS9HfTrIcf
	F+MmIsbi9PYzP48gme3LxtrbQRePS6wPexsuUsX3IF+EfKP89fKcQB1mSukb8KrJlhtxr9vi0gq
	5/j93ocaWPa2ieM5Lvb8G1TXUCDdKwEVFMDRpjEMTGG4bTkSqoelNTnWO8V1Oq0fCQTU7+wi2Iq
	Lscxhh2F8lM20wXPLT20nTupMRKYehO6I15BHPUElTjE/0IFL5Wukl/SyGZeMus6h3RBYZ2YHW0
	82BK62f+KpMunJvxNIbME/7E90bx8BImT/S2NFx24RJypmBfLNqqNz3kax/cjz5nCYltraB9xKq
	sz8UaOO8ZlHkMzX+HgumTDjORXSOI320dP8G2kFIZS38XTbQKQ1tK0+XQgrNMDXHTPyjmnLdGB+
	RLCtguPz6W1isXGDticPyyaybo5v9fbCkANc0nhg2QTvV4tyBRDJjhMqrG9HVIzJ1ocv5iPj8Se
	kbYG+ZMBO2wTLuvqQ7cfzvMccnhVK9YqZxluLvaBcI4hBRuL0Ub/zvcwUT+B4uVE9uhNz
X-Received: by 2002:a05:701a:c905:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1b556911949mr1923872c88.30.1795164544267;
        Fri, 20 Nov 2026 00:49:04 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4843652c88.0.2026.11.20.00.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:49:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 09:49:01 +0100
Message-Id: <DMZWPXB8Y2G3.2G4BS7LSQNYP6@gmail.com>
Cc: "Jeff Johnson" <jjohnson@kernel.org>, "Filippo Falezza"
 <effeffe99@gmail.com>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
 <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
 <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
 <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
 <c1a6694e-9be8-46d5-8cf0-d70f8757bd05@oss.qualcomm.com>
In-Reply-To: <c1a6694e-9be8-46d5-8cf0-d70f8757bd05@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004905_900352_762C26A3 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

On Fri Nov 20, 2026 at 2:39 AM CET, Jeff Johnson wrote:
>
> Since the original was already sent up to Linus via the normal -rc proces=
s, I
> submitted a revert that is making its way up (already in the wireless tre=
e).
> So a new implementation should be on top of the revert.
>
> /jeff

Thanks for the heads up. I'll get to it as soon as I can.

